#!/bin/sh

./test_mysql.sh test test test
./test_vertica.sh dbadmin password test
./test_mongodb.sh test test test
./test_hive.sh
./test_impala.sh
./test_impala_parquet.sh
