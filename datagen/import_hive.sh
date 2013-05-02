#!/bin/sh

echo "Start import: " `date`

hive -e "DROP TABLE IF EXISTS analytics;"

hive -e "CREATE TABLE analytics (ymdh TIMESTAMP,
    state_id INT,
    advertiser_id INT,
    publisher_id INT,
    imps INT,
    clicks INT,
    revenue DOUBLE
) ROW FORMAT
DELIMITED FIELDS TERMINATED BY ',';"

for file in test_*.csv
do
  echo "Importing $file"
  hive -e "LOAD DATA LOCAL INPATH '$file' INTO TABLE analytics;"
done

echo "Done: " `date`
