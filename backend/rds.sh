#!/bin/bash
# Type password when prompted to access the MySQL console for Infinite Options RDS

function usage () {
    echo "usage:";
    echo "--login, -l: log onto mysql server"
    echo "--file <filename>, -f <filename>: run a specific file";
}

function logon() {
    mysql -h pm-mysqldb.cxjnrciilyjq.us-west-1.rds.amazonaws.com -u admin -D pricing -p
}

if [[ $# -eq 0 ]]; then
    usage;
    logon;
    exit 0
else
    case $1 in
    -l | --login)
        logon;
        exit 0
        ;;
    -f | --file)
        cat $2 | logon
        exit 0
        ;;
    *)
        usage
        exit 1
        ;;
    esac
fi

