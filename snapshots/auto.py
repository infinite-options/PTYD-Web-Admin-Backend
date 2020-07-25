from datetime import datetime, timedelta
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
    start_date = datetime.strptime("20200727", "%Y%m%d")
    start_date_str = start_date.strftime("%Y%m%d")
    while 1:
        #now = datetime.now()
        
		
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
        update = requests.post(url = DEV_URL + "updatepurchases/%s"%(start_date_str))
        print(update.json())
        sleep(INTERVAL)
        start_date = start_date + timedelta(days=3)
        start_date_str = start_date.strftime("%Y%m%d")
        print('charge')
        charge = requests.post(url = DEV_URL + "chargesubscribers/%s"%(start_date_str))
        print(charge.json())
        start_date = start_date + timedelta(days=4)
        start_date_str = start_date.strftime("%Y%m%d")

if __name__ == '__main__':
    main()
