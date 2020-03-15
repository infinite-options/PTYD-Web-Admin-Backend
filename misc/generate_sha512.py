from hashlib import sha512
import pymysql
import sys

RDS_HOST = 'pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com'
RDS_PORT = 3306
RDS_USER = 'admin'
RDS_DB = 'pricing'
RDS_PW = ':)'

try:
    conn = pymysql.connect( RDS_HOST,
                            user=RDS_USER,
                            port=RDS_PORT,
                            passwd=RDS_PW,
                            db=RDS_DB,
                            cursorclass=pymysql.cursors.DictCursor)
    cur = conn.cursor()

    cur.execute("SELECT user_uid, user_name FROM ptyd_accounts;")
    accounts = cur.fetchall()

    for account in accounts:
        print(account)
        salt = account['user_uid']
        print(salt)
        hashed = sha512((account['user_name'] + salt).encode()).hexdigest()
        print(hashed)
        query = """
            INSERT INTO ptyd_passwords
            (
                password_user_uid,
                password_hash,
                password_salt,
                password_hash_algorithm,
                datetime_created,
                password_last_changed
            )
            VALUES
            (
                \'""" + salt + """\',
                \'""" + hashed + """\',
                \'""" + salt + """\',
                \'SHA512\',
                \'2020-01-01 12:30:01\',
                \'2020-01-01 12:30:01\'
            )
            ON DUPLICATE KEY UPDATE
                password_hash = \'""" + hashed + """\',
                password_salt = \'""" + salt + """\',
                password_hash_algorithm = \'SHA512\',
                datetime_created = \'2020-01-01 12:30:01\',
                password_last_changed = \'2020-01-01 12:30:01\';"""
        print(query)
        cur.execute(query)
    conn.commit()
except:
    print("unsuccessful")
finally:
    conn.close()
