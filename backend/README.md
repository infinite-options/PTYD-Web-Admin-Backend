# Prep-To-Your-Door/backend
### api/
Here is the web app's API that fetches data from the database (AWS RDS). The API is written in Python using Flask and is deployed to an AWS [S3 bucket](https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/) using Zappa.

### db/
This is where all database schemas and queries are stored. A shell script that allows access to the database is included.

### gspread-to-db/
The script which fetches data from Google Sheets and stores it onto the database is here. Relevant files are stored here also.
