#!/bin/bash

SQL="/cockroach/cockroach.sh sql --insecure --host ${COCKROACH_HOST} -e"
PRESENT=$(${SQL} "SELECT * FROM system.users WHERE username='${DB_USER}';" | grep "$DB_USER")

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME"
$SQL "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
if [ -z $PRESENT ]; then
    echo "CREATE USER $DB_USER"
    $SQL "CREATE USER $DB_USER;"
    echo "GRANT ALL ON DATABASE $DB_USER TO $DB_USER"
    $SQL "GRANT ALL ON DATABASE $DB_USER TO $DB_USER;"
fi
