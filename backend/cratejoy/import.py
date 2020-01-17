import pymysql
import json

JSON_FILE = 'data.json'

# Connect to RDS
def getMysqlConn(MYSQLPW):
    try:
        # MySQL database information
        MYSQLHOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
        MYSQLPORT = 3306
        MYSQLUSER = 'admin'
        MYSQLDB = 'pricing'

        # MySQL connection
        print("Connecting to MySQL server...")
        conn = pymysql.connect( MYSQLHOST,
                                user=MYSQLUSER,
                                port=MYSQLPORT,
                                passwd=MYSQLPW,
                                db=MYSQLDB)
        print("Connected to MySQL server successfully.")

        # MySQL cursor for executing queries
        cur = conn.cursor()
        print("Cursor initiated.")
        return [conn, cur]
    except:
        raise Exception("Could not connect to MySQL server")

# Fetch json from file and convert to a dict
def jsonifyFile(JSON_FILE):
    with open(JSON_FILE, 'r') as f:
        data = json.load(f)
    return data


