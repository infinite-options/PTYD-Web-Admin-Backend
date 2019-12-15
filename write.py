# Enter password for RDS as first command line argument
from oauth2client.service_account import ServiceAccountCredentials
import gspread
import pymysql
import sys
import json

# RDS PASSWORD
if len(sys.argv) == 2:
    RDS_PW = str(sys.argv[1])
else:
    print("Usage: Enter password for MySQL server as first command line argument")
    sys.exit(1)

def jsonifyInput():
    # Initialize json
    inputJson = {}
    keys = ('subscriptions', 'orders', 'meals')

    try:
        # creds: create a client to interact with the Google Drive API
#       scope = ['https://spreadsheets.google.com/feeds']
        scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
        creds = ServiceAccountCredentials.from_json_keyfile_name('client_secret.json', scope)
        client = gspread.authorize(creds)
        print("Created interactive client for Google Drive API")
    except:
        raise Exception("Bad credentials or scope for spreadsheet")

    try:
        # Find a workbook by name and open the sheets
        subscriptions = client.open("Database Example").get_worksheet(0)
        orders = client.open("Database Example").get_worksheet(1)
        meals = client.open("Database Example").get_worksheet(2)
#       for keyIndex, keyValue in enumerate(keys):
#           print(keyIndex)
#           records = client.open("Database Example").get_worksheet(keyIndex)
#           inputJson[keyValue] = records
#       print("Retrieved data")
#       return inputJson
    except:
        raise Exception("Cannot retrieve and/or format input data")

    try:
        # Extract and format all of the values
        inputJson['subscriptions'] = subscriptions.get_all_records()
        inputJson['orders'] = orders.get_all_records()
        inputJson['meals'] = meals.get_all_records()
        return inputJson
    except:
        raise Exception("Cannot format input data")

def connectToRDS(RDS_PW):
    # RDS
    RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
    RDS_PORT = 3306
    RDS_USER = 'admin'
    RDS_DB = 'pricing'

    # RDS connection
    print("Connecting to RDS...")
    try:
        conn = pymysql.connect( RDS_HOST,
                                user=RDS_USER,
                                port=RDS_PORT,
                                passwd=RDS_PW,
                                db=RDS_DB)
        print("Connected to RDS successfully.")
    except:
        raise Exception("Could not connect to RDS.")
#       sys.exit(1)

    # Initialize pymysql cursor
    print("Initializing cursor...")
    try:
        cur = conn.cursor()
        print("Initialized cursor.")
    except:
        raise Exception("Could not initialize cursor.")
#       sys.exit(1)

    return [conn, cur]

'''
def writeToSubscriptions(subscriptionsTable):


def writeToOrders(ordersTable):


def writeToMeals(mealsTable):


def getSubscriptionsColumns(headerRow):


def getOrdersColumns(headerRow):


def getMealsColumns(headerRow):


'''

def main():
    data = jsonifyInput()
    print(data)
    db = connectToRDS(RDS_PW)
    conn = db[0]
    cur = db[1]

if __name__ == '__main__':
    main()
