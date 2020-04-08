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

# V2 Meals API
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
                    meal_id = eachMeal['meal_id']
                    mealQuantities[meal_id] = 0
        return mealQuantities

    # HTTP method GET
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()
            now = datetime.now()

            dates = execute("SELECT DISTINCT menu_date FROM ptyd_menu;", 'get', conn)

            i = 1
            for date in dates['result']:
                # only grab 6 weeks worth of menus
                if i == 7:
                    break
                # convert string to datetime
                stamp = datetime.strptime(date['menu_date'], '%Y-%m-%d')
                # Roll calendar at 4PM Monday
                if now - timedelta(days=1, hours=16) < stamp:

                    weekly_special = execute(
                        """ 
                        SELECT
                            meal_id,
                            meal_name,
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
                        WHERE (menu_category = 'WKLY_SPCL_1' OR menu_category = 'WKLY_SPCL_2' OR menu_category = 'WKLY_SPCL_3')
                        AND menu_date = '""" + date['menu_date'] + "';", 'get', conn)

                    seasonal_special = execute(
                        """ 
                        SELECT
                            meal_id,
                            meal_name,
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
                        WHERE (menu_category = 'SEAS_FAVE_1' OR menu_category = 'SEAS_FAVE_2' OR menu_category = 'SEAS_FAVE_3')
                        AND menu_date = '""" + date['menu_date'] + "';", 'get', conn)

                    smoothies = execute(
                        """ 
                        SELECT
                            meal_id,
                            meal_name,
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
                        WHERE (menu_category = 'SMOOTHIE_1' OR menu_category = 'SMOOTHIE_2' OR menu_category = 'SMOOTHIE_3')
                        AND menu_date = '""" + date['menu_date'] + "';", 'get', conn)

                    addon = execute(
                        """ 
                        SELECT
                            meal_id,
                            meal_name,
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
                        WHERE menu_category LIKE 'ADD_ON_%'
                        AND menu_date = '""" + date['menu_date'] + "';", 'get', conn)

                    week = {
                        'SaturdayDate': str((stamp - timedelta(days=1)).date()),
                        'SundayDate': str(stamp.date()),
                        'Sunday': stamp.strftime('%B %d'),
                        'Monday': (stamp + timedelta(days=1)).strftime('%B %d'),
                        'Meals': {
                            'Weekly': {
                                'Category': "WEEKLY SPECIALS",
                                'Menu': weekly_special['result']
                            },
                            'Seasonal': {
                                'Category': "SEASONAL FAVORITES",
                                'Menu': seasonal_special['result']
                            },
                            'Smoothies': {
                                'Category': "SMOOTHIES",
                                'Menu': smoothies['result']
                            }
                        },
                        'Addons': {
                            'Addons': {
                                'Category': "ADD ONS",
                                'Menu': addon['result']
                            },
                            'Weekly': {
                                'Category': "ADD MORE MEALS",
                                'Menu': weekly_special['result'] + seasonal_special['result']
                            },
                            'Smoothies': {
                                'Category': "ADD MORE SMOOTHIES",
                                'Menu': smoothies['result']
                            }
                        }
                    }

                    week['MealQuantities'] = self.getMealQuantities(week)

                    index = 'MenuForWeek' + str(i)
                    items[index] = week

                    i += 1

            # Finish Line
            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# NO LONGER USED
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
                print(key)
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

            print(1)
            rowDict['PaidWeeksRemaining'] = self.calculatePaidWeeksRemaining(rowDict['NextChargeDate'])
            print(2)

            try:
                ccExpDateObj = datetime.strptime(rowDict['cc_exp_date'], "%Y-%m-%d")
                rowDict['cc_exp_year'] = ccExpDateObj.strftime("%Y")
                rowDict['cc_exp_month'] = ccExpDateObj.strftime("%m")
                rowDict['cc_exp_day'] = ccExpDateObj.strftime("%d")
            except:
                rowDict['cc_exp_year'] = None
                rowDict['cc_exp_month'] = None
                rowDict['cc_exp_day'] = None

            print(3)
            if rowDict['billing_zip'] in mondayZips:
                rowDict['MondayAvailable'] = True
            else:
                rowDict['MondayAvailable'] = False

            print(4)
            json.append(rowDict)

        print(5)
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

class AccountSaltById(Resource):
    def get(self, userUid):
        response = {}
        try:
            conn = connect()

            items = execute(""" SELECT password_salt
                                FROM ptyd_passwords
                                WHERE password_user_uid = \'""" + userUid + "\';", 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items['result']

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class AccountSalt(Resource):
    def get(self, accEmail):
        response = {}
        try:
            conn = connect()

            items = execute(""" SELECT password_salt
                                FROM ptyd_passwords
                                INNER JOIN ptyd_accounts
                                ON password_user_uid = user_uid
                                WHERE user_email = \'""" + accEmail + "\';", 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items['result']

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

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
                    num_meals AS MaximumMeals,
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

            for eachItem in items['result']:
                last_charge_date = datetime.strptime(eachItem['last_payment_time_stamp'], '%Y-%m-%d %H:%M:%S')
                next_charge_date = None

                if eachItem['payment_frequency'] == 'Weekly':
                    next_charge_date = last_charge_date + timedelta(days=7)
                elif eachItem['payment_frequency'] == 'Bi-Weekly':
                    next_charge_date = last_charge_date + timedelta(days=14)
                elif eachItem['payment_frequency'] == 'Monthly':
                    next_charge_date = last_charge_date + timedelta(days=28)

                eachItem['paid_weeks_remaining'] = str( int( (next_charge_date - datetime.now()).days / 7 ) )
                eachItem['next_charge_date'] = str( next_charge_date.date() )            

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
                        \'STRIPE\',
                        \'""" + data['cc_num'][-4:] + """\',
                        \'""" + data['cc_exp_year'] + "-" + data['cc_exp_month'] + """-01\',
                        \'""" + data['cc_cvv'] + """\',
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

            if 'delivery_address_unit' in data:
                if data['delivery_address_unit'] == None:
                    DeliveryUnit = 'NULL'
                else:
                    DeliveryUnit = '\'' + data['delivery_address_unit'] + '\''
            else:
                DeliveryUnit = 'NULL'
            print(DeliveryUnit)

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

            possSocialAcc = execute("SELECT user_uid FROM ptyd_social_accounts WHERE user_email = '" + data['delivery_email'] + "';", 'get', conn)
            print(json.dumps(possSocialAcc, indent=1))

            if len(possSocialAcc['result']) != 0:
                if possSocialAcc['result'][0]['user_uid'] == data['user_uid']:
                    print('Very Cool Kanye!')
                    print("Successfully authenticated user.")
                else:
                    response['message'] = 'Could not authenticate user.'
                    return response, 400 
            elif userAuth['code'] != 280 or len(userAuth['result']) != 1:
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
                        """ + DeliveryUnit + """,
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

            queries = ["""
                SELECT
                    ms1.week_affected,
                    ms1.meal_selection,
                    ms1.selection_time,
                    ms1.delivery_day
                FROM ptyd_meals_selected AS ms1
                INNER JOIN (
                    SELECT
                        week_affected,
                        MAX(selection_time) AS latest_selection
                    FROM ptyd_meals_selected
                    GROUP BY week_affected
                ) ms2 ON ms1.week_affected = ms2.week_affected AND selection_time = latest_selection
                WHERE
                purchase_id = \'""" + purchaseId + "\';", """
                SELECT
                    ms1.week_affected,
                    ms1.meal_selection,
                    ms1.selection_time
                FROM ptyd_addons_selected AS ms1
                INNER JOIN (
                    SELECT
                        week_affected,
                        MAX(selection_time) AS latest_selection
                    FROM ptyd_addons_selected
                    GROUP BY week_affected
                ) ms2 ON ms1.week_affected = ms2.week_affected AND selection_time = latest_selection
                WHERE
                purchase_id = \'""" + purchaseId + "\';"]

            meals = execute(queries[0], 'get', conn)
            addons = execute(queries[1], 'get', conn)

            items['Meals'] = self.readQuery(meals['result'])
            items['Addons'] = self.readQuery(addons['result'])

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

    def formatMealSelection(self, mealSelection):
        mealSelectionString = ""
        for mealId in mealSelection:
            for mealCount in range(mealSelection[mealId]):
                mealSelectionString += mealId + ";"
        # Remove last semicolon
        return mealSelectionString[:-1]

    def postQuery(self, purchaseId, data):
        selectionTime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        if data['is_addons'] == True:
            mealSelection = self.formatMealSelection(data['addon_quantities'])
            query = """
                INSERT INTO ptyd_addons_selected
                (
                    purchase_id,
                    selection_time,
                    week_affected,
                    meal_selection
                )
                VALUES
                (
                    \'""" + purchaseId + """\',
                    \'""" + selectionTime + """\',
                    \'""" + data['week_affected'] + """\',
                    \'""" + mealSelection + "\');"
        else:
            # Handle SKIP request
            if data['delivery_day'] == 'SKIP':
                mealSelection = 'SKIP'
            # Handle default meal selection
            elif data['default_selected'] is True:
                mealSelection = 'SURPRISE'
            # Handle custom meal selection
            else:
                mealSelection = self.formatMealSelection(data['meal_quantities'])

            query = """
                INSERT INTO ptyd_meals_selected
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
                    \'""" + data['delivery_day'] + "\');"

        return query

    # HTTP method POST
    def post(self, purchaseId):
        response = {}
        items = []
        try:
            conn = connect()

            data = request.get_json(force=True)
            print("Received:", data)

            queries = [
                """ SELECT purchase_id
                    FROM ptyd_purchases
                    WHERE purchase_id = \'""" + purchaseId + "\';"]

            # Retrieve purchase ID
            getPurchaseId = execute(queries[0], 'get', conn)

            # Handle successful purchase ID query
            if getPurchaseId['code'] == 280:
                if not len(getPurchaseId['result']) > 0:
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

            queries.append(self.postQuery(purchaseId, data))

            execute(queries[1], 'post', conn)

            response['message'] = 'Request successful.'

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

class MealInfo(Resource):

    # HTTP method GET
    def get(self):
        response = {}
        meal_info = {}
        conn = connect()
        try:
            

            queries = """select A1.menu_meal_id,A3.meal_desc, A1.total_sold,A2.post_count, (A1.total_sold/A2.post_count) as "Number_sold_per_posting"
                        from
                        (select menu_meal_id, sum(menu_num_sold) as "total_sold" from ptyd_menu
                        #where month(menu_date) = 2
                        group by menu_meal_id) A1 
                        join
                        (select distinct menu_meal_id, count(menu_meal_id) "post_count"
                        from ptyd_menu
                        #where month(menu_date) = 2
                        group by menu_meal_id) A2
                        on A1.menu_meal_id = A2.menu_meal_id
                        join
                        (select meal_id, meal_desc from ptyd_meals)A3
                        on A1.menu_meal_id = A3.meal_id;
                        """

            meal_info['meal_info'] = execute(queries, 'get', conn)
            print(meal_info)
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
                        menu_date,
                        menu_category,
                        meal_desc,
                        IFNULL(menu_num_sold,0) AS menu_num_sold 
                        FROM 
                        ptyd_menu
                        JOIN ptyd_meals ON menu_meal_id=meal_id;""", 'get', conn)

                           
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
                menuEntries = 14
                while menuEntries != 0:
                    menu_cat = items['result'][index2]['menu_category']
                    menu_cat = "Menu Category: " + menu_cat
                    dictValues.append(menu_cat)
                    
                    menu_descript =  items['result'][index2]['meal_desc']
                    menu_descript = "Meal Description: " + menu_descript
                    dictValues.append(menu_descript)

                    menu_num = items['result'][index2]['menu_num_sold']
                    menu_num = str(menu_num)
                    menu_num = "Number Sold: " + menu_num
                    dictValues.append(menu_num)

                    menuEntries -=1
                    index2 +=1
                
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
    
    # HTTP method POST to update the menu
    def post(self):
        response = {}
        items = {}
        try:
            conn = connect()
            data = request.get_json(force=True)

            MenuDate = data['MenuDate']
            MenuCategory = data['MenuCategory']
            Meal = data['Meal']
            NumberSold = 0

            print("Received:", data)

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
    
class displayIngredients(Resource):
    global RDS_PW
    
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
                menuEntries = 14
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

class SocialSignUp(Resource):
    # HTTP method POST
    def post(self):
        response = {}
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
            SocialMedia = data['SocialMedia']
            AccessToken = data['AccessToken']
            RefreshToken = data['RefreshToken']

            print("Received:", data)

            # Query [0]
            queries = ["CALL get_new_user_id;"]

            NewUserIDresponse = execute(queries[0], 'get', conn)
            NewUserID = NewUserIDresponse['result'][0]['new_id']

            print("NewUserID:", NewUserID)

            # Query [1]
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

            # Query [2]
            queries.append("""
                INSERT INTO ptyd_social_accounts
                (
                    user_uid,
                    user_email,
                    user_social_media,
                    user_access_token,
                    user_refresh_token
                )
                VALUES
                (
                    \'""" + NewUserID + """\',
                    \'""" + Email + """\',
                    \'""" + SocialMedia + """\',
                    \'""" + AccessToken + """\',
                    \'""" + RefreshToken + "\');")

            usnInsert = execute(queries[1], 'post', conn)

            if usnInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Could not commit account.'
                print(response['message'], response['result'], usnInsert['code'])
                return response, 400

            socInsert = execute(queries[2], 'post', conn)

            if socInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Could not commit password.'
                print(response['message'], response['result'], socInsert['code'])
                return response, 500

            response['message'] = 'Request successful.'

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# Social Media Login API
class Social(Resource):

    # HTTP method GET
    def get(self, email):
        response = {}
        try:
            conn = connect()

            queries = [
            """     SELECT
                        user_uid,
                        user_email,
                        user_social_media,
                        user_access_token,
                        user_refresh_token
                    FROM ptyd_social_accounts WHERE user_email = '""" + email + "';"
            ]

            items = execute(queries[0], 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items

            print( items )

            # restest = SocialAccount().get(email)

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class SocialAccount(Resource):

    # HTTP method GET
    def get(self, uid):
        response = {}
        try:
            conn = connect()

            queries = [
            """     SELECT
                        user_uid,
                        first_name,
                        last_name,
                        user_email,
                        phone_number,
                        create_date,
                        last_update,
                        referral_source
                    FROM ptyd_accounts WHERE user_uid = '""" + uid + "';" ]

            items = execute(queries[0], 'get', conn)

            print(items)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class CheckEmail(Resource):

    # HTTP method GET
    def get(self, email):
        if email == None:
            return {'result': False}, 401

        try:
            conn = connect()

            queries = []
            queries.append( "SELECT user_email FROM ptyd_accounts WHERE user_email = '" + email + "';" )

            users = execute(queries[0], 'get', conn)

            if users['result'] == ():
                return {'result': False}, 401
            elif len(users['result']) > 0:
                return {'result': True}, 200

        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# Define API routes
# Customer page
api.add_resource(Meals, '/api/v2/meals')
api.add_resource(Plans, '/api/v2/plans')
api.add_resource(SignUp, '/api/v2/signup')
api.add_resource(CheckEmail, '/api/v2/checkemail/<string:email>')
api.add_resource(Account, '/api/v2/account/<string:accEmail>/<string:accPass>')
api.add_resource(AccountSalt, '/api/v2/accountsalt/<string:accEmail>')
api.add_resource(AccountSaltById, '/api/v2/accountsaltbyid/<string:userUid>')
api.add_resource(AccountPurchases, '/api/v2/accountpurchases/<string:buyerId>')
api.add_resource(Checkout, '/api/v2/checkout')
api.add_resource(MealSelection, '/api/v2/mealselection/<string:purchaseId>')

# Admin page
api.add_resource(CustomerInfo, '/api/v2/customerinfo')
api.add_resource(CustomerProfile,'/api/v2/customerprofile')

api.add_resource(MealInfo, '/api/v2/meal_info')

api.add_resource(AdminDBv2, '/api/v2/admindb')
api.add_resource(MealCustomerLifeReport, '/api/v2/mealCustomerReport')
api.add_resource(AdminMenu, '/api/v2/menu_display')
api.add_resource(displayIngredients, '/api/v2/displayIngredients')

api.add_resource(SocialSignUp, '/api/v2/socialSignup')
api.add_resource(Social, '/api/v2/social/<string:email>')
api.add_resource(SocialAccount, '/api/v2/socialacc/<string:uid>')

# Template
api.add_resource(TemplateApi, '/api/v2/templateapi')

# Run on below IP address and port
# Make sure port number is unused (i.e. don't use numbers 0-1023)
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=2000)
