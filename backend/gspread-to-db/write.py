# Enter password for RDS as first command line argument
from oauth2client.service_account import ServiceAccountCredentials
import gspread
import pymysql
import sys
import json
from datetime import datetime, timedelta

# Store first command line argument as database password
if len(sys.argv) >= 2:
    RDS_PW = str(sys.argv[1])
else:
    print("Usage: Enter password for MySQL server as first command line argument")
    sys.exit(1)

RDS_DB = 'pricing'
SKIP_KEY = None
WRITE_SETTINGS = 'gspread.json'

# Flag that prints more info to console log when set to True
SUPER_VERBOSE_MODE = False
DELETE_TABLE_MODE = False 

# Set super verbose flag to true if user enters the --super-verbose argument
if any(arg in ['-d', '--delete-table'] for arg in sys.argv):
    DELETE_TABLE_MODE = True

# Set super verbose flag to true if user enters the --super-verbose argument
if any(arg in ['-s', '--super-verbose'] for arg in sys.argv):
    SUPER_VERBOSE_MODE = True

# Retrieve data from Google Sheets and return it as a JSON object
def jsonifyInput():
    global WRITE_SETTINGS
    # Initialize JSON to return
    inputJson = {}
    with open(WRITE_SETTINGS, 'r') as f:
        settings = json.load(f)
        sheets_name = settings['sheet_name']
        keys = tuple(settings['keys'])
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
            if SUPER_VERBOSE_MODE is True: print("Reformating table:", key[1])
            sheet = client.open(sheets_name).get_worksheet(key[0])
            records = sheet.get_all_records()
            records = reformatRecords(records)
            inputJson[key[1]] = records
        print("Retrieved data from Google Sheets:", inputJson)
        return inputJson
    except:
        print("Could not retrieve input data from Google Sheets.")
        raise Exception("Cannot retrieve and/or format input data")

# Consolidate columns of different meal plans for the same item
def reformatRecords(records):
    newDict = []
    for record in records:
        rowToAppend = {}
        for key, value in record.items():
            if key.startswith('5: '):
                newKey = formatKey(key, 3)
                newValue = getMealQty(value)
                rowToAppend[newKey] = newValue
                if SUPER_VERBOSE_MODE is True: print("KEY:", key)
                if SUPER_VERBOSE_MODE is True: print("VALUE:", "\'", value, "\'")
                if SUPER_VERBOSE_MODE is True: print("NEWKEY:", newKey)
                if SUPER_VERBOSE_MODE is True: print("NEWVALUE (new):", "\'", newValue, "\'")
            elif any(substring in key for substring in ['10: ', '15: ', '20: ']):
                newKey = formatKey(key, 4)
                newValue = getMealQty(value)
                if SUPER_VERBOSE_MODE is True: print("KEY:", key)
                if SUPER_VERBOSE_MODE is True: print("VALUE:", "\'", value, "\'")
                if SUPER_VERBOSE_MODE is True: print("NEWKEY:", newKey)
                if SUPER_VERBOSE_MODE is True: print("OLDVALUE:", "\'", rowToAppend[newKey], "\'")
                rowToAppend[newKey] += newValue
                if SUPER_VERBOSE_MODE is True: print("VALUETOADD:", "\'", newValue, "\'")
                if SUPER_VERBOSE_MODE is True: print("NEWVALUE:", "\'", rowToAppend[newKey], "\'")
            else:
                newKey = formatKey(key, 0)
                rowToAppend[newKey] = value
            if SUPER_VERBOSE_MODE is True: print("Row currently:", rowToAppend)
        newDict.append(rowToAppend)
        if SUPER_VERBOSE_MODE is True: print("Final row:", rowToAppend)
    return newDict

def getMealQty(value):
    if value is '':
        return 0
    if isinstance(value, str):
        if 'charge_type = no_charge|quantity' in value:
            return int(value[35:])
    return value

# Format key from JSON for SQL insert statement
def formatKey(key, index):
    newKey = replaceSpacesWithUnderscores(key[index:])
    if len(newKey) > 0:
        newKey = removeLeadingUnderscore(newKey)
    return newKey

# Replace spaces with underscores in an item
def replaceSpacesWithUnderscores(item):
    try:
        newItem = item.replace(' ','_')
        return newItem
    except:
        print("Spaces of item could not be replaced with underscoress")
        return item

# Replace slashes with dashes in an item
def replaceSlashesWithDashes(item):
    try:
        newItem = item.replace('/','-')
        return newItem
    except:
        print("Slashes of item could not be replaced with dashes")
        return item

# Remove leading underscore if item has it
def removeLeadingUnderscore(item):
    if item[0] == '_':
        return item[1:]
    return item

# Add an escape character in front of each single quote
def escapeSingleQuotes(value):
    try:
        return value.replace('\'','\\\'')
    except:
        if SUPER_VERBOSE_MODE is True: print("Can't add escape character for value:", value)
        return value

# Get 2-digit month/day values, 4-digit year and append "SKIP" before it
def reformatSkipColumn(key, now):
    if SUPER_VERBOSE_MODE is True: print("Attempting reformatSkipColumns()")
    try:
        # Store json key as datetime object
        datetimeObj = datetime.strptime(key, "%m/%d/%Y")
        newKey = 'SKIP'
        newKey += '{:02d}'.format(datetimeObj.month)
        newKey += '{:02d}'.format(datetimeObj.day)
        newKey += '{:04d}'.format(datetimeObj.year)
        # Check if key datetime is within 7 days of today, set thisWeek to True if it is
        if now <= datetimeObj <= now + timedelta(days=7):
            global SKIP_KEY
            SKIP_KEY = newKey
            if SUPER_VERBOSE_MODE is True: print("The key", newKey, " will also be the key for SKIP_THIS_WEEK")
        if SUPER_VERBOSE_MODE is True: print("reformatSkipColumns(): Returning", newKey)
        return newKey
    except:
        print("reformatSkipColumns(): Bad key?", key)
        raise Exception("Cannot reformat json key to table column name")

# Returns a Connection object from pymysql to the database
def connectToRDS(RDS_PW):
    # RDS information
    RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
    RDS_PORT = 3306
    RDS_USER = 'admin'
    global RDS_DB
#   RDS_DB = 'pricing'

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
    if SUPER_VERBOSE_MODE is True: print("Starting dictToSql()")
    now = datetime.now()
    query = []
    skipquery = []
    if DELETE_TABLE_MODE is True: query.append("DELETE FROM " + tableName + ";")
    try:
        print("Generating SQL commands for", tableName + "...")
        if SUPER_VERBOSE_MODE is True: print("JSON:", jsonDicts)
        for jsonDict in jsonDicts:
            ins = "INSERT IGNORE INTO " + tableName + " ("
            val = "VALUES ("
            if SUPER_VERBOSE_MODE is True: print("Current ins:", ins)
            if SUPER_VERBOSE_MODE is True: print("Current val:", val)
            for key, value in jsonDict.items():
                if SUPER_VERBOSE_MODE is True: print("Key:", key)
                if SUPER_VERBOSE_MODE is True: print("Value:", value)
                if '/' in key:
#                   key = reformatSkipColumn(key, now)
#                   if SUPER_VERBOSE_MODE is True: print("SKIP Key reformatted:", key)
#                   if key not in tableInfo:
#                       addColumnQuery = "ALTER TABLE " + tableName + " ADD COLUMN " + key + " VARCHAR(64);"
#                       tableInfo[key] = 'varchar'
#                       if SUPER_VERBOSE_MODE is True: print("Appending query:", addColumnQuery)
#                       query.append(addColumnQuery)
                    if 'SKIP' in value:
                        insToSkips = "INSERT IGNORE INTO Skips (Date_Submitted, Phone_Number, Skip_Sunday_Date) VALUES ("
                        insToSkips = appendSqlItem(insToSkips, jsonDict['Date_Submitted'], "datetime")
                        insToSkips = appendSqlItem(insToSkips, reformatPhoneNum(jsonDict['Phone_Number']), "varchar")
                        insToSkips = appendSqlItem(insToSkips, key, "date")
                        insToSkips = completeSqlCmd(insToSkips, ");")
                        skipquery.append(insToSkips)
                    continue

                if SUPER_VERBOSE_MODE is True: print("Finished slash in key check")
                if 'phone' in key.lower():
                    value = reformatPhoneNum(value)
                if SUPER_VERBOSE_MODE is True: print("Finished phone in key check")
                # tableInfo won't intially have value type info on newly created columns
                if SUPER_VERBOSE_MODE is True: print("tableInfo:", tableInfo)
                valueType = tableInfo[key]
                if SUPER_VERBOSE_MODE is True: print("valueType:", valueType)
                if value == '':
                    value = 'NULL'
                    valueType = 'null_value'
                value = escapeSingleQuotes(value)
                ins = appendSqlItem(ins, key, "column_name")
                val = appendSqlItem(val, value, valueType)
                if SUPER_VERBOSE_MODE is True: print("Current ins:", ins)
                if SUPER_VERBOSE_MODE is True: print("Current val:", val)
            ins = completeSqlCmd(ins, ") ")
            val = completeSqlCmd(val, ");")
            query.append(ins + val)
            print("Generated query:", ins + val)
        print("Finished queries for table", tableName + ".")
        query.extend(skipquery)
        return query
    except:
        print("Could not generate SQL commands.")
        raise Exception("Could not generate SQL commands.")

# Currently only handles country area code 1
def reformatPhoneNum(num):
    if SUPER_VERBOSE_MODE is True: print("Reformatting phone number:", num)
    areaCode = '1'
    formatNum = str(num)
    if len(formatNum) is 0:
        if SUPER_VERBOSE_MODE is True: print("No phone number. Returning 0000000000")
        return "5550000000"
    # The two spaces are somehow different characters?
    symbolsToRemove = ['(',')',' ','-','+','.',' ']
    for symbol in symbolsToRemove:
        formatNum = formatNum.replace(symbol,'')
        if SUPER_VERBOSE_MODE is True: print("Current value after removing symbol " + symbol + ":", formatNum)
    if len(formatNum) is 11 and formatNum[0] == areaCode:
        formatNum = formatNum[1:]
        if SUPER_VERBOSE_MODE is True: print("Current value:", formatNum)
#   if len(formatNum) > 10:
#       print("Cannot format phone number", num, "to 10-digit number.")
#       if SUPER_VERBOSE_MODE is True: print("Phone number length:", len(formatNum))
#       if SUPER_VERBOSE_MODE is True: print("Phone number formatted:", formatNum)
#       raise Exception("Cannot remove non-digit symbols in phone number")
    if SUPER_VERBOSE_MODE is True: print("Final value:", formatNum)
    return formatNum


# Reformate date values from input data
def formatInputDate(inputDate, formatType):
    formats = ["%b %d, %Y %H:%M:%S", "%Y-%m-%d %H:%M:%S", "%m/%d/%Y", "%Y-%m-%d", "%Y-%m-%d %H:%M:%S-0600", "%Y-%m-%d %H:%M:%S-0500"]
    for fmt in formats:
        try:
            datetimeObj = datetime.strptime(inputDate, fmt)
            if formatType == 'datetime':
                objToStr = datetimeObj.strftime("%Y-%m-%d %H:%M:%S")
            if formatType == 'date':
                objToStr = datetimeObj.strftime("%Y-%m-%d")
            return objToStr
        except:
            pass
    print("Cannot format to SQL datetime value:", inputDate)
    raise Exception("formatInputDate(): Cannot format datetime value")

# Append an item to an SQL command
def appendSqlItem(cmd, item, data_type):
    if any(nonStringType in data_type for nonStringType in ['int', 'column_name', 'null_value']):
        item = str(item)
    else:
        # Use the below two lines if Date_Submitted value format is Dec 9, 2019, 17:00:00
        if data_type == 'datetime' or data_type == 'date':
            item = formatInputDate(str(item), data_type)
        item = "\'" + str(item) + "\'"
    newCmd = cmd + item
    if SUPER_VERBOSE_MODE is True: print("appendSqlItem():", newCmd)
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
            if SUPER_VERBOSE_MODE is True: print("tableInfo:", tableInfo)
            queries.extend(dictToSql(tableValues, table, tableInfo))
#       global SKIP_KEY

#       # Remove later - temporarily setting SKIP_KEY as SKIP01192020 for now
#       SKIP_KEY = "SKIP01192020"

#       if SUPER_VERBOSE_MODE is True: print("SKIP_KEY:", SKIP_KEY)
#       if SKIP_KEY:
#           if SUPER_VERBOSE_MODE is True: print("Adding UPDATE query...")
#           queries.append("UPDATE Orders SET SKIP_THIS_WEEK = " + SKIP_KEY + ";")
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
