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

# --------------------------------------------------- Api template-----------------------------------------------------------


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


class Admin_db(Resource):
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


    def jsonify_admin(self,query, col_names):
        result =[]
        decimalKeys=["Quantity of Ingredient Required","A package of this much","Amount of ingredient needed this week","quantity of ingredients needed to buy (Negative Surplus)"]
        for row in query:
            row_dict ={}
            for ind, val in enumerate(row):
                key = col_names[ind]
                if "Date" in key:
                    # print(val)
                    val = val.strftime("%b %d, %Y")
                if key in decimalKeys:
                    if val is None:
                        val = 0
                    else:
                        val =float(val)
                row_dict[key] = val
            result.append(row_dict)
        return result


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
            
            queries = [
                        """SELECT 
                            M.menu_date "Entered Menu Date" ,
                            M.menu_category AS "Menu Category",
                            A.meal_desc "Meal option" ,
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

            query1_col = ["Date","Category","Meal Option","Amount"]
            query2_col = ["Menu Number","Entered Menu Date","Menu Category","Meal option selected","How many to make","Ingredient Required Per meal",
            "Quantity of Ingredient Required","Amount of ingredient needed this week","Amount of ingredient on hand","location of ingredient",
            "A package of this much","Will cost this much in $USD","quantity of ingredients needed to buy (Negative Surplus)"]
            col_names = [query1_col,query2_col]
            queries_key = ["Meals by week", "Inventory DB"]
            items={}
            # Initialize response
            response = {}

            # runSelectQuery() is a function
            # written above that will run a
            # SELECT query and return a tuple of
            # Python tuples. This will be
            # stored into query.
            for ind,query in enumerate(queries):
                query1 = runSelectQuery(query, cur)
                # print(query1[1])
                items[queries_key[ind]] = self.jsonify_admin(query1, col_names[ind])
            # Successful message
            response['message'] = 'Request successful.'

            # We can manipulate the query object
            # from earlier as needed to format
            # our API data to our liking.
            response['result'] = items
            
            # Return the response object and the
            # HTTP code 200 to indicate the
            # GET request was successful.
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)


class MealCustomerLifeReport(Resource):
    global RDS_PW

    def jsonify_adminMEALlife(self,query, col_names,decimal_cols,date_cols):
        result =[]
        for row in query:
            row_dict ={}
            for ind, val in enumerate(row):
                key = col_names[ind]
                if val is None:
                    val=0
                elif key in date_cols:
                    val = val.strftime("%b %d, %Y")
                elif key in decimal_cols:
                    val =float(val)
                row_dict[key] = val
            result.append(row_dict)
        return result

    def get(self):
        try:
            db = getRdsConn(RDS_PW)
            conn = db[0]
            cur = db[1]

            queries = ["""SELECT 
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
                        
            # query1 = runSelectQuery(queries[1], cur)
            query1_col = ["Meal_id","Meal name","Average/listing","Total number sold"]
            query2_col = ["Customer Name","Account Creation Date","Last account Update","Last Delivery","Customer Lifetime in days",
            "Customer Lifetime in months"]
            col_names = [query1_col,query2_col]
            decimal_cols =["Average/listing","Total number sold"]
            date_cols = ["Account Creation Date","Last account Update","Last Delivery"]
            queries_key = ["Meals report", "Customer Lifetime"]
            items={}
            response = {}

            for ind,query in enumerate(queries):
                query1 = runSelectQuery(query, cur)
                items[queries_key[ind]] = self.jsonify_adminMEALlife(query1, col_names[ind],decimal_cols,date_cols)
            
            # Successful message
            response['message'] = 'Request successful.'

            # We can manipulate the query object
            # from earlier as needed to format
            # our API data to our liking.
            response['result'] = items
            
            # Return the response object and the
            # HTTP code 200 to indicate the
            # GET request was successful.
            return response, 200
        except:
            raise BadRequest('Request failed, please try again later.')
        finally:
            closeRdsConn(cur, conn)

        # print(query1[0])
        
# obj1 = MealCustomerLifeReport()
# print(obj1.get())

api.add_resource(Admin_db, '/api/v1/admindb')
api.add_resource(MealCustomerLifeReport, '/api/v1/MealCustomerLifeReport')

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=4000)