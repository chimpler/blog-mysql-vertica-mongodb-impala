#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3

/opt/vertica/bin/vsql -d $DATABASE -U $USERNAME -w $PASSWORD -c "DROP TABLE IF EXISTS analytics"

/opt/vertica/bin/vsql -d $DATABASE -U $USERNAME -w $PASSWORD -c "CREATE TABLE analytics (ymdh DATETIME,
    state_id INT,
    advertiser_id INT,
    publisher_id INT,
    imps INT,
    clicks INT,
    revenue NUMBER(12,6)
);"

for file in test_*.csv
do
  echo "Importing $file"
  /opt/vertica/bin/vsql -d $DATABASE -U $USERNAME -w $PASSWORD -c "COPY analytics(ymdh, state_id, advertiser_id, publisher_id, imps, clicks, revenue) FROM '$PWD/$file' DIRECT DELIMITER ',' RECORD TERMINATOR E'\n' EXCEPTIONS '/tmp/vsql.err'; "
done 

echo "Done!"
