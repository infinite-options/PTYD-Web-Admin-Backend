from datetime import datetime
from time import sleep
import json
import requests

#DEV_URL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/"
DEV_URL = 'http://127.0.0.1:2000/api/v2/'
API = {}
API['UPDATE'] = DEV_URL + "updatepurchases"
API['CHARGE'] = DEV_URL + "chargesubscribers"
#INTERVAL = 60 * 60

INTERVAL = 5

def main():
    global API
    global INTERVAL

    while 1:
        now = datetime.now()

        # Run Update Purchases API if it is Monday before 1AM
        """ if now.weekday() == 0 and now.hour < 1:
            r = requests.post(url = API['UPDATE'])
            print("============================================")
            print("Calling for update subscription snapshots...")
            print("Response:\n", r.json())
            print("============================================")

        # Run Charge Subscribers API if it is Thursday before 1AM
        if now.weekday() == 3 and now.hour < 1:
            r = requests.post(url = API['CHARGE'])
            print("============================================")
            print("Calling for billing renewing purchases...")
            print("Response:\n", r.json())
            print("============================================")

        print("Last checked for snapshot updates on:", now)
        sleep(INTERVAL)"""

        sleep(INTERVAL)
        print('update')
        update = requests.post(url = API['UPDATE'])
        print(update.json())
        sleep(INTERVAL)
        print('charge')
        charge = requests.post(url = API['CHARGE'])
        print(charge.json())

if __name__ == '__main__':
    main()
