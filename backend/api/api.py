from flask import Flask, request, render_template
from flask_restful import Resource, Api
from flask_cors import CORS

from werkzeug.exceptions import BadRequest, NotFound

from decimal import Decimal
from datetime import datetime, date, timedelta
from hashlib import sha512
from math import ceil

import decimal
import sys
import json
import pymysql

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
    RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
    RDS_PORT = 3306
    RDS_USER = 'admin'
    RDS_DB = 'pricing'
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

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# ----------------------------------------------
# Template API
# ----------------------------------------------
# Each API is defined in a class and
# inherits the Resource class from flask_restful.
#
# We can define GET and POST APIs in each class
# with get() and post() functions. Pass self as
# a parameter to enable recursive use of members.
#
# In each function, the try block must connect to
# the database, run queries, and format them as
# needed. The queried data can then be returned
# along with the HTTP response code 200.
#
# If the try block fails, we can catch exceptions
# and raise a BadRequest.
#
# Finally, we must close the connection in the
# finally block.
# ----------------------------------------------

class NewApiTemplate(Resource):
    # This fetches the global variable RDS_PW
    # and stores it in the class's local
    # instance of RDS_PW
    #
    # When running this Python script locally,
    # we pass the password to the database as
    # a command line argument. This argument
    # will be stored into the global variable
    # RDS_PW.
    global RDS_PW

    # This is an API that will be called when
    # HTTP makes a GET request on the URL
    # for this API
    def get(self):
        try:
            # This will connect to our database
            # Refer to the function getRdsConn()
            # above for more info
            db = getRdsConn(RDS_PW)

            # The above function will create a
            # Connection object defined in the
            # pymysql module. We will store it
            # into the object conn.
            conn = db[0]

            # getRdsConn() will also initialize
            # a pymysql cursor object from our
            # Connection object. This cursor can
            # run MySQL queries.
            cur = db[1]

            # Initialize response
            response = {}

            # runSelectQuery() is a function
            # written above that will run a
            # SELECT query and return a tuple of
            # Python tuples. This will be
            # stored into query.
            query = runSelectQuery("SELECT meal_plan_id, meal_plan_desc FROM ptyd_meal_plans;", cur)

            # Successful message
            response['message'] = 'Request successful.'

            # We can manipulate the query object
            # from earlier as needed to format
            # our API data to our liking.
            response['result'] = query

            # Return the response object and the
            # HTTP code 200 to indicate the
            # GET request was successful.
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

# ----------------------------------------------
# We must also define a route for each API.
# Follow this template below to do so. Pass the
# class name and desired route as parameters.
# ----------------------------------------------

api.add_resource(NewApiTemplate, '/api/v1/newapitemplate')

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Plans API
class Plans(Resource):
    global RDS_PW

    # Format queried tuples into JSON
    def jsonifyMealPlans(self, query, rowDictKeys):
        json = []
        for row in query:
            rowDict = {}
            for element in enumerate(row):
                key = rowDictKeys[element[0]]
                value = element[1]
                # Convert all decimal values in row to floats
                if key == 'meal_plan_price':
                    value = float(value)
                    rowDict[key+'_per_meal'] = value / rowDict['num_meals']
                rowDict[key] = value
            json.append(rowDict)
        return json

    # HTTP method GET
    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = {}

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
                        CONCAT('/', num_meals, '-meals-subscription') AS RouteOnclick
                    FROM ptyd_meal_plans
                    WHERE payment_frequency = \'Monthly\';""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price
                    FROM ptyd_meal_plans
                    WHERE num_meals = 5;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price
                    FROM ptyd_meal_plans
                    WHERE num_meals = 10;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price
                    FROM ptyd_meal_plans
                    WHERE num_meals = 15;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_plan_price
                    FROM ptyd_meal_plans
                    WHERE num_meals = 20;"""]

            mealPlanKeys = ('meal_plan_id', 'meal_plan_desc', 'payment_frequency', 'photo_URL',
                            'plan_headline', 'plan_footer', 'num_meals', 'meal_plan_price', 'RouteOnclick')
            paymentPlanKeys = ('meal_plan_id', 'meal_plan_desc',
                               'payment_frequency', 'photo_URL', 'num_meals', 'meal_plan_price')

            query = runSelectQuery(queries[0], cur)
            items['MealPlans'] = self.jsonifyMealPlans(query, mealPlanKeys)

            query = runSelectQuery(queries[1], cur)
            items['FiveMealPaymentPlans'] = self.jsonifyMealPlans(
                query, paymentPlanKeys)

            query = runSelectQuery(queries[2], cur)
            items['TenMealPaymentPlans'] = self.jsonifyMealPlans(
                query, paymentPlanKeys)

            query = runSelectQuery(queries[3], cur)
            items['FifteenMealPaymentPlans'] = self.jsonifyMealPlans(
                query, paymentPlanKeys)

            query = runSelectQuery(queries[4], cur)
            items['TwentyMealPaymentPlans'] = self.jsonifyMealPlans(
                query, paymentPlanKeys)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

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
        return mealSelectionString

    # HTTP method POST
    def post(self):
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = []

            response = {}

            data = request.get_json(force=True)
#           data = {'recipient_id': '100-000001', 'start_date': '2020-02-01', 'meal_quantities': {'700-000001': 2, '700-000002': 1, '700-000011': 2}, 'delivery_day': 'Sunday'}
            print("Received:", data)

            mealSelection = self.formatMealSelection(data['meal_quantities'])
            print("Meal Selection String:", mealSelection)

#           queries = []

#           runInsertQuery(queries[0], cur, conn)

            response['message'] = 'Request successful.'

#           print("Query:", queries[0])

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
                    value = value.strftime("%b %d, %Y")
                if key is 'Subscription':
                    value = self.shortenPlanDesc(value)
                # Get weekly price of meal plan and multiply by X
                if key is 'WeeklyPrice':
                    key = 'NextCharge'
                    if self.isOneTimePlan(rowDict['Subscription']):
                        value = 0
                    else:
                        value = self.calculateNextCharge(value, rowDict['PaymentPlan'])
                # Get user's most recent payment date and offset by X weeks
                if key is 'payment_time_stamp':
                    key = 'NextChargeDate'
                    if self.isOneTimePlan(rowDict['Subscription']):
                        value = None
                    else:
                        value = self.calculateNextChargeDate(value, rowDict['PaymentPlan'])
                rowDict[key] = value
            rowDict['password_sha512'] = sha512(
                rowDict['user_name'].encode()).hexdigest()

            rowDict['PaidWeeksRemaining'] = self.calculatePaidWeeksRemaining(rowDict['NextChargeDate'])

            ccExpDateObj = datetime.strptime(rowDict['cc_exp_date'], "%b %d, %Y")
            rowDict['cc_exp_year'] = ccExpDateObj.strftime("%Y")
            rowDict['cc_exp_month'] = ccExpDateObj.strftime("%m")
            rowDict['cc_exp_day'] = ccExpDateObj.strftime("%d")

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
                        CONCAT('XX', RIGHT(cc_cvv, 1) ) AS cc_cvv_secret
                    FROM ptyd_accounts a1
                    LEFT JOIN ptyd_payments p1
                    ON user_uid = p1.buyer_id
                    LEFT JOIN ptyd_purchases
                    ON user_uid = recipient_id
                    LEFT JOIN ptyd_meal_plans
                    ON ptyd_purchases.meal_plan_id = ptyd_meal_plans.meal_plan_id
                    ORDER BY payment_time_stamp, user_uid DESC;""",
                    "SELECT * FROM ptyd_monday_zipcodes;"]

            accountKeys = ( 'user_uid', 'user_name', 'first_name', 'last_name',
                            'user_email', 'phone_number', 'user_address', 'address_unit',
                            'user_city', 'user_state', 'user_zip', 'user_region',
                            'user_gender', 'create_date', 'last_update', 'activeBool',
                            'last_delivery', 'referral_source', 'delivery_note', 'Subscription',
                            'PaymentPlan', 'WeeklyPrice', 'payment_time_stamp', 'purchase_status',
                            'MaximumMeals', 'cc_num_secret', 'cc_exp_date', 'cc_cvv_secret')
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
    global RDS_PW

    # Format queried tuples into JSON
    def jsonifyAccounts(self, query, rowDictKeys):
        json = []
        dateKeys = ['create_date', 'last_update', 'last_delivery']
        for row in query:
            rowDict = {}
            for element in enumerate(row):
                key = rowDictKeys[element[0]]
                value = element[1]
                if key in dateKeys:
                    value = value.strftime("%Y-%m-%d")
                rowDict[key] = value
            rowDict['password_sha512'] = sha512(
                rowDict['user_name'].encode()).hexdigest()
            json.append(rowDict)
        return json

    # HTTP method GET
    def get(self, accName, accPass):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = []

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

            accountKeys = ('user_uid', 'user_name', 'first_name', 'last_name', 'user_email', 'phone_number', 'user_address', 'address_unit', 'user_city',
                           'user_state', 'user_zip', 'user_region', 'user_gender', 'create_date', 'last_update', 'activeBool', 'last_delivery', 'referral_source', 'user_note')
            query = runSelectQuery(queries[0], cur)

            items = self.jsonifyAccounts(query, accountKeys)

            response['message'] = 'Request successful.'
            response['result'] = items

            passCheck = sha512(accPass.encode()).hexdigest()
            if passCheck == items[0]['password_sha512']:
                return response, 200
            else:
                return "Request failed, wrong password.", 400 
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

class SignUp(Resource):
    global RDS_PW

    def getNewUserID(self, cur):
        procedure = "get_new_user_id"
        cur.execute("CALL " + procedure + ";")
        result = cur.fetchall()
        return result[0][0]

    # HTTP method POST
    def post(self):
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = []

            response = {}

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
            WeeklyUpdates = "TRUE"
#           WeeklyUpdates = data['WeeklyUpdates']
            CreateDate = datetime.strftime(date.today(), "%Y-%m-%d")
            LastUpdate = CreateDate
            ActiveBool = "Yes"
            Referral = data['Referral']

            print("Received:", data)

#           NewUserID = "RunStoredProcedure"
            NewUserID = self.getNewUserID(cur)

            print("NewUserID:", NewUserID)

            queries = [
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
                        WeeklyUpdates + "," +
                        "\'" + CreateDate + "\'," +
                        "\'" + LastUpdate + "\'," +
                        "\'" + ActiveBool + "\'," +
                        "NULL," +
                        "\'" + Referral + "\'," +
                        "NULL," +
                        "NULL);"]

            runInsertQuery(queries[0], cur, conn)

            response['message'] = 'Request successful.'

            print("Query:", queries[0])

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

# Define API routes
api.add_resource(Plans, '/api/v1/plans')
api.add_resource(Meals, '/api/v1/meals')
api.add_resource(Accounts, '/api/v1/accounts')
api.add_resource(Account, '/api/v1/account/<string:accName>/<string:accPass>')
api.add_resource(SignUp, '/api/v1/signup')

# Run on below IP address and port
# Make sure port number is unused (i.e. don't use numbers 0-1023)
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=2000)
