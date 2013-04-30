#!/bin/sh

time ./import_mysql.sh test test test
time ./import_vertica.sh dbadmin password test
time ./import_mongo.sh test test test
