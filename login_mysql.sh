#!/bin/bash
# Type password when prompted to access the MySQL console for Infinite Options RDS

function usage () {
    echo "usage:";
    echo "--login, -l: log onto mysql server"
    echo "--run-schema, -r: setup schema in database, use with caution";
    exit 1;
}

if [[ $# -eq 1 ]]; then
    case $1 in
    -l | --login)
        mysql -h pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com -u admin -D pricing -p
        exit 0
        ;;
    -r | --run-schema)
        mysql -h pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com -u admin -D pricing -p < db_setup/schema.sql
        exit 0
        ;;
    *)
        usage
        ;;
    esac
else
    usage;
fi

