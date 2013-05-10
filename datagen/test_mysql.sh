#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3 

echo "SET SQL_BIG_SELECTS=1; SELECT SUM(imps) FROM analytics" | /usr/bin/time --portability mysql -u $USERNAME -p$PASSWORD -U $DATABASE
echo "SET SQL_BIG_SELECTS=1; SELECT SUM(imps) FROM analytics" | /usr/bin/time --portability mysql -u $USERNAME -p$PASSWORD -U $DATABASE

echo "SET SQL_BIG_SELECTS=1; SELECT advertiser_id, AVG(clicks) FROM analytics FORCE INDEX (idx_ymdh) WHERE ymdh BETWEEN '2012-06-01 00:00:00' AND '2012-07-01 00:00:00' GROUP BY advertiser_id" | /usr/bin/time --portability mysql -u $USERNAME -p$PASSWORD -U $DATABASE
echo "SET SQL_BIG_SELECTS=1; SELECT advertiser_id, AVG(clicks) FROM analytics FORCE INDEX (idx_ymdh) WHERE ymdh BETWEEN '2012-06-01 00:00:00' AND '2012-07-01 00:00:00' GROUP BY advertiser_id" | /usr/bin/time --portability mysql -u $USERNAME -p$PASSWORD -U $DATABASE

echo "SET SQL_BIG_SELECTS=1; select avg(1000 * revenue / imps) as cpm from analytics where ymdh > '2012-12-01 00:00:00' GROUP BY publisher_id ORDER BY cpm DESC LIMIT 10;" | /usr/bin/time --portability mysql -u $USERNAME -p$PASSWORD -U $DATABASE
echo "SET SQL_BIG_SELECTS=1; select avg(1000 * revenue / imps) as cpm from analytics where ymdh > '2012-12-01 00:00:00' GROUP BY publisher_id ORDER BY cpm DESC LIMIT 10;" | /usr/bin/time --portability mysql -u $USERNAME -p$PASSWORD -U $DATABASE
