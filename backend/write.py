# Enter password for RDS as first command line argument
from oauth2client.service_account import ServiceAccountCredentials
import gspread
import pymysql
import sys
import json
import datetime

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
    keys = ('Subscriptions', 'Orders', 'Meals')
    sheets_name = "Prep To Your Door Data Schema"
    try:
        # Create a client to interact with the Google Drive API
        scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
        creds = ServiceAccountCredentials.from_json_keyfile_name('client_secret.json', scope)
        client = gspread.authorize(creds)
        print("Created interactive client for Google Drive API.")
    except:
        print("Bad credentials or scope for Google Drive API.")
        raise Exception("Bad credentials or scope for spreadsheet")

    try:
        # Find a workbook by name and open the sheets
        for key in enumerate(keys):
            sheet = client.open(sheets_name).get_worksheet(key[0])
            records = sheet.get_all_records()
            if key[1] == "Orders":
                records = consolidateMealColumns(records)
            inputJson[key[1]] = records
        print("Retrieved data from Google Sheets:", inputJson)
        return inputJson
    except:
        print("Could not retrieve input data from Google Sheets.")
        raise Exception("Cannot retrieve and/or format input data")

# Consolidate columns of different meal plans for the same item
def consolidateMealColumns(orders):
    newDict = []
    for order in orders:
        rowToAppend = {}
        for key, value in order.items():
            if key.startswith('5: '):
#               newKey = formatKey(key, 3)
                newKey = key[3:]
                newValue = getMealQty(value)
                rowToAppend[newKey] = newValue
#               print("KEY:", key)
#               print("VALUE:", "\'", value, "\'")
#               print("NEWKEY:", newKey)
#               print("NEWVALUE (new):", "\'", newValue, "\'")
            elif any(substring in key for substring in ['10: ', '15: ', '20: ']):
#               newKey = formatKey(key, 4)
                newKey = key[4:]
                newValue = getMealQty(value)
#               print("KEY:", key)
#               print("VALUE:", "\'", value, "\'")
#               print("NEWKEY:", newKey)
#               print("OLDVALUE:", "\'", rowToAppend[newKey], "\'")
                rowToAppend[newKey] += newValue
#               print("VALUETOADD:", "\'", newValue, "\'")
#               print("NEWVALUE:", "\'", rowToAppend[newKey], "\'")
            else:
#               newKey = formatKey(key, 0)
                newKey = key
                rowToAppend[newKey] = value
#           print("Row currently:", rowToAppend)
        newDict.append(rowToAppend)
#       print("Final row:", rowToAppend)
    return newDict

def getMealQty(value):
    if value is '':
        return 0
    if isinstance(value, str):
        if 'charge_type = no_charge|quantity' in value:
            return int(value[35:])
    return value

'''
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

# Reformat columns with name XX/XX/XXXX
def reformatDColumn(key):
    return "D" + key.replace('/','')

'''

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
    # Initialize pymysql cursor
    print("Initializing cursor...")
    try:
        cur = conn.cursor()
        print("Initialized cursor.")
    except:
        raise Exception("Could not initialize cursor.")
    return [conn, cur]

# Return a list of SQL commands to run from a JSON dict
def dictToSql(jsonDicts, tableName, tableInfo):
    query = []
    query.append("DELETE FROM " + tableName + ";")
    try:
        print("Generating SQL commands for", tableName + "...")
#       print("JSON:", jsonDicts)
        for jsonDict in jsonDicts:
            ins = "INSERT INTO " + tableName + " ("
            val = "VALUES ("
#           print("Current ins:", ins)
#           print("Current val:", val)
            for key, value in jsonDict.items():
#               print("Key:", key)
#               print("Value:", value)
                if '/' in key:
                    continue
#                   key = reformatDColumn(key)
#               print("Finished slash in key check")
                if 'phone' in key.lower():
                    value = reformatPhoneNum(value)
#               print("Finished phone in key check")
#               print(tableInfo)
                valueType = tableInfo[key]
#               print("valueType:", valueType)
                if value == '':
                    value = 'NULL'
                    valueType = 'null_value'
                ins = appendSqlItem(ins, key, "column_name")
                val = appendSqlItem(val, value, valueType)
#               print("Current ins:", ins)
#               print("Current val:", val)
            ins = completeSqlCmd(ins, ") ")
            val = completeSqlCmd(val, ");")
            query.append(ins + val)
            print("Generated query:", ins + val)
        return query
    except:
        print("Could not generate SQL commands.")
        raise Exception("Could not generate SQL commands.")

# Currently only handles country area code 1
def reformatPhoneNum(num):
#   print("Reformatting phone number:", num)
    areaCode = '1'
    formatNum = str(num)
    symbolsToRemove = ['(',')',' ','-','+','.']
    for symbol in symbolsToRemove:
        if symbol in formatNum:
            formatNum = formatNum.replace(symbol,'')
#           print("Current value:", formatNum)
    if len(formatNum) is 11 and formatNum[0] == areaCode:
        formatNum = formatNum[1:]
#       print("Current value:", formatNum)
    if len(formatNum) is not 10:
        print("Cannot format phone number", num, "to 10-digit number.")
        raise Exception("Cannot remove non-digit symbols in phone number")
#   print("Final value:", formatNum)
    return formatNum


# Reformate date values from input data
def formatInputDate(inputDate):
    datetimeObj = datetime.datetime.strptime(inputDate, "%b %d, %Y %H:%M:%S")
    objToStr = datetimeObj.strftime("%Y-%m-%d %H:%M:%S")
    return objToStr

# Append an item to an SQL command
def appendSqlItem(cmd, item, data_type):
    if any(nonStringType in data_type for nonStringType in ['int', 'column_name', 'null_value']):
        item = str(item)
        if data_type == 'column_name':
            item = "`" + str(item) + "`"
    else:
        # Use the below two lines if Date_Submitted value format is Dec 9, 2019, 17:00:00
        if data_type == 'datetime':
            item = formatInputDate(str(item))
        item = "\'" + str(item) + "\'"
    newCmd = cmd + item
#   print("appendSqlItem():", newCmd)
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
    try:
        db = connectToRDS(RDS_PW)
        conn = db[0]
        cur = db[1]
        queries = []
        for table, tableValues in data.items():
            tableInfoQuery = describeTable(table)
            cur.execute(tableInfoQuery)
            tableInfo = cur.fetchall()
            tableInfo = mapTupleList(tableInfo)
            queries.extend(dictToSql(tableValues, table, tableInfo))
        print("Successfully wrote all queries.")
        for query in queries:
            print("Attempting query:", query)
            cur.execute(query)
            print("Executed query:", query)
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
