from flask import Flask, request, render_template, url_for, redirect
from flask_restful import Resource, Api
from flask_mail import Mail, Message # used for email
from itsdangerous import URLSafeTimedSerializer, SignatureExpired, BadTimeSignature #used for serializer email and error handling
from flask_cors import CORS

from werkzeug.exceptions import BadRequest, NotFound

from dateutil.relativedelta import *
from decimal import Decimal
from datetime import datetime, date, timedelta
from hashlib import sha512
from math import ceil

# BING API KEY
# Import Bing API key into bing_api_key.py
from env_keys import BING_API_KEY, RDS_PW

# When deploying to Zappa, replace above statement with below:
#BING_API_KEY = "insert_key_kere"
#RDS_PW = "insert_password_here"

import decimal
import sys
import json
import pymysql
import requests

RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
RDS_PORT = 3306
RDS_USER = 'admin'
RDS_DB = 'ptyd'

app = Flask(__name__)

#--------------- Stripe Variables ------------------
pubKey = 'pk_test_3HElAH8HDKNUmf5qCPxIyxDn00I2qUjmiM'
secKey = 'sk_test_rcUdq1pyNtsDMCWE4ool6qK100z3zdq0Hr'

# Allow cross-origin resource sharing
cors = CORS(app, resources={r'/api/*': {'origins': '*'}})

# Set this to false when deploying to live application
app.config['DEBUG'] = True

# Adding for email testing
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'ptydtesting@gmail.com'
app.config['MAIL_PASSWORD'] = 'infiniteoptions0422'
app.config['MAIL_DEFAULT_SENDER'] = 'ptydtesting@gmail.com'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
#app.config['MAIL_DEBUG'] = True
#app.config['MAIL_SUPPRESS_SEND'] = False
#app.config['TESTING'] = False

mail = Mail(app)

# API
api = Api(app)

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
        conn = pymysql.connect(RDS_HOST,
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
def execute(sql, cmd, conn, skipSerialization=False):
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
        for key in [('Addons', 'ADD-ON'), ('Weekly', 'ADD MORE MEALS'), ('Smoothies', 'ADD MORE SMOOTHIES')]:
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
    # Optional parameter: startDate (YYYYMMDD)
    def get(self, startDate = None):
        response = {}
        items = {}

        try:
            if startDate:
                now = datetime.strptime(startDate, "%Y%m%d")
            else:
                now = datetime.now()

        except:
            raise BadRequest('Request failed, bad startDate parameter.')

        try:
            conn = connect()

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
                        'SaturdayDate': str(stamp.date()),
                        'SundayDate': str((stamp + timedelta(days=1)).date()),
                        'Sunday': str((stamp + timedelta(days=1)).date().strftime('%b %-d')),
                        'Monday': str((stamp + timedelta(days=2)).date().strftime('%b %-d')),
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

# Return salt if current login session
class SessionVerification(Resource):
    def get(self, userUid, sessionId):
        response = {}
        try:
            conn = connect()

            items = execute(""" SELECT password_salt
                , referral_source
                FROM ptyd_passwords
                RIGHT JOIN ptyd_accounts
                ON password_user_uid = user_uid
                INNER JOIN ptyd_login
                ON password_user_uid = login_user_uid
                WHERE user_uid = \'""" + userUid + """\'
                AND session_id = \'""" + sessionId + """\'
                ;""", 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items['result']
            print("response['result']: {} ".format(response['result']))
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
    def get(self, accId):
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
                    "\nWHERE user_uid = " + "\'" + accId + "\';"]

            items = execute(queries[0], 'get', conn)
            user_uid = items['result'][0]['user_uid']

            queries.append("SELECT * FROM ptyd_passwords WHERE password_user_uid = \'" + user_uid + "\';")
            password_response = execute(queries[1], 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items['result']
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

def ipVersion(ip):
    if '.' in ip:
        return 'IPv4'
    elif ':' in ip:
        return 'IPv6'
    else:
        return 'unknown'

# NO MAC ADDRESS INSERT
def LogLoginAttempt(data, conn):
    try:
        response = {}

        login_id_res = execute("CALL get_login_id;", 'get', conn)
        login_id = login_id_res['result'][0]['new_id']
        # Generate random session ID

        if data["auth_success"] is "TRUE":
            session_id = "\'" + sha512(getNow().encode()).hexdigest() + "\'"
        else:
            session_id = "NULL"
        sql = """
            INSERT INTO ptyd_login (
                login_attempt
                , login_password
                , login_user_uid
                , ip_address
                , ip_version
                , browser_type
                , attempt_datetime
                , successBool
                , session_id
            )
            VALUES
            (
                \'""" + login_id + """\'
                , \'""" + data["attempt_hash"] + """\'
                , \'""" + data["user_uid"] + """\'
                , \'""" + data["ip_address"] + """\'
                , \'""" + ipVersion(data["ip_address"]) + """\'
                , \'""" + data["browser_type"] + """\'
                , \'""" + getNow() + """\'
                , \'""" + data["auth_success"] + """\'
                , """ + session_id + """
            );
            """
        log = execute(sql, 'post', conn)

        if session_id != "NULL":
            session_id = session_id[1:-1]
            print(session_id)

        response['session_id'] = session_id
        response['login_id'] = login_id
        print(log)

        return response
    except:
        print("Could not log login attempt.")
        return None

class Login(Resource):

    def post(self, accEmail, accPass):
        response = {}
        try:
            conn = connect()
            data = request.get_json(force=True)
            print (data)
            if data.get('ip_address') == None:
                response['message'] = 'Request failed, did not receive IP address.'
                return response, 400
            if data.get('browser_type') == None:
                response['message'] = 'Request failed, did not receive browser type.'
                return response, 400

            queries = [
                """ SELECT
                        user_uid,
                        first_name,
                        last_name,
                        user_email,
                        phone_number,
                        create_date,
                        last_update,
                        referral_source,
                        email_verify
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
                httpCode = 200
            else:
                print("Wrong password.")
                response['message'] = 'Request failed, wrong password.'
                response['auth_success'] = False
                httpCode = 401

            login_attempt = {
                'user_uid': user_uid,
                'attempt_hash': accPass,
                'ip_address': data['ip_address'],
                'browser_type': data['browser_type'],
            }

            if response['auth_success']:
                login_attempt['auth_success'] = 'TRUE'
            else:
                login_attempt['auth_success'] = 'FALSE'

            response['login_attempt_log'] = LogLoginAttempt(login_attempt, conn)

            return response, httpCode
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

            queries = ["""
               SELECT DISTINCT
                   payment_id,
                   purchase_status,
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
               WHERE buyer_id = \'""" + buyerId + """\'AND purchase_status = "ACTIVE"
               GROUP BY purchase_id""",
                       "   SELECT * FROM ptyd_monday_zipcodes;"]

            items = execute(queries[0], 'get', conn)
            mondayZipsQuery = execute(queries[1], 'get', conn)

            mondayZips = []
            for eachZip in mondayZipsQuery['result']:
                mondayZips.append(eachZip['zipcode'])
            del mondayZipsQuery

            for eachItem in items['result']:
                last_charge_date = datetime.strptime(eachItem['last_payment_time_stamp'], '%Y-%m-%d %H:%M:%S')
                print("strptime", eachItem['last_payment_time_stamp'])
                print("last_charge_date", last_charge_date)
                next_charge_date = None

                if eachItem['payment_frequency'] == 'Weekly':
                    next_charge_date = last_charge_date + timedelta(days=7)
                elif eachItem['payment_frequency'] == 'Bi-Weekly':
                    next_charge_date = last_charge_date + timedelta(days=14)
                elif eachItem['payment_frequency'] == 'Monthly':
                    next_charge_date = last_charge_date + timedelta(days=28)
                
                tempdate = datetime(2020, 5, 25, 21, 59, 59, 342380)
                print("datetime now",datetime.now())
                print("datetime noww", tempdate)
                # eachItem['paid_weeks_remaining'] = str(int((next_charge_date - datetime.now()).days / 7) + 1)
                eachItem['paid_weeks_remaining'] = str(int((next_charge_date - tempdate).days / 7) + 1)
                print("paid_week_remaining", eachItem['paid_weeks_remaining'])

                eachItem['next_charge_date'] = str(next_charge_date.date())
                print("next_charge_date", eachItem['next_charge_date'])

                if eachItem['delivery_zip'] in mondayZips:
                    eachItem['monday_available'] = True
                else:
                    eachItem['monday_available'] = False

            response['message'] = 'Request successful.'
            response['result'] = items['result']
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


'''This part use for testing of sending confirmation email'''

s = URLSafeTimedSerializer('thisisaverysecretkey')  # should put the secret key in this.

'''Confirmation testing is ended here'''
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
            print ("User insert: {}".format(usnInsert.get('code')))
            if usnInsert['code'] != 281:
                response['message'] = 'Request failed.'

                query = """
                    SELECT user_email FROM ptyd_accounts
                    WHERE user_email = \'""" + Email + "\';"

                emailExists = execute(query, 'get', conn)

                if emailExists['code'] == 280 and len(emailExists['result']) > 0:
                    statusCode = 400
                    response['result'] = 'Email address taken.'
                else:
                    statusCode = 500
                    response['result'] = 'Internal server error.'

                response['code'] = usnInsert['code']
                print(response['message'], response['result'], usnInsert['code'])
                print('response will be sent to client')
                return response, statusCode

            pwInsert = execute(queries[2], 'post', conn)

            if pwInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Internal server error (Password write).'
                response['code'] = pwInsert['code']

                # Make sure to delete signed up user
                # New user was added to db from first MySQL cmd
                query = """
                    DELETE FROM ptyd_accounts
                    WHERE user_email = \'""" + Email + "\';"

                deleteUser = execute(query, 'post', conn)

                # Handle error for successful user account signup
                # but failed password storing to the db
                if deleteUser['code'] != 281:
                    response[
                        'WARNING'] = "This user was signed up to the database but did not properly store their password. Their account cannot be logged into and must be reset by a system administrator."
                    response['code'] = 590

                print(response['message'], response['result'], pwInsert['code'])
                return response, 500

            #this part using for testing email verification

            token = s.dumps(Email)
            msg = Message("Email Verification", sender='ptydtesting@gmail.com', recipients=[Email])
            link = url_for('confirm', token=token, hashed=hashed, _external=True)
            msg.body = "Click on the link <a href={}> Please confirm to verify your email address. </a> ".format(link)

            mail.send(msg)
            #email verification testing is ended here...

            response['message'] = 'Request successful. An email has been sent and need to verify.'
            response['code'] = usnInsert['code']
            response['first_name'] = FirstName
            response['user_uid'] = NewUserID

            print(response)
            return response, 200
        except:
            print("Error happened while Sign Up")
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class Coordinates:
    #array of addresses such as 
    #['Dunning Ln, Austin, TX 78746', '12916 Cardinal Flower Drive, Austin, TX 78739', '51 Rainey St., austin, TX 78701']
    def __init__(self, locations):
        self.locations = locations
    
    def calculateFromLocations(self):
        global BING_API_KEY

        params = {
        'key' : BING_API_KEY
        }
        coordinates = []

        for address in self.locations:
            formattedAddress = self.formatAddress(address)
            r = requests.get('http://dev.virtualearth.net/REST/v1/Locations/{}'.format(formattedAddress),\
                '&maxResults=1&key={}'.format(params['key']))
            results = r.json() 

            try:
                assert(results['resourceSets'][0]['estimatedTotal']) 
                point = results['resourceSets'][0]['resources'][0]['geocodePoints'][0]['coordinates']
                lat, lng = point[0], point[1]
            except:
                lat,lng = None, None

            #appends a dictionary of latitude and longitude points for the given address
            coordinates.append({
                "latitude": lat,
                "longitude": lng
            })
        #prints lat, long points for each address
        for i in coordinates:
            print(i, "\n")
            print(type(i["latitude"]))

        #return array of dictionaries containing lat, long points
        return coordinates

    #returns an address formatted to be used for the Bing API to get locations
    def formatAddress(self, address):
        output = address.replace(" ", "%20")
        return output

#confirmation page
@app.route('/api/v2/confirm/<token>/<hashed>', methods=['GET'])
def confirm(token, hashed):
    try:
        email = s.loads(token)#max_age = 86400 = 1 day
        #marking email confirmed in database, then...
        print (email);
        conn = connect()
        query = """UPDATE ptyd_accounts SET email_verify = 1 WHERE user_email = \'""" + email + """\';""";
        print(query)
        update = execute(query, 'post', conn)
        print(update)
        if update.get('code') == 281:
            #redirect to login page
            return redirect('http://preptoyourdoor.netlify.app/login/{}/{}'.format(email, hashed))
        else:
            print("Error happened while confirming an email address.")
            error = "Confirm error."
            err_code = 401 # Verification code is incorrect
            return error, err_code
    except (SignatureExpired, BadTimeSignature) as err:
        status=403 #forbidden
        return str(err), status
    finally:
        disconnect(conn)

# NEED CODE FOR NON-RECURRING ONE TIME PLANS
class Checkout(Resource):
    def getPaymentQuery(self, data, paymentId, purchaseId):
        query = """ INSERT INTO ptyd_payments
                    (
                        payment_id,
                        buyer_id,
                        recurring,
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
                        \'TRUE\',
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
                        \'""" + data['billing_zip'] + "\');"""

        return query

    def getDates(self, frequency):
        dates = {}
        dayOfWeek = date.today().weekday()

        # Get the soonest Thursday, same day if today is Thursday
        thurs = date.today() + timedelta(days=(3 - dayOfWeek) % 7)

        # If today is Thursday after 4PM
        if thurs == date.today() and datetime.now().hour >= 16:
            thurs += timedelta(days=7)

        # Set start date to Saturday after thurs
        #       dates['startDate'] = thurs + timedelta(days=2)
        dates['startDate'] = (thurs + timedelta(days=2)).strftime("%Y-%m-%d")

        # Set end date to 1st/2nd/4th Monday after thurs
        # Set next billing date to Friday after the end date
        if frequency == 'Weekly':
            dates['endDate'] = (thurs + timedelta(days=4)).strftime("%Y-%m-%d")
            dates['billingDate'] = (thurs + timedelta(days=7)).strftime("%Y-%m-%d")
            dates['weeksRemaining'] = '1'
        elif frequency == 'Bi-Weekly':
            dates['endDate'] = (thurs + timedelta(days=11)).strftime("%Y-%m-%d")
            dates['billingDate'] = (thurs + timedelta(days=14)).strftime("%Y-%m-%d")
            dates['weeksRemaining'] = '2'
        elif frequency == 'Monthly':
            dates['endDate'] = (thurs + timedelta(days=25)).strftime("%Y-%m-%d")
            dates['billingDate'] = (thurs + timedelta(days=28)).strftime("%Y-%m-%d")
            dates['weeksRemaining'] = '4'

        return dates

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

            purchaseIDresponse = execute("CALL get_new_purchase_id;", 'get', conn)
            paymentIDresponse = execute("CALL get_new_payment_id;", 'get', conn)
            snapshotIDresponse = execute("CALL get_snapshots_id;", 'get', conn)

            print(snapshotIDresponse)
            print(purchaseIDresponse)
            print(paymentIDresponse)

            snapshotId = snapshotIDresponse['result'][0]['new_id']
            purchaseId = purchaseIDresponse['result'][0]['new_id']
            paymentId = paymentIDresponse['result'][0]['new_id']

            if snapshotId == None:
                snapshotId = '160-000001'

            if purchaseId == None:
                purchaseId = '300-000001'

            if paymentId == None:
                paymentId = '200-000001'

            print(snapshotId)
            print(purchaseId)
            print(paymentId)
            print("data['salt]: {}".format(data['salt']))
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
                    , payment_frequency
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
            print("user_id: {}".format(data['user_uid']))
            possSocialAcc = execute(
                "SELECT user_uid FROM ptyd_social_accounts WHERE user_uid = '" + data['user_uid'] + "';", 'get',
                conn)
            print(json.dumps(possSocialAcc, indent=1))

            if len(possSocialAcc['result']) != 0:
                if possSocialAcc['result'][0]['user_uid'] == data['user_uid']:
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
                dates = self.getDates(mealPlanQuery['result'][0]['payment_frequency'])
                print("Meal Plan ID:", mealPlanId)
            else:
                response['message'] = 'Could not retrieve meal ID of requested plan.'
                response['error'] = mealPlanQuery
                print("Error:", response['message'])
                print("Error JSON:", response['error'])
                return response, 501

            queries.append(self.getPaymentQuery(data, paymentId, purchaseId))

            # replace with real longitute and latitude
            addressObj = Coordinates([data['delivery_address']])
            delivery_coord = addressObj.calculateFromLocations()[0]

            # If a key of the coordinates object is None, set to NULL
            # Otherwise wrap quotation marks around it
            # This is because delivery_lat and delivery_long are VARCHAR in db
            for key in delivery_coord:
                if delivery_coord[key] == None:
                    delivery_coord[key] = 'NULL'
                else:
                    delivery_coord[key] = '\'' + str(delivery_coord[key]) + '\''

            queries.append(
                """ INSERT INTO ptyd_purchases
                    (
                        purchase_id,
                        purchase_status,
                        meal_plan_id,
                        start_date,
                        delivery_first_name,
                        delivery_last_name,
                        delivery_email,
                        delivery_phone,
                        delivery_instructions,
                        delivery_address,
                        delivery_address_unit,
                        delivery_city,
                        delivery_state,
                        delivery_zip,
                        delivery_region,
                        delivery_long,
                        delivery_lat
                    )
                    VALUES
                    (
                        \'""" + purchaseId + """\',
                        \'ACTIVE\',
                        \'""" + mealPlanId + """\',
                        \'""" + getToday() + """\',
                        \'""" + data['delivery_first_name'] + """\',
                        \'""" + data['delivery_last_name'] + """\',
                        \'""" + data['delivery_email'] + """\',
                        \'""" + data['delivery_phone'] + """\',
                        \'""" + data['delivery_instructions'] + """\',
                        \'""" + data['delivery_address'] + """\',
                        """ + DeliveryUnit + """,
                        \'""" + data['delivery_city'] + """\',
                        \'""" + data['delivery_state'] + """\',
                        \'""" + data['delivery_zip'] + """\',
                        \'""" + data['delivery_region'] + """\',
                        """ + str(delivery_coord['longitude']) + """,
                        """ + str(delivery_coord['latitude']) + """
                    );"""
            )

            print('perforem laste 2 queries')

            #           print("pur")
            #           print(dates)
            #           print(snapshotId)
            #           print(paymentId)
            #           print(purchaseId)
            #           print(getNow())

            # Initial snapshot
            queries.append(
                """ INSERT INTO ptyd_snapshots
                    (
                        snapshot_id
                        , snapshot_timestamp
                        , purchase_id
                        , payment_id
                        , delivery_start_date
                        , subscription_weeks
                        , delivery_end_date
                        , next_billing_date
                        , weeks_remaining
                        , week_affected
                    )
                    VALUES
                    (
                        \'""" + snapshotId + """\'
                        , \'""" + getNow() + """\'
                        , \'""" + purchaseId + """\'
                        , \'""" + paymentId + """\'
                        , \'""" + dates['startDate'] + """\'
                        , """ + dates['weeksRemaining'] + """
                        , \'""" + dates['endDate'] + """\'
                        , \'""" + dates['billingDate'] + """\'
                        , """ + dates['weeksRemaining'] + """
                        , \'""" + dates['startDate'] + "\');")

            #           print("snap")

            #           print(queries)
            reply['payment'] = execute(queries[3], 'post', conn)
            # Add credit card verification code here

            reply['purchase'] = execute(queries[4], 'post', conn)
            reply['snapshot'] = execute(queries[5], 'post', conn)

            response['message'] = 'Request successful.'
            response['result'] = reply

            #           print(response)

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

# Call this API from another source every Monday at midnight
class UpdatePurchases(Resource):
    def post(self, affectedDate = None):
        response = {}
        items = []

        try:
            if affectedDate:
                affDateObj = datetime.strptime(affectedDate, "%Y%m%d")
                print(affDateObj)
                thisSat = datetime.strftime(affDateObj - timedelta(days=((affDateObj.weekday() - 5) % 7)), "%Y-%m-%d")
                nextSat = datetime.strftime(affDateObj + timedelta(days=(5 - affDateObj.weekday() % 7)), "%Y-%m-%d")
            else:
                # Get following Saturday (same day if Saturday) as a string
                thisSat = datetime.strftime(date.today() - timedelta(days=((date.today().weekday() - 5) % 7)), "%Y-%m-%d")
                nextSat = datetime.strftime(date.today() + timedelta(days=(5 - date.today().weekday() % 7)), "%Y-%m-%d")
        except:
            print('Error: Bad parameter.')
            raise BadRequest('Request failed, bad affectedDate parameter.')

        try:
            print(thisSat)
            conn = connect()

            # UPDATE PURCHASE TEST CASES
            #           thisSat = '2020-04-18'
            #           nextSat = '2020-04-25'
            #           thisSat = '2020-04-25'
            #           nextSat = '2020-05-02'
            #           thisSat = '2020-05-02'
            #           nextSat = '2020-05-09'
            #           thisSat = '2020-05-09'
            #           nextSat = '2020-05-16'
            #           thisSat = '2020-05-16'
            #           nextSat = '2020-05-23'
            #           thisSat = '2020-05-23'
            #           nextSat = '2020-05-30'

            # Returns this Saturday's meal selections with nonzero weeks remaining
            query = """
                SELECT
                    p1.purchase_id
                    , p1.purchase_status
                    , ms1.week_affected
                    , ms1.meal_selection
                    , ms1.selection_time
                    , ms1.delivery_day
                    , s3.snapshot_id
                    , s3.snapshot_timestamp
                    , s3.weeks_remaining
                FROM
                    ptyd_meals_selected AS ms1
                INNER JOIN (
                    SELECT
                        week_affected
                        , MAX(selection_time) AS latest_selection
                    FROM
                        ptyd_meals_selected
                    GROUP BY
                        week_affected
                        , purchase_id
                ) ms2
                ON
                    ms1.week_affected = ms2.week_affected
                AND
                    selection_time = latest_selection
                LEFT JOIN
                    ptyd_purchases p1
                ON
                    ms1.purchase_id = p1.purchase_id
                LEFT JOIN (
                    SELECT
                        s1.purchase_id
                        , snapshot_id
                        , snapshot_timestamp
                        , weeks_remaining
                    FROM
                        ptyd_snapshots s1
                    INNER JOIN (
                        SELECT
                            purchase_id
                            , MAX(snapshot_timestamp) AS latest_snapshot
                        FROM
                            ptyd_snapshots
                        GROUP BY
                            purchase_id
                    ) s2
                    ON
                        s1.purchase_id = s2.purchase_id
                    AND
                        snapshot_timestamp = latest_snapshot
                ) s3
                ON
                    ms1.purchase_id = s3.purchase_id
                WHERE
                    ms1.week_affected = \'""" + thisSat + """\'
                AND
                    weeks_remaining != 0
                ;"""

            # Get purchases with no selections at all
            dflts = """
                SELECT active.*
                    , orders.delivery_day
                    , orders.meal_selection
                FROM (
                    SELECT * FROM ptyd.ptyd_snapshots snap
                    WHERE weeks_remaining > 0 AND week_affected = \'""" + thisSat + """\')
                    AS active
                    LEFT JOIN (
                        SELECT ms1.*
                            , ms2.latest_selection
                        FROM ptyd_meals_selected AS ms1
                        INNER JOIN (
                            SELECT *, MAX(selection_time) AS latest_selection
                            FROM ptyd_meals_selected
                            GROUP BY purchase_id
                                , week_affected)
                        AS ms2 	
                    ON ms1.purchase_id = ms2.purchase_id 
                        AND ms1.week_affected = ms2.week_affected 
                        AND ms1.selection_time = ms2.latest_selection
                    WHERE ms1.week_affected = \'""" + thisSat + """\')
                AS orders
                ON active.purchase_id = orders.purchase_id
                WHERE orders.meal_selection IS NULL
                ;"""

            mealSelections = execute(query, 'get', conn)
            defaultSelections = execute(dflts, 'get', conn)

            #           print("\n\n\n\n\n")
            #           print(mealSelections['result'])
            #           print("\n\n\n\n\n")
            #           print(defaultSelections['result'])

            if mealSelections['code'] != 280:
                response['message'] = 'Could not retrieve meal selections.'
                return response, 500
            if defaultSelections['code'] != 280:
                response['message'] = 'Could not retrieve default selections.'
                return response, 500

            allPurchases = []
            for selections in [mealSelections['result'], defaultSelections['result']]:
                allPurchases.extend(selections)

            #           print("\n\n\n\n\n")
            #           print(allPurchases)
            #           print(len(allPurchases))

            #           # FIXED: RETURNING 6 INSTEAD OF 3

            #           raise Exception

            for eachPurchase in allPurchases:
                #               print(eachPurchase)
                newSnapshotQuery = execute("CALL get_snapshots_id", 'get', conn)

                if newSnapshotQuery['code'] != 280:
                    response['message'] = 'Could not generate new snapshot ID.'
                    return response, 500

                newSnapshotId = newSnapshotQuery['result'][0]['new_id']

                del newSnapshotQuery

                # Push billing and end delivery dates by a week
                if eachPurchase['meal_selection'] == 'SKIP':
                    query = """
                        INSERT INTO ptyd_snapshots
                        (
                            snapshot_id
                            , snapshot_timestamp
                            , purchase_id
                            , payment_id
                            , delivery_start_date
                            , subscription_weeks
                            , delivery_end_date
                            , next_billing_date
                            , weeks_remaining
                            , week_affected
                        )
                        SELECT
                            \'""" + newSnapshotId + """\' AS snapshot_id
                            , \'""" + getNow() + """\' AS snapshot_timestamp
                            , s1.purchase_id
                            , payment_id
                            , delivery_start_date
                            , subscription_weeks
                            , DATE_ADD(
                                delivery_end_date
                                , INTERVAL 7 DAY
                                ) AS delivery_end_date
                            , DATE_ADD(
                                next_billing_date
                                , INTERVAL 7 DAY
                                ) AS next_billing_date
                            , weeks_remaining
                            , \'""" + nextSat + """\'
                        FROM
                            ptyd_snapshots s1
                        INNER JOIN (
                            SELECT
                                purchase_id
                                , MAX(snapshot_timestamp) AS latest_snapshot
                            FROM
                                ptyd_snapshots
                            GROUP BY
                                purchase_id
                        ) s2
                        ON
                            s1.purchase_id = s2.purchase_id
                        AND
                            snapshot_timestamp = latest_snapshot
                        WHERE
                            s1.purchase_id = \'""" + eachPurchase['purchase_id'] + "\';"
                # Decrement weeks remaining by 1
                else:
                    query = """
                        INSERT INTO ptyd_snapshots
                        (
                            snapshot_id
                            , snapshot_timestamp
                            , purchase_id
                            , payment_id
                            , delivery_start_date
                            , subscription_weeks
                            , delivery_end_date
                            , next_billing_date
                            , weeks_remaining
                            , week_affected
                        )
                        SELECT
                            \'""" + newSnapshotId + """\' AS snapshot_id
                            , \'""" + getNow() + """\' AS snapshot_timestamp
                            , s1.purchase_id
                            , payment_id
                            , delivery_start_date
                            , subscription_weeks
                            , delivery_end_date
                            , next_billing_date
                            , weeks_remaining - 1
                            , \'""" + nextSat + """\'
                        FROM
                            ptyd_snapshots s1
                        INNER JOIN (
                            SELECT
                                purchase_id
                                , MAX(snapshot_timestamp) AS latest_snapshot
                            FROM
                                ptyd_snapshots
                            GROUP BY
                                purchase_id
                        ) s2
                        ON
                            s1.purchase_id = s2.purchase_id
                        AND
                            snapshot_timestamp = latest_snapshot
                        WHERE
                            s1.purchase_id = \'""" + eachPurchase['purchase_id'] + "\';"
                items.append(execute(query, 'post', conn))

            response['message'] = 'POST request successful.'

            # For debugging
            response['items'] = items
            #           print(items)

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


# Call this API from another source every Thursday at midnight
class ChargeSubscribers(Resource):
    def getDates(self, frequency, thurs):
        dates = {}

        # CHARGE SUBSCRIBER TEST CASES
        #       thurs = date(2020, 4, 23)
        #       thurs = date(2020, 4, 30)
        #       thurs = date(2020, 5, 7)
        #       thurs = date(2020, 5, 14)
        #       thurs = date(2020, 5, 21)
        #       thurs = date(2020, 5, 28)

        # Set start date to Saturday after thurs
        dates['startDate'] = (thurs + timedelta(days=2)).strftime("%Y-%m-%d")

        # Set end date to 1st/2nd/4th Monday after thurs
        # Set next billing date to Friday after the end date
        if frequency == 1:
            dates['endDate'] = (thurs + timedelta(days=4)).strftime("%Y-%m-%d")
            dates['billingDate'] = (thurs + timedelta(days=7)).strftime("%Y-%m-%d")
        elif frequency == 2:
            dates['endDate'] = (thurs + timedelta(days=11)).strftime("%Y-%m-%d")
            dates['billingDate'] = (thurs + timedelta(days=14)).strftime("%Y-%m-%d")
        elif frequency == 4:
            dates['endDate'] = (thurs + timedelta(days=25)).strftime("%Y-%m-%d")
            dates['billingDate'] = (thurs + timedelta(days=28)).strftime("%Y-%m-%d")

        return dates

    def post(self, affectedDate = None):
        response = {}
        items = []

        try:
            if affectedDate:
                affDateObj = datetime.strptime(affectedDate, "%Y%m%d")
                print(affDateObj)
                dayOfWeek = affDateObj.weekday()
                paramDate = affDateObj + timedelta(days=(3 - dayOfWeek) % 7)
            else:
                # Get today's date (or the coming Thursday)
                dayOfWeek = date.today().weekday()
                paramDate = date.today() + timedelta(days=(3 - dayOfWeek) % 7)

        except:
            print('Error, bad parameter.')
            raise BadRequest('Request failed, bad affectedDate parameter.')

        try:
            print(paramDate)
            conn = connect()

            # Get all purchases with 0 weeks remaining
            query = """
                SELECT
                    p1.purchase_id
                    , recurring
                    , p1.payment_id
                    , snapshot_id
                    , latest_snapshot
                    , delivery_start_date
                    , subscription_weeks
                    , delivery_end_date
                    , next_billing_date
                    , weeks_remaining
                FROM
                    ptyd_snapshots p1
                INNER JOIN (
                    SELECT
                        purchase_id
                        , MAX(snapshot_timestamp) AS latest_snapshot
                    FROM
                        ptyd_snapshots
                    GROUP BY
                        purchase_id
                ) p2
                ON
                    p1.purchase_id = p2.purchase_id
                AND
                    snapshot_timestamp = latest_snapshot
                INNER JOIN
                    ptyd_payments p3
                ON
                    p1.payment_id = p3.payment_id
                WHERE
                    recurring = \'TRUE\'
                AND
                    weeks_remaining = 0
                ORDER BY
                    p1.purchase_id
                ASC
                ;"""

            duePayments = execute(query, 'get', conn)

            if duePayments['code'] != 280:
                response['message'] = 'Could not retrieve meal selections.'
                return response, 500

            for eachPayment in duePayments['result']:
                newSnapshotQuery = execute("CALL get_snapshots_id", 'get', conn)
                newPaymentQuery = execute("CALL get_new_payment_id", 'get', conn)

                if newSnapshotQuery['code'] != 280:
                    response['message'] = 'Could not generate new snapshot ID.'
                    return response, 500
                if newPaymentQuery['code'] != 280:
                    response['message'] = 'Could not generate new snapshot ID.'
                    return response, 500

                newSnapshotId = newSnapshotQuery['result'][0]['new_id']
                newPaymentId = newPaymentQuery['result'][0]['new_id']

                # New payment
                query = """ INSERT INTO ptyd_payments
                            (
                                payment_id,
                                buyer_id,
                                recurring,
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
                            SELECT
                                \'""" + newPaymentId + """\' AS payment_id,
                                buyer_id,
                                \'TRUE\',
                                gift,
                                coupon_id,
                                amount_due,
                                amount_paid,
                                purchase_id,
                                \'""" + getNow() + """\',
                                \'STRIPE\',
                                cc_num,
                                cc_exp_date,
                                cc_cvv,
                                billing_zip
                            FROM
                                ptyd_payments
                            WHERE
                                payment_id = \'""" + eachPayment['payment_id'] + """\'
                            ;"""
                items.append(execute(query, 'post', conn))

                # New snapshot
                dates = self.getDates(eachPayment['subscription_weeks'], paramDate)
                query = """
                    INSERT INTO ptyd_snapshots
                    (
                        snapshot_id
                        , snapshot_timestamp
                        , purchase_id
                        , payment_id
                        , delivery_start_date
                        , subscription_weeks
                        , delivery_end_date
                        , next_billing_date
                        , weeks_remaining
                        , week_affected
                    )
                    SELECT
                        \'""" + newSnapshotId + """\' AS snapshot_id
                        , \'""" + getNow() + """\' AS snapshot_timestamp
                        , s1.purchase_id
                        , \'""" + newPaymentId + """\' AS payment_id
                        , \'""" + dates['startDate'] + """\'
                        , subscription_weeks
                        , \'""" + dates['endDate'] + """\'
                        , \'""" + dates['billingDate'] + """\'
                        , subscription_weeks
                        , \'""" + dates['startDate'] + """\'
                    FROM
                        ptyd_snapshots s1
                    WHERE
                        s1.snapshot_id = \'""" + eachPayment['snapshot_id'] + "\';"

                items.append(execute(query, 'post', conn))

            response['message'] = 'POST request successful.'

            # For debugging
            response['items'] = items
            #           print(items)
            #           print(json.dumps(response, indent=1))

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class MealSelection(Resource):
    def readQuery(self, items):
        for item in items:
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

#           queries = ["""
#               SELECT latest_active.week_affected
#                   , latest_sel.meal_selection
#                   , latest_sel.delivery_day
#               FROM (
#                   # LATEST ACTIVE SUBSCRIPTIONS BY WEEK WITH MEALS PURCHASED
#                   SELECT active.*
#                       ,pur_plans.num_meals
#                   FROM (
#                       SELECT snap1.*
#                           , snap2.latest_snapshot
#                       FROM ptyd_snapshots AS snap1
#                       INNER JOIN (
#                           SELECT *, MAX(snapshot_timestamp) AS latest_snapshot
#                           FROM ptyd_snapshots
#                           GROUP BY purchase_id
#                               , week_affected)
#                           AS snap2 
#                       ON snap1.purchase_id = snap2.purchase_id 
#                           AND snap1.week_affected = snap2.week_affected 
#                           AND snap1.snapshot_timestamp = snap2.latest_snapshot)
#                       AS active
#                   LEFT JOIN (
#                       SELECT pur.*
#                       , plans.num_meals
#                       FROM ptyd.ptyd_purchases pur
#                       LEFT JOIN ptyd_meal_plans plans
#                       ON pur.meal_plan_id = plans.meal_plan_id)
#                       AS pur_plans
#                   ON active.purchase_id = pur_plans.purchase_id)
#                   AS latest_active
#               LEFT JOIN (
#                   SELECT ms1.*
#                       , ms2.latest_selection
#                   FROM ptyd_meals_selected AS ms1
#                   INNER JOIN (
#                       SELECT *, MAX(selection_time) AS latest_selection
#                       FROM ptyd_meals_selected
#                       GROUP BY purchase_id
#                           , week_affected)
#                       AS ms2 
#                   ON ms1.purchase_id = ms2.purchase_id 
#                       AND ms1.week_affected = ms2.week_affected 
#                       AND ms1.selection_time = ms2.latest_selection)
#                   AS latest_sel
#               ON latest_active.purchase_id = latest_sel.purchase_id 
#                   AND latest_active.week_affected = latest_sel.week_affected
#               WHERE
#                   latest_active.purchase_id = \'""" + purchaseId + """\'
#               ;""", """
#               SELECT
#                   ms1.purchase_id
#                   , ms1.week_affected
#                   , ms1.meal_selection
#                   
#               FROM ptyd_addons_selected AS ms1
#               INNER JOIN (
#                   SELECT
#                       purchase_id
#                       , week_affected
#                       , meal_selection
#                       , MAX(selection_time) AS latest_selection
#                   FROM ptyd_addons_selected
#                   GROUP BY purchase_id
#                       , week_affected
#               ) as ms2 
#               ON
#                   ms1.purchase_id = ms2.purchase_id
#               AND
#                   ms1.week_affected = ms2.week_affected
#               AND
#                   ms1.selection_time = ms2.latest_selection
#               WHERE
#                   ms1.purchase_id = \'""" + purchaseId + """\'
#               ;"""]

            queries = ["""
                # WORKING AND VERIFIED  
                # QUERY 1a:  Eliminates older orders  (KEY QUERY - use this as the starting point to eliminate unneccesary table entries)
                # (KEY QUERY - use this to count meals from a string)
                # Latest Meal Selection (from ptyd_addons_selected table)  
                SELECT
                ms1.purchase_id
                    , ms1.week_affected
                , ms1.meal_selection
                    , ms1.delivery_day
                   
                FROM ptyd_meals_selected AS ms1
                INNER JOIN (
                SELECT
                purchase_id
                        , week_affected
                        , meal_selection
                        , MAX(selection_time) AS latest_selection
                        , delivery_day
                FROM ptyd_meals_selected
                GROUP BY purchase_id
                , week_affected
                ) as ms2
                ON ms1.purchase_id = ms2.purchase_id AND ms1.week_affected = ms2.week_affected AND ms1.selection_time = ms2.latest_selection
                WHERE
                    ms1.purchase_id = \'""" + purchaseId + """\'
                ;""", """
                # WORKING AND VERIFIED  
                # SAME
                # (KEY QUERY - use this to count meals from a string)
                # Latest Meal Selection (from ptyd_addons_selected table)  
                SELECT
                ms1.purchase_id
                    , ms1.week_affected
                , ms1.meal_selection
                   
                FROM ptyd_addons_selected AS ms1
                INNER JOIN (
                SELECT
                purchase_id
                        , week_affected
                        , meal_selection
                        , MAX(selection_time) AS latest_selection
                FROM ptyd_addons_selected
                GROUP BY purchase_id
                , week_affected
                ) as ms2
                ON ms1.purchase_id = ms2.purchase_id AND ms1.week_affected = ms2.week_affected AND ms1.selection_time = ms2.latest_selection
                WHERE
                    ms1.purchase_id = \'""" + purchaseId + """\'
                ;"""]

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
                        referral_source,
                        email_verify
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
                        "\'" + Referral + "\', \'1\');")

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

                query = """
                    SELECT user_email FROM ptyd_accounts
                    WHERE user_email = \'""" + Email + "\';"

                emailExists = execute(query, 'get', conn)

                if emailExists['code'] == 280 and len(emailExists['result']) > 0:
                    statusCode = 400
                    response['result'] = 'Email address taken.'
                else:
                    statusCode = 500
                    response['result'] = 'Internal server error.'

                response['code'] = usnInsert['code']
                print(response['message'], response['result'], usnInsert['code'])
                return response, statusCode

            socInsert = execute(queries[2], 'post', conn)

            if socInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Could not commit password.'
                print(response['message'], response['result'], socInsert['code'])
                return response, 500

            response['message'] = 'Request successful.'
            response['result'] = {'user_uid':NewUserID}

            print(response)
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
            # restest = SocialAccount().get(email)

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class SocialAccount(Resource):

    # HTTP method POST
    def post(self, uid):
        response = {}
        try:
            conn = connect()
            data = request.get_json(force=True)
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


            print('I\'m here')
            print("data is {}".format(data));
            items = execute(queries[0], 'get', conn)
            #create a login attempt
            login_attempt = {
                'auth_success': 'TRUE',
                'user_uid': uid,
                'attempt_hash': "NULL",
                'ip_address': data['ip_address'],
                'browser_type': data['browser_type'],
            }

            response['login_attempt_log'] = LogLoginAttempt(login_attempt, conn)

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

'''
class MealSelection(Resource):
    def readQuery(self, items):
        for item in items:
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
'''
class CustomerInfo(Resource):

    # def ___inti__(self):
    #     self.dict1 = {"Full_name":None,"Current_subscription":None,"Start_date":None,"End_date":None}
    @staticmethod
    def jsonify_one(dict1):
        map_subs = {"Weekly": 7, "Bi-Weekly": 14}
        # res = {}
        # res = None
        start_date = datetime.strptime(dict1["start_date"], '%Y-%m-%d')
        if dict1["frequency"] == "Monthly":
            end_date = start_date + relativedelta(months=1)
        else:
            end_date = start_date + timedelta(days=map_subs[dict1["frequency"]])

        curr_date = datetime.now()
        delta = end_date - curr_date
        if delta.days < 0:
            # res["weeks_left"] = "Expired"
            dict1["Weeks_left"] = "Expired"
        else:
            # res["weeks_left"] = delta.days//7
            dict1["Weeks_left"] = delta.days // 7

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
            list1 = list(map(self.jsonify_one, cus_info['CustomerInfo']['result']))

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
            list1 = list(map(CustomerInfo.jsonify_one, cus_info['CustomerInfo']['result']))
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
                    -- M.menu_date = "2020-02-01";
                    """

            ]

            for ind1, query in enumerate(queries):
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

            for ind1, query in enumerate(queries):
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
            menuDates = list(dict.fromkeys(menuDates))

            print(menuDates)

            d = {}
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

                    menu_descript = items['result'][index2]['meal_desc']
                    menu_descript = "Meal Description: " + menu_descript
                    dictValues.append(menu_descript)

                    menu_num = items['result'][index2]['menu_num_sold']
                    menu_num = str(menu_num)
                    menu_num = "Number Sold: " + menu_num
                    dictValues.append(menu_num)

                    menuEntries -= 1
                    index2 += 1

                d[menuDates[index]] = dictValues

            print('Dictionary part 2 --------------')
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
            menuDates = list(dict.fromkeys(menuDates))

            print(menuDates)

            d = {}
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

                    ingredients_needed = items['result'][index2]['quantity']
                    ingredients_needed = "Amount needed to use: " + ingredients_needed
                    dictValues.append(ingredients_needed)

                    menuEntries -= 1
                    index2 += 1
                    print(menuEntries)

                d[menuDates[index]] = dictValues

            print('Dictionary part 2 --------------')
            print(d)

            response['message'] = 'successful'
            response['result'] = d

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


#curl -X PATCH -H "Content-Type: application/json" http://localhost:2000/api/v2/cancel-subscription-now --data '{"item_name": "Apple", "quantity": 2}'

class CancelSubscriptionNow(Resource):
    global RDS_PW

    def patch(self):
        response = {}
        
        try:
            conn = connect()
            data = request.get_json(force=True)
            
            newSnapshotQuery = execute("""CALL get_snapshots_id();""", 'get', conn)
            
            purchase_id = data['purchase_id']

            snapshotId = newSnapshotQuery['result'][0]['new_id']

            

            execute(""" CALL `ptyd`.`user_cancel_now_update_snapshot`( \'""" + snapshotId + """\' , \'""" + getNow() + """\', \'""" + purchase_id + """\');""", 'post', conn)
            execute("""UPDATE `ptyd`.`ptyd_payments` SET `recurring` = 'FALSE' WHERE (`payment_id` = (SELECT payment_id FROM ptyd_snapshots WHERE purchase_id = \'""" + purchase_id + """\' ORDER BY snapshot_timestamp DESC LIMIT 1) );""", 'post', conn)
            execute("""UPDATE `ptyd`.`ptyd_purchases` SET `purchase_status` = 'CANCELLED' WHERE (`purchase_id` = '\'""" + purchase_id + """\');""",'post',conn)
            
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class DoNotRenewSubscription(Resource):
    def patch(self):
        response = {}
        
        try:
            conn = connect()
            data = request.get_json(force=True)
            

            newSnapshotQuery = execute("CALL get_snapshots_id;", 'get', conn)

            purchase_id = data['purchase_id']

            snapshotId = newSnapshotQuery['result'][0]['new_id']

            print(snapshotId)

            execute(""" CALL `ptyd`.`user_cancel_later_update_snapshot`(\'""" + snapshotId + """\', \'""" + getNow() + """\', \'""" + purchase_id + """\');""", 'post', conn)
            execute("""UPDATE `ptyd`.`ptyd_payments` SET `recurring` = 'FALSE' WHERE (`payment_id` = (SELECT payment_id FROM ptyd_snapshots WHERE purchase_id = \'""" + purchase_id + """\' ORDER BY snapshot_timestamp DESC LIMIT 1) );""", 'post', conn)
            execute("""UPDATE `ptyd`.`ptyd_purchases` SET `purchase_status` = 'CANCELLED' WHERE (`purchase_id` = '\'""" + purchase_id + """\');""",'post',conn)
            
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)



class ZipCodes(Resource):
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(""" SELECT * FROM ptyd_monday_zipcodes; """, 'get', conn)

            response['message'] = 'successful'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

'''
class GetTestKey(Resource):
    def get(self):
        keys = {"Public Key" : pubKey, "Secret Key": secKey }
        return keys

class StripeTestPayment(Resource):
    stripe.api_key = pubKey


    def post(self):
        response = {}
        items = {}

        try:
            conn = connect()
            data = request.get_json(force=True)
            
            cartAmount = data['cart_amount']


            intent = stripe.PaymentIntent.create(
                amount=1099,
                currency='usd',
                # Verify your integration in this guide by including this parameter
                metadata={'integration_check': 'accept_a_payment'},
            )
'''


class UpdateSubscription(Resource):
    def patch(self):
        response = {}
        
        try:
            conn = connect()
            data = request.get_json(force=True)
            
            print("pre",data)

            meal_plan_id = data['meal_plan_id']
            purchase_id = data['purchase_id']
            delivery_address = data['delivery_address']

            print("1")
            delivery_address_unit = data['delivery_address_unit']
            # delivery_address_unit = None
            print("2")

            delivery_city = data['delivery_city']
            delivery_state = data['delivery_state']
            delivery_zip = data['delivery_zip']
            delivery_instructions = data['delivery_instructions']

            # if (delivery_address_unit == None):
            #     delivery_address_unit = ""

            print("data",data)
            # test=execute(""" CALL `ptyd`.`update_purchase`(\'""" + str(purchase_id) + """\', \'""" + str(meal_plan_id) + """\', \'""" + str(delivery_address) + """\', \'""" + str(delivery_address_unit) + """\', \'""" + str(delivery_city) + """\', \'""" + str(delivery_state) + """\', \'""" + str(delivery_zip) + """\', \'""" + str(delivery_instructions) + """\'); """, 'post', conn)
            # print("test",test)
            execute(""" CALL `ptyd`.`update_purchase`(\'""" + str(purchase_id) + """\',
                                                           \'""" + str(meal_plan_id) + """\',
                                                           \'""" + str(delivery_address) + """\',
                                                           \'""" + str(delivery_address_unit) + """\', 
                                                           \'""" + str(delivery_city) + """\', 
                                                           \'""" + str(delivery_state) + """\', 
                                                           \'""" + str(delivery_zip) + """\', 
                                                           \'""" + str(delivery_instructions) + """\');
                                                            """, 'post', conn)
            
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
# Customer page
api.add_resource(Meals, '/api/v2/meals', '/api/v2/meals/<string:startDate>')
api.add_resource(Plans, '/api/v2/plans')
api.add_resource(SignUp, '/api/v2/signup')
api.add_resource(Login, '/api/v2/account/<string:accEmail>/<string:accPass>')
api.add_resource(Account, '/api/v2/account/<string:accId>')
api.add_resource(AccountSalt, '/api/v2/accountsalt/<string:accEmail>')
api.add_resource(SessionVerification, '/api/v2/sessionverification/<string:userUid>/<string:sessionId>')
api.add_resource(AccountPurchases, '/api/v2/accountpurchases/<string:buyerId>')
api.add_resource(Checkout, '/api/v2/checkout')
api.add_resource(MealSelection, '/api/v2/mealselection/<string:purchaseId>')
api.add_resource(SocialSignUp, '/api/v2/socialSignup')
api.add_resource(Social, '/api/v2/social/<string:email>')
api.add_resource(SocialAccount, '/api/v2/socialacc/<string:uid>')

# Admin page
# ---------- Admin page -----------------------------
api.add_resource(CustomerInfo, '/api/v2/customerinfo')
api.add_resource(CustomerProfile, '/api/v2/customerprofile')

api.add_resource(MealInfo, '/api/v2/meal_info')

api.add_resource(AdminDBv2, '/api/v2/admindb')
api.add_resource(MealCustomerLifeReport, '/api/v2/mealCustomerReport')
api.add_resource(AdminMenu, '/api/v2/menu_display')
api.add_resource(displayIngredients, '/api/v2/displayIngredients')

# Automated APIs
api.add_resource(UpdatePurchases, '/api/v2/updatepurchases', '/api/v2/updatepurchases/<string:affectedDate>')
api.add_resource(ChargeSubscribers, '/api/v2/chargesubscribers', '/api/v2/chargesubscribers/<string:affectedDate>')

#in progress
api.add_resource(CancelSubscriptionNow, '/api/v2/cancel-subscription-now')
api.add_resource(DoNotRenewSubscription, '/api/v2/do-not-renew-subscription')

'''
#-----------Stripe Resrouces--------------------
api.add_resource(GetTestKey, '/api/v2/stripe-testkeys')
'''
# in progress
api.add_resource(UpdateSubscription, '/api/v2/update-subscription')


api.add_resource(ZipCodes, '/api/v2/monday-zip-codes')

# Template
api.add_resource(TemplateApi, '/api/v2/templateapi')

# Run on below IP address and port
# Make sure port number is unused (i.e. don't use numbers 0-1023)
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=2000)
