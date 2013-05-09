#!/bin/sh

echo "Start import: " `date`

impala-shell -q "DROP TABLE IF EXISTS analytics_parquet;"

impala-shell -q "create table analytics_parquet like analytics stored as parquetfile;"

impala-shell -q "insert into analytics_parquet select * from analytics;"

echo "Done: " `date`
