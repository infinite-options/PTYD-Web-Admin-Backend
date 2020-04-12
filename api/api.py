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

getToday = lambda: datetime.strftime(date.today(), "%Y-%m-%d")
getNow = lambda: datetime.strftime(datetime.now(), "%Y-%m-%d %H:%M:%S")

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
                        meal_name,
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
                            meal_name,
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

            mealsKeys = ('menu_date', 'menu_category', 'menu_meal_id', 'meal_name', 'meal_category', 'meal_photo_url',
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
        response = {}
        items = []
        try:
            conn = connect()

            data = request.get_json(force=True)

            if data['num_meals'] == None:
                response['message'] = 'User not subscribed.'
                print("Error:", response['message'])
                return response, 400

            queries = [
                """ SELECT purchase_id
                    FROM ptyd_purchases
                    WHERE recipient_id = \'""" + data['recipient_id'] + "\';",
                """ SELECT default_meal_plan
                    FROM ptyd_default_meal_selection
                    WHERE num_meals = """ + str(data['num_meals']) + ";"]

            # Handle SKIP request
            if data['delivery_day'] == 'SKIP':
                mealSelection = 'SKIP'
            # Handle default meal selection
            elif data['default_selected'] is True:
                mealSelection = 'SURPRISE'
#               getDefault = execute(queries[1], 'get', conn)
#               # Handle successful default selection query
#               if getDefault['code'] == 280 and len(getDefault['result']) > 0:
#                   mealSelection = getDefault['result'][0]['default_meal_plan']
#               # Handle unsuccessful default selection query
#               else:
#                   response['message'] = 'Could not retrieve default meal selections.'
#                   response['error'] = getDefault
#                   print("Error:", response['message'])
#                   print("Error JSON:", response['error'])
#                   # 501: Not implemented in server
#                   return response, 501
            # Handle custom meal selection
            else:
                mealSelection = self.formatMealSelection(data['meal_quantities'])
#           print("Meal Selection String:", mealSelection)

            # Retrieve purchase ID
            getPurchaseId = execute(queries[0], 'get', conn)

            # Handle successful purchase ID query
            if getPurchaseId['code'] == 280:
                if len(getPurchaseId['result']) > 0:
                    purchaseId = getPurchaseId['result'][0]['purchase_id']
                # If user has no purchase ID
                else:
                    response['message'] = 'Recipient has no active purchase_id.'
                    response['error'] = getPurchaseId
                    print("Error:", response['message'])
                    # 400: Client side bad request
                    return response, 400
            # Handle unsuccessful purchase ID query
            else:
                response['message'] = 'Could not retrieve purchase_id.'
                response['error'] = getPurchaseId
                print("Error:", response['message'])
                # 500: Internal server error
                return response, 500
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

#           print("Query:", queries[2])
            execute(queries[2], 'post', conn)

            response['message'] = 'Request successful.'

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# V2 Accounts
class Accounts(Resource):
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
        if nextChargeDate and nextChargeDate != 'N/A':
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
        for row in query['result']:
            zips.append(row['zipcode'])
        return zips

    # Format query
    def formatQuery(self, query, mondayZips):
        json = []
        for row in query['result']:
            rowDict = {}
            for key in row:
                value = row[key]
                if key == 'Subscription':
                    if value:
                        value = self.shortenPlanDesc(value)
                    else:
                        value = None
                # Get weekly price of meal plan and multiply by X
                if key == 'WeeklyPrice':
                    if self.isOneTimePlan(rowDict['Subscription']):
                        rowDict['NextCharge'] = 0
                    elif rowDict['Subscription'] == None:
                        rowDict['NextCharge'] = 0
                    else:
                        rowDict['NextCharge'] = self.calculateNextCharge(value, rowDict['PaymentPlan'])
                # Get user's most recent payment date and offset by X weeks
                if key == 'payment_time_stamp':
                    if self.isOneTimePlan(rowDict['Subscription']):
                        rowDict['NextChargeDate'] = None
                    elif rowDict['Subscription'] == None:
                        rowDict['NextChargeDate'] = None
                    elif value == None:
                        rowDict['NextChargeDate'] = 'N/A'
                    else:
                        rowDict['NextChargeDate'] = self.calculateNextChargeDate(value, rowDict['PaymentPlan'])
                rowDict[key] = value

            rowDict['PaidWeeksRemaining'] = self.calculatePaidWeeksRemaining(rowDict['NextChargeDate'])

            try:
                ccExpDateObj = datetime.strptime(rowDict['cc_exp_date'], "%Y-%m-%d")
                rowDict['cc_exp_year'] = ccExpDateObj.strftime("%Y")
                rowDict['cc_exp_month'] = ccExpDateObj.strftime("%m")
                rowDict['cc_exp_day'] = ccExpDateObj.strftime("%d")
            except:
                rowDict['cc_exp_year'] = None
                rowDict['cc_exp_month'] = None
                rowDict['cc_exp_day'] = None

            if rowDict['billing_zip'] in mondayZips:
                rowDict['MondayAvailable'] = True
            else:
                rowDict['MondayAvailable'] = False

            json.append(rowDict)

        return json

    # HTTP method GET
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            # Needs password salt
            queries = [
                """ SELECT DISTINCT
                        user_uid,
                        user_email,
                        first_name,
                        last_name,
                        phone_number,
                        create_date,
                        last_update,
                        referral_source,
                        password_salt,
                        mp.meal_plan_desc AS Subscription,
                        mp.payment_frequency AS PaymentPlan,
                        mp.meal_plan_price AS WeeklyPrice,
                        p1.payment_time_stamp,
                        p1.billing_zip,
                        mp.num_meals AS MaximumMeals,
                        p1.cc_num AS cc_num_secret,
                        cc_exp_date,
                        CONCAT('XX', RIGHT(cc_cvv, 1) ) AS cc_cvv_secret
                    FROM ptyd_accounts a1
                    LEFT JOIN ptyd_payments p1
                    ON user_uid = p1.buyer_id
                    LEFT JOIN ptyd_purchases p2
                    ON p1.purchase_id = p2.purchase_id
                    LEFT JOIN ptyd_meal_plans mp
                    ON p2.meal_plan_id = mp.meal_plan_id
                    LEFT JOIN ptyd_passwords
                    ON user_uid = password_user_uid;""",
                    "SELECT * FROM ptyd_monday_zipcodes;"]

            query = execute(queries[0], 'get', conn)

            mondayZipsQuery = execute(queries[1], 'get', conn)
            mondayZips = self.formatMondayZips(mondayZipsQuery)

            items['MondayZips'] = mondayZips
            items['Accounts'] = self.formatQuery(query, mondayZips)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# SOON TO BE DEPRECATED
class AccountsV1(Resource):
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
                    FROM mock_accounts a1
                    LEFT JOIN mock_payments p1
                    ON user_uid = p1.buyer_id
                    LEFT JOIN mock_purchases
                    ON user_uid = recipient_id
                    LEFT JOIN mock_meal_plans
                    ON mock_purchases.meal_plan_id = mock_meal_plans.meal_plan_id
                    LEFT JOIN mock_passwords
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
    def get(self, accEmail, accPass):
        response = {}
        try:
            conn = connect()

            queries = [
                """ SELECT
                        user_uid,
                        first_name,
                        last_name,
                        user_email,
                        phone_number,
                        create_date,
                        last_update,
                        referral_source
                    FROM ptyd_accounts""" +
                    "\nWHERE user_email = " + "\'" + accEmail + "\';"]

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

class AccountPurchases(Resource):

    # HTTP method GET
    def get(self, buyerId):
        response = {}
        try:
            conn = connect()

            queries = [ """
                SELECT DISTINCT
                    payment_id,
                    buyer_id,
                    coupon_id,
                    gift,
                    amount_due,
                    amount_paid,
                    p1.purchase_id,
                    MAX(payment_time_stamp) AS last_payment_time_stamp,
                    payment_type,
                    CONCAT(\'XXXXXXXXXXXX\', cc_num) AS cc_num,
                    cc_exp_date,
                    cc_cvv,
                    billing_zip,
                    p2.meal_plan_id,
                    meal_plan_desc,
                    payment_frequency,
                    start_date,
                    delivery_first_name,
                    delivery_last_name,
                    delivery_email,
                    delivery_phone,
                    delivery_address,
                    delivery_address_unit,
                    delivery_city,
                    delivery_state,
                    delivery_zip,
                    delivery_region,
                    delivery_instructions
                FROM
                    ptyd_payments p1
                INNER JOIN
                    ptyd_purchases p2
                ON
                    p1.purchase_id = p2.purchase_id
                INNER JOIN
                    ptyd_meal_plans mp
                ON p2.meal_plan_id = mp.meal_plan_id
                WHERE buyer_id = \'""" + buyerId + """\'
                GROUP BY purchase_id;"""]

            items = execute(queries[0], 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items['result']
            return response, 200
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

            Email = data['Email']
            FirstName = data['FirstName']
            LastName = data['LastName']
            PhoneNumber = data['PhoneNumber']
            WeeklyUpdates = data['WeeklyUpdates']
            CreateDate = getToday()
            LastUpdate = CreateDate
            Referral = data['Referral']

            print("Received:", data)

            queries = ["CALL get_new_user_id;"]

            NewUserIDresponse = execute(queries[0], 'get', conn)
            NewUserID = NewUserIDresponse['result'][0]['new_id']

            print("NewUserID:", NewUserID)

            # Not storing customer addresses
            queries.append(
                """ INSERT INTO ptyd_accounts
                    (
                        user_uid,
                        user_email,
                        first_name,
                        last_name,
                        phone_number,
                        weekly_updates,
                        create_date,
                        last_update,
                        referral_source
                    )
                    VALUES
                    (""" +
                        "\'" + NewUserID + "\'," +
                        "\'" + Email + "\'," +
                        "\'" + FirstName + "\'," +
                        "\'" + LastName + "\'," +
                        "\'" + PhoneNumber + "\'," +
                        "\'" + WeeklyUpdates + "\'," +
                        "\'" + CreateDate + "\'," +
                        "\'" + LastUpdate + "\'," +
                        "\'" + Referral + "\');")

            DatetimeStamp = getNow()
            salt = getNow()
            hashed = sha512((data['Password'] + salt).encode()).hexdigest()

            queries.append("""
                INSERT INTO ptyd_passwords
                (
                    password_user_uid,
                    password_hash,
                    password_salt,
                    password_hash_algorithm,
                    datetime_created,
                    password_last_changed
                )
                VALUES
                (
                    \'""" + NewUserID + """\',
                    \'""" + hashed + """\',
                    \'""" + salt + """\',
                    \'SHA512\',
                    \'""" + DatetimeStamp + """\',
                    \'""" + DatetimeStamp + "\');")

            usnInsert = execute(queries[1], 'post', conn)

            if usnInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Could not commit account.'
                print(response['message'], response['result'], usnInsert['code'])
                return response, 400

            pwInsert = execute(queries[2], 'post', conn)

            if usnInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Could not commit password.'
                print(response['message'], response['result'], pwInsert['code'])
                return response, 500

            response['message'] = 'Request successful.'

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class Checkout(Resource):
    def getPaymentQuery(self, data, paymentId, purchaseId):
        query = """ INSERT INTO ptyd_payments
                    (
                        payment_id,
                        buyer_id,
                        gift,
                        coupon_id,
                        amount_due,
                        amount_paid,
                        purchase_id,
                        payment_time_stamp,
                        payment_type,
                        cc_num,
                        cc_exp_date,
                        cc_cvv,
                        billing_zip
                    )
                    VALUES (
                        \'""" + paymentId + """\',
                        \'""" + data['user_uid'] + """\',
                        \'""" + data['is_gift'] + """\',
                        NULL,
                        """ + data['item_price'] + """,
                        """ + data['item_price'] + """,
                        \'""" + purchaseId + """\',
                        \'""" + getNow() + """\',
                        \'unknown\',
                        \'""" + data['cc_num_secret'] + """\',
                        \'""" + data['cc_exp_year'] + "-" + data['cc_exp_month'] + """-01\',
                        \'""" + data['cc_cvv_secret'] + """\',
                        \'""" + data['billing_zip'] + "\');"
#       query = """ INSERT INTO ptyd_payments
#                   (
#                       payment_id,
#                       purchase_id,
#                       buyer_id,
#                       amount_paid,
#                       coupon_id,
#                       payment_time_stamp,
#                       payment_type,
#                       cc_num,
#                       cc_exp_date,
#                       cc_cvv
#                   )
#                   VALUES
#                   (
#                       \'""" + paymentId + """\',
#                       \'""" + purchaseId + """\',
#                       \'""" + data['user_uid'] + """\',
#                       """ + data['item_price'] + """,
#                       NULL,
#                       \'""" + getNow() + """\',
#                       \'unknown\',
#                       \'""" + data['cc_num_secret'] + """\',
#                       \'""" + data['cc_exp_year'] + "-" + data['cc_exp_month'] + """-01\',
#                       \'""" + data['cc_cvv_secret'] + "\');"
        return query

    def post(self):
        response = {}
        reply = {}
        try:
            conn = connect()
            data = request.get_json(force=True)

            print("Received:", data)

            purchaseIDresponse = execute("CALL get_new_purchase_id;", 'get', conn)
            paymentIDresponse = execute("CALL get_new_payment_id;", 'get', conn)
            purchaseId = purchaseIDresponse['result'][0]['new_id']
            paymentId = paymentIDresponse['result'][0]['new_id']

            mealPlan = data['item'].split(' Subscription')[0]

            queries = ["""
                SELECT
                    password_user_uid
                FROM
                    ptyd_passwords
                WHERE
                    password_user_uid = \'""" + data['user_uid'] + """\'
                AND
                    password_hash = \'""" + data['salt'] + "\'", """
                SELECT
                    meal_plan_id
                FROM
                    ptyd_meal_plans
                WHERE
                    meal_plan_desc = \'""" + mealPlan + "\'", """
                SELECT
                    cc_num
                FROM
                    ptyd_payments
                WHERE
                    buyer_id = \'""" + data['user_uid'] + "\';"]

            userAuth = execute(queries[0], 'get', conn)

            if userAuth['code'] != 280 or len(userAuth['result']) != 1:
                response['message'] = 'Could not authenticate user.'
                response['error'] = userAuth
                print("Error:", response['message'])
                print("Error JSON:", response['error'])
                if userAuth['code'] == 280:
                    statusCode = 400
                else:
                    statusCode = 500
                return response, statusCode
            else:
                print("Successfully authenticated user.")

            mealPlanQuery = execute(queries[1], 'get', conn)

            if mealPlanQuery['code'] == 280:
                print("Getting meal plan ID...")
                mealPlanId = mealPlanQuery['result'][0]['meal_plan_id']
                print("Meal Plan ID:", mealPlanId)
            else:
                response['message'] = 'Could not retrieve meal ID of requested plan.'
                response['error'] = mealPlanQuery
                print("Error:", response['message'])
                print("Error JSON:", response['error'])
                return response, 501

#           ccNumQuery = execute(queries[2], 'get', conn)
#           print(ccNumQuery)

            queries.append(self.getPaymentQuery(data, paymentId, purchaseId))

#           if ccNumQuery['code'] == 280 and len(ccNumQuery['result']) > 0:
#               print("Checking for existing credit cards...")
#               ccNumLastFour = ccNumQuery['result'][0]['cc_num']
#               print(data['cc_num'][-4:])
#               if data['cc_num'][-4:] == ccNumLastFour:
#                   queries.append("""
#                       INSERT INTO ptyd_payments
#                       (
#                           payment_id,
#                           buyer_id,
#                           gift,
#                           coupon_id,
#                           amount_due,
#                           amount_paid,
#                           purchase_id,
#                           payment_time_stamp,
#                           payment_type,
#                           cc_num,
#                           cc_exp_date,
#                           cc_cvv,
#                           billing_zip
#                       )
#                       SELECT
#                           \'""" + paymentId + """\',
#                           \'""" + data['user_uid'] + """\',
#                           \'""" + data['is_gift'] + """\',
#                           NULL,
#                           """ + data['item_price'] + """,
#                           """ + data['item_price'] + """,
#                           \'""" + purchaseId + """\',
#                           \'""" + getNow() + """\',
#                           payment_type,
#                           cc_num,
#                           cc_exp_date,
#                           cc_cvv,
#                           \'""" + data['billing_zip'] + """\'
#                       FROM
#                           ptyd_payments
#                       WHERE
#                           RIGHT(cc_num, 4) = \'""" + ccNumLastFour + """\'
#                       ORDER BY
#                           payment_time_stamp
#                       LIMIT 1;""")
#                   print("Credit card exists, using previous card.")
#               else:
#                   print('No matching credit cards found. Using user input.')
#                   queries.append(self.getPaymentQuery(data, paymentId, purchaseId))
#           else:
#               print('No matching credit cards found. Using user input.')
#               queries.append(self.getPaymentQuery(data, paymentId, purchaseId))

            queries.append(
                """ INSERT INTO ptyd_purchases
                    (
                        purchase_id,
                        meal_plan_id,
                        start_date,
                        delivery_first_name,
                        delivery_last_name,
                        delivery_email,
                        delivery_phone,
                        delivery_address,
                        delivery_address_unit,
                        delivery_city,
                        delivery_state,
                        delivery_zip,
                        delivery_region,
                        delivery_instructions
                    )
                    VALUES
                    (
                        \'""" + purchaseId + """\',
                        \'""" + mealPlanId + """\',
                        \'""" + getToday() + """\',
                        \'""" + data['delivery_first_name'] + """\',
                        \'""" + data['delivery_last_name'] + """\',
                        \'""" + data['delivery_email'] + """\',
                        \'""" + data['delivery_phone'] + """\',
                        \'""" + data['delivery_address'] + """\',
                        \'""" + data['delivery_address_unit'] + """\',
                        \'""" + data['delivery_city'] + """\',
                        \'""" + data['delivery_state'] + """\',
                        \'""" + data['delivery_zip'] + """\',
                        \'""" + data['delivery_region'] + """\',
                        \'""" + data['delivery_instructions'] + """\'
                    );""")

            reply['payment'] = execute(queries[3], 'post', conn)
            # Add credit card verification code here

            reply['purchase'] = execute(queries[4], 'post', conn)

            response['message'] = 'Request successful.'
            response['result'] = reply

            print(response)

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class MealSelection(Resource):
    def readQuery(self, items):
        for item in items:
            print(item)
            item['meals_selected'] = {}
            if item['meal_selection'] == 'SKIP':
                continue
            if item['meal_selection'] == 'SURPRISE':
                continue
            if item['meal_selection'] == None:
                continue
            selectedMeals = item['meal_selection'].split(';')
            for selectedMeal in selectedMeals:
                if selectedMeal in item['meals_selected']:
                    item['meals_selected'][selectedMeal] += 1
                else:
                    item['meals_selected'][selectedMeal] = 1
        return items

    def get(self, purchaseId):
        response = {}
        items = {}
        try:
            conn = connect()

            query = """ SELECT
                            week_affected,
                            meal_selection,
                            \'Sunday\' AS delivery_day
                            -- delivery_day
                        FROM ptyd_meals_selected
                        WHERE
                        purchase_id = \'""" + purchaseId + "\';"

            items = execute(query, 'get', conn)
            print(items)
            items = self.readQuery(items['result'])

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class CustomerInfo(Resource):

    # def ___inti__(self):
    #     self.dict1 = {"Full_name":None,"Current_subscription":None,"Start_date":None,"End_date":None}
    @staticmethod
    def jsonify_one(dict1):
        map_subs = {"Weekly":7,"Bi-Weekly":14}
        # res = {}
        # res = None
        start_date = datetime.strptime(dict1["start_date"], '%Y-%m-%d')
        if dict1["frequency"]=="Monthly":
            end_date = start_date + relativedelta(months=1)
        else:
            end_date = start_date + timedelta(days=map_subs[dict1["frequency"]])
        
        curr_date = datetime.now()
        delta = end_date - curr_date
        if delta.days<0:
            # res["weeks_left"] = "Expired"
            dict1["Weeks_left"] = "Expired"
        else:    
            # res["weeks_left"] = delta.days//7
            dict1["Weeks_left"]=delta.days//7

        del dict1['start_date']
        del dict1['frequency']
        # for key,vals in dict1.items():
        #     if key == "Full_name" or key == "Current_subscription":
        #         # res[key] = vals
        #         continue
        #     elif key == "start_date":
        #         start_date = datetime.strptime(dict1["start_date"], '%Y-%m-%d')
        #         if dict1["frequency"]=="Monthly":
        #             end_date = start_date + relativedelta(months=1)
        #         else:
        #             end_date = start_date + timedelta(days=map_subs[dict1["frequency"]])
                
        #         # res["end_date"] = end_date.strftime('%Y-%m-%d')
        #         curr_date = datetime.now()
        #         # curr_date = datetime.strptime("2020-02-15", '%Y-%m-%d')
        #         delta = end_date - curr_date
        #         if delta.days<0:
        #             # res["weeks_left"] = "Expired"
        #             res = "Expired"
        #         else:    
        #             # res["weeks_left"] = delta.days//7
        #             res=delta.days//7
        #     else:
        #         continue
        return dict1
            
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
                            pur.start_date as start_date, meal.payment_frequency as frequency, meal.meal_plan_desc as Current_subscription,
                            ptyd_accounts.user_gender as Gender,
                            concat(ptyd_accounts.user_address,', ',ptyd_accounts.user_zip) as Address,
                            count(*) as Meals_ordered,
                            ptyd_accounts.create_date AS 'Customer_Since' 
                            from ptyd_accounts
                            inner join 
                            ptyd_payments pay ON ptyd_accounts.user_uid = pay.buyer_id
                            inner join
                            ptyd_purchases pur ON ptyd_accounts.user_uid = pur.recipient_id
                            inner join 
                            ptyd_meal_plans meal on pur.meal_plan_id = meal.meal_plan_id
                            group by pay.buyer_id"""

            cus_info['CustomerInfo'] = execute(queries, 'get', conn)
            list1 = list(map(CustomerInfo.jsonify_one,cus_info['CustomerInfo']['result']))
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

            queries = """
                            SELECT
                                concat(ptyd_accounts.first_name,' ',ptyd_accounts.last_name) as Full_name,
                                DATEDIFF(CURDATE(),ptyd_accounts.create_date) AS 'Num_of_days', count(*) as Number_of_meals
                            FROM ptyd_accounts
                            inner join 
                                ptyd_payments pay ON ptyd_accounts.user_uid = pay.buyer_id
                            group by pay.buyer_id;
                            """

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
                            A.meal_name as "Meal option" ,
                            M.menu_num_sold AS "How many to make"
                        FROM 
                            ptyd_menu M
                        JOIN 
                            ptyd_meals A ON M.menu_meal_id = A.meal_id
                        -- WHERE 
                            -- ENTER THE WEEK IN QUESTION IN “2020-02-01”
                        -- M.menu_date = "2020-02-01";
                        """, 

                        """SELECT 
                        M.menu_meal_id AS "Menu Number",
                        M.menu_date "Entered Menu Date" ,
                        M.menu_category AS "Menu Category",
                        A.meal_name "Meal option selected" ,
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
                    -- M.menu_date = "2020-02-01";
                    """

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
                        M.meal_name AS "Meal Name",
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
                            ptyd_accounts;
                            """
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

class MealInfo(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        meal_info = {}
        conn = connect()
        try:
            

            queries = """SELECT A.menu_meal_id, B.meal_name, total_sold, times_posted,total_sold/times_posted AS "Avg Sales/Posting"
                        FROM 
                            (SELECT 
                                menu_meal_id,
                                count(menu_meal_id) AS times_posted
                            FROM 
                                ptyd_menu
                            GROUP BY menu_meal_id) AS A
                        JOIN 

                        (SELECT
                            meal_selected,
                            
                            meal_name AS Meal_Name,
                            count(n) as total_sold from (select delivery_day, week_affected, substring_index(substring_index(meal_selection,';',n),';',-1) as meal_selected,n
                        FROM 
                            ptyd_meals_selected 
                        JOIN
                            numbers
                        ON char_length(meal_selection)
                            - char_length(replace(meal_selection, ';', ''))
                            >= n - 1) sub1
                        JOIN 
                            ptyd_meals

                        ON sub1.meal_selected=meal_id
                        GROUP BY sub1.meal_selected ) AS B

                        ON
                            B.meal_selected = A.menu_meal_id
                        """

            meal_info['meal_info'] = execute(queries, 'get', conn)
            response['message'] = 'Request successful.'
            response['result'] = meal_info

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class AdminMenu(Resource):
    global RDS_PW
    
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(
                    """ SELECT
                            A.menu_date,A.menu_category,A.meal_name, IFNULL(B.total_sold,0) AS total_sold
                        FROM 
                            (SELECT 
                                menu_date,
                                menu_category,
                                meal_name,
                                menu_meal_id
                            FROM 
                                ptyd_menu
                            JOIN ptyd_meals ON menu_meal_id=meal_id) AS A

                        LEFT JOIN 
                        (SELECT
                            week_affected,
                            meal_selected,
                            meal_name AS Meal_Name,
                            count(n) as total_sold from (select delivery_day, week_affected, substring_index(substring_index(meal_selection,';',n),';',-1) as meal_selected,n
                        FROM 
                            ptyd_meals_selected 
                        JOIN
                            numbers
                        ON char_length(meal_selection)
                            - char_length(replace(meal_selection, ';', ''))
                            >= n - 1) sub1
                        JOIN 
                            ptyd_meals

                        ON sub1.meal_selected=meal_id
                        GROUP BY sub1.meal_selected, week_affected) AS B
                        ON
                            A.menu_date = B.week_affected;
                        """, 'get', conn)
                           
           
            menuDates = []
            for index in range(len(items['result'])):
                placeHolder = items['result'][index]['menu_date']
                menuDates.append(placeHolder)
            menuDates = list( dict.fromkeys(menuDates) )
            

            d ={}
            for index in range(len(menuDates)):
                key = menuDates[index]
                d[key] = 'value'
            
        
            
            index2 = 0
            for index in range(len(menuDates)):
                dictValues = []
                #------------ 6/menuEntries is hard coded, need to add logic to calculate ---------
                menuEntries = 6
                while menuEntries != 0:
                    menu_cat = items['result'][index2]['menu_category']
                    menu_cat = "Menu Category: " + menu_cat
                    dictValues.append(menu_cat)
                    
                    menu_descript =  items['result'][index2]['meal_name']
                    menu_descript = "Meal Name: " + menu_descript
                    dictValues.append(menu_descript)

                    menu_total_sold = items['result'][index2]['total_sold']
                    menu_total_sold = "Total Sold: " + str(menu_total_sold)
                    dictValues.append(menu_total_sold)

                    menuEntries -=1
                    index2 +=1
                
                d[menuDates[index]] = dictValues

        



            response['message'] = 'successful'
            response['result'] = d

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)
    
    
    
class displayIngredients(Resource):
    global RDS_PW
    
    #not working because we need a new querie to calculate number sold 

    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(
                    """ SELECT 
                            menu_date,
                            ingredient_desc,
                            IFNULL(CONCAT(TRIM(ROUND(SUM((menu_num_sold*recipe_ingredient_qty)*(SELECT conversion_ratio FROM ptyd_measure_conversion WHERE from_measure_unit_id=recipe_measure_id AND to_measure_unit_id=ingredient_measure_id)  ),6))+0, " ",
                            ingredient_measure),0) AS quantity
                        FROM 
                            ptyd_menu
                        JOIN
                            ptyd_recipes ON menu_meal_id=recipe_meal_id
                        JOIN 
                            ptyd_ingredients ON recipe_ingredient_id = ingredient_id
                        JOIN 
                            ptyd_meals ON recipe_meal_id = meal_id
                        GROUP BY ingredient_desc, menu_date
                        ORDER BY menu_date, menu_category ASC;
                        """, 'get', conn)
                        
            print('Items --------------------------------------------')         
            print(items['result'][0]['menu_date'])
            
            print('Test Code ---------------------------------------')
            menuDates = []
            for index in range(len(items['result'])):
                placeHolder = items['result'][index]['menu_date']
                menuDates.append(placeHolder)
            menuDates = list( dict.fromkeys(menuDates) )
            
            print(menuDates)


            d ={}
            for index in range(len(menuDates)):
                key = menuDates[index]
                d[key] = 'value'
            
            print('new dictionary-------------------------------')
            print(d)

            print('test-------------')

            index2 = 0
            for index in range(len(menuDates)):
                dictValues = []
                #------------ 6/menuEntries is hard coded, need to add logic to calculate ---------
                menuEntries = 6
                print(menuEntries)
                while menuEntries != 0:
                    print(menuEntries)
                    ingredient_description = items['result'][index2]['ingredient_desc']
                    ingredient_description = "Ingredient: " + ingredient_description
                    dictValues.append(ingredient_description)
                    print(menuEntries)

                    ingredients_needed =  items['result'][index2]['quantity']
                    ingredients_needed = "Amount needed to use: " + ingredients_needed
                    dictValues.append(ingredients_needed)

                    menuEntries -=1
                    index2 +=1
                    print(menuEntries)
                
                d[menuDates[index]] = dictValues
        
            print ('Dictionary part 2 --------------')
            print(d)



            response['message'] = 'successful'
            response['result'] = d

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class MenuCreation(Resource):
    global RDS_PW
    
    #----------------- 
    # POST for 1. pulling up the menu dates available. 2. Populating the menu type and meal if there is an existing one. 3. providing a list of meals and their
    # average sold per posting
    # ----------------

    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(
                    """ SELECT 
                        menu_date,
                        menu_type,
                        meal_category,
                        meal_name
                        FROM 
                        ptyd_menu
                        JOIN ptyd_meals ON menu_meal_id=meal_id
                        ORDER BY menu_date DESC ;""", 'get', conn)

            # generated all of the menu dates available                
            menuDates = []
            for index in range(len(items['result'])):
                placeHolder = items['result'][index]['menu_date']
                menuDates.append(placeHolder)
            
            # formated the menu dates into a list
            menuDates = list( dict.fromkeys(menuDates) )

            

            d ={}
            for index in range(len(menuDates)):
                key = menuDates[index]
                d[key] = 'value'
            
            

            for index in range(len(menuDates)):
                
                

                menuInfo =[]
                for index2 in range(len(items['result'])):
                    tempDict = {}
                    if (items['result'][index2]['menu_date'] == menuDates[index]):
                        
                        key1 = "Menu Type"
                        key2 = "Meal Name"
                        
                        menuType = items['result'][index2]['menu_type']
                        mealNames = items['result'][index2]['meal_name']

                        tempDict[key1] = menuType
                        tempDict[key2] = mealNames
                        
                        menuInfo.append(tempDict)

                
                d[menuDates[index]] = menuInfo

            
            items = execute(
                        """ SELECT C.meal_id, C.meal_name, IFNULL(B.total_sold,0) AS total_sold, IFNULL(A.times_posted,0) AS times_posted, IFNULL(total_sold/times_posted,0) AS "Avg Sales/Posting"
                            FROM 
                                (SELECT 
                                    menu_meal_id,
                                    count(menu_meal_id) AS times_posted
                                FROM 
                                    ptyd_menu
                                GROUP BY menu_meal_id) AS A


                            JOIN 

                            (SELECT
                                meal_selected,
                                
                                meal_name AS Meal_Name,
                                count(n) as total_sold from (select delivery_day, week_affected, substring_index(substring_index(meal_selection,';',n),';',-1) as meal_selected,n
                            FROM 
                                ptyd_meals_selected 
                            JOIN
                                numbers
                            ON char_length(meal_selection)
                                - char_length(replace(meal_selection, ';', ''))
                                >= n - 1) sub1
                            JOIN 
                                ptyd_meals
                            ON sub1.meal_selected=meal_id
                            GROUP BY sub1.meal_selected ) AS B

                            ON
                                B.meal_selected = A.menu_meal_id
                            RIGHT JOIN 
                                ptyd_meals C 
                            ON A.menu_meal_id = C. meal_id;
                        """, 'get', conn)
            
            #creating list of meal categories to isolate unique values
            
            mealAvg = []
            mealNames = []
            mealPostings = []
            mealTotalSold = []
            for index in range(len(items['result'])):
                placeHolder = items['result'][index]['meal_name']
                mealNames.append(placeHolder)
                placeHolder = items['result'][index]['Avg Sales/Posting']
                mealAvg.append(placeHolder)
                placeHolder = items['result'][index]['total_sold']
                mealTotalSold.append(placeHolder)
                placeHolder = items['result'][index]['times_posted']
                mealPostings.append(placeHolder)

            
            

            #mealNames = list( dict.fromkeys(mealNames) )
          
            # initializing empty dictionary with the meal categories as keys
            mealList =[]
            
            for index in range(len(mealNames)):
                tempDict = {}
                key1 = "Meal Name"
                key2 = "Avg Sales/Posting"
                key3 = "Total Posts"
                key4 = "Total Sold"
                tempDict[key1] = mealNames[index]
                tempDict[key2] = str(mealAvg[index])
                tempDict[key3] = str(mealPostings[index])
                tempDict[key4] = str(mealTotalSold[index])
                mealList.append(tempDict)
                

            
           #iterating through all of the meal options and sorting the meal name and average sales into the meal category dictionary with values as lists


          

            response['message'] = 'successful'
            
            response['menu_dates'] = menuDates
            response['menus'] = d
            response['result'] = mealList
            

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)
    
    def post(self):
        response = {}
        
        data = request.get_json(force=True)

        Date = data['MenuDate']
        Type = data['MenuType']
        MealName= data['MealName']
        MenuMealID = ''

        try:
            conn = connect()

            MenuMealID = execute(
                            """ SELECT 
                                    meal_id
                                FROM 
                                    ptyd_meals
                                WHERE meal_name = \'""" + MealName + "\';"
                                , 'get', conn)
           
            items = execute(""" INSERT INTO ptyd_menu
                    (
                        menu_date,
                        menu_type,
                        menu_meal_id
                    )
                    VALUES
                    (""" +
                        "\'" + Date + "\'," +
                        "\'" + Type + "\'," +
                        "\'" + MenuMealID+ "\');", 'get', conn)


            print('TEST POST-------------------')
            print(items)
            
            
            response['message'] = 'successful'
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





# Define API routes

# Still uses getRdsConn()
# Needs to be converted to V2 APIs
api.add_resource(Meals, '/api/v1/meals')
api.add_resource(AccountsV1, '/api/v1/accounts')

# New APIs, uses connect() and disconnect()
api.add_resource(Accounts, '/api/v2/accounts')
api.add_resource(Plans, '/api/v2/plans')
api.add_resource(SignUp, '/api/v2/signup')
api.add_resource(Account, '/api/v2/account/<string:accEmail>/<string:accPass>')
api.add_resource(AccountPurchases, '/api/v2/accountpurchases/<string:buyerId>')
api.add_resource(Checkout, '/api/v2/checkout')
api.add_resource(MealSelection, '/api/v2/mealselection/<string:purchaseId>')

api.add_resource(CustomerInfo, '/api/v2/customerinfo')
api.add_resource(CustomerProfile,'/api/v2/customerprofile')

api.add_resource(MealInfo, '/api/v2/meal_info')

api.add_resource(AdminDBv2, '/api/v2/admindb')

api.add_resource(MealCustomerLifeReport, '/api/v2/mealCustomerReport')
api.add_resource(AdminMenu, '/api/v2/menu_display')
api.add_resource(displayIngredients, '/api/v2/displayIngredients')

api.add_resource(MenuCreation, '/api/v2/create-menu')

api.add_resource(TemplateApi, '/api/v2/templateapi')

# Run on below IP address and port
# Make sure port number is unused (i.e. don't use numbers 0-1023)
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=2000)
