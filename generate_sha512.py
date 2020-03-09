from hashlib import sha512
import pymysql
import sys

#RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
#RDS_PORT = 3306
#RDS_USER = 'admin'
#RDS_DB = 'pricing'
#RDS_PW = ''

try:
#   conn = pymysql.connect( RDS_HOST,
#                           user=RDS_USER,
#                           port=RDS_PORT,
#                           passwd=RDS_PW,
#                           db=RDS_DB,
#                           cursorclass=pymysql.cursors.DictCursor)
#   cur = conn.cursor()

    username = "JPark"
    salt = '0'

    hashed = sha512((username + salt).encode()).hexdigest()
    print(hashed)
except:
    print("unsuccessful")
#finally:
#   conn.close()
