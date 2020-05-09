# Prep-To-Your-Door/api
This directory contains all files related to the middleware that allows the web UIs to communicate with the database.

- `api.py`: These are the APIs that facilitate communication between the frontend and database
- `requirements.txt`: This is a list of Python modules that need to be installed
- `zappa_settings.json`: Configuration file for deploying our API to AWS

### Requirements
You will need the following:

#### `env_keys.py`
By default, this file is in the `.gitignore` file, as it contains sensitive information. You'll want to include the following in the file:

```
BING_API_KEY = "insert_bing_key"
RDS_PW = "insert_password_here"
```

#### `requirements.txt`
Run `pip3 install -r requirements.txt` to install the Python modules required. You may do this in a Python virtual environment if you wish.

### Run the APIs locally
1. Run `python3 api.py`. This will run the APIs on your local machine at `localhost:2000`.
2. View the APIs in your browser with `localhost:2000/api/v2/<resource-route>`, with `<resource-route>` being the designated route of the resource you wish to view. These routes can be found at the bottom of `api.py`.

### Deploy the APIs to AWS
1. Make sure `api.py` runs properly locally.
2. Near the top of `api.py`, you'll see:

```
# BING API KEY
# Import Bing API key into bing_api_key.py
from env_keys import BING_API_KEY, RDS_PW

# When deploying to Zappa, replace above statement with below:
#BING_API_KEY = "insert_key_kere"
#RDS_PW = "insert_password_here"
```

Comment the `env_keys import` line, uncomment the `BING_API_KEY` and `RDS_PW` lines and add the keys there.

3. Activate your virtual environment with `source ~/.virtualenv/ptyd-env/bin/activate`. If you havent created it, see below section.
4. Configure AWS with `aws configure` (may need to install `awscli`)
5. Run `zappa update dev` to update the API in production on AWS.

#### Troubleshooting
- Run `zappa tail` to check Zappa logs
- Create a Python3 virtual environment by navigating to `~/.virtualenv/` (make the directory if you need to) and run `virtualenv ptyd-env`. Then navigate back to this directory and install the Python modules with `pip3 install -r requirements.txt`
