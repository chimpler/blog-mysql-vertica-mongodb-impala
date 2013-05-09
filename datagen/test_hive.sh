#!/bin/sh

/usr/bin/time --portability hive -e "SELECT SUM(imps) FROM analytics"
/usr/bin/time --portability hive -e "SELECT SUM(imps) FROM analytics"

/usr/bin/time --portability hive -e "SELECT advertiser_id, AVG(clicks) FROM analytics WHERE ymdh BETWEEN '2012-06-01 00:00:00' AND '2012-07-01 00:00:00' GROUP BY advertiser_id"
/usr/bin/time --portability hive -e "SELECT advertiser_id, AVG(clicks) FROM analytics WHERE ymdh BETWEEN '2012-06-01 00:00:00' AND '2012-07-01 00:00:00' GROUP BY advertiser_id"

/usr/bin/time --portability hive -e "select avg(1000 * revenue / imps) as cpm from analytics where ymdh > '2012-12-01 00:00:00' GROUP BY publisher_id ORDER BY cpm DESC LIMIT 10;"
/usr/bin/time --portability hive -e "select avg(1000 * revenue / imps) as cpm from analytics where ymdh > '2012-12-01 00:00:00' GROUP BY publisher_id ORDER BY cpm DESC LIMIT 10;"
