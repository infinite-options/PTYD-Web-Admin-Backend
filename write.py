# Enter password for RDS as first command line argument
from oauth2client.service_account import ServiceAccountCredentials
import gspread
import pymysql
import sys
import json

# Store first command line argument as database password
if len(sys.argv) == 2:
    RDS_PW = str(sys.argv[1])
else:
    print("Usage: Enter password for MySQL server as first command line argument")
    sys.exit(1)

# Retrieve data from Google Sheets and return it as a JSON object
def jsonifyInput():
    # Initialize JSON to return
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
        orders = orders.get_all_records()
        meals = meals.get_all_records()
        inputJson['subscriptions'] = subscriptions.get_all_records()
        inputJson['orders'] = consolidateMealColumns(orders)
        inputJson['meals'] = formatMeals(meals)
        return inputJson
    except:
        raise Exception("Cannot format input data")

# Consolidate columns of different meal plans for the same item
def consolidateMealColumns(orders):
    newDict = []
    for order in orders:
        rowToAppend = {}
#       print(order)
        for key, value in order.items():
            if '5: ' in key:
                newKey = formatKey(key, 3)
                newValue = replaceNullWithZero(value)
                rowToAppend[newKey] = newValue
            elif any(substring in key for substring in ['10: ', '15: ', '20: ']):
                newKey = formatKey(key, 4)
                newValue = replaceNullWithZero(value)
                rowToAppend[newKey] += newValue
            else:
                newKey = formatKey(key, 0)
                rowToAppend[newKey] = value
        newDict.append(rowToAppend)
#   print(newDict)
    return newDict

# Format meals dict
def formatMeals(meals):
    newDict = []
    for meal in meals:
        rowToAppend = {'Meals': meal['Meals'], 'Actual_Meal': meal['Actual Meal']}
        newDict.append(rowToAppend)
    return newDict

# Format key from JSON for SQL insert statement
def formatKey(key, index):
    newKey = replaceSpacesWithUnderscores(key[index:])
    newKey = removeLeadingUnderscore(newKey)
    return newKey

# Replace spaces with underscores in an item
def replaceSpacesWithUnderscores(item):
    try:
        newItem = item.replace(' ','_')
        return newItem
    except:
        print("Spaces of item could not be replaced with dashes")
        return item

# Remove leading underscore if item has it
def removeLeadingUnderscore(item):
    if item[0] == '_':
        return item[1:]
    return item

# Replace value with 0 if it is a null string
def replaceNullWithZero(value):
    if value is '':
        return 0
    return value

# Returns a Connection object from pymysql to the database
def connectToRDS(RDS_PW):
    # RDS information
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
#   db = connectToRDS(RDS_PW)
#   conn = db[0]
#   cur = db[1]

if __name__ == '__main__':
    main()
