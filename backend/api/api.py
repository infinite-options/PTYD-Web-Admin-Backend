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

RDS_PW = "prashant"
'''
# RDS PASSWORD
if len(sys.argv) == 2:
    RDS_PW = str(sys.argv[1])
else:
    RDS_PW = ""
'''

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

def runQuery(query, cur):
    cur.execute(query)
    queriedData = cur.fetchall()
    return queriedData

class Plans(Resource):
    global RDS_PW
    def get(self):
        response = {}
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]
            items = {'MealPlans': [], 'PaymentPlans': []}

            queries = [ """ SELECT MealsPerWeek, WeekToWeek, WeekToWeekPrice, TwoWeekPrePay, TwoWeekPrice, FourWeekPrePay, FourWeekPrice
                            FROM PaymentPlans;""",
                        """ SELECT m.MealsPerWeek, m.PlanSummary, m.PlanFooter, p.FourWeekPrice
                            FROM MealPlans as m
                            INNER JOIN PaymentPlans as p
                            WHERE m.MealsPerWeek = p.MealsPerWeek;"""]

            query = runQuery(queries[0], cur)
            print("PaymentPlans query ran successfully.")
            for row in query:
                rowDict = {}
                rowDictKeys = ('MealsPerWeek', 'WeekToWeek', 'WeekToWeekPrice', 'TwoWeekPrePay', 'TwoWeekPrice', 'FourWeekPrePay', 'FourWeekPrice')

                for element in enumerate(row):
                    key = rowDictKeys[element[0]]
                    value = element[1]
                    # Convert all decimal values in row to floats
                    if 'Price' in key:
                        value = float(value)
                    rowDict[key] = value
                items['PaymentPlans'].append(rowDict)

            query = runQuery(queries[1], cur)
            print("MealPlans query ran successfully.")
            for row in query:
                rowDict = {}
                rowDictKeys = ('MealsPerWeek', 'PlanSummary', 'PlanFooter', 'LowestPrice')

                for element in enumerate(row):
                    key = rowDictKeys[element[0]]
                    value = element[1]
                    # Convert all decimal values in row to floats
                    if 'Price' in key:
                        value = float(value)
                    rowDict[key] = value

                url = '/' + str(rowDict['MealsPerWeek']) + '-meals-subscriptions'
                rowDict['RouteTo'] = url

                items['MealPlans'].append(rowDict)

            response['message'] = 'Request successful.'
            response['result'] = items

            cur.close()
            conn.close()
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')

api.add_resource(Plans, '/api/v1/plans')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port='2000')
