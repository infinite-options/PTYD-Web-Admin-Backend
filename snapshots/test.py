from datetime import datetime
from time import sleep
import requests

# DEV_URL = "https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/api/v2/"
DEV_URL = "http://localhost:2000/api/v2/"
API = {}
API['UPDATE'] = DEV_URL + "updatepurchases"
API['CHARGE'] = DEV_URL + "chargesubscribers"

def main():
    global API

    while 1:
        print("--- Monday API ---")
        param = input("Enter date parameter (YYYYMMDD):\n")
        r = requests.post(url = API['UPDATE'] + '/' + str(param))

        print("--- Thursday API ---")
        param = input("Enter date parameter (YYYYMMDD):\n")
        r = requests.post(url = API['CHARGE'] + '/' + str(param))

if __name__ == '__main__':
    main()
