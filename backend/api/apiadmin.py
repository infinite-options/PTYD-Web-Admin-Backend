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


# --------------------------------------------- Connecting to database------------------------------------------------------------
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
# print(RDS_PW)
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
                        menu_num_sold
                        FROM 
                        ptyd_menu
                        JOIN ptyd_meals ON menu_meal_id=meal_id;""", 'get', conn)
                           
                            

            response['message'] = 'successful'
            response['result'] = items

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
    

# obj1 = MealCustomerLifeReport()
# print(obj1.get())


api.add_resource(AdminMenu, '/api/v2/menu_display')
api.add_resource(AdminMenu, '/api/v2/menu_display')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=4000)