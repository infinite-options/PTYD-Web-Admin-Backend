# Prep-To-Your-Door/backend
### api/
Here is the web app's API that fetches data from the database (AWS RDS). The API is written in Python using Flask and is deployed to an AWS [S3 bucket](https://uavi7wugua.execute-api.us-west-1.amazonaws.com/dev/) using Zappa.

### rds.sh
This is a shell script that allows access to the database is included.

To use it:
- Run `./rds.sh` or `./rds.sh -l` to log onto the RDS through the shell
- Run `./rds.sh -f <filename>` to run an SQL script on the RDS. **Use with caution, it can overwrite existing data and tables.**
