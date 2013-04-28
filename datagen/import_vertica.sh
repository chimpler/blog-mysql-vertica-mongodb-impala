#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3

/opt/vertica/bin/vsql -d $DATABASE -U $USERNAME -w $PASSWORD -c "CREATE TABLE analytics (ymdh DATETIME,
    state_id INT,
    advertiser_id INT,
    publisher_id INT,
    imps INT,
    clicks INT,
    revenue NUMBER(6,6)
);"

for file in test_*.csv
do
  echo "Importing $file"
  tail -n +1 $file | /opt/vertica/bin/vsql -d $DATABASE -U $USERNAME -w $PASSWORD -c "COPY analytics(ymdh, state_id, advertiser_id, publisher_id, imps, clicks, revenue) FROM stdin DIRECT DELIMITER E',';"
  year=`expr $year + 1`
done

echo "Done!"
