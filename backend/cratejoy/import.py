from requests.auth import HTTPBasicAuth
import sys
import pymysql
import requests
import json

API_URL = 'http://api.cratejoy.com/v1/'
API_URL_SHIPMENTS = API_URL + 'shipments/'
SECRET_KEYS = 'cratejoy_keys.json'

try:
    with open(SECRET_KEYS, 'r') as keysFile:
        keys = json.load(keysFile)

    MYSQLPW = keys['MYSQL_PW']
    CLIENT_ID = keys['CRATEJOY_API_ID']
    CLIENT_SKEY = keys['CRATEJOY_API_SECRET_KEY']
    print("Retrieved secret keys from", SECRET_KEYS)
except:
    print("Could not retrieve secret keys. Check your " + SECRET_KEYS + "file.")
    raise Exception("Bad secret keys")

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

GET_URL = API_URL_SHIPMENTS
shipments = []

try:
    while GET_URL:
        print("Getting data from:", GET_URL)
        response = requests.get(GET_URL, auth=(CLIENT_ID, CLIENT_SKEY))
        response.raise_for_status()
        objs = response.json()
        if objs['next']:
            GET_URL = API_URL_SHIPMENTS + objs['next']
        else:
            GET_URL = None
        for obj in objs['results']:
            shipments.append(obj)
    print("Finished retrieving API data.")
except:
    print("Error occured while retrieving API data.")
    print("URL of API:", GET_URL)
    raise Exception("Could not retrieve API data")
finally:
    print("===========================")
    print("API data:")
    print(shipments)
