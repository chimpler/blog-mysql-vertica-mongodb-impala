#!/bin/sh

if [ $# -lt 3 ]
then
  echo "Usage: $0 username password database"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
DATABASE=$3 

echo 'db.analytics.aggregate(
  { 
    $project: {
      "imps":1
    }
  },
  { 
    $group: {
      _id:1,
      "sum_imps":{$sum:"$imps"}
    }
  }
);' | /usr/bin/time --portability mongo $DATABASE

echo 'db.analytics.aggregate(
  { 
    $project: {
      "imps":1
    }
  },
  { 
    $group: {
      _id:1,
      "sum_imps":{$sum:"$imps"}
    }
  }
);' | /usr/bin/time --portability mongo $DATABASE

echo 'db.analytics.aggregate(
  {
    $match: {
        "ymdh": {
		$gte:"2012-06-01 00:00:00",
		$lte:"2012-07-01 00:00:00"
	}
    }
  }, { 
    $project: {
      "advertiser_id":1,
      "clicks":1
    }
  }, { 
    $group: {
      _id:"$advertiser_id",
      "sum_clicks":{$sum:"$clicks"}
    }
  }
);' | /usr/bin/time --portability mongo $DATABASE

echo 'db.analytics.aggregate(
  {
    $match: {
        "ymdh": {
		$gte:"2012-06-01 00:00:00",
		$lte:"2012-07-01 00:00:00"
	}
    }
  }, { 
    $project: {
      "advertiser_id":1,
      "clicks":1
    }
  }, { 
    $group: {
      _id:"$advertiser_id",
      "sum_clicks":{$sum:"$clicks"}
    }
  }
);' | /usr/bin/time --portability mongo $DATABASE

echo 'db.analytics.aggregate(
  {
    $match: {
        "ymdh": {
		$gte:"2012-12-01 00:00:00"
	}
    }
  }, { 
    $project: {
      "advertiser_id":1,
      "revenue":1,
      "imps":1
    }
  }, { 
    $group: {
      _id:"$advertiser_id",
      "avg_cpm":{$avg:"1000 * $revenue / $imps"}
    }
  }
);' | /usr/bin/time --portability mongo $DATABASE

echo 'db.analytics.aggregate(
  {
    $match: {
        "ymdh": {
		$gte:"2012-12-01 00:00:00"
	}
    }
  }, { 
    $project: {
      "advertiser_id":1,
      "revenue":1,
      "imps":1
    }
  }, { 
    $group: {
      _id:"$advertiser_id",
      "avg_cpm":{$avg:"1000 * $revenue / $imps"}
    }
  }
);' | /usr/bin/time --portability mongo $DATABASE
