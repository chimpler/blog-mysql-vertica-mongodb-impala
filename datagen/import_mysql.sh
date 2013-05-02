#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3

echo "DROP TABLE IF EXISTS analytics;" | mysql -u $USERNAME -p$PASSWORD -U $DATABASE

echo "CREATE TABLE analytics (ymdh DATETIME,
    state_id INT,
    advertiser_id INT,
    publisher_id INT,
    imps INT,
    clicks INT,
    revenue FLOAT(12,6)
) ENGINE=InnoDB;" | mysql -u $USERNAME -p$PASSWORD -U $DATABASE

echo "Start import: " `date`

for file in test_*.csv
do
  echo "Importing $file"
  echo "LOAD DATA LOCAL INFILE '$PWD/$file' INTO TABLE analytics FIELDS TERMINATED BY ',' ENCLOSED BY '' LINES TERMINATED BY '\n' (ymdh, state_id, advertiser_id, publisher_id, imps, clicks, revenue);" | mysql -u $USERNAME -p$PASSWORD -U $DATABASE
done

echo "Start indexing: " `date`
for i in ymdh state_id advertiser_id publisher_id
do
  echo "Indexing $i..."
  echo "CREATE INDEX idx_$i ON analytics($i);" | mysql -u $USERNAME -p$PASSWORD -U $DATABASE
done

echo "Done: " `date`
