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
#   keys = ('Subscriptions', 'Orders', 'Meals')

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
        inputJson['Subscriptions'] = subscriptions.get_all_records()
        inputJson['Orders'] = consolidateMealColumns(orders)
        inputJson['Meals'] = formatMeals(meals)
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

# Return a list of SQL commands to run from a JSON dict
def dictToSql(jsonDicts, tableName, tableInfo):
    query = []
    try:
        print("Generating SQL commands for", tableName + "...")
#       print("Data types of table", tableName + ":", tableInfo)
        for jsonDict in jsonDicts:
#           print(jsonDict)
            ins = "INSERT INTO " + tableName + " ("
            val = "VALUES ("
#           print(ins)
#           print(val)
            for key, value in jsonDict.items():
#               print(key)
                if '/' in key:
#                   print("REFORMATTING KEY")
                    key = reformatDColumn(key)
#                   print("REFORMATED D COLUMN KEY: ", key)
                valueType = tableInfo[key]
                if value == '':
                    value = 'NULL'
                    valueType = 'null_value'
#               print(value, ", DATA_TYPE: ", valueType)
                ins = appendSqlItem(ins, key, "column_name")
                val = appendSqlItem(val, value, valueType)
#               print(ins)
#               print(val)
            ins = completeSqlCmd(ins, ") ")
            val = completeSqlCmd(val, ");")
#           print(ins)
#           print(val)
            query.append(ins + val)
            print("Generated query:", ins + val)
        return query
    except:
        print("Could not generate SQL commands.")
        raise Exception("Could not generate SQL commands.")

# Reformat columns with name XX/XX/XXXX
def reformatDColumn(key):
    return "D" + key.replace('/','')

# Append an item to an SQL command
def appendSqlItem(cmd, item, data_type):
    if any(nonStringType in data_type for nonStringType in ['int', 'column_name', 'null_value']):
        item = str(item)
    else:
        item = "\'" + str(item) + "\'"
    newCmd = cmd + item
    return newCmd + ", "

# Close an SQL command
def completeSqlCmd(cmd, endChar):
    newCmd = cmd[:-2] + endChar
    return newCmd

# Returns query that selects data types of every column of a table
def describeTable(table):
    return "SELECT column_name, data_type FROM information_schema.columns WHERE table_name = \'" + table + "\';"

# Convert list of tuples (from cur.fetchall) to a dictionary
def mapTupleList(tuples):
    newMap = {}
    for aTuple in tuples:
        key = aTuple[0]
        value = aTuple[1]
        newMap[key] = value
    return newMap

# Code executes here
def main():
    data = jsonifyInput()
#   print("Full JSON dictionary: ", data)
    try:
        db = connectToRDS(RDS_PW)
        conn = db[0]
        cur = db[1]
        queries = []
        for table, tableValues in data.items():
            tableInfoQuery = describeTable(table)
#           print("Table info query: ", tableInfoQuery)
            cur.execute(tableInfoQuery)
            tableInfo = cur.fetchall()
            tableInfo = mapTupleList(tableInfo)
#           print("Table Infomation: ", tableInfo)
            queries.extend(dictToSql(tableValues, table, tableInfo))
        print("Successfully wrote all queries.")
#       print("List of all queries:", queries)
#       print("Beginning queries.")
        for query in queries:
            print("Attempting query: ", query)
            cur.execute(query)
            print("Executed query: ", query)
        conn.commit()
        print("Successfully committed queries to database.")
    except:
        print("Could not commit to database.")
    finally:
        cur.close()
        conn.close()
        print("Connection to database closed.")

if __name__ == '__main__':
    main()
