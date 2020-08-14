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
    start_date = datetime.strptime("20200824", "%Y%m%d")
    start_date_str = start_date.strftime("%Y%m%d")
    while 1:
        sleep(INTERVAL)

        print("Calling updatepurchases")
        requests.post(url=API['UPDATE']+ "/" + start_date_str)
        start_date = start_date + timedelta(days=3)
        start_date_str = start_date.strftime("%Y%m%d")
        sleep(INTERVAL)
        print("Calling chargesubscribers")
        requests.post(url=API['CHARGE'] + "/" + start_date_str)
        start_date = start_date + timedelta(days=4)
        start_date_str = start_date.strftime("%Y%m%d")
if __name__ == '__main__':
    main()
