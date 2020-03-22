from flask import Flask, request, render_template
from flask_restful import Resource, Api
from flask_cors import CORS

from werkzeug.exceptions import BadRequest, NotFound

from dateutil.relativedelta import *
from decimal import Decimal
from datetime import datetime, date, timedelta
from hashlib import sha512
from math import ceil

import decimal
import sys
import json
import pymysql

RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
#RDS_HOST = 'localhost'
RDS_PORT = 3306
#RDS_USER = 'root'
RDS_USER = 'admin'
RDS_DB = 'pricing'

app = Flask(__name__)

# Allow cross-origin resource sharing
cors = CORS(app, resources={r'/api/*': {'origins': '*'}})

# Set this to false when deploying to live application
app.config['DEBUG'] = True

# API
api = Api(app)

# Get RDS password from command line argument
def RdsPw():
    if len(sys.argv) == 2:
        return str(sys.argv[1])
    return ""

# RDS PASSWORD
# When deploying to Zappa, set RDS_PW equal to the password as a string
# When pushing to GitHub, set RDS_PW equal to RdsPw()
RDS_PW = RdsPw()

# Connect to RDS
def getRdsConn(RDS_PW):
    global RDS_HOST
    global RDS_PORT
    global RDS_USER
    global RDS_DB

    print("Trying to connect to RDS...")
    try:
        conn = pymysql.connect(RDS_HOST,
                               user=RDS_USER,
                               port=RDS_PORT,
                               passwd=RDS_PW,
                               db=RDS_DB)
        cur = conn.cursor()
        print("Successfully connected to RDS.")
        return [conn, cur]
    except:
        print("Could not connect to RDS.")
        raise Exception("RDS Connection failed.")

# Connect to MySQL database (API v2)
def connect():
    global RDS_PW
    global RDS_HOST
    global RDS_PORT
    global RDS_USER
    global RDS_DB

    print("Trying to connect to RDS (API v2)...")
    try:
        conn = pymysql.connect( RDS_HOST,
                                user=RDS_USER,
                                port=RDS_PORT,
                                passwd=RDS_PW,
                                db=RDS_DB,
                                cursorclass=pymysql.cursors.DictCursor)
        print("Successfully connected to RDS. (API v2)")
        return conn
    except:
        print("Could not connect to RDS. (API v2)")
        raise Exception("RDS Connection failed. (API v2)")

# Disconnect from MySQL database (API v2)
def disconnect(conn):
    try:
        conn.close()
        print("Successfully disconnected from MySQL database. (API v2)")
    except:
        print("Could not properly disconnect from MySQL database. (API v2)")
        raise Exception("Failure disconnecting from MySQL database. (API v2)")

# Serialize JSON
def serializeResponse(response):
    try:
        for row in response:
            for key in row:
                if type(row[key]) is Decimal:
                    row[key] = float(row[key])
                elif type(row[key]) is date or type(row[key]) is datetime:
                    row[key] = row[key].strftime("%Y-%m-%d")
        return response
    except:
        raise Exception("Bad query JSON")

# Execute an SQL command (API v2)
# Set cmd parameter to 'get' or 'post'
# Set conn parameter to connection object
# OPTIONAL: Set skipSerialization to True to skip default JSON response serialization
def execute(sql, cmd, conn, skipSerialization = False):
    response = {}
    try:
        with conn.cursor() as cur:
            cur.execute(sql)
            if cmd is 'get':
                result = cur.fetchall()
                response['message'] = 'Successfully executed SQL query.'
                # Return status code of 280 for successful GET request
                response['code'] = 280
                if not skipSerialization:
                    result = serializeResponse(result)
                response['result'] = result
            elif cmd in 'post':
                conn.commit()
                response['message'] = 'Successfully committed SQL command.'
                # Return status code of 281 for successful POST request
                response['code'] = 281
            else:
                response['message'] = 'Request failed. Unknown or ambiguous instruction given for MySQL command.'
                # Return status code of 480 for unknown HTTP method
                response['code'] = 480
    except:
        response['message'] = 'Request failed, could not execute MySQL command.'
        # Return status code of 490 for unsuccessful HTTP request
        response['code'] = 490
    finally:
        response['sql'] = sql
        # print(response)
        return response

# Close RDS connection
def closeRdsConn(cur, conn):
    try:
        cur.close()
        conn.close()
        print("Successfully closed RDS connection.")
    except:
        print("Could not close RDS connection.")

# Runs a select query with the SQL query string and pymysql cursor as arguments
# Returns a list of Python tuples
def runSelectQuery(query, cur):
    try:
        cur.execute(query)
        queriedData = cur.fetchall()
        return queriedData
    except:
        raise Exception("Could not run select query and/or return data")

# Runs an insert query with the SQL query string and pymysql cursor as arguments
def runInsertQuery(query, cur, conn):
    cur.execute(query)
    conn.commit()

# Plans API (v2)
class Plans(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            queries = [
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        plan_headline,
                        plan_footer,
                        num_meals,
                        meal_plan_price,
                        meal_plan_price/num_meals AS meal_plan_price_per_meal,
                        CONCAT('/', num_meals, '-meals-subscription') AS RouteOnclick
                    FROM ptyd_meal_plans
                    WHERE payment_frequency = \'Monthly\';""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price,
                        meal_plan_price/num_meals AS meal_plan_price_per_meal
                    FROM ptyd_meal_plans
                    WHERE num_meals = 5;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price,
                        meal_plan_price/num_meals AS meal_plan_price_per_meal
                    FROM ptyd_meal_plans
                    WHERE num_meals = 10;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price,
                        meal_plan_price/num_meals AS meal_plan_price_per_meal
                    FROM ptyd_meal_plans
                    WHERE num_meals = 15;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price,
                        meal_plan_price/num_meals AS meal_plan_price_per_meal
                    FROM ptyd_meal_plans
                    WHERE num_meals = 20;"""]

            items['MealPlans'] = execute(queries[0], 'get', conn)
            items['FiveMealPaymentPlans'] = execute(queries[1], 'get', conn)
            items['TenMealPaymentPlans'] = execute(queries[2], 'get', conn)
            items['FifteenMealPaymentPlans'] = execute(queries[3], 'get', conn)
            items['TwentyMealPaymentPlans'] = execute(queries[4], 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# Meals API
class Meals(Resource):
    global RDS_PW

    # Format queried tuples into JSON
    def jsonifyMeals(self, query, mealKeys):
        json = {}
        for key in [('Weekly', 'WEEKLY SPECIALS'), ('Seasonal', 'SEASONAL FAVORITES'), ('Smoothies', 'SMOOTHIES')]:
            json[key[0]] = {'Category': key[1], 'Menu': []}
        decimalKeys = ['extra_meal_price', 'meal_calories', 'meal_protein',
                       'meal_carbs', 'meal_fiber', 'meal_sugar', 'meal_fat', 'meal_sat']
        indexOfMealId = mealKeys.index('menu_meal_id')
        for row in query:
            if row[indexOfMealId] is None:
                continue
            rowDict = {}
            for element in enumerate(row):
                key = mealKeys[element[0]]
                value = element[1]
                # Convert all decimal values in row to floats
                if key in decimalKeys:
                    value = float(value)
                if key == 'menu_date':
                    value = value.strftime("%Y-%m-%d")
                rowDict[key] = value
            # Hardcode quantity to 0
            # Will need to fetch from db eventually
            rowDict['quantity'] = 0
#           rowDict['meal_photo_url'] = 'https://prep-to-your-door-s3.s3.us-west-1.amazonaws.com/dev_imgs/700-000014.png'
            if 'SEAS_FAVE' in rowDict['menu_category']:
                json['Seasonal']['Menu'].append(rowDict)
            elif 'WKLY_SPCL' in rowDict['menu_category']:
                json['Weekly']['Menu'].append(rowDict)
            elif rowDict['menu_category'] in ['ALMOND_BUTTER', 'THE_ENERGIZER', 'SEASONAL_SMOOTHIE', 'THE_ORIGINAL']:
                json['Smoothies']['Menu'].append(rowDict)
        return json

    def jsonifyAddons(self, query, mealKeys):
        json = {}
        for key in [('Addons', 'ADD-ON'),('Weekly', 'ADD MORE MEALS'), ('Smoothies', 'ADD MORE SMOOTHIES')]:
            json[key[0]] = {'Category': key[1], 'Menu': []}
        decimalKeys = ['extra_meal_price', 'meal_calories', 'meal_protein',
                       'meal_carbs', 'meal_fiber', 'meal_sugar', 'meal_fat', 'meal_sat']
        indexOfMealId = mealKeys.index('menu_meal_id')
        for row in query:
            if row[indexOfMealId] is None:
                continue
            rowDict = {}
            for element in enumerate(row):
                key = mealKeys[element[0]]
                value = element[1]
                # Convert all decimal values in row to floats
                if key in decimalKeys:
                    value = float(value)
                if key == 'menu_date':
                    value = value.strftime("%Y-%m-%d")
                rowDict[key] = value
            # Hardcode quantity to 0
            # Will need to fetch from db eventually
            rowDict['quantity'] = 0
#           rowDict['meal_photo_url'] = 'https://prep-to-your-door-s3.s3.us-west-1.amazonaws.com/dev_imgs/700-000014.png'
            
            if rowDict['menu_category'] in ['ALMOND_BUTTER', 'THE_ENERGIZER', 'SEASONAL_SMOOTHIE', 'THE_ORIGINAL']:
                json['Smoothies']['Menu'].append(rowDict)
            elif 'SEAS_FAVE' in rowDict['menu_category']:
                json['Weekly']['Menu'].append(rowDict)
            elif 'WKLY_SPCL' in rowDict['menu_category']:
                json['Weekly']['Menu'].append(rowDict)
            else:
                json['Addons']['Menu'].append(rowDict)

        return json

    def getMealQuantities(self, menu):
        mealQuantities = {}
        for key in ['Meals', 'Addons']:
            for subMenu in menu[key]:
                for eachMeal in menu[key][subMenu]['Menu']:
                    meal_id = eachMeal['menu_meal_id']
                    if meal_id in mealQuantities:
                        mealQuantities[meal_id] += eachMeal['quantity']
                    else:
                        mealQuantities[meal_id] = eachMeal['quantity']
        return mealQuantities

    # HTTP method GET
    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = {}

            now = datetime.now()

            # Temporarily setting now to Feb 2 15:59
            now = datetime(2020, 2, 2, 15, 59)

            # Get meals for the next six weeks
            nextSixWeeks = []
            if now.weekday() == 0 and now.hour < 16:
                print("it's monday before 4pm")
                offset = 0
            else:
                print("it's not monday before 4pm")
                offset = 1

            for weekIndex in range(6):
                weekDict = {}
                weekDict['saturday'] = (
                    now + timedelta(days=-now.weekday()-2, weeks=weekIndex+offset)).date()
                weekDict['sunday'] = weekDict['saturday'] + timedelta(days=1)
                weekDict['monday'] = weekDict['saturday'] + timedelta(days=2)
                weekDict['sundayDate'] = weekDict['sunday'].strftime("%b %-d")
                weekDict['mondayDate'] = weekDict['monday'].strftime("%b %-d")
                nextSixWeeks.append(weekDict)

            queries = [
                """ SELECT
                        menu_date,
                        menu_category,
                        menu_meal_id,
                        meal_desc,
                        meal_category,
                        meal_photo_url,
                        extra_meal_price,
                        meal_calories,
                        meal_protein,
                        meal_carbs,
                        meal_fiber,
                        meal_sugar,
                        meal_fat,
                        meal_sat
                    FROM ptyd_menu
                    LEFT JOIN ptyd_meals ON ptyd_menu.menu_meal_id = ptyd_meals.meal_id"""]

            for eachWeek in nextSixWeeks:
                queries.append(
                    """ SELECT
                            menu_date,
                            menu_category,
                            menu_meal_id,
                            meal_desc,
                            meal_category,
                            meal_photo_url,
                            extra_meal_price,
                            meal_calories,
                            meal_protein,
                            meal_carbs,
                            meal_fiber,
                            meal_sugar,
                            meal_fat,
                            meal_sat
                        FROM ptyd_menu
                        LEFT JOIN ptyd_meals ON ptyd_menu.menu_meal_id = ptyd_meals.meal_id
                        WHERE menu_date = \'""" + str(eachWeek['saturday']) + """\';""")

            mealsKeys = ('menu_date', 'menu_category', 'menu_meal_id', 'meal_desc', 'meal_category', 'meal_photo_url',
                         'extra_meal_price', 'meal_calories', 'meal_protein', 'meal_carbs', 'meal_fiber', 'meal_sugar', 'meal_fat', 'meal_sat')

            for eachWeek in range(6):
                query = runSelectQuery(queries[eachWeek+1], cur)
                key = 'MenuForWeek' + str(eachWeek+1)
                items[key] = {}
                items[key]['SaturdayDate'] = str(nextSixWeeks[eachWeek]['saturday'])
                items[key]['Sunday'] = nextSixWeeks[eachWeek]['sundayDate']
                items[key]['Monday'] = nextSixWeeks[eachWeek]['mondayDate']
                items[key]['Meals'] = self.jsonifyMeals(query, mealsKeys)
                items[key]['Addons'] = self.jsonifyAddons(query, mealsKeys)
                items[key]['MealQuantities'] = self.getMealQuantities(items[key])

            # Uncomment if you want all meals stored in one key
#           query = runSelectQuery(queries[0], cur)
#           items['AllMeals'] = self.jsonifyMeals(query, mealsKeys)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

    def formatMealSelection(self, mealSelection):
        mealSelectionString = ""
        for mealId in mealSelection:
            for mealCount in range(mealSelection[mealId]):
                mealSelectionString += mealId + ";"
        # Remove last semicolon
        return mealSelectionString[:-1]

    # HTTP method POST
    def post(self):
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = []

            response = {}

            data = request.get_json(force=True)
#           data = {'recipient_id': '300-000001', 'week_affected': '2020-02-01', 'meal_quantities': {'700-000001': 2, '700-000002': 1, '700-000011': 2}, 'delivery_day': 'Sunday'}
            # print("Received:", data)

            if data['delivery_day'] != None:
                mealSelection = self.formatMealSelection(data['meal_quantities'])
            else:
                mealSelection = 'SKIP'
#           print("Meal Selection String:", mealSelection)

            queries = [
                """ SELECT purchase_id
                    FROM ptyd_purchases
                    WHERE recipient_id = \'""" + data['recipient_id'] + "\';"]

            purchaseIdTuple = runSelectQuery(queries[0], cur)

            if purchaseIdTuple == None:
                response['message'] = 'Recipient has no active purchase_id.'
                print("Error:", response['message'])
                return response, 400
            else:
                purchaseId = purchaseIdTuple[0][0]
#               print("purchase_id:", purchaseId)

            selectionTime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
#           print(selectionTime)

            queries.append(
                """ INSERT INTO ptyd_meals_selected
                    (
                        purchase_id,
                        selection_time,
                        week_affected,
                        meal_selection,
                        delivery_day
                    )
                    VALUES
                    (
                        \'""" + purchaseId + """\',
                        \'""" + selectionTime + """\',
                        \'""" + data['week_affected'] + """\',
                        \'""" + mealSelection + """\',
                        \'""" + data['delivery_day'] + """\'
                    )
                    ON DUPLICATE KEY UPDATE
                        meal_selection = \'""" + mealSelection + """\',
                        selection_time = \'""" + selectionTime + """\',
                        delivery_day = \'""" + data['delivery_day'] + "\';")

            print("Query:", queries[1])
            runInsertQuery(queries[1], cur, conn)

            response['message'] = 'Request successful.'

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

class Accounts(Resource):
    global RDS_PW

    # Split by dashes and return whatever is on the left side of it
    # Also remove any whitespaces at the end
    def shortenPlanDesc(self, planDesc):
        return planDesc.split('-')[0].rstrip()

    # Check if subscription plan is a one time order
    def isOneTimePlan(self, subscriptionPlan):
        if subscriptionPlan == None:
            return False
        if 'One Time' in subscriptionPlan:
            return True
        return False

    # Calculate amount to charge based on weekly price and subscription
    def calculateNextCharge(self, weeklyPrice, subscriptionPlan):
        if 'Bi-Weekly' in subscriptionPlan:
            return float(weeklyPrice) * 2
        elif 'Weekly' in subscriptionPlan:
            return float(weeklyPrice)
        elif 'Monthly' in subscriptionPlan:
            return float(weeklyPrice) * 4

    # Calculate next charge date based on most recent payment and subscription
    def calculateNextChargeDate(self, lastPaymentDate, subscriptionPlan):
        if 'Bi-Weekly' in subscriptionPlan:
            nextPaymentDate = lastPaymentDate + timedelta(weeks=2)
            return nextPaymentDate.strftime("%b %d, %Y")
        elif 'Weekly' in subscriptionPlan:
            nextPaymentDate = lastPaymentDate + timedelta(weeks=1)
            return nextPaymentDate.strftime("%b %d, %Y")
        elif 'Monthly' in subscriptionPlan:
            nextPaymentDate = lastPaymentDate + timedelta(weeks=4)
            return nextPaymentDate.strftime("%b %d, %Y")

    # Calculate number of paid weeks remaining
    def calculatePaidWeeksRemaining(self, nextChargeDate):
        if nextChargeDate:
#           now = datetime.now()
            now = datetime(2020, 2, 2, 15, 59)
            nextChargeDateObj = datetime.strptime(nextChargeDate, "%b %d, %Y")
            deltaObj = nextChargeDateObj - now
            return ceil(deltaObj.days / 7)
        else:
            return "N/A"

    # Format Monday Zipcodes Query to a list of strings
    def formatMondayZips(self, query):
        zips = []
        for row in query:
            zips.append(row[0])
        return zips

    # Format queried tuples into JSON
    def jsonifyAccounts(self, query, rowDictKeys, mondayZips):
        json = []
        dateKeys = ['create_date', 'last_update', 'last_delivery', 'cc_exp_date']
        for row in query:
            rowDict = {}
            for element in enumerate(row):
                key = rowDictKeys[element[0]]
                value = element[1]
                if key in dateKeys:
                    if value:
                        value = value.strftime("%b %d, %Y")
                    else:
                        value = None
                if key is 'Subscription':
                    if value:
                        value = self.shortenPlanDesc(value)
                    else:
                        value = None
                # Get weekly price of meal plan and multiply by X
                if key is 'WeeklyPrice':
                    key = 'NextCharge'
                    if self.isOneTimePlan(rowDict['Subscription']):
                        value = 0
                    elif rowDict['Subscription'] == None:
                        value = 0
                    else:
                        value = self.calculateNextCharge(value, rowDict['PaymentPlan'])
                # Get user's most recent payment date and offset by X weeks
                if key is 'payment_time_stamp':
                    key = 'NextChargeDate'
                    if self.isOneTimePlan(rowDict['Subscription']):
                        value = None
                    elif rowDict['Subscription'] == None:
                        value = None
                    else:
                        value = self.calculateNextChargeDate(value, rowDict['PaymentPlan'])
                rowDict[key] = value
#           rowDict['password_sha512'] = sha512(
#               rowDict['user_name'].encode()).hexdigest()

            rowDict['PaidWeeksRemaining'] = self.calculatePaidWeeksRemaining(rowDict['NextChargeDate'])

            try:
                ccExpDateObj = datetime.strptime(rowDict['cc_exp_date'], "%b %d, %Y")
                rowDict['cc_exp_year'] = ccExpDateObj.strftime("%Y")
                rowDict['cc_exp_month'] = ccExpDateObj.strftime("%m")
                rowDict['cc_exp_day'] = ccExpDateObj.strftime("%d")
            except:
                rowDict['cc_exp_year'] = None
                rowDict['cc_exp_month'] = None
                rowDict['cc_exp_day'] = None

            if rowDict['user_zip'] in mondayZips:
                rowDict['MondayAvailable'] = True
            else:
                rowDict['MondayAvailable'] = False
            json.append(rowDict)
        return json

    # HTTP method GET
    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = []

            # Select last digits of credit card info only
            # to avoid storing sensitive info in
            # Python objects
            queries = [
                """ SELECT DISTINCT
                        user_uid,
                        user_name,
                        first_name,
                        last_name,
                        user_email,
                        phone_number,
                        user_address,
                        address_unit,
                        user_city,
                        user_state,
                        user_zip,
                        user_region,
                        user_gender,
                        create_date,
                        last_update,
                        activeBool,
                        last_delivery,
                        referral_source,
                        delivery_note,
                        meal_plan_desc AS Subscription,
                        payment_frequency AS PaymentPlan,
                        meal_plan_price AS WeeklyPrice,
                        payment_time_stamp,
                        purchase_status,
                        num_meals AS MaximumMeals,
                        CONCAT('XXXX-XXXX-XXXX-', RIGHT(cc_num, 4) ) AS cc_num_secret,
                        cc_exp_date,
                        CONCAT('XX', RIGHT(cc_cvv, 1) ) AS cc_cvv_secret,
                        password_salt
                    FROM ptyd_accounts a1
                    LEFT JOIN ptyd_payments p1
                    ON user_uid = p1.buyer_id
                    LEFT JOIN ptyd_purchases
                    ON user_uid = recipient_id
                    LEFT JOIN ptyd_meal_plans
                    ON ptyd_purchases.meal_plan_id = ptyd_meal_plans.meal_plan_id
                    INNER JOIN ptyd_passwords
                    ON user_uid = password_user_uid
                    ORDER BY payment_time_stamp, user_uid DESC;""",
                    "SELECT * FROM ptyd_monday_zipcodes;"]

            accountKeys = ( 'user_uid', 'user_name', 'first_name', 'last_name',
                            'user_email', 'phone_number', 'user_address', 'address_unit',
                            'user_city', 'user_state', 'user_zip', 'user_region',
                            'user_gender', 'create_date', 'last_update', 'activeBool',
                            'last_delivery', 'referral_source', 'delivery_note', 'Subscription',
                            'PaymentPlan', 'WeeklyPrice', 'payment_time_stamp', 'purchase_status',
                            'MaximumMeals', 'cc_num_secret', 'cc_exp_date', 'cc_cvv_secret', 'password_salt')
            query = runSelectQuery(queries[0], cur)

            mondayZipsQuery = runSelectQuery(queries[1], cur)
            mondayZips = self.formatMondayZips(mondayZipsQuery)

            items = self.jsonifyAccounts(query, accountKeys, mondayZips)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

class Account(Resource):

    # HTTP method GET
    def get(self, accName, accPass):
        response = {}
        try:
            conn = connect()

            queries = [
                """ SELECT
                        user_uid,
                        user_name,
                        first_name,
                        last_name,
                        user_email,
                        phone_number,
                        user_address,
                        address_unit,
                        user_city,
                        user_state,
                        user_zip,
                        user_region,
                        user_gender,
                        create_date,
                        last_update,
                        activeBool,
                        last_delivery,
                        referral_source,
                        user_note
                    FROM ptyd_accounts""" +
                    "\nWHERE user_name = " + "'" + accName + "' AND user_state = 'TX';"]

            items = execute(queries[0], 'get', conn)
            user_uid = items['result'][0]['user_uid']

            queries.append("SELECT * FROM ptyd_passwords WHERE password_user_uid = \'" + user_uid + "\';")
            password_response = execute(queries[1], 'get', conn)

            if accPass == password_response['result'][0]['password_hash']:
                print("Successful authentication.")
                response['message'] = 'Request successful.'
                response['result'] = items
                response['auth_success'] = True
                return response, 200
            else:
                print("Wrong password.")
                response['message'] = 'Request failed, wrong password.'
                response['auth_success'] = False
                return response, 401 
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class SignUp(Resource):
    # HTTP method POST
    def post(self):
        response = {}
        items = []
        try:
            conn = connect()
            data = request.get_json(force=True)

            Username = data['Username']
            FirstName = data['FirstName']
            LastName = data['LastName']
            Email = data['Email']
            PhoneNumber = data['PhoneNumber']
            Password = data['Password']
            Address = data['Address']
            AddressUnit = data['AddressUnit']
            DeliveryNote = "N/A"
            City = data['City']
            State = data['State']
            Zip = data['Zip']
            Region = "US"
            Gender = "F"
            WeeklyUpdates = data['WeeklyUpdates']
            CreateDate = datetime.strftime(date.today(), "%Y-%m-%d")
            LastUpdate = CreateDate
            ActiveBool = "Yes"
            Referral = data['Referral']

            print("Received:", data)

            queries = ["CALL get_new_user_id;"]

            NewUserIDresponse = execute(queries[0], 'get', conn)
            NewUserID = NewUserIDresponse['result'][0]['new_id']

            print("NewUserID:", NewUserID)

            queries.append(
                """ INSERT INTO ptyd_accounts
                    (
                        user_uid,
                        user_name,
                        first_name,
                        last_name,
                        user_email,
                        phone_number,
                        user_address,
                        address_unit,
                        delivery_note,
                        user_city,
                        user_state,
                        user_zip,
                        user_region,
                        user_gender,
                        weekly_updates,
                        create_date,
                        last_update,
                        activeBool,
                        last_delivery,
                        referral_source,
                        user_note,
                        user_profile_picture
                    )
                    VALUES
                    (""" +
                        "\'" + NewUserID + "\'," +
                        "\'" + Username + "\'," +
                        "\'" + FirstName + "\'," +
                        "\'" + LastName + "\'," +
                        "\'" + Email + "\'," +
                        "\'" + PhoneNumber + "\'," +
                        "\'" + Address + "\'," +
                        "\'" + AddressUnit + "\'," +
                        "\'" + DeliveryNote + "\'," +
                        "\'" + City + "\'," +
                        "\'" + State + "\'," +
                        "\'" + Zip + "\'," +
                        "\'" + Region + "\'," +
                        "\'" + Gender + "\'," +
                        "\'" + WeeklyUpdates + "\'," +
                        "\'" + CreateDate + "\'," +
                        "\'" + LastUpdate + "\'," +
                        "\'" + ActiveBool + "\'," +
                        "NULL," +
                        "\'" + Referral + "\'," +
                        "NULL," +
                        "NULL);")

            # print("Query:", queries[1])
            insertResponse = execute(queries[1], 'post', conn)

            response['message'] = 'Request successful.'
            response['result'] = insertResponse

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class TemplateApi(Resource):
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(""" SELECT
                                *
                                FROM
                                ptyd_meal_plans;""", 'get', conn)

            response['message'] = 'successful'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class CustomerInfo(Resource):

    # def ___inti__(self):
    #     self.dict1 = {"Full_name":None,"Current_subscription":None,"Start_date":None,"End_date":None}

    def jsonify_one(self,dict1):
        map_subs = {"Weekly":7,"Bi-Weekly":14}
        res = {}
        for key,vals in dict1.items():
            if key == "Full_name" or key == "Current_subscription" or key == "start_date":
                res[key] = vals
                continue
            else:
                date = datetime.strptime(dict1["start_date"], '%Y-%m-%d')
                if dict1["frequency"]=="Monthly":
                    end_date = date + relativedelta(months=1)
                else:
                    end_date = date + timedelta(days=map_subs[dict1["frequency"]])
                res["end_date"] = end_date.strftime('%Y-%m-%d')
        return res
            
    # HTTP method GET
    def get(self):
        response = {}
        cus_info = {}
        try:
            conn = connect()

            queries = """select concat(ptyd_accounts.first_name,' ',ptyd_accounts.last_name) as Full_name,
                        pur.start_date as start_date, meal.payment_frequency as frequency, meal.meal_plan_desc as Current_subscription
                        from ptyd_accounts
                        inner join 
                        ptyd_purchases pur ON ptyd_accounts.user_uid = pur.recipient_id
                        inner join 
                        ptyd_meal_plans meal on pur.meal_plan_id = meal.meal_plan_id"""

            cus_info['CustomerInfo'] = execute(queries, 'get', conn)
            list1 = list(map(self.jsonify_one,cus_info['CustomerInfo']['result']))
            
            cus_info['CustomerInfo']['result'] = list1
            response['message'] = 'Request successful.'
            response['result'] = cus_info

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class CustomerProfile(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        cus_info = {}
        try:
            conn = connect()

            # -- select concat(ptyd_accounts.first_name,' ',ptyd_accounts.last_name) as Full_name, concat(ptyd_accounts.user_address,', ',ptyd_accounts.user_city,', ',
            # -- ptyd_accounts.user_state,' ',ptyd_accounts.user_zip) as Address, 
            # -- ptyd_accounts.user_gender as Gender, DATEDIFF(CURDATE(),ptyd_accounts.create_date) AS 'Num_of_days' from ptyd_accounts
            queries = """select concat(ptyd_accounts.first_name,' ',ptyd_accounts.last_name) as Full_name,
                            ptyd_accounts.user_gender as Gender,
                            concat(ptyd_accounts.user_address,', ',ptyd_accounts.user_zip) as Address,
                            count(*) as Meals_ordered,
                            ptyd_accounts.create_date AS 'Customer Since' 
                            from ptyd_accounts
                            inner join 
                            ptyd_payments pay ON ptyd_accounts.user_uid = pay.buyer_id
                            group by pay.buyer_id"""

            cus_info['CustomerInfo'] = execute(queries, 'get', conn)
            response['message'] = 'Request successful.'
            response['result'] = cus_info

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class CustomerInfo2(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        cus_info = {}
        try:
            conn = connect()

            queries = """select concat(ptyd_accounts.first_name,' ',ptyd_accounts.last_name) as Full_name,
                            DATEDIFF(CURDATE(),ptyd_accounts.create_date) AS 'Num_of_days', count(*) as Number_of_meals
                            from ptyd_accounts
                            inner join 
                            ptyd_payments pay ON ptyd_accounts.user_uid = pay.buyer_id
                            group by pay.buyer_id"""

            cus_info['CustomerInfo'] = execute(queries, 'get', conn)
            response['message'] = 'Request successful.'
            response['result'] = cus_info

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)



class AdminDBv2(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        results = {}
        try:
            conn = connect()
            queries_name = ["Meals_by_week", "Inventory_DB"]
            queries = [
                        """SELECT 
                            M.menu_date as "Entered Menu Date" ,
                            M.menu_category AS "Menu Category",
                            A.meal_desc as "Meal option" ,
                            M.menu_num_sold AS "How many to make"
                        FROM 
                            ptyd_menu M
                        JOIN 
                            ptyd_meals A ON M.menu_meal_id = A.meal_id
                        -- WHERE 
                            -- ENTER THE WEEK IN QUESTION IN “2020-02-01”
                        -- M.menu_date = "2020-02-01";""", 
                        """SELECT 
                        M.menu_meal_id AS "Menu Number",
                        M.menu_date "Entered Menu Date" ,
                        M.menu_category AS "Menu Category",
                        A.meal_desc "Meal option selected" ,
                        M.menu_num_sold AS "How many to make",
                        I.ingredient_desc AS "Ingredient Required Per meal",
                        R.recipe_ingredient_qty AS "Quantity of Ingredient Required",
                        (M.menu_num_sold * R.recipe_ingredient_qty) AS "Amount of ingredient needed this week",
                        CONCAT(inventory_qty," ", inventory_unit) AS "Amount of ingredient on hand",
                        inventory_location AS "location of ingredient",
                        I.package_size AS "A package of this much",
                        I.ingredient_cost AS "Will cost this much in $USD",
                        ((M.menu_num_sold * R.recipe_ingredient_qty) - inventory_qty  ) AS "quantity of ingredients needed to buy (Negative Surplus)" 
                    FROM 
                        ptyd_menu M
                    JOIN 
                        ptyd_meals A ON M.menu_meal_id = A.meal_id
                    JOIN 
                        ptyd_recipes R ON M.menu_meal_id = R.recipe_meal_id
                    JOIN 
                        ptyd_ingredients I ON R.recipe_ingredient_id = I.ingredient_id
                    JOIN
                        ptyd_inventory AS inv ON R.recipe_ingredient_id = inv.inventory_ingredient_id
                    -- WHERE 
                        -- ENTER THE WEEK IN QUESTION IN “2020-02-01”
                    -- M.menu_date = "2020-02-01";"""
                    ]
            
            for ind1,query in enumerate(queries):
                results[queries_name[ind1]] = execute(query, 'get', conn)
            
            # print(results["Meals_by_week"])

            response['message'] = 'Request successful.'
            response['result'] = results

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class MealCustomerLifeReport(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        results = {}
        try:
            conn = connect()
            queries_name = ["Meals report", "Customer Lifetime"]
            queries = [
                        """SELECT 
                        p.menu_meal_id,
                        M.meal_desc AS "Meal Name",
                        ROUND(AVG(p.menu_num_sold),2) AS "Average number sold per listing",
                        SUM(p.menu_num_sold) AS "Total Number Sold"
                        FROM
                            ptyd_menu p
                        JOIN 
                            ptyd_meals M ON p.menu_meal_id = M.meal_id
                        GROUP BY p.menu_meal_id
                        ORDER BY p.menu_meal_id ASC
                        ;
                        """,
                        """SELECT 
                        CONCAT(first_name, " " , last_name) AS "Customer Name",
                        create_date AS "Account creation Date",
                        last_update AS "Last account Update",
                        last_delivery AS "Last Delivery",
                        datediff(last_delivery, create_date) AS "Customer Lifetime in days",
                        timestampdiff(MONTH, create_date, last_delivery) AS "Customer Lifetime in months"
                        FROM
                            ptyd_accounts;"""
                    ]
            
            for ind1,query in enumerate(queries):
                results[queries_name[ind1]] = execute(query, 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = results

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# Define API routes
api.add_resource(Meals, '/api/v1/meals')
api.add_resource(Accounts, '/api/v1/accounts')

api.add_resource(Plans, '/api/v2/plans')
api.add_resource(SignUp, '/api/v2/signup')
api.add_resource(Account, '/api/v2/account/<string:accName>/<string:accPass>')

api.add_resource(TemplateApi, '/api/v2/templateapi')
api.add_resource(CustomerInfo, '/api/v2/customerinfo')
api.add_resource(CustomerProfile,'/api/v2/customerprofile')

api.add_resource(AdminDBv2, '/api/v2/admindb')
api.add_resource(MealCustomerLifeReport, '/api/v2/mealCustomerReport')

# Run on below IP address and port
# Make sure port number is unused (i.e. don't use numbers 0-1023)
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=2000)
