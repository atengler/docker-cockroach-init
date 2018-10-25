#!/bin/bash

SQL="/cockroach/cockroach.sh sql --insecure --host ${COCKROACH_HOST} -e"
PRESENT=$(${SQL} "SELECT * FROM system.users WHERE username='oapi';" | grep "oapi")

echo "CREATE DATABASE IF NOT EXISTS oapi"
$SQL "CREATE DATABASE IF NOT EXISTS oapi;"
if [ -z $PRESENT ]; then
    echo "CREATE USER oapi"
    $SQL "CREATE USER oapi;"
    echo "GRANT ALL ON DATABASE oapi TO oapi"
    $SQL "GRANT ALL ON DATABASE oapi TO oapi;"
fi
