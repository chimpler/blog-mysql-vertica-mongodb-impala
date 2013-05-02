#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3

echo "db.analytics.drop()" | mongo $DATABASE

echo "Start import: " `date`

for file in test_*.csv
do
  echo "Importing $file"
  mongoimport -c analytics -d $DATABASE -f ymdh,state_id,advertiser_id,publisher_id,imps,clicks,revenue --type csv --file $file
  year=`expr $year + 1`
done

echo "Start indexing: " `date`
for i in ymdh state_id advertiser_id publisher_id
do
  echo "Indexing $i..."
  echo "db.analytics.ensureIndex({\"$i\":1})" | mongo $DATABASE
done

echo "Done: " `date`
