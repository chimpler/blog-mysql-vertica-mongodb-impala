#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_YEARS 10
#define NUM_MONTHS 12
#define NUM_DAYS 28
#define NUM_HOURS 24
#define NUM_ADVERTISERS 200
#define NUM_PUBLISHERS 200

int main(int argc, char *argv[]) {
	int year, month, day, hour, advertiser_id, publisher_id, imps, clicks;
	double revenue;
	srand(time(NULL));
	printf("ymd,advertiser_id,publisher_id,imps,clicks,revenue\n");
	for (year = 0; year < NUM_YEARS; year++) {
	    for (month = 1; month <= NUM_MONTHS; month++) {
	        for (day = 1; day <= NUM_DAYS; day++) {
	            for (hour = 0; hour < NUM_HOURS; hour++) {
	                for (advertiser_id = 0; advertiser_id < NUM_ADVERTISERS; advertiser_id++) {
	                    for (publisher_id = 0; publisher_id < NUM_PUBLISHERS; publisher_id++) {
				imps = rand() * 1000000.0 / RAND_MAX;
				clicks = imps / (rand() * 20.0 / RAND_MAX + 10);
				revenue = rand() * 10.0 * (double)imps / (double)(RAND_MAX * 100000.0);
		        	printf("%d-%02d-%02d %02d:00:00,%d,%d,%d,%d,%f\n",
					2013 - NUM_YEARS + year,
					month, day, hour, advertiser_id,
					publisher_id, imps, clicks, revenue);
			    }
		        }
		    }
		}
	    }
	}
	return 0;
}
