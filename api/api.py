from flask import Flask, request, render_template, url_for, redirect
from flask_restful import Resource, Api
from flask_mail import Mail, Message  # used for email
# used for serializer email and error handling
from itsdangerous import URLSafeTimedSerializer, SignatureExpired, BadTimeSignature
from flask_cors import CORS

from werkzeug.exceptions import BadRequest, NotFound

from dateutil.relativedelta import *
from decimal import Decimal
from datetime import datetime, date, timedelta
from hashlib import sha512
from math import ceil
import string
import random
# BING API KEY
# Import Bing API key into bing_api_key.py
from env_keys import BING_API_KEY, RDS_PW

import decimal
import sys
import json
import pytz
import pymysql
import requests

RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
RDS_PORT = 3306
RDS_USER = 'admin'
RDS_DB = 'ptyd'

app = Flask(__name__)

# --------------- Stripe Variables ------------------
# these key are using for testing. Customer should use their stripe account's keys instead
import stripe
stripe_public_key = 'pk_test_6RSoSd9tJgB2fN2hGkEDHCXp00MQdrK3Tw'
stripe_secret_key = 'sk_test_fe99fW2owhFEGTACgW3qaykd006gHUwj1j'

#this is a testing key using ptydtesting's stripe account.
# stripe_public_key = "pk_test_51H0sExEDOlfePYdd9TVlnhVDOCmmnmdxAxyAmgW4x7OI0CR7tTrGE2AyrTk8VjftoigEOhv2RTUv5F8yJrfp4jWQ00Q6KGXDHV"
# stripe_secret_key = "sk_test_51H0sExEDOlfePYdd9UQDxfp8yoY7On272hCR9ti12WSNbIGTysaJI8K2W8NhCKqdBOEhiNj4vFOtQu6goliov8vF00cvqfWG6d"

stripe.api_key = stripe_secret_key
# Allow cross-origin resource sharing
cors = CORS(app, resources={r'/api/*': {'origins': '*'}})

# Set this to false when deploying to live application
app.config['DEBUG'] = True

# Adding for email testing
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'ptydtesting@gmail.com'
app.config['MAIL_PASSWORD'] = 'ptydtesting06282020'
app.config['MAIL_DEFAULT_SENDER'] = 'ptydtesting@gmail.com'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
# app.config['MAIL_DEBUG'] = True
# app.config['MAIL_SUPPRESS_SEND'] = False
# app.config['TESTING'] = False

mail = Mail(app)

# API
api = Api(app)

# convert to UTC time zone when testing in local time zone
utc = pytz.utc
def getToday(): return datetime.strftime(datetime.now(utc), "%Y-%m-%d")
def getNow(): return datetime.strftime(datetime.now(utc),"%Y-%m-%d %H:%M:%S")


# def getToday(): return datetime.strftime(date.today(), "%Y-%m-%d")
# def getNow(): return datetime.strftime(datetime.now(), "%Y-%m-%d %H:%M:%S")


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
        # response['sql'] = sql
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
                        meal_weekly_price,
                        meal_plan_price,
                        meal_weekly_price/num_meals AS meal_plan_price_per_meal,
                        meal_shipping,
                        meal_tax,
                        CONCAT('/', num_meals, '-meals-subscription') AS RouteOnclick
                    FROM ptyd_meal_plans
                    WHERE payment_frequency = \'4 Week Pre-Pay\';""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_weekly_price,
                        meal_plan_price,
                        meal_weekly_price/num_meals AS meal_plan_price_per_meal,
                        meal_shipping,
                        meal_tax
                    FROM ptyd_meal_plans
                    WHERE num_meals = 5;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_weekly_price,
                        meal_plan_price,
                        meal_weekly_price/num_meals AS meal_plan_price_per_meal,
                        meal_shipping,
                        meal_tax
                    FROM ptyd_meal_plans
                    WHERE num_meals = 10;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_weekly_price,
                        meal_plan_price,
                        meal_weekly_price/num_meals AS meal_plan_price_per_meal,
                        meal_shipping,
                        meal_tax
                    FROM ptyd_meal_plans
                    WHERE num_meals = 15;""",
                """SELECT
                        meal_plan_id,
                        meal_plan_desc,
                        payment_frequency,
                        photo_URL,
                        num_meals,
                        meal_weekly_price,
                        meal_plan_price,
                        meal_weekly_price/num_meals AS meal_plan_price_per_meal,
                        meal_shipping,
                        meal_tax
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

    def getAddonPrice(self, menu):
        savedAddonPrice = {}
        for key in ['Meals', 'Addons']:
            for subMenu in menu[key]:
                for eachMeal in menu[key][subMenu]['Menu']:
                    related_price = eachMeal['extra_meal_price']
                    meal_id = eachMeal['meal_id']
                    savedAddonPrice[meal_id] = related_price
        return savedAddonPrice

    # HTTP method GET
    # Optional parameter: startDate (YYYYMMDD)
    def get(self, startDate=None):
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

            dates = execute(
                "SELECT DISTINCT menu_date FROM ptyd_menu;", 'get', conn)

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

                    thursday = stamp - timedelta(days=2)

                    today = datetime.now()

                    if today < thursday:
                        # stamp = stamp + timedelta(days=7)

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
                        week['AddonPrice'] = self.getAddonPrice(week)

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

            queries.append(
                "SELECT * FROM ptyd_passwords WHERE password_user_uid = \'" + user_uid + "\';")
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
            print(data)
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

            queries.append(
                "SELECT * FROM ptyd_passwords WHERE password_user_uid = \'" + user_uid + "\';")
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

            response['login_attempt_log'] = LogLoginAttempt(
                login_attempt, conn)

            return response, httpCode
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class ResetPassword(Resource):
    def get_random_string(self, stringLength=8):
        lettersAndDigits = string.ascii_letters + string.digits
        return "".join([random.choice(lettersAndDigits) for i in range(stringLength)])

    def get(self):
        response = {}
        try:
            conn = connect()
            # search for email;
            email = request.args.get('email')
            if email == None:
                response['message'] = "Invalid Email Address"
                return response, 400
            query = """SELECT * FROM ptyd_accounts
                    WHERE user_email ='""" + email + "';"
            user_lookup = execute(query, 'get', conn)
            if (user_lookup.get('code') == 280):
                user_uid = user_lookup.get('result')[0].get('user_uid')
                pass_temp = self.get_random_string()
                salt = getNow()
                pass_temp_hashed = sha512(
                    (pass_temp + salt).encode()).hexdigest()
                query = """UPDATE ptyd_passwords SET password_hash = '""" + pass_temp_hashed + """'
                             , password_salt = '""" + salt + "' WHERE password_user_uid = '" + user_uid + "';"
                # update database with temp password
                query_result = execute(query, 'post', conn)
                if (query_result.get('code') == 281):
                    # send an email to client
                    msg = Message(
                        "Email Verification", sender='ptydtesting@gmail.com', recipients=[email])
                    msg.body = "Your temporary password is {temp}. Please use it to reset your password".format(
                        temp=pass_temp)
                    mail.send(msg)
                    response['message'] = "A temporary password has been sent"
                    response['result'] = {"user_uid": user_uid}
                    return response, 200
                else:
                    return 500
            else:
                response['message'] = "User is not found"
                return response, 404

        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class ChangePassword(Resource):
    def post(self):
        response = {}
        try:
            conn = connect()
            data = request.get_json(force=True)

            user_uid = data['ID']
            old_pass = data['old']
            new_pass = data['new']
            query = """SELECT password_hash, password_salt FROM ptyd_passwords WHERE password_user_uid = '""" \
                    + user_uid + "';"
            query_result = execute(query, "get", conn)
            if (query_result.get('code') == 280):
                salt = query_result.get('result')[0].get('password_salt')
                current_pass = query_result.get(
                    'result')[0].get('password_hash')
                old_pass_hashed = sha512(
                    (old_pass + salt).encode()).hexdigest()
                if (current_pass == old_pass_hashed):
                    # change the password
                    salt = getNow()
                    new_password_hashed = sha512(
                        (new_pass + salt).encode()).hexdigest()
                    query = """UPDATE ptyd_passwords SET password_hash = '""" + new_password_hashed \
                            + "', password_salt = '" + salt + "' WHERE password_user_uid = '" + user_uid + "'; "
                    query_result = execute(query, 'post', conn)
                    if (query_result.get('code') == 281):
                        response['message'] = "Password is changed"
                        return response, 200
                    else:
                        return "Internal Server Error", 500
                else:
                    return "Wrong password", 401
            else:
                return "No record found", 404
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


# ADD Update to Payments


class AccountPurchases(Resource):
    # HTTP method GET
    def get(self, buyerId):
        response = {}

        try:
            start_date = request.args.get('startdate')

            if start_date is not None:
                startDate = datetime.strptime(start_date, "%Y%m%d")
                now = startDate
            else:
                now = date.today()

        except:
            raise BadRequest('Request failed, bad startDate parameter.')

        try:
            conn = connect()

            dayOfWeek = now.weekday()
            # Get the soonest Saturday, same day if today is Saturday
            sat = now + timedelta(days=(12 - dayOfWeek) % 7)
            thur = now + timedelta(days=(10 - dayOfWeek) % 7)

            print("sat before: ", sat)
            print("thur before: ", thur)

            # If today is Thursday after 4PM
            # if sat == now and now.hour >= 16:
            #     sat += timedelta(days=7)

            # if thursday is passed, the affected week is the next week
            # if now + timedelta(days=7) > thur:
            # #     thur += timedelta(days=7)
            #     sat += timedelta(days=7)
            # change sat into string
            sat = sat.strftime("%Y-%m-%d")
            thur = thur.strftime("%Y-%m-%d")
            print("sat after: ", sat)
            print("thur after: ", thur)
            queries = ["""
                SELECT 
                    snap.payment_id
                    ,pay.buyer_id
                    ,pay.coupon_id
                    ,pay.gift
                    ,(pay.amount_due + IFNULL(addon.total_charge,0)) AS amount_due
                    ,pay.amount_paid
                    ,snap_purchase_id AS purchase_id
                    ,pay.payment_time_stamp AS last_payment_time_stamp
                    ,pay.payment_type
                    ,pay.cc_num
                    ,pay.cc_exp_date
                    ,pay.cc_cvv
                    ,pay.billing_zip
                    ,purch.meal_plan_id
                    ,plans.MaximumMeals
                    ,plans.meal_plan_desc
                    ,plans.meal_plan_price
                    ,plans.payment_frequency
                    ,snap.delivery_start_date AS start_date
                    ,purch.delivery_first_name
                    ,purch.delivery_last_name
                    ,purch.delivery_email
                    ,purch.delivery_phone
                    ,purch.delivery_address
                    ,purch.delivery_address_unit
                    ,purch.delivery_city
                    ,purch.delivery_state
                    ,purch.delivery_zip
                    ,purch.delivery_region
                    ,purch.delivery_instructions
                    ,snap.weeks_remaining AS paid_weeks_remaining
                    ,snap.next_billing_date AS next_charge_date
                    ,IFNULL(addon.total_charge, 0.00) AS total_charge
                    ,pay.amount_due AS amount_due_before_addon
                    ,addon.week_affected
                    , \'""" + thur + """\' AS next_addon_charge_date
                FROM (
                -- Snapshot Query
                SELECT 
                    ms1.payment_id 
                    ,ms1.purchase_id AS snap_purchase_id
                    ,ms1.delivery_start_date
                    ,ms1.subscription_weeks
                    ,ms1.weeks_remaining
                    ,ms1.next_billing_date
                FROM 
                    ptyd_snapshots ms1
                INNER JOIN (
                SELECT 
                    C.purchase_id
                    ,C.payment_id
                    ,MAX(C.snapshot_timestamp) AS latest_snap -- starting point for getting the most recent information
                    ,C.weeks_remaining
                FROM 
                    ptyd_snapshots C
                GROUP BY 
                    C.purchase_id
                ) AS ms2
                ON ms1.purchase_id = ms2.purchase_id AND ms1.snapshot_timestamp = latest_snap
                ) snap
                JOIN (
                -- purchases query , checks to make sure the account is active 
                SELECT 
                    A.purchase_id
                    ,A.meal_plan_id
                    ,A.start_date
                    ,A.delivery_first_name
                    ,A.delivery_last_name
                    ,A.delivery_email
                    ,A.delivery_phone
                    ,A.delivery_address
                    ,A.delivery_address_unit
                    ,A.delivery_city
                    ,A.delivery_state
                    ,A.delivery_zip
                    ,A.delivery_region
                    ,A.delivery_instructions
                    ,A.purchase_status
                FROM ptyd_purchases A
                WHERE
                    purchase_status = "ACTIVE"
                ) purch
                ON snap_purchase_id = purch.purchase_id
                JOIN (
                -- payments query
                SELECT
                    ms3.purchase_id  AS payment_purchase_id
                    ,ms3.payment_id
                    ,ms3.payment_time_stamp
                    ,ms3.buyer_id
                    ,ms3.coupon_id 
                    ,ms3.gift
                    ,ms3.amount_due
                    ,ms3.amount_paid
                    ,ms3.purchase_id
                    ,ms3.payment_type
                    ,CONCAT('XXXXXXXXXXXX', ms3.cc_num) AS cc_num
                    ,ms3.cc_exp_date
                    ,ms3.cc_cvv
                    ,ms3.billing_zip
                FROM
                    ptyd_payments AS ms3
                INNER JOIN (
                SELECT
                    B.purchase_id,
                    B.payment_id,
                    MAX(B.payment_time_stamp) AS latest_payment
                    FROM ptyd_payments B
                    GROUP BY B.purchase_id
                ) ms4 ON ms3.purchase_id = ms4.purchase_id AND payment_time_stamp = latest_payment
                ) pay 
                ON purch.purchase_id = pay.purchase_id
                JOIN (
                -- meal plan query
                SELECT 
                    B.meal_plan_id
                    ,B.num_meals AS MaximumMeals
                    ,B.meal_plan_desc
                    ,B.payment_frequency
                    ,B.meal_plan_price
                FROM 
                    ptyd_meal_plans B
                ) plans
                ON purch.meal_plan_id = plans.meal_plan_id
                LEFT JOIN (
                -- ADDON query
                        SELECT
                            purchase_id,
                            week_affected,
                            SUM(total) AS total_addons,
                            SUM(charge) AS total_charge
                        FROM ( # QUERY 11
                            SELECT purchase_id
                                , week_affected
                                , meal_selected
                                , meal_name
                                , COUNT(num) as total
                                , extra_meal_price
                                , COUNT(num) * extra_meal_price as charge
                            FROM (
                                SELECT *
                                    , substring_index(substring_index(meal_selection,';',n),';',-1) AS meal_selected
                                    , n AS num
                                FROM (# QUERY 1
                                   SELECT
                                        ms1.purchase_id
                                        -- ,ms2.purchase_id
                                        , ms1.week_affected
                                        -- , ms2.week_affected
                                        , "0" AS num_meals
                                        , "0" AS delivery_day
                                        , ms1.meal_selection
                                        -- , ms1.selection_time
                                        -- , ms2.latest_selection
                                        -- , ms1.delivery_day
                                    FROM ptyd.ptyd_addons_selected AS ms1
                                    INNER JOIN (
                                        SELECT
                                            purchase_id
                                            , week_affected
                                            , meal_selection
                                            , MAX(selection_time) AS latest_selection
                                            -- , delivery_day
                                        FROM ptyd.ptyd_addons_selected
                                        GROUP BY purchase_id
                                            , week_affected
                                    ) as ms2 
                                    ON ms1.purchase_id = ms2.purchase_id 
                                        AND ms1.week_affected = ms2.week_affected 
                                        AND ms1.selection_time = ms2.latest_selection
                                    ORDER BY purchase_id
                                        , week_affected)
                                        AS combined
                                    JOIN numbers ON char_length(meal_selection) - char_length(replace(meal_selection, ';', '')) >= n - 1)
                                AS sub
                            LEFT JOIN ptyd.ptyd_meals meals ON sub.meal_selected = meals.meal_id
                            GROUP BY purchase_id
                                , week_affected
                                , meal_selected
                            ORDER BY purchase_id
                                , week_affected
                                , num_meals
                                , meal_selected)
                            AS addons
                        WHERE week_affected = \'""" + sat + """\'
                        GROUP BY purchase_id,
                            week_affected
                ) addon
                ON snap_purchase_id = addon.purchase_id
                WHERE buyer_id = \'""" + buyerId + """\'
                GROUP BY snap.payment_id;""",
                       "   SELECT * FROM ptyd_monday_zipcodes;"]

            items = execute(queries[0], 'get', conn)
            mondayZipsQuery = execute(queries[1], 'get', conn)

            mondayZips = []
            for eachZip in mondayZipsQuery['result']:
                mondayZips.append(eachZip['zipcode'])
            del mondayZipsQuery

            for eachItem in items['result']:
                # last_charge_date = datetime.strptime(eachItem['last_payment_time_stamp'], '%Y-%m-%d %H:%M:%S')
                # next_charge_date = None

                # if eachItem['payment_frequency'] == 'Weekly':
                #     next_charge_date = last_charge_date + timedelta(days=7)
                # elif eachItem['payment_frequency'] == 'Bi-Weekly':
                #     next_charge_date = last_charge_date + timedelta(days=14)
                # elif eachItem['payment_frequency'] == 'Monthly':
                #     next_charge_date = last_charge_date + timedelta(days=28)

                # eachItem['paid_weeks_remaining'] = str(int((next_charge_date - datetime.now()).days / 7) + 1)
                # eachItem['next_charge_date'] = str(next_charge_date.date())

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

# should put the secret key in this.
s = URLSafeTimedSerializer('thisisaverysecretkey')

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

            queries = ["CALL get_new_user_id;"]
            print("Received: ", data)
            NewUserIDresponse = execute(queries[0], 'get', conn)
            NewUserID = NewUserIDresponse['result'][0]['new_id']

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

                return response, 500

            # this part using for testing email verification

            token = s.dumps(Email)
            msg = Message("Email Verification",
                          sender='ptydtesting@gmail.com', recipients=[Email])
            link = url_for('confirm', token=token,
                           hashed=hashed, _external=True)
            msg.body = "Click on the link {} to verify your email address.".format(
                link)

            mail.send(msg)
            # email verification testing s ended here...

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
    # array of addresses such as
    # ['Dunning Ln, Austin, TX 78746', '12916 Cardinal Flower Drive, Austin, TX 78739', '51 Rainey St., austin, TX 78701']
    def __init__(self, locations):
        self.locations = locations

    def calculateFromLocations(self):
        global BING_API_KEY

        params = {
            'key': BING_API_KEY
        }
        coordinates = []
        for address in self.locations:
            formattedAddress = self.formatAddress(address)
            print("address: ", address)
            r = requests.get('http://dev.virtualearth.net/REST/v1/Locations/{}'.format(formattedAddress),
                             '&maxResults=1&key={}'.format(params['key']))
            print("result:", r)
            try:
                results = r.json()
                assert (results['resourceSets'][0]['estimatedTotal'])
                point = results['resourceSets'][0]['resources'][0]['geocodePoints'][0]['coordinates']
                lat, lng = point[0], point[1]
            except:
                lat, lng = None, None

            # appends a dictionary of latitude and longitude points for the given address
            coordinates.append({
                "latitude": lat,
                "longitude": lng
            })
        # prints lat, long points for each address
        for i in coordinates:
            print(i, "\n")
            print(type(i["latitude"]))

        # return array of dictionaries containing lat, long points
        return coordinates

    # returns an address formatted to be used for the Bing API to get locations
    def formatAddress(self, address):
        output = address.replace(" ", "%20")
        if "." in output:
            output = output.replace(".", "")
        return output


# confirmation page


# confirmation page
@app.route('/api/v2/confirm/<token>/<hashed>', methods=['GET'])
def confirm(token, hashed):
    try:
        email = s.loads(token)  # max_age = 86400 = 1 day
        # marking email confirmed in database, then...
        conn = connect()
        query = """UPDATE ptyd_accounts SET email_verify = 1 WHERE user_email = \'""" + \
                email + """\';"""
        update = execute(query, 'post', conn)
        if update.get('code') == 281:
            # redirect to login page
            return redirect('http://preptoyourdoor.netlify.app/login/{}/{}'.format(email, hashed))
            # return redirect('http://localhost:3000/login/{}/{}'.format(email, hashed))
        else:
            print("Error happened while confirming an email address.")
            error = "Confirm error."
            err_code = 401  # Verification code is incorrect
            return error, err_code
    except (SignatureExpired, BadTimeSignature) as err:
        status = 403  # forbidden
        return str(err), status
    finally:
        disconnect(conn)


# NEED CODE FOR NON-RECURRING ONE TIME PLANS


class Checkout(Resource):
    def getPaymentQuery(self, data, couponID, amount_due, amount_paid, paymentId, purchaseId):
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
                        """ + couponID + """,
                        \'""" + str(amount_due) + """\',
                        \'""" + str(amount_paid) + """\',
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
            dates['billingDate'] = (
                thurs + timedelta(days=7)).strftime("%Y-%m-%d")
            dates['weeksRemaining'] = '1'
        elif frequency == '2 Week Pre-Pay':
            dates['endDate'] = (thurs + timedelta(days=11)
                                ).strftime("%Y-%m-%d")
            dates['billingDate'] = (
                thurs + timedelta(days=14)).strftime("%Y-%m-%d")
            dates['weeksRemaining'] = '2'
        elif frequency == '4 Week Pre-Pay':
            dates['endDate'] = (thurs + timedelta(days=25)
                                ).strftime("%Y-%m-%d")
            dates['billingDate'] = (
                thurs + timedelta(days=28)).strftime("%Y-%m-%d")
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

            def get_new_paymentID():

                newPaymentQuery = execute(
                    "CALL get_new_payment_id", 'get', conn)
                if newPaymentQuery['code'] != 280:
                    response['message'] = 'Could not generate new snapshot ID.'
                    return response, 500
                return newPaymentQuery['result'][0]['new_id']
            purchaseIDresponse = execute(
                "CALL get_new_purchase_id;", 'get', conn)
            snapshotIDresponse = execute("CALL get_snapshots_id;", 'get', conn)

            print(snapshotIDresponse)
            print(purchaseIDresponse)

            snapshotId = snapshotIDresponse['result'][0]['new_id']
            purchaseId = purchaseIDresponse['result'][0]['new_id']
            paymentId = get_new_paymentID()

            if snapshotId == None:
                snapshotId = '160-000001'

            if purchaseId == None:
                purchaseId = '300-000001'

            if paymentId == None:
                paymentId = '200-000001'

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
            possSocialAcc = execute(
                "SELECT user_uid FROM ptyd_social_accounts WHERE user_uid = '" +
                data['user_uid'] + "';", 'get',
                conn)

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
                dates = self.getDates(
                    mealPlanQuery['result'][0]['payment_frequency'])
                print("Meal Plan ID:", mealPlanId)
            else:
                response['message'] = 'Could not retrieve meal ID of requested plan.'
                response['error'] = mealPlanQuery
                print("Error:", response['message'])
                print("Error JSON:", response['error'])
                return response, 501

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
                    delivery_coord[key] = '\'' + \
                                          str(delivery_coord[key]) + '\''

            purchase_query = """ INSERT INTO ptyd_purchases
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
                        'US',
                        """ + str(delivery_coord['longitude']) + """,
                        """ + str(delivery_coord['latitude']) + """
                    );"""
            snapshot_query = """ INSERT INTO ptyd_snapshots
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
                        , \'""" + dates['startDate'] + "\');"

            coupon_id = data.get('coupon_id')
            charge = 0
            if coupon_id == "" or coupon_id is None:
                charge = data['total_charge']
                payment_query = self.getPaymentQuery(data, 'NULL', charge, charge, paymentId, purchaseId)
            else:
                charge = round(data['total_charge'] - data['total_discount'], 2)
            # create a stripe charge and make sure that charge is successful before writting it into database
            # we should use Idempotent key to prevent sending multiple payment requests due to connection fail.
            try:

                card_dict={"number": data['cc_num'], "exp_month": int(data['cc_exp_month']),"exp_year": int(data['cc_exp_year']),"cvc": data['cc_cvv'],}
                print ("card dict: ", card_dict)
                try:
                    card_token = stripe.Token.create(card=card_dict)
                    print("card_token", card_token)
                    stripe_charge = stripe.Charge.create(
                                            amount=int(round(charge*100, 0)),
                                            currency="usd",
                                            source=card_token,
                                            description="Charge customer %s for %s" %(data['delivery_first_name'] + " " + data['delivery_last_name'], data['item'] ))

                    print("charge success: ", stripe_charge)
                except stripe.error.CardError as e:
                    # Since it's a decline, stripe.error.CardError will be caught
                    print('Status is: %s' % e.http_status)
                    print('Type is: %s' % e.error.type)
                    print('Code is: %s' % e.error.code)
                    # param is '' in this case
                    print('Param is: %s' % e.error.param)
                    print('Message is: %s' % e.error.message)
                    response['message'] = e.error.message
                    return response, 400
                if coupon_id != "" and coupon_id is not None:
                    coupon_id = "'" + coupon_id + "'"  # need this to solve the add NULL to sql database
                    temp_query = """ INSERT INTO ptyd_payments
                                (
                                    payment_id,
                                    buyer_id,
                                    recurring,
                                    gift,
                                    coupon_id,
                                    amount_due,
                                    amount_paid,
                                    purchase_id,
                                    payment_time_stamp
                                )
                                VALUES (
                                    \'""" + paymentId + """\',
                                    \'""" + data['user_uid'] + """\',
                                    \'TRUE\',
                                    \'""" + data['is_gift'] + """\', NULL,
                                    \'""" + str(data['total_charge']) + """\', 0,
                                    \'""" + purchaseId + """\',
                                    \'""" + getNow() + """\');"""
                    res = execute(temp_query, 'post', conn)
                    print("after execute temp query 1: ", res)

                    paymentId = get_new_paymentID()
                    temp_query = """ INSERT INTO ptyd_payments
                                    (
                                        payment_id,
                                        buyer_id,
                                        recurring,
                                        gift,
                                        coupon_id,
                                        amount_due,
                                        amount_paid,
                                        purchase_id,
                                        payment_time_stamp
                                    )
                                    VALUES (
                                        \'""" + paymentId + """\',
                                        \'""" + data['user_uid'] + """\',
                                        \'TRUE\',
                                        \'""" + data['is_gift'] + """\',
                                        """ + coupon_id + """,
                                        \'""" + str(0-data['total_discount']) + """\',0,
                                        \'""" + purchaseId + """\',
                                        \'""" + getNow() + """\');"""
                    print("temp2: ", temp_query)
                    res = execute(temp_query, 'post', conn)
                    print("after execute temp query 2: ", res)
                    # update coupon table
                    coupon_query = """UPDATE ptyd_coupons SET num_used = num_used + 1 
                                WHERE coupon_id = """ + coupon_id + ";"
                    res = execute(coupon_query, 'post', conn)
                    print("after execute coupon_query: ", res)
                    paymentId = get_new_paymentID()

                    payment_query = self.getPaymentQuery(data, coupon_id, charge, charge, paymentId, purchaseId)
                    print("payment_query: ", payment_query)
                reply['payment'] = execute(payment_query, 'post', conn)
                if reply['payment']['code'] != 281:
                    response['message'] = "Internal Server Error"
                    return response, 500
                # Add credit card verification code here
                reply['purchase'] = execute(purchase_query, 'post', conn)
                if reply['purchase']['code'] != 281:
                    response['message'] = "Internal Server Error"
                    return response, 500
                reply['snapshot'] = execute(snapshot_query, 'post', conn)
                if reply['snapshot']['code'] != 281:
                    response['message'] = "Internal Server Error"
                    return response, 500
                response['message'] = 'Request successful.'
                response['result'] = reply
                return response, 200
            except:
                response['message'] = "Payment process error."
                return responsee, 500
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


# Call this API from another source every Monday at midnight


class UpdatePurchases(Resource):
    def post(self, affectedDate=None):
        response = {}
        items = []

        try:
            if affectedDate:
                affDateObj = datetime.strptime(affectedDate, "%Y%m%d")
                print(affDateObj)
                thisSat = datetime.strftime(
                    affDateObj - timedelta(days=((affDateObj.weekday() - 5) % 7)), "%Y-%m-%d")
                nextSat = datetime.strftime(
                    affDateObj + timedelta(days=(5 - affDateObj.weekday() % 7)), "%Y-%m-%d")
            else:
                # Get following Saturday (same day if Saturday) as a string
                thisSat = datetime.strftime(
                    date.today() - timedelta(days=((date.today().weekday() - 5) % 7)), "%Y-%m-%d")
                nextSat = datetime.strftime(
                    date.today() + timedelta(days=(5 - date.today().weekday() % 7)), "%Y-%m-%d")
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
                    SELECT snap1.*
                        FROM ptyd.ptyd_snapshots AS snap1
                        INNER JOIN (
                            SELECT
                                purchase_id,
                                week_affected,
                                MAX(snapshot_timestamp) AS latest_selection
                                FROM ptyd.ptyd_snapshots
                                GROUP BY purchase_id, week_affected) AS snap2
                        ON snap1.purchase_id = snap2.purchase_id
                            AND snap1.week_affected = snap2.week_affected
                            AND snap1.snapshot_timestamp = snap2.latest_selection
                    WHERE snap1.week_affected = \'""" + thisSat + """\'
                        AND weeks_remaining > 0
                    ORDER BY purchase_id, week_affected) AS active
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
            # print(mealSelections['result'])
            #           print("\n\n\n\n\n")
            # print("defaultSelections: ", defaultSelections)

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
                print("eachPurchase: ", eachPurchase)
                newSnapshotQuery = execute(
                    "CALL get_snapshots_id", 'get', conn)

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
                result = execute(query, 'post', conn)
                print(result)
                items.append(result)

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
            dates['billingDate'] = (
                thurs + timedelta(days=7)).strftime("%Y-%m-%d")
        elif frequency == 2:
            dates['endDate'] = (thurs + timedelta(days=11)
                                ).strftime("%Y-%m-%d")
            dates['billingDate'] = (
                thurs + timedelta(days=14)).strftime("%Y-%m-%d")
        elif frequency == 4:
            dates['endDate'] = (thurs + timedelta(days=25)
                                ).strftime("%Y-%m-%d")
            dates['billingDate'] = (
                thurs + timedelta(days=28)).strftime("%Y-%m-%d")

        return dates

    def post(self, affectedDate=None):
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
            query = """
                SELECT
                    p1.purchase_id
                    , recurring
                    , p1.payment_id
                    , snapshot_id
                    , latest_snapshot
                    , p5.meal_plan_id
                    , p5.meal_plan_price
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
                INNER JOIN
					ptyd_purchases p4
				ON 
				    p4.purchase_id = p1.purchase_id
                INNER JOIN ptyd_meal_plans p5
				ON 
				    p4.meal_plan_id = p5.meal_plan_id
				WHERE p4.purchase_status = 'ACTIVE'
                ORDER BY
                    p1.purchase_id
                ASC
                ;"""

            Payments = execute(query, 'get', conn)
            print("duePayments: ", Payments['result'])
            if Payments['code'] != 280:
                response['message'] = 'Could not retrieve meal selections.'
                return response, 500

            def get_new_snapshotID():
                newSnapshotQuery = execute(
                    "CALL get_snapshots_id", 'get', conn)
                if newSnapshotQuery['code'] != 280:
                    response['message'] = 'Could not generate new snapshot ID.'
                    return response, 500
                return newSnapshotQuery['result'][0]['new_id']

            def get_new_paymentID():

                newPaymentQuery = execute(
                    "CALL get_new_payment_id", 'get', conn)
                if newPaymentQuery['code'] != 280:
                    response['message'] = 'Could not generate new snapshot ID.'
                    return response, 500
                return newPaymentQuery['result'][0]['new_id']

            def query_template(NewPaymentId, paymentId, amount):
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
                                payment_time_stamp
                            )
                            SELECT
                                \'""" + NewPaymentId + """\' AS payment_id,
                                buyer_id,
                                \'FALSE\',
                                gift,
                                coupon_id, """ + str(amount) + """
                                amount_due,
                                0,
                                purchase_id,
                                \'""" + getNow() + """\'
                            FROM
                                ptyd_payments
                            WHERE
                                payment_id = \'""" + paymentId + """\'
                            ;"""
                return query

            def charge_query(NewPaymentID, paymentID, amount, recurring):
                recur = 'TRUE' if recurring else 'FALSE'
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
                                \'""" + NewPaymentID + """\' AS payment_id,
                                buyer_id, '""" + recur + """' ,
                                gift,
                                coupon_id, """ + str(amount) + """,
                                """ + str(amount) + """,
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
                                payment_id = \'""" + paymentID + """\'
                            ;"""
                return query

            for eachPayment in Payments['result']:
                print("each payment: ", eachPayment)
                subscription_charge = 0
                addon_charge = 0
                # to be careful here. We're assuming that user has chosen recurring == True then we'll charge them every
                # thursday. What will happen if recurring == false and they still choosing ADD LOCAL TREATS. Should
                # we charge them or not, because those addons have written into the database and it will be delivered.
                if (eachPayment['weeks_remaining'] == 0 and eachPayment['recurring'] == "TRUE"):
                    subscription_charge = float(eachPayment['meal_plan_price'])
                # check for the addon for the next week
                # paramDate is Thursday
                nextSat = paramDate + timedelta(days=2)
                print("nextSat: ", nextSat)
                nextSat_str = nextSat.strftime("%Y-%m-%d")

                addon_query = """SELECT * FROM ptyd_addons_selected
                                    WHERE purchase_id = '""" + eachPayment['purchase_id'] + """'
                                    AND week_affected = '""" + nextSat_str + "';"
                price_query = """SELECT meal_id, extra_meal_price FROM ptyd_meals;"""
                price_result = execute(price_query, "get", conn).get("result")

                price = {}
                for item in price_result:
                    price[item['meal_id']] = item['extra_meal_price']
                print("price: ", price)
                print("addon query: ", addon_query)
                addon_result = execute(addon_query, "get", conn).get('result')
                print("addon_result: ", addon_result)

                if addon_result:
                    meal_selected = addon_result[0].get(
                        'meal_selection').split(";")
                    print("meal_selected: ", meal_selected)
                    for id in meal_selected:
                        addon_charge += float(price.get(id))
                # start to write to the database

                if subscription_charge > 0:  # time to renew subcription
                    print("subcribtion > 0")
                    newPaymentId = get_new_paymentID()
                    if addon_charge > 0:  # write this addon into database without strip info
                        try:
                            print("cuc cu")
                            temp_query = query_template(
                                newPaymentId, eachPayment['payment_id'], addon_charge)
                            print("ther")
                            res = execute(temp_query, 'post', conn)
                            print("after write addon into database:  line 2159", res)
                            newPaymentId = get_new_paymentID()
                            temp_query = query_template(
                                newPaymentId, eachPayment['payment_id'], subscription_charge)
                            res = execute(temp_query, 'post', conn)
                            print(
                                "after write subscription into database:  line 2163", res)
                            # write total charge into database with strip info
                            newPaymentId = get_new_paymentID()
                            chargeQuery = charge_query(
                                newPaymentId, eachPayment['payment_id'], subscription_charge + addon_charge, True)
                            res = execute(chargeQuery, 'post', conn)
                            print(
                                "after write total charge into database line 2207: ", res)
                        except:
                            return "Internal server Error", 500
                    else:
                        chargeQuery = charge_query(newPaymentId, eachPayment['payment_id'],
                                                   subscription_charge, True)
                        res = execute(chargeQuery, 'post', conn)
                        print(
                            "after write total charge without addon into database line 2215: ", res)
                    # New snapshot
                    newSnapshotId = get_new_snapshotID()
                    print("Passed newSnapshotID")
                    dates = self.getDates(
                        eachPayment['subscription_weeks'], paramDate)
                    print("passed dates")
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
                else:  # only charge for the addon
                    print("no it's not")
                    print("addon_charge: ", addon_charge)
                    if addon_charge > 0:
                        chargeQuery = charge_query(
                            get_new_paymentID(), eachPayment['payment_id'], addon_charge, False)
                        res = execute(chargeQuery, 'post', conn)
                        print("after execute charge_query: ", res)

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
        if mealSelection is not None:
            mealSelectionString = ""
            for mealId in mealSelection:
                if mealId != "":
                    for mealCount in range(mealSelection[mealId]):
                        mealSelectionString += mealId + ";"
            # Remove last semicolon
            return mealSelectionString[:-1]
        else:
            return ""

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
                mealSelection = self.formatMealSelection(
                    data['meal_quantities'])
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
                    \'""" + data['delivery_day'] + "\');\n"
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
                print(response['message'],
                      response['result'], usnInsert['code'])
                return response, statusCode

            socInsert = execute(queries[2], 'post', conn)

            if socInsert['code'] != 281:
                response['message'] = 'Request failed.'
                response['result'] = 'Could not commit password.'
                print(response['message'],
                      response['result'], socInsert['code'])
                return response, 500

            response['message'] = 'Request successful.'
            response['result'] = {'user_uid': NewUserID}

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
                    FROM ptyd_accounts WHERE user_uid = '""" + uid + "';"]

            items = execute(queries[0], 'get', conn)
            # create a login attempt
            login_attempt = {
                'auth_success': 'TRUE',
                'user_uid': uid,
                'attempt_hash': "NULL",
                'ip_address': data['ip_address'],
                'browser_type': data['browser_type'],
            }

            response['login_attempt_log'] = LogLoginAttempt(
                login_attempt, conn)

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
            queries.append(
                "SELECT user_email FROM ptyd_accounts WHERE user_email = '" + email + "';")

            users = execute(queries[0], 'get', conn)

            if users['result'] == ():
                return {'result': False}, 401
            elif len(users['result']) > 0:
                return {'result': True}, 200

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

# curl -X PATCH -H "Content-Type: application/json" http://localhost:2000/api/v2/cancel-subscription-now --data '{"item_name": "Apple", "quantity": 2}'

class CancelSubscriptionNow(Resource):
    global RDS_PW

    def refund_calculator(self, conn, purchaseID):
        current_purchase_query = """SELECT purchase.purchase_id, purchase.meal_plan_id, plans.meal_plan_desc, 
                                                      plans.meal_plan_price, payment.payment_id, payment.buyer_id, 
                                                      payment.gift, payment.amount_due, payment.amount_paid, 
                                                      snapshot1.weeks_remaining, snapshot1.week_affected
                                           FROM ptyd_purchases purchase, ptyd_payments payment, 
                                                  ptyd_snapshots snapshot1, ptyd_meal_plans plans
                                           WHERE  purchase.purchase_id = '""" + purchaseID + """' AND
                                                   snapshot1.snapshot_timestamp = (SELECT MAX(snapshot2.snapshot_timestamp)
																				FROM ptyd_snapshots snapshot2
                                                                                WHERE snapshot2.purchase_id = snapshot1.purchase_id
                                                                                ) AND
													payment.payment_time_stamp = (SELECT MAX(payment2.payment_time_stamp)
																				FROM ptyd_payments payment2
                                                                                WHERE payment.purchase_id = payment2.purchase_id
                                                                                ) AND
                                                   purchase.purchase_id = payment.purchase_id AND
                                                   purchase.purchase_id = snapshot1.purchase_id AND
                                                   purchase.meal_plan_id = plans.meal_plan_id AND
                                                   snapshot1.next_billing_date <> 'NULL' AND
                                                   purchase.purchase_status = 'ACTIVE';"""
        current_purchase_info = execute(
            current_purchase_query, "get", conn).get('result')[0]
        name_matching = current_purchase_info.get('meal_plan_desc')
        if name_matching != None:
            name_matching = name_matching.split(" - ")
        else:
            print("Error. Cannot split name_matching")
        # get all same type of meal plan from meal plan table
        mealplan_query = """SELECT meal_plan_desc, meal_plan_price 
                                       FROM ptyd_meal_plans
                                       WHERE meal_plan_desc LIKE '""" + name_matching[0] + "%';"
        mealplan_info = execute(mealplan_query, "get", conn).get("result")

        week_remaining = int(current_purchase_info.get('weeks_remaining'))
        # calculate amount paid
        if (float(current_purchase_info.get('amount_paid')) > float(current_purchase_info.get('meal_plan_price'))):
            amount_paid = float(current_purchase_info.get('amount_paid'))
        else:
            amount_paid = float(current_purchase_info.get('meal_plan_price'))

        amount_due = float(current_purchase_info.get('meal_plan_price'))
        amount_calculating = amount_paid if amount_paid >= 0 else amount_due
        print("amount_paid: ", amount_paid)
        refund = 0
        # create a temp dictionary to keep the meal plan price
        price = {}
        for mealplan in mealplan_info:
            price[mealplan.get('meal_plan_desc').split(
                " - ")[1]] = mealplan.get('meal_plan_price')

        if name_matching[1] == "4 Week Pre-Pay":
            print("matching 4 week pre-pay")
            if week_remaining == 0:
                refund = 0
            elif week_remaining == 1:
                refund = amount_calculating - \
                    float(price.get('2 Week Pre-Pay')) - \
                    float(price.get("Weekly"))
            elif week_remaining == 2:
                refund = amount_calculating - \
                    float(price.get('2 Week Pre-Pay'))
            elif week_remaining == 3:
                refund = amount_calculating - float(price.get('Weekly'))
            elif week_remaining == 4:
                refund = amount_calculating
        elif name_matching[1] == "2 Week Pre-Pay":
            print("matching 2 week Pre-pay")
            if week_remaining == 0:
                refund = 0
            elif week_remaining == 1:
                refund = amount_calculating - float(price.get("Weekly"))
            elif week_remaining == 2:
                refund = amount_calculating
        elif name_matching[1] == "Weekly":
            print("matching weekly")
            if week_remaining == 0:
                refund = 0
            elif week_remaining == 1:
                refund = amount_calculating
        else:
            print("Meal Plan name format error")
            response['message'] = "Internal server error"
            return response, 500

        current_purchase_info['refund_amount'] = round(refund, 2)
        return current_purchase_info

    def patch(self):
        response = {}

        try:
            conn = connect()
            data = request.get_json(force=True)

            newSnapshotQuery = execute(
                """CALL get_snapshots_id();""", 'get', conn)
            paymentIDresponse = execute(
                "CALL get_new_payment_id;", 'get', conn)

            purchase_id = data['purchase_id']

            snapshotId = newSnapshotQuery['result'][0]['new_id']
            new_paymentID = paymentIDresponse['result'][0]['new_id']
            timestamp = datetime.strftime(datetime.now(), "%Y-%m-%d %H:%M:%S")
            # calculate the refund
            refund_info = self.refund_calculator(conn, purchase_id)
            refund = refund_info.get('refund_amount')

            execute(""" CALL `ptyd`.`user_cancel_now_update_snapshot`( \'""" + snapshotId +
                    """\' , \'""" + getNow() + """\', \'""" + purchase_id + """\');""", 'post', conn)

            execute(
                """UPDATE `ptyd`.`ptyd_purchases` SET `purchase_status` = 'CANCELLED' WHERE (`purchase_id` = '\'""" +
                purchase_id + """\');""", 'post', conn)

            query = """SELECT * FROM ptyd_payments 
                        WHERE purchase_id = '""" + purchase_id + """' AND
                            recurring = 'TRUE';"""

            get_info = execute(query, 'get', conn)
            get_info = get_info['result'][0]

            for key in get_info:
                get_info[key] = "NULL" if get_info[key] == None else get_info[key]

            payment_query = []
            payment_query.append("""UPDATE ptyd_payments SET recurring = 'FALSE'
                                WHERE purchase_id = '""" + purchase_id + "';")

            payment_query.append("""INSERT INTO ptyd_payments 
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
                                billing_zip,
                                stripe_charge_id,
                                isAddon
                            ) VALUES
                            (
                                '""" + new_paymentID + """',
                                '""" + str(refund_info.get('buyer_id')) + """',
                                'FALSE',
                                '""" + refund_info.get('gift') + """',
                                NULL,
                                '""" + str(round(0 - refund, 2)) + """',
                                '""" + str(round(0 - refund, 2)) + """',
                                '""" + str(refund_info.get('purchase_id')) + """',
                                '""" + getNow() + """',
                                '""" + str(get_info.get('payment_type')) + """',
                                '""" + str(get_info.get('cc_num')) + """',
                                '""" + str(get_info.get('cc_exp_date')) + """',
                                '""" + str(get_info.get('cc_cvv')) + """',
                                '""" + str(get_info.get('billing_zip')) + """',
                                '""" + str(get_info.get('stripe_charge_id')) + """',
                                '""" + str(get_info.get('isAddon')) + """'
                            );""")
            print("start again")
            for query in payment_query:
                result = execute(query, 'post', conn)
                print("result: ", result)
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

            execute(""" CALL `ptyd`.`user_cancel_later_update_snapshot`(\'""" + snapshotId +
                    """\', \'""" + getNow() + """\', \'""" + purchase_id + """\');""", 'post', conn)
            execute(
                """UPDATE `ptyd`.`ptyd_payments` SET `recurring` = 'FALSE' WHERE (`payment_id` = (SELECT payment_id FROM ptyd_snapshots WHERE purchase_id = \'""" +
                purchase_id + """\' ORDER BY snapshot_timestamp DESC LIMIT 1) );""", 'post', conn)
            execute(
                """UPDATE `ptyd`.`ptyd_purchases` SET `purchase_status` = 'CANCELLED' WHERE (`purchase_id` = '\'""" +
                purchase_id + """\');""", 'post', conn)

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

            items = execute(
                """ SELECT * FROM ptyd_monday_zipcodes; """, 'get', conn)

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


# this code was copy from "Checkout" class without cheking for password.
class Update_Subscription(Resource):
    def getPaymentQuery(self, data, newpaymentId, purchaseId, refund_info, choice):
        refund = refund_info.get('refund_amount')
        exp_date = datetime(int(data['cc_exp_year']), int(
            data['cc_exp_month']), 1).strftime("%Y-%m-%d")
        query1 = ["""UPDATE ptyd_payments SET recurring = 'FALSE'
                        WHERE purchase_id = '""" + refund_info.get('purchase_id') + "';",
                  """INSERT INTO ptyd_payments
                        (
                            payment_id,
                            buyer_id,
                            recurring,
                            gift,
                            coupon_id,
                            amount_due,
                            amount_paid,
                            purchase_id,
                            payment_time_stamp
                        )
                        VALUE
                        (
                            '""" + newpaymentId + """',
                            '""" + str(refund_info.get('buyer_id')) + """',
                            'FALSE',
                            '""" + data.get('is_gift') + """',
                            NULL,
                            '""" + str(round(0 - refund, 2)) + """',
                            '""" + str(round(0 - refund, 2)) + """',
                            '""" + str(refund_info.get('purchase_id')) + """',
                            '""" + getNow() + """'
                        );"""]

        query2 = """ INSERT INTO ptyd_payments
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
                        \'""" + newpaymentId + """\',
                        \'""" + data['user_uid'] + """\',
                        \'TRUE\',
                        \'""" + data['is_gift'] + """\',
                        NULL,
                        \'""" + str(data['item_price']) + """\',
                        \'""" + str(round(float(data.get('item_price')) - refund, 2)) + """\',
                        \'""" + str(purchaseId) + """\',
                        \'""" + getNow() + """\',
                        'STRIPE',
                        \'""" + str(data['cc_num'][-4:]) + """',
                        \'""" + exp_date + """',
                         '""" + str(data['cc_cvv']) + """',
                         '""" + str(data['billing_zip']) + "');"
        return query1 if choice == 1 else query2

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

            purchaseIDresponse = execute(
                "CALL get_new_purchase_id;", 'get', conn)
            paymentIDresponse = execute(
                "CALL get_new_payment_id;", 'get', conn)
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
            print("before mealPlan")
            mealPlan = data['item'].split(' Subscription')[0]
            print(data['user_uid'])
            print("after mealPlan: ", mealPlan)

            queries = ["""
                SELECT
                    meal_plan_id
                    , payment_frequency
                FROM
                    ptyd_meal_plans
                WHERE
                    meal_plan_desc = \'""" + mealPlan + "\'", # first query
                """
                SELECT
                    cc_num
                FROM
                    ptyd_payments
                WHERE
                    buyer_id = \'""" + data['user_uid'] + "\';"] # second query

            mealPlanQuery = execute(queries[0], 'get', conn)

            print("Passed mealPlanQuery")
            if mealPlanQuery['code'] == 280:
                print("Getting meal plan ID...")
                mealPlanId = mealPlanQuery['result'][0]['meal_plan_id']
                dates = Checkout().getDates(
                    mealPlanQuery['result'][0]['payment_frequency'])
                print("Meal Plan ID:", mealPlanId)
            else:
                response['message'] = 'Could not retrieve meal ID of requested plan.'
                response['error'] = mealPlanQuery
                print("Error:", response['message'])
                print("Error JSON:", response['error'])
                return response, 501

            # calculate the refund.
            refund_info = CancelSubscriptionNow().refund_calculator(conn,
                                                                    data['purchase_id'])
            print("refund_info: ", refund_info)

            payment_query = self.getPaymentQuery(
                data, paymentId, purchaseId, refund_info, 1)
            # update payment table

            reply = [execute(query, 'post', conn) for query in payment_query]
            # execute the second payment_query with a new paymentID
            paymentIDresponse = execute(
                "CALL get_new_payment_id;", 'get', conn)
            paymentId = paymentIDresponse['result'][0]['new_id']
            payment_query = self.getPaymentQuery(
                data, paymentId, purchaseId, refund_info, 2)
            reply += [execute(payment_query, 'post', conn)]

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
                    delivery_coord[key] = '\'' + \
                                          str(delivery_coord[key]) + '\''
            # update purchase table, cancel the current purchase and order the new one
            purchase_query = []
            purchase_query.append("""UPDATE ptyd_purchases
                                        SET purchase_status = 'CANCELLED'
                                        WHERE purchase_id = '""" + refund_info.get('purchase_id') + "';")

            purchase_query.append(""" INSERT INTO ptyd_purchases
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
                       'US',
                        """ + str(delivery_coord['longitude']) + """,
                        """ + str(delivery_coord['latitude']) + """
                    );""")

            # update snapshot
            snapshot_query = []
            # update the snapshots
            reply += [execute(""" CALL `ptyd`.`user_cancel_now_update_snapshot`( \'""" + snapshotId + """\' , 
                        \'""" + getNow() + """\', \'""" + refund_info.get('purchase_id') + """\');""", 'post', conn)]
            print("here")
            # create a new ID for snapshots
            snapshotIDresponse = execute("CALL get_snapshots_id;", 'get', conn)
            snapshotId = snapshotIDresponse['result'][0]['new_id']

            # Initial snapshot
            snapshot_query.append("""INSERT INTO ptyd_snapshots
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

            # execute the rest of query
            reply += [execute(query, 'post', conn)
                      for type in [purchase_query, snapshot_query] for query in type]
            print("reply: ", reply)
            response['result'] = reply
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class Coupon (Resource):
    def get(self):
        response = {}
        try:
            data = request.args
            print("Received: ", data)
            coupon_id = data['coupon_id']
            apply_email = data['email']
            # prepare a query to get info of coupon
            query = """SELECT * FROM ptyd_coupons WHERE coupon_id = '""" + coupon_id + "';"
            # connect to database to get info of this coupon
            conn = connect();
            res = execute(query, 'get', conn)
            print("after query coupon table: ", res)
            if res['result']: # there is matching coupon_id
                result = res['result'][0]
                # check if coupon is inactive
                if result.get('active') == "TRUE":
                    # check if coupon expiration
                    expire_date = datetime.strptime(result.get('expire_date'), "%Y-%m-%d")
                    today = datetime.today()
                    if (today <= expire_date):
                        if (result.get('limits') > result.get('num_used')):
                            if (result.get('email') is None): # this coupon can apply for everyone
                                response['message'] = "OK"
                                response['result'] = result
                            else: # compare the email in result with apply_email to make sure we have a right customer
                                if (result['email'] == apply_email): # valid email
                                    response['message'] = "OK"
                                    response['result'] = result
                                else:
                                    response['message'] = "Invalid email address for current coupon ID."
                                    return response, 400
                        else:
                            response['message'] = " This coupon is no longer available."
                            return response, 400
                    else:
                        response['message'] = "This coupon has expired."
                        return response, 400
                    return response, 200
                else:
                    response['message'] = "This coupon is no longer active."
                    return response, 400
            else: # there is no matching coupon for requesting coupon_id
                response['message'] = "Invalid coupon ID"
                return response, 400
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)
class UpdateDeliveryAddress(
        Resource):  # we do not need this if we consider updating subcription as deleting the old one and
    # buy the new subcription
    def patch(self):
        response = {}

        try:
            conn = connect()
            data = request.get_json(force=True)

            print("pre", data)

            purchase_id = data['purchase_id']
            delivery_address = data['delivery_address']

            print("1")
            # sometimes there is not address_unit
            delivery_address_unit = data.get('delivery_address_unit')
            # delivery_address_unit = None
            print("2")

            delivery_city = data['delivery_city']
            delivery_state = data['delivery_state']
            delivery_zip = data['delivery_zip']
            delivery_instructions = data['delivery_instructions']

            if (delivery_address_unit == None):
                delivery_address_unit = ""

            # test=execute(""" CALL `ptyd`.`update_purchase`(\'""" + str(purchase_id) + """\', \'""" + str(meal_plan_id) + """\', \'""" + str(delivery_address) + """\', \'""" + str(delivery_address_unit) + """\', \'""" + str(delivery_city) + """\', \'""" + str(delivery_state) + """\', \'""" + str(delivery_zip) + """\', \'""" + str(delivery_instructions) + """\'); """, 'post', conn)
            # print("test",test)
            execute(""" CALL `ptyd`.`update_delivery_address`(\'""" + str(purchase_id) + """\',
                                                           \'""" + str(delivery_address) + """\',
                                                           \'""" + str(delivery_address_unit) + """\', 
                                                           \'""" + str(delivery_city) + """\', 
                                                           \'""" + str(delivery_state) + """\', 
                                                           \'""" + str(delivery_zip) + """\', 
                                                           \'""" + str(delivery_instructions) + """\');
                                                            """, 'post', conn)

            # curl -X PATCH -H "Content-Type: application/json" http://127.0.0.1:2000/api/v2/update-subscription --data '{"purchase_id":"300-00004","meal_plan_id":"800-000007","delivery_address":"121","delivery_address_unit":"121","delivery_city":"3243","delivery_state":"Texas","delivery_zip”:"95130","delivery_instructions":"N/A"}'

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class UpdatePayments(Resource):
    def patch(self):
        response = {}

        try:
            conn = connect()
            data = request.get_json(force=True)

            print("pre", data)

            purchase_id = data['purchase_id']
            cc_num = data['cc_num'][-4:]
            cc_exp_date = data['cc_exp_date']
            cc_cvv = data['cc_cvv']

            print("data", data)
            execute(""" CALL `ptyd`.`update_payments`(\'""" + str(purchase_id) + """\',
                                                        \'""" + str(cc_num) + """\', 
                                                        \'""" + str(cc_exp_date) + """\',
                                                        \'""" + str(cc_cvv) + """\');
                                                        """, 'post', conn)

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class All_Meals(Resource):
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()
            # data = request.get_json(force=True)
            date = request.args.get("date")
            # date_affected = data['date_affected']

            items = execute("""SELECT 
                                    allmeals.*,
                                    meals_ordered.*
                                    FROM (# QUERY 8
                                    SELECT 
                                        menu_date,
                                        menu_category,
                                        meal_category,
                                        menu_type,
                                        meal_cat,
                                        meal_id,
                                        meals.meal_name,
                                        default_meal,
                                        extra_meal_price
                                    FROM ptyd.ptyd_menu menu
                                    JOIN ptyd.ptyd_meals meals
                                        ON menu.menu_meal_id = meals.meal_id )
                                        AS allmeals
                                LEFT JOIN   (# QUERY 9
                                    SELECT 
                                        week_affected,
                                        meal_selected,
                                        meal_name,
                                        COUNT(num) AS total
                                    FROM (
                                        SELECT *
                                            , substring_index(substring_index(combined_selection,';',n),';',-1) AS meal_selected
                                            , n AS num
                                        FROM (# QUERY 8
                                            SELECT meals.*,
                                                addons.meal_selection AS addon_selection,
                                                if(addons.meal_selection IS NOT NULL,CONCAT(meals.meal_selection,';',addons.addons.meal_selection),meals.meal_selection) AS combined_selection
                                            FROM (# QUERY 7
                                                SELECT
                                                    act_meal.purchase_id,
                                                    act_meal.Saturday AS week_affected,
                                                    act_meal.delivery_first_name,
                                                    act_meal.delivery_last_name,
                                                    act_meal.num_meals,
                                                    act_meal.deliver AS delivery_day,
                                                    -- act_meal.meal_selection AS org_meal_selection,
                                                    CASE
                                                        WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 5  THEN  act_meal.def_5_meal
                                                        WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 10 THEN act_meal.def_10_meal
                                                        WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 15 THEN act_meal.def_15_meal
                                                        WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 20 THEN act_meal.def_20_meal
                                                        ELSE act_meal.meal_selection
                                                    END AS meal_selection
                                                FROM (# QUERY 6
                                                    SELECT 
                                                        sel_meals.*,
                                                        CASE
                                                            WHEN (sel_meals.delivery_day IS NULL AND sel_meals.delivery_default_day IS NULL ) THEN  "Sunday"
                                                            WHEN (sel_meals.delivery_day IS NULL AND sel_meals.delivery_default_day IS NOT NULL ) THEN sel_meals.delivery_default_day
                                                            ELSE sel_meals.delivery_day
                                                        END AS deliver,
                                                        plans.num_meals,
                                                        plans.meal_weekly_price,
                                                        plans.meal_plan_price,
                                                        def_meals.*
                                                    FROM (# QUERY 4
                                                        SELECT 
                                                            act_pur.*,
                                                            act_meal.selection_time,
                                                            act_meal.meal_selection,
                                                            act_meal.delivery_day
                                                        FROM (
                                                            SELECT * 
                                                            FROM ptyd.ptyd_purchases pur
                                                            JOIN ptyd.ptyd_saturdays sat
                                                            WHERE pur.purchase_status = "ACTIVE"
                                                                -- AND sat.Saturday < "2020-09-01"
                                                                AND sat.Saturday > DATE_ADD(CURDATE(), INTERVAL -16 DAY)
                                                                AND sat.Saturday < DATE_ADD(CURDATE(), INTERVAL 40 DAY)
                                                               -- AND sat.Saturday > pur.start_date)
                                                                AND DATE_ADD(sat.Saturday, INTERVAL 0 DAY) > DATE_ADD(pur.start_date, INTERVAL 2 DAY))
                                                            AS act_pur
                                                        LEFT JOIN (# QUERY 1 
                                                            SELECT
                                                                ms1.purchase_id
                                                                , ms1.selection_time
                                                                , ms1.week_affected
                                                                , ms1.meal_selection
                                                                , ms1.delivery_day
                                                            FROM ptyd.ptyd_meals_selected AS ms1
                                                            INNER JOIN (
                                                                SELECT
                                                                    purchase_id
                                                                    , week_affected
                                                                    , meal_selection
                                                                    , MAX(selection_time) AS latest_selection
                                                                    , delivery_day
                                                                FROM ptyd.ptyd_meals_selected
                                                                GROUP BY purchase_id
                                                                    , week_affected)
                                                                AS ms2 
                                                            ON ms1.purchase_id = ms2.purchase_id 
                                                                AND ms1.week_affected = ms2.week_affected 
                                                                AND ms1.selection_time = ms2.latest_selection
                                                            ORDER BY purchase_id
                                                                , week_affected)
                                                            AS act_meal
                                                        ON act_pur.Saturday = act_meal.week_affected
                                                            AND act_pur.purchase_id = act_meal.purchase_id
                                                        ORDER BY act_pur.purchase_id
                                                            , act_pur.Saturday
                                                            , act_meal.selection_time)
                                                        AS sel_meals
                                                    LEFT JOIN ptyd.ptyd_meal_plans AS plans ON sel_meals.meal_plan_id = plans.meal_plan_id    
                                                    LEFT JOIN (# QUERY 5
                                                        SELECT dm.*
                                                            , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 59,10)) 
                                                                    as def_5_meal
                                                            , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 59,10),";"
                                                                    ,MID(dm.default_meals, 59,10)) 
                                                                    as def_10_meal
                                                            , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 59,10),";"
                                                                    ,MID(dm.default_meals, 59,10),";"
                                                                    ,MID(dm.default_meals, 59,10)) 
                                                                    as def_15_meal
                                                            , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals,  3,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 17,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 31,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 45,10),";"
                                                                    ,MID(dm.default_meals, 59,10),";"
                                                                    ,MID(dm.default_meals, 59,10),";"
                                                                    ,MID(dm.default_meals, 59,10),";"
                                                                    ,MID(dm.default_meals, 59,10)) 
                                                                    as def_20_meal
                                                        FROM (
                                                            SELECT defaultmeal.menu_date
                                                                , defaultmeal.menu_category
                                                                , defaultmeal.menu_type
                                                                , defaultmeal.meal_cat
                                                                , JSON_ARRAYAGG(menu_meal_id) as "default_meals" 
                                                                
                                                            FROM (
                                                                SELECT * FROM ptyd.ptyd_menu menu
                                                                WHERE default_meal = "TRUE")
                                                                AS defaultmeal
                                                            GROUP BY defaultmeal.menu_date)
                                                            AS dm)
                                                        AS def_meals
                                                    ON sel_meals.Saturday = def_meals.menu_date)
                                                    AS act_meal)
                                                AS meals
                                            LEFT JOIN (# QUERY 2
                                                SELECT
                                                    ms1.purchase_id,
                                                    -- , ms1.selection_time
                                                    ms1.week_affected,
                                                    "Add-on" AS delivery_first_name,
                                                    "Add-on" AS delivery_last_name,
                                                    "0" AS num_meals,
                                                    "Add-on" AS delivery_day,
                                                    ms1.meal_selection
                                                FROM ptyd.ptyd_addons_selected AS ms1
                                                INNER JOIN (
                                                    SELECT
                                                        purchase_id
                                                        , week_affected
                                                        , meal_selection
                                                        , MAX(selection_time) AS latest_selection
                                                    FROM ptyd.ptyd_addons_selected
                                                    GROUP BY purchase_id
                                                        , week_affected
                                                ) as ms2 
                                                ON ms1.purchase_id = ms2.purchase_id 
                                                    AND ms1.week_affected = ms2.week_affected 
                                                    AND ms1.selection_time = ms2.latest_selection
                                                ORDER BY purchase_id
                                                    , week_affected)
                                                AS addons
                                                ON meals.purchase_id = addons.purchase_id
                                                AND meals.week_affected = addons.week_affected
                                            GROUP BY meals.purchase_id,
                                                meals.week_affected)
                                            AS combined
                                    JOIN numbers ON char_length(combined_selection) - char_length(replace(combined_selection, ';', '')) >= n - 1)
                                        AS sub
                                    LEFT JOIN ptyd.ptyd_meals meals ON sub.meal_selected = meals.meal_id
                                    GROUP BY week_affected
                                        , meal_selected
                                    ORDER BY week_affected
                                        , meal_selected)
                                                                        AS meals_ordered
                                        ON allmeals.menu_date = meals_ordered.week_affected
                                                                            AND allmeals.meal_id = meals_ordered.meal_selected
                                                                    where menu_date = \'""" + date + """\'
                                                                    ORDER BY 
                                                                        menu_date,
                                                                        menu_category
                                    ;""", 'get', conn)

            response['message'] = 'successful'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class All_Ingredients(Resource):
    global RDS_PW

    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()
            # data = request.get_json(force=True)
            date = request.args.get("date")
            # date_affected = data['date_affected']

            items = execute("""SELECT
                                meals_ordered.week_affected,
                                -- meals_ordered.total,
                                -- SUM(rec.recipe_ingredient_qty),
                                SUM(meals_ordered.total * rec.recipe_ingredient_qty) AS total_needed,
                                unit.measure_name,
                                ing.ingredient_desc,
                                ing.package_size,
                                ing.ingredient_measure,
                                mc.conversion_ratio,
                                ROUND(SUM(meals_ordered.total * rec.recipe_ingredient_qty) * mc.conversion_ratio / ing.package_size,2) AS need_qty,
                                inv.inventory_qty,
                                if(SUM(meals_ordered.total * rec.recipe_ingredient_qty) * mc.conversion_ratio / ing.package_size - inv.inventory_qty < 0,0,
                                CEILING(SUM(meals_ordered.total * rec.recipe_ingredient_qty) * mc.conversion_ratio / ing.package_size - inv.inventory_qty)) AS buy_qty       
                            FROM (# QUERY 11
                                SELECT 
                                    week_affected,
                                    meal_selected,
                                    meal_name,
                                    COUNT(num) AS total
                                FROM (
                                    SELECT *
                                        , substring_index(substring_index(combined_selection,';',n),';',-1) AS meal_selected
                                        , n AS num
                                    FROM (# QUERY 8
                                        SELECT meals.*,
                                            addons.meal_selection AS addon_selection,
                                            if(addons.meal_selection IS NOT NULL,CONCAT(meals.meal_selection,';',addons.addons.meal_selection),meals.meal_selection) AS combined_selection
                                        FROM (# QUERY 7
                                            SELECT
                                                act_meal.purchase_id,
                                                act_meal.Saturday AS week_affected,
                                                act_meal.delivery_first_name,
                                                act_meal.delivery_last_name,
                                                act_meal.num_meals,
                                                act_meal.deliver AS delivery_day,
                                                -- act_meal.meal_selection AS org_meal_selection,
                                                CASE
                                                    WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 5  THEN  act_meal.def_5_meal
                                                    WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 10 THEN act_meal.def_10_meal
                                                    WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 15 THEN act_meal.def_15_meal
                                                    WHEN (act_meal.meal_selection IS NULL OR act_meal.meal_selection = "SURPRISE") AND act_meal.num_meals = 20 THEN act_meal.def_20_meal
                                                    ELSE act_meal.meal_selection
                                                END AS meal_selection
                                            FROM (# QUERY 6
                                                SELECT 
                                                    sel_meals.*,
                                                    CASE
                                                        WHEN (sel_meals.delivery_day IS NULL AND sel_meals.delivery_default_day IS NULL ) THEN  "Sunday"
                                                        WHEN (sel_meals.delivery_day IS NULL AND sel_meals.delivery_default_day IS NOT NULL ) THEN sel_meals.delivery_default_day
                                                        ELSE sel_meals.delivery_day
                                                    END AS deliver,
                                                    plans.num_meals,
                                                    plans.meal_weekly_price,
                                                    plans.meal_plan_price,
                                                    def_meals.*
                                                FROM (# QUERY 4
                                                    SELECT 
                                                        act_pur.*,
                                                        act_meal.selection_time,
                                                        act_meal.meal_selection,
                                                        act_meal.delivery_day
                                                    FROM (
                                                        SELECT * 
                                                        FROM ptyd.ptyd_purchases pur
                                                        JOIN ptyd.ptyd_saturdays sat
                                                        WHERE pur.purchase_status = "ACTIVE"
                                                            -- AND sat.Saturday < "2020-09-01"
                                                            AND sat.Saturday > DATE_ADD(CURDATE(), INTERVAL -16 DAY)
                                                            AND sat.Saturday < DATE_ADD(CURDATE(), INTERVAL 40 DAY)
                                                           -- AND sat.Saturday > pur.start_date)
                                                            AND DATE_ADD(sat.Saturday, INTERVAL 0 DAY) > DATE_ADD(pur.start_date, INTERVAL 2 DAY))
                                                        AS act_pur
                                                    LEFT JOIN (# QUERY 1 
                                                        SELECT
                                                            ms1.purchase_id
                                                            , ms1.selection_time
                                                            , ms1.week_affected
                                                            , ms1.meal_selection
                                                            , ms1.delivery_day
                                                        FROM ptyd.ptyd_meals_selected AS ms1
                                                        INNER JOIN (
                                                            SELECT
                                                                purchase_id
                                                                , week_affected
                                                                , meal_selection
                                                                , MAX(selection_time) AS latest_selection
                                                                , delivery_day
                                                            FROM ptyd.ptyd_meals_selected
                                                            GROUP BY purchase_id
                                                                , week_affected)
                                                            AS ms2 
                                                        ON ms1.purchase_id = ms2.purchase_id 
                                                            AND ms1.week_affected = ms2.week_affected 
                                                            AND ms1.selection_time = ms2.latest_selection
                                                        ORDER BY purchase_id
                                                            , week_affected)
                                                        AS act_meal
                                                    ON act_pur.Saturday = act_meal.week_affected
                                                        AND act_pur.purchase_id = act_meal.purchase_id
                                                    ORDER BY act_pur.purchase_id
                                                        , act_pur.Saturday
                                                        , act_meal.selection_time)
                                                    AS sel_meals
                                                LEFT JOIN ptyd.ptyd_meal_plans AS plans ON sel_meals.meal_plan_id = plans.meal_plan_id    
                                                LEFT JOIN (# QUERY 5
                                                    SELECT dm.*
                                                        , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 59,10)) 
                                                                as def_5_meal
                                                        , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 59,10),";"
                                                                ,MID(dm.default_meals, 59,10)) 
                                                                as def_10_meal
                                                        , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 59,10),";"
                                                                ,MID(dm.default_meals, 59,10),";"
                                                                ,MID(dm.default_meals, 59,10)) 
                                                                as def_15_meal
                                                        , CONCAT(MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals,  3,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 17,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 31,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 45,10),";"
                                                                ,MID(dm.default_meals, 59,10),";"
                                                                ,MID(dm.default_meals, 59,10),";"
                                                                ,MID(dm.default_meals, 59,10),";"
                                                                ,MID(dm.default_meals, 59,10)) 
                                                                as def_20_meal
                                                    FROM (
                                                        SELECT defaultmeal.menu_date
                                                            , defaultmeal.menu_category
                                                            , defaultmeal.menu_type
                                                            , defaultmeal.meal_cat
                                                            , JSON_ARRAYAGG(menu_meal_id) as "default_meals" 
                                                            
                                                        FROM (
                                                            SELECT * FROM ptyd.ptyd_menu menu
                                                            WHERE default_meal = "TRUE")
                                                            AS defaultmeal
                                                        GROUP BY defaultmeal.menu_date)
                                                        AS dm)
                                                    AS def_meals
                                                ON sel_meals.Saturday = def_meals.menu_date)
                                                AS act_meal)
                                            AS meals
                                        LEFT JOIN (# QUERY 2
                                            SELECT
                                                ms1.purchase_id,
                                                -- , ms1.selection_time
                                                ms1.week_affected,
                                                "Add-on" AS delivery_first_name,
                                                "Add-on" AS delivery_last_name,
                                                "0" AS num_meals,
                                                "Add-on" AS delivery_day,
                                                ms1.meal_selection
                                            FROM ptyd.ptyd_addons_selected AS ms1
                                            INNER JOIN (
                                                SELECT
                                                    purchase_id
                                                    , week_affected
                                                    , meal_selection
                                                    , MAX(selection_time) AS latest_selection
                                                FROM ptyd.ptyd_addons_selected
                                                GROUP BY purchase_id
                                                    , week_affected
                                            ) as ms2 
                                            ON ms1.purchase_id = ms2.purchase_id 
                                                AND ms1.week_affected = ms2.week_affected 
                                                AND ms1.selection_time = ms2.latest_selection
                                            ORDER BY purchase_id
                                                , week_affected)
                                            AS addons
                                            ON meals.purchase_id = addons.purchase_id
                                            AND meals.week_affected = addons.week_affected
                                        GROUP BY meals.purchase_id,
                                            meals.week_affected)
                                        AS combined
                                JOIN numbers ON char_length(combined_selection) - char_length(replace(combined_selection, ';', '')) >= n - 1)
                                    AS sub
                                LEFT JOIN ptyd.ptyd_meals meals ON sub.meal_selected = meals.meal_id
                                GROUP BY week_affected
                                    , meal_selected
                                ORDER BY week_affected
                                    , meal_selected)
                                AS meals_ordered
                            LEFT JOIN ptyd.ptyd_recipes rec ON meals_ordered.meal_selected = rec.recipe_meal_id
                            JOIN ptyd.ptyd_measure_unit unit ON rec.recipe_measure_id = unit.measure_unit_id
                            LEFT JOIN ptyd.ptyd_ingredients ing ON rec.recipe_ingredient_id = ing.ingredient_id
                            LEFT JOIN ptyd.ptyd_measure_conversion mc ON rec.recipe_measure_id = mc.from_measure_unit_id AND ing.ingredient_measure_id = mc.to_measure_unit_id
                            LEFT JOIN ptyd.ptyd_inventory inv ON rec.recipe_ingredient_id = inv.inventory_ingredient_id
                            where meals_ordered.week_affected = \'""" + date + """\'
                            GROUP BY rec.recipe_ingredient_id,
                                meals_ordered.week_affected
                            ORDER BY meals_ordered.week_affected,
                                ingredient_desc;""", 'get', conn)

            response['message'] = 'successful'
            response['result'] = items

            return response
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class DisplaySaturdays(Resource):
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()
            items = execute(""" (select * from ptyd_saturdays where Saturday < CURDATE() order by Saturday desc limit 4)
                                union all
                                (select * from ptyd_saturdays where Saturday > CURDATE() order by Saturday limit 4);""", 'get', conn)
            response['message'] = 'successful'
            response['result'] = items
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class MealCreation(Resource):
    def listIngredients(self, result):
        response = {}
        for meal in result:
            key = meal['meal_id']
            if key not in response:
                response[key] = {}
                response[key]['meal_name'] = meal['meal_name']
                response[key]['ingredients'] = []
            ingredient = {}
            ingredient['name'] = meal['ingredient_desc']
            ingredient['qty'] = meal['recipe_ingredient_qty']
            ingredient['units'] = meal['measure_name']
            ingredient['ingredient_id'] = meal['ingredient_id']
            ingredient['measure_id'] = meal['recipe_measure_id']
            response[key]['ingredients'].append(ingredient)

        return response

    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            query = """
                SELECT  
                    m.meal_id,
                    m.meal_name,
                    ingredient_id,
                    ingredient_desc,
                    recipe_ingredient_qty,
                    measure_name,
                    recipe_measure_id
                    FROM
                    ptyd_meals m
                    left JOIN
                    ptyd_recipes r
                    ON
                    recipe_meal_id = meal_id
                    left JOIN
                    ptyd_ingredients
                    ON
                    ingredient_id = recipe_ingredient_id
                    left JOIN
                    ptyd_measure_unit
                    ON                     
                    recipe_measure_id = measure_unit_id 
                    order by recipe_meal_id;"""

            sql = execute(query, 'get', conn)

            items = self.listIngredients(sql['result'])

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

    def post(self):
        try:
            conn = connect()
            data = request.get_json(force=True)

            # Post JSON needs to be in this format
#           data = {
#               'meal_id': '700-000001',
#               'ingredient_id': '110-000002',
#               'ingredient_qty': 3,
#               'measure_id': '130-000004'
#           }

            query = """
                INSERT INTO ptyd_recipes (
                    recipe_meal_id,
                    recipe_ingredient_id,
                    recipe_ingredient_qty,
                    recipe_measure_id )
                VALUES (
                    \'""" + data['meal_id'] + """\',
                    \'""" + data['ingredient_id'] + """\',
                    \'""" + data['ingredient_qty'] + """\',
                    \'""" + data['measure_id'] + """\')
                ON DUPLICATE KEY UPDATE
                    recipe_ingredient_qty = \'""" + data['ingredient_qty'] + """\',
                    recipe_measure_id = \'""" + data['measure_id'] + "\';"

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class Edit_Recipe(Resource):
    def post(self):
        response = {}
        items = {}
        try:
            conn = connect()
            data = request.get_json(force=True)

            meal_id = data['meal_id']
            meal_name = data['meal_name']
            ingredients = data['ingredients']

            items['delete_ingredients'] = execute("""delete from ptyd_recipes 
                                                        where recipe_meal_id = \'""" + str(meal_id) + """\';
                                                            """, 'post', conn)

            i = 0
            for eachIngredient in data['ingredients']:
                name = ingredients[i]['name']
                qty = ingredients[i]['qty']
                units = ingredients[i]['units']
                ingredient_id = ingredients[i]['ingredient_id']
                measure_id = ingredients[i]['measure_id']
                print(name)
                print(qty)
                print(units)
                print(ingredient_id)
                print(measure_id)
                print(meal_id)
                print(meal_name)
                print("************************")

                items['new_ingredients_insert'] = execute(""" INSERT INTO ptyd_recipes (
                                                            recipe_meal_id, recipe_ingredient_id, recipe_ingredient_qty, 
                                                            recipe_measure_id
                                                            ) 
                                                            VALUES (
                                                            \'""" + str(meal_id) + """\',\'""" + str(ingredient_id) + """\',\'""" + str(qty) + """\',\'""" + str(measure_id) + """\'
                                                            );
                                                            """, 'post', conn)
                i += 1

        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)


class Add_New_Ingredient(Resource):
    def post(self):
        response = {}
        items = {}
        try:
            conn = connect()
            data = request.get_json(force=True)

            ingredient_desc = data['ingredient_desc']
            package_size = data['package_size']
            ingredient_measure_id = data['ingredient_measure_id']
            ingredient_cost = data['ingredient_cost']

            ingredientIdQuery = execute(
                """CALL get_new_ingredient_id();""", 'get', conn)
            ingredientId = ingredientIdQuery['result'][0]['new_id']
            items['new_ingredient_insert'] = execute(""" INSERT INTO ptyd_ingredients (
                                                                ingredient_id, ingredient_desc, package_size,ingredient_measure_id,ingredient_cost, ingredient_measure
                                                                ) 
                                                                SELECT \'""" + str(ingredientId) + """\', \'""" + str(ingredient_desc) + """\',
                                                                \'""" + str(package_size) + """\',\'""" + str(ingredient_measure_id) + """\',
                                                                \'""" + str(ingredient_cost) + """\', mu.measure_name 
                                                                FROM ptyd_measure_unit mu
                                                                WHERE measure_unit_id=\'""" + str(ingredient_measure_id) + """\';
                                                                """, 'post', conn)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(""" SELECT
                                *
                                FROM
                                ptyd_ingredients;""", 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)
class Get_All_Units(Resource):       

    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()

            items = execute(""" SELECT
                                *
                                FROM
                                ptyd_measure_unit;""", 'get', conn)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)



class Add_Meal(Resource):
    def post(self):
        response = {}
        items = {}
        try:
            conn = connect()
            print("connection done...")
            data = request.get_json(force=True)
            print("data collected...")
            print(data)
            mealIdQuery = execute("""CALL get_new_meal_id();""", 'get', conn)
            print("meal_id called..")
            mealId = mealIdQuery['result'][0]['new_id']
            print("new_meal_id created...")
            meal_category = data['meal_category']
            meal_name = data['meal_name']
            meal_desc = data['meal_desc']
            meal_hint = data['meal_hint']
            meal_photo_URL = data['meal_photo_URL']
            extra_meal_price = data['extra_meal_price']
            meal_calories = data['meal_calories']
            meal_protein = data['meal_protein']
            meal_carbs = data['meal_carbs']
            meal_fiber = data['meal_fiber']
            meal_sugar = data['meal_sugar']
            meal_fat = data['meal_fat']
            meal_sat = data['meal_sat']

            print("Items read...")
            items['new_meal_insert'] = execute("""INSERT INTO ptyd_meals ( 	
                                                meal_id,meal_category,meal_name,meal_desc,
                                                meal_hint,meal_photo_URL,extra_meal_price, 	
                                                meal_calories,meal_protein,meal_carbs,
                                                meal_fiber,meal_sugar,meal_fat,meal_sat 
                                                ) 
                                                VALUES ( 	
                                                \'""" + str(mealId) + """\',\'""" + str(meal_category) + """\',
                                                \'""" + str(meal_name) + """\',\'""" + str(meal_desc) + """\',
                                                \'""" + str(meal_hint) + """\',\'""" + str(meal_photo_URL) + """\',
                                                \'""" + str(extra_meal_price) + """\',\'""" + str(meal_calories) + """\',
                                                \'""" + str(meal_protein) + """\',\'""" + str(meal_carbs) + """\',
                                                \'""" + str(meal_fiber) + """\',\'""" + str(meal_sugar) + """\',
                                                \'""" + str(meal_fat) + """\',\'""" + str(meal_sat) + """\'
                                                );""", 'post', conn)

            print("meal_inserted...")

        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)

class Edit_Meal(Resource):
    def get(self):
        response = {}
        items = {}
        try:
            conn = connect()
            items = execute(""" select * from ptyd_meals;""", 'get', conn)

            response['message'] = 'successful'
            response['result'] = items
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn)
    
    def patch(self):
        response = {}
        items = {}
        try:
            conn = connect()
            data = request.get_json(force=True)
           
            mealId = data['mealId']
            meal_category = data['meal_category']
            meal_name = data['meal_name']
            meal_desc = data['meal_desc']
            meal_hint = data['meal_hint']
            meal_photo_URL = data['meal_photo_URL']
            extra_meal_price = data['extra_meal_price']
            meal_calories = data['meal_calories']
            meal_protein = data['meal_protein']
            meal_carbs = data['meal_carbs']
            meal_fiber = data['meal_fiber']
            meal_sugar = data['meal_sugar']
            meal_fat = data['meal_fat']
            meal_sat = data['meal_sat']
            print(data)
            print("Items read...")
            items['update_meal'] = execute("""update ptyd_meals 
                                                set
                                                meal_category = \'""" + str(meal_category) + """\',
                                                meal_name = \'""" + str(meal_name) + """\',
                                                meal_desc = \'""" + str(meal_desc) + """\',
                                                meal_hint = \'""" + str(meal_hint) + """\',
                                                meal_photo_URL = \'""" + str(meal_photo_URL) + """\',
                                                extra_meal_price = \'""" + str(extra_meal_price) + """\',
                                                meal_calories = \'""" + str(meal_calories) + """\',
                                                meal_protein = \'""" + str(meal_protein) + """\',
                                                meal_carbs = \'""" + str(meal_carbs) + """\',
                                                meal_fiber = \'""" + str(meal_fiber) + """\',
                                                meal_sugar = \'""" + str(meal_sugar) + """\',
                                                meal_fat = \'""" + str(meal_fat) + """\',
                                                meal_sat  = \'""" + str(meal_sat) + """\'
                                                where
                                                meal_id = \'""" + str(mealId) + """\';""", 'post', conn)
                                            
            print("meal_updated...")
            
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            disconnect(conn) 

class Add_New_Measure_Unit(Resource):       
    def post(self):
        response = {}
        items = {}
        try:
            conn = connect()
            data = request.get_json(force=True)

            measure_name = data['measure_name']

            measure_unitIdQuery = execute("""CALL get_new_measure_unit_id();""", 'get', conn)
            measure_unitId = measure_unitIdQuery ['result'][0]['new_id']
            items['new_ingredient_insert'] = execute(""" INSERT INTO ptyd_measure_unit 
                                                        (
                                                        measure_unit_id,measure_name
                                                        ) 
                                                        VALUES 
                                                        (
                                                        \'""" + str(measure_unitId) + """\',
                                                        \'""" + str(measure_name) + """\'
                                                        );
                                                        """, 'post', conn)
            
            response['message'] = 'Request successful.'
            response['result'] = items

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

            response['message'] = 'Request successful.'
            response['result'] = items

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
                        
                        key1 = "Menu_Type"
                        key2 = "Meal_Name"
                        
                        menuType = items['result'][index2]['menu_type']
                        mealNames = items['result'][index2]['meal_name']

                        tempDict[key1] = menuType
                        tempDict[key2] = mealNames
                        
                        menuInfo.append(tempDict)

                
                d[menuDates[index]] = menuInfo

            
            items = execute(
                        """ SELECT C.meal_id, C.meal_category, C.meal_name, IFNULL(B.total_sold,0) AS total_sold, IFNULL(A.times_posted,0) AS times_posted, IFNULL(total_sold/times_posted,0) AS "Avg Sales/Posting"
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
            
            mealCat = []
            mealAvg = []
            mealNames = []
            mealPostings = []
            mealTotalSold = []
            for index in range(len(items['result'])):
                placeHolder = items['result'][index]['meal_category']
                mealCat.append(placeHolder)
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

                key1 = "Meal_Name"
                key2 = "Avg_Sales/Posting"
                key3 = "Total_Posts"
                key4 = "Total_Sold"
                key5 = "Meal_Category"
                tempDict[key5] = mealCat[index]
                tempDict[key1] = mealNames[index]
                tempDict[key2] = str(mealAvg[index])
                tempDict[key3] = str(mealPostings[index])
                tempDict[key4] = str(mealTotalSold[index])
                mealList.append(tempDict)
                

            
           #iterating through all of the meal options and sorting the meal name and average sales into the meal category dictionary with values as lists

            d2 = {}

            for index in range(len(mealCat)):
                key = mealCat[index]
                d2[key] = "value"
            
            print("TEST -------------------")
            print(d2)
            for index in range(len(mealCat)):
                tempList = []
                
                for index2 in range(len(items['result'])):
                    
                    if (items['result'][index2]['meal_category'] == mealCat[index]):
                        tempDict = {}
                        mealName = items['result'][index2]['meal_name']
                        mealAvg = str(items['result'][index2]['Avg Sales/Posting'])
                        mealTotalSold = str(items['result'][index2]['total_sold'])
                        mealNumPostings = str(items['result'][index2]['times_posted'])
                        key1 = "Meal_Name"
                        key2 = "Avg_Sales_Posting"
                        key3 = "Total_Sold"
                        key4 = "Times_Posted"
                        tempDict[key1] = mealName
                        tempDict[key2] = mealAvg
                        tempDict[key3] = mealTotalSold
                        tempDict[key4] = mealNumPostings
                        tempList.append(tempDict)
                        print("tempDict --------------")
                        print(tempDict)
                print("TEMPLIST ____________________")
                print(tempList)
                d2[mealCat[index]] = tempList

                        

            print("TEST -------------")
            print(d2)

            response['message'] = 'successful'
            
            # response['menu_dates'] = menuDates
            response['menus'] = d
            response['result'] = d2
            

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
api.add_resource(ResetPassword, '/api/v2/resetpassword')
api.add_resource(ChangePassword, '/api/v2/changepassword')
api.add_resource(Account, '/api/v2/account/<string:accId>')
api.add_resource(AccountSalt, '/api/v2/accountsalt/<string:accEmail>')
api.add_resource(SessionVerification,
                 '/api/v2/sessionverification/<string:userUid>/<string:sessionId>')
api.add_resource(AccountPurchases, '/api/v2/accountpurchases/<string:buyerId>')
api.add_resource(Checkout, '/api/v2/checkout')
api.add_resource(MealSelection, '/api/v2/mealselection/<string:purchaseId>')
api.add_resource(SocialSignUp, '/api/v2/socialSignup')
api.add_resource(Social, '/api/v2/social/<string:email>')
api.add_resource(SocialAccount, '/api/v2/socialacc/<string:uid>')
api.add_resource(UpdateDeliveryAddress, '/api/v2/update-delivery-address')
api.add_resource(Update_Subscription, '/api/v2/update-subscription')
api.add_resource(Coupon, '/api/v2/coupon')
api.add_resource(ZipCodes, '/api/v2/monday-zip-codes')

# Admin page
# ---------- Admin page -----------------------------
api.add_resource(DisplaySaturdays, '/api/v2/saturdays')
api.add_resource(MealCreation, '/api/v2/mealcreation')
api.add_resource(Add_New_Measure_Unit, '/api/v2/Add_New_Measure_Unit')
api.add_resource(All_Meals, '/api/v2/All_Meals')
api.add_resource(All_Ingredients, '/api/v2/All_Ingredients')
api.add_resource(Add_New_Ingredient, '/api/v2/Add_New_Ingredient')
api.add_resource(Edit_Recipe, '/api/v2/Edit_Recipe')
api.add_resource(Add_Meal, '/api/v2/Add_Meal')
api.add_resource(Edit_Meal, '/api/v2/Edit_Meal')

api.add_resource(CancelSubscriptionNow, '/api/v2/cancel-subscription-now')
api.add_resource(DoNotRenewSubscription, '/api/v2/do-not-renew-subscription')

# Automated APIs
api.add_resource(UpdatePurchases, '/api/v2/updatepurchases',
                 '/api/v2/updatepurchases/<string:affectedDate>')
api.add_resource(ChargeSubscribers, '/api/v2/chargesubscribers',
                 '/api/v2/chargesubscribers/<string:affectedDate>')

'''
# -----------Stripe Resrouces--------------------
api.add_resource(GetTestKey, '/api/v2/stripe-testkeys')
'''
# in progress
api.add_resource(UpdatePayments, '/api/v2/update-payments')

'''
api.add_resource(EditMeals, '/api/v2/edit-meals')
api.add_resource(UpdateRecipe, '/api/v2/update-recipe')
'''

# Template
api.add_resource(TemplateApi, '/api/v2/templateapi')

# Run on below IP address and port
# Make sure port number is unused (i.e. don't use numbers 0-1023)
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=2000)