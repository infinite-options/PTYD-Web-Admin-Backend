#!/bin/bash
# Type password when prompted to access the MySQL console for Infinite Options RDS

function usage () {
    echo "usage:";
    echo "--login, -l: log onto mysql server"
    echo "--reset, -r: setup or soft reset schema in database";
    echo "--hard-reset, -h: hard reset schema";
}

function logon() {
    mysql -h pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com -u admin -D pricing -p
}

if [[ $# -eq 0 ]]; then
    usage;
    logon;
    exit 0
elif [[ $# -eq 1 ]]; then
    case $1 in
    -l | --login)
        logon;
        exit 0
        ;;
    -h | --hard-reset)
        cat hard_delete.sql schema.sql | mysql -h pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com -u admin -D pricing -p
        exit 0
        ;;
    -r | --reset)
        mysql -h pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com -u admin -D pricing -p < schema.sql
        exit 0
        ;;
    *)
        usage
        exit 1
        ;;
    esac
else
    usage;
fi

