from datetime import datetime
from time import sleep
import requests

DEV_URL = "http://127.0.0.1:2000/api/v2/"
API = {}
API['UPDATE'] = DEV_URL + "updatepurchases"
API['CHARGE'] = DEV_URL + "chargesubscribers"
INTERVAL = 60 * 60

def test():
    global API
    while 1:
        now = datetime.now()

        if now.second < 5:
            r = requests.post(url = API['UPDATE'])
            print("Calling for update subscription snapshots...")
        if now.second > 55:
            r = requests.post(url = API['CHARGE'])
            print("Calling for billing renewing purchases...")

        print("Current timestamp:", now)
        sleep(5)

def test2():
    global API
    while 1:
        now = datetime.now()

        r = requests.post(url = API['CHARGE'])
        print("Calling for billing renewing purchases...")
        a = input()

        r = requests.post(url = API['UPDATE'])
        print("Calling for update subscription snapshots...")
        a = input()

def main():
    global API
    global INTERVAL

    while 1:
        now = datetime.now()

        if now.weekday() == 0 and now.hour < 1:
            r = requests.post(url = API['UPDATE'])
            print("Calling for update subscription snapshots...")
        if now.weekday() == 3 and now.hour < 1:
            r = requests.post(url = API['CHARGE'])
            print("Calling for billing renewing purchases...")

        print("Current timestamp:", now)
        sleep(INTERVAL)

if __name__ == '__main__':
    test2()
