from flask import Flask, request, render_template
from flask_restful import Resource, Api
from flask_cors import CORS

from werkzeug.exceptions import BadRequest, NotFound

from decimal import Decimal
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

def runSelectQuery(query, cur):
    try:
        cur.execute(query)
        queriedData = cur.fetchall()
        return queriedData
    except:
        raise Exception("Could not run select query and/or return data")

def jsonifyQuery(query, rowDictKeys):
    json = []
    for row in query:
        rowDict = {}
        for element in enumerate(row):
            key = rowDictKeys[element[0]]
            value = element[1]
            # Convert all decimal values in row to floats
            if 'Price' in key:
                value = float(value)
#               value = format(float(value), '.2f')
            rowDict[key] = value
        json.append(rowDict)
    return json

class Plans(Resource):
    global RDS_PW
    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = {}

            queries = [
                """ SELECT
                    MealsPerWeek,
                    WeekToWeek,
                    WeekToWeekPrice,
                    TwoWeekPrePay,
                    TwoWeekPrice,
                    FourWeekPrePay,
                    FourWeekPrice
                FROM PaymentPlans;""",
                """ SELECT
                    m.MealsPerWeek,
                    m.PlanSummary,
                    m.PlanFooter,
                    CAST(p.FourWeekPrice/CAST(p.MealsPerWeek AS DECIMAL(7,2)) AS DECIMAL(7,2)) AS PricePerMeal,
                    p.FourWeekPrice as LowestPrice,
                    m.Img,
                    m.RouteOnclick
                FROM MealPlans as m
                INNER JOIN PaymentPlans as p
                WHERE m.MealsPerWeek = p.MealsPerWeek;"""]

            paymentPlanKeys = ('MealsPerWeek', 'WeekToWeek', 'WeekToWeekPrice', 'TwoWeekPrePay', 'TwoWeekPrice', 'FourWeekPrePay', 'FourWeekPrice')
            mealPlanKeys = ('MealsPerWeek', 'PlanSummary', 'PlanFooter', 'PricePerMeal', 'LowestPrice', 'Img', 'RouteOnclick')

            query = runSelectQuery(queries[0], cur)
            items['PaymentPlans'] = jsonifyQuery(query, paymentPlanKeys)

            query = runSelectQuery(queries[1], cur)
            items['MealPlans'] = jsonifyQuery(query, mealPlanKeys)

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            cur.close()
            conn.close()

class Meals(Resource):
    global RDS_PW
    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = {}

            queries = [
                """ SELECT
                    Meal_ID,
                    Meals,
                    Actual_Meal,
                    Calories,
                    Protein,
                    Carbs,
                    Sugar,
                    Fiber,
                    Fat,
                    Sat,
                    Ingredient,
                    Qty,
                    Unit
                    FROM
                    Meals
                    LEFT JOIN Ingredients
                    ON Meal_ID = Meal;
                    """]

            response['message'] = 'Request successful.'
            response['result'] = items

            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            cur.close()
            conn.close()

api.add_resource(Plans, '/api/v1/plans')
api.add_resource(Meals, '/api/v1/meals')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port='2000')
