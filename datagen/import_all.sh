#!/bin/sh

./import_mysql.sh test test test
./import_vertica.sh dbadmin password test
./import_mongo.sh test test test
