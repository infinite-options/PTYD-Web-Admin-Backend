# Prep-To-Your-Door/api
`api.py` is the API which queries from the database.

To access it locally:
1. Run `python3 api.py` with the password to the RDS as the first command line argument. This will run the APIs on your local machine at `localhost:2000`.
2. View the APIs in your browser with `localhost:2000/api/v2/<resource-route>`, with `<resource-route>` being the designated route of the resource you wish to view. These routes can be found at the bottom of `api.py`.

If you are running it for the first time:
1. Run `pip3 install -r requirements.txt` to install Python modules. You may do this in a Python virtual environment if you wish.
