#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3

for file in test_*.csv
do
  echo "Importing $file"
  mongoimport -c analytics -d $DATABASE --headerline --type csv --file $file
  year=`expr $year + 1`
done

echo "Done!"
