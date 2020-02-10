from flask import Flask, request, render_template
from flask_restful import Resource, Api
from flask_cors import CORS

from werkzeug.exceptions import BadRequest, NotFound

from decimal import Decimal
from datetime import datetime, date, timedelta
from hashlib import sha512

import decimal
import sys
import json
import pymysql

app = Flask(__name__)
cors = CORS(app, resources={r'/api/*': {'origins': '*'}})

app.config['DEBUG'] = True

api = Api(app)

# Get RDS password from command line argument
def RdsPw():
    if len(sys.argv) == 2: return str(sys.argv[1])
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
        conn = pymysql.connect( RDS_HOST,
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

def runSelectQuery(query, cur):
    try:
        cur.execute(query)
        queriedData = cur.fetchall()
        return queriedData
    except:
        raise Exception("Could not run select query and/or return data")

class Plans(Resource):
    global RDS_PW
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

            mealPlanKeys = ('meal_plan_id', 'meal_plan_desc', 'payment_frequency', 'photo_URL', 'plan_headline', 'plan_footer', 'num_meals', 'meal_plan_price', 'RouteOnclick')
            paymentPlanKeys = ('meal_plan_id', 'meal_plan_desc', 'payment_frequency', 'photo_URL', 'num_meals', 'meal_plan_price')

            query = runSelectQuery(queries[0], cur)
            items['MealPlans'] = self.jsonifyMealPlans(query, mealPlanKeys)

            query = runSelectQuery(queries[1], cur)
            items['FiveMealPaymentPlans'] = self.jsonifyMealPlans(query, paymentPlanKeys)

            query = runSelectQuery(queries[2], cur)
            items['TenMealPaymentPlans'] = self.jsonifyMealPlans(query, paymentPlanKeys)

            query = runSelectQuery(queries[3], cur)
            items['FifteenMealPaymentPlans'] = self.jsonifyMealPlans(query, paymentPlanKeys)

            query = runSelectQuery(queries[4], cur)
            items['TwentyMealPaymentPlans'] = self.jsonifyMealPlans(query, paymentPlanKeys)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

class Meals(Resource):
    global RDS_PW
#   def getIngredients(self, mealID, cur):
#       sql = """   SELECT
#                       Ingredient,
#                       Meal,
#                       Qty,
#                       Unit
#                   FROM Ingredients
#                   WHERE Meal = \'""" + mealID + """\';"""
#       ingrKeys = ('Ingredient', 'Meal', 'Qty', 'Unit')
#       query = runSelectQuery(sql, cur)
#       ingredients = self.jsonifyQuery(query, ingrKeys)

#       return ingredients

    def jsonifyMeals(self, query, mealKeys):
        json = []
        decimalKeys = ['extra_meal_price', 'meal_calories', 'meal_protein', 'meal_carbs', 'meal_fiber', 'meal_sugar', 'meal_fat']
        for row in query:
            rowDict = {}
            mealID = row[0]
            for element in enumerate(row):
                key = mealKeys[element[0]]
                value = element[1]
                # Convert all decimal values in row to floats
                if key in decimalKeys:
                    value = float(value)
                if key == 'menu_date':
                    value = value.strftime("%Y-%m-%d")
                rowDict[key] = value
#           rowDict['Ingredients'] = self.getIngredients(mealID, cur)
            json.append(rowDict)
        return json

#   def jsonifyMeals(self, query, mealKeys, cur):
#       json = []
#       decimalKeys = ['Protein', 'Carbs', 'Sugar', 'Fiber', 'Fat', 'Sat']
#       for row in query:
#           rowDict = {}
#           mealID = row[0]
#           for element in enumerate(row):
#               key = mealKeys[element[0]]
#               value = element[1]
#               # Convert all decimal values in row to floats
#               if key in decimalKeys:
#                   value = float(value)
#               rowDict[key] = value
#           rowDict['Ingredients'] = self.getIngredients(mealID, cur)
#           json.append(rowDict)
#       return json

#   def jsonifyQuery(self, query, rowDictKeys):
#       json = []
#       for row in query:
#           rowDict = {}
#           for element in enumerate(row):
#               key = rowDictKeys[element[0]]
#               value = element[1]
#               rowDict[key] = value
#           json.append(rowDict)
#       return json

    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = {}

            now = datetime.now()
            now = datetime(2020, 1, 1, 16, 0)

            print(now.weekday())

            # Set to 0 if Monday, otherwise set to 1
            if now.weekday() == 0:
                weeksOffset = 0
            else:
                weeksOffset = 1

            # Get this coming and next 2 Tuesdays
            this_tuesday = str( (now + timedelta(days=-now.weekday()+1, weeks=weeksOffset)) )
#           this_tuesday = this_monday.replace(hour=16, minute=0, second=0, microsecond=0)
            next_tuesday = str( (now + timedelta(days=-now.weekday()+1, weeks=weeksOffset+1)) )
#           next_tuesday = this_monday.replace(hour=16, minute=0, second=0, microsecond=0)
            next2_tuesday = str( (now + timedelta(days=-now.weekday()+1, weeks=weeksOffset+2)) )
#           next2_tuesday = this_monday.replace(hour=16, minute=0, second=0, microsecond=0)

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
                        meal_fat
                    FROM ptyd_menu
                    LEFT JOIN ptyd_meals ON ptyd_menu.menu_meal_id = ptyd_meals.meal_id""",
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
                        meal_fat
                    FROM ptyd_menu
                    LEFT JOIN ptyd_meals ON ptyd_menu.menu_meal_id = ptyd_meals.meal_id
                    WHERE menu_date > \'""" + this_tuesday + """\' and menu_date < \'""" + next_tuesday + """\'""",
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
                        meal_fat
                    FROM ptyd_menu
                    LEFT JOIN ptyd_meals ON ptyd_menu.menu_meal_id = ptyd_meals.meal_id
                    WHERE menu_date > \'""" + next_tuesday + """\' and menu_date < \'""" + next2_tuesday + """\'"""]

            query = runSelectQuery(queries[0], cur)

            mealsKeys = ('menu_date', 'menu_category', 'menu_meal_id', 'meal_desc', 'meal_category', 'meal_photo_url', 'extra_meal_price', 'meal_calories', 'meal_protein', 'meal_carbs', 'meal_fiber', 'meal_sugar', 'meal_fat')
            items['AllMeals'] = self.jsonifyMeals(query, mealsKeys)

            query = runSelectQuery(queries[1], cur)
            items['MenuThisWeek'] = self.jsonifyMeals(query, mealsKeys)

            query = runSelectQuery(queries[2], cur)
            items['MenuNextWeek'] = self.jsonifyMeals(query, mealsKeys)

#           items['Meals'] = self.jsonifyMeals(query, mealsKeys, cur)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

class Login(Resource):
    global RDS_PW
    def jsonifyLogin(self, query, rowDictKeys):
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
            rowDict['password_sha512'] = sha512(rowDict['user_name'].encode()).hexdigest()
            json.append(rowDict)
        return json

    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = []

#           queries = [
#               """ SELECT
#                       UserID,
#                       Pass
#                   FROM TestLogin;"""]

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
                    FROM ptyd_user_accounts;"""]

            loginKeys = ('user_uid', 'user_name', 'first_name', 'last_name', 'user_email', 'phone_number', 'user_address', 'address_unit', 'user_city', 'user_state', 'user_zip', 'user_region', 'user_gender', 'create_date', 'last_update', 'activeBool', 'last_delivery', 'referral_source', 'user_note')
            query = runSelectQuery(queries[0], cur)
            print(query)

            items = self.jsonifyLogin(query, loginKeys)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

api.add_resource(Plans, '/api/v1/plans')
api.add_resource(Meals, '/api/v1/meals')
api.add_resource(Login, '/api/v1/login')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port='2000')
