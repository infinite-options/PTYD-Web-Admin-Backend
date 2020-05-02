from datetime import datetime
from time import sleep
import requests

DEV_URL = "http://127.0.0.1:2000/api/v2/"
API = {}
API['UPDATE'] = DEV_URL + "updatepurchases"
API['CHARGE'] = DEV_URL + "chargesubscribers"

def main():
    global API

    while 1:
        print("--- Update snapshots API ---")
        param = input("Enter date parameter (YYYYMMDD):\n")
        r = requests.post(url = API['UPDATE'] + '/' + str(param))

        print("--- Charge subscribers API ---")
        param = input("Enter date parameter (YYYYMMDD):\n")
        r = requests.post(url = API['CHARGE'] + '/' + str(param))

if __name__ == '__main__':
    main()
