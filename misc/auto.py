from datetime import datetime
from time import sleep
import requests

DEV_URL = "http://127.0.0.1:2000/api/v2/"
API = {}
API['UPDATE'] = DEV_URL + "updatepurchases"
API['CHARGE'] = DEV_URL + "chargesubscribers"
INTERVAL = 60 * 60

def main():
    global API
    global INTERVAL

    while 1:
        now = datetime.now()

        # Run Update Purchases API if it is Monday before 1AM
        if now.weekday() == 0 and now.hour < 1:
            r = requests.post(url = API['UPDATE'])
            print("============================================")
            print("Calling for update subscription snapshots...")
            print("Response:\n", r)
            print("============================================")

        # Run Charge Subscribers API if it is Thursday before 1AM
        if now.weekday() == 3 and now.hour < 1:
            r = requests.post(url = API['CHARGE'])
            print("============================================")
            print("Calling for billing renewing purchases...")
            print("Response:\n", r)
            print("============================================")

        print("Last checked for snapshot updates on:", now)
        sleep(INTERVAL)

if __name__ == '__main__':
    main()
