import pymysql
from hashlib import sha512

RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
RDS_PORT = 3306
RDS_USER = 'admin'
RDS_DB = 'pricing'
RDS_PW = 'prashant'

conn = pymysql.connect(RDS_HOST,
    user=RDS_USER,
    port=RDS_PORT,
    passwd=RDS_PW,
    db=RDS_DB)

cur = conn.cursor()

cur.execute("SELECT user_name FROM ptyd_accounts;")
q = cur.fetchall()

for i in q:
    s = sha512(i[0].encode()).hexdigest()
    cur.execute("UPDATE ptyd_accounts SET sha512 = \'" + s + "\' WHERE user_name = \'" + i[0] + "\';")

conn.commit()

cur.close()
conn.close()
