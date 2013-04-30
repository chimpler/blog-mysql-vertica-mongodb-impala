#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_YEARS 1
#define NUM_MONTHS 12
#define NUM_DAYS 28
#define NUM_HOURS 24
#define NUM_STATES 10
#define NUM_ADVERTISERS 20
#define NUM_PUBLISHERS 100
#define FILENAME_BASE "test_%d-%02d.csv"
#define HEADER "ymd,state_id,advertiser_id,publisher_id,imps,clicks,revenue\n"

int main(int argc, char *argv[]) {
	int year, month, day, hour, state_id, advertiser_id, publisher_id, imps, clicks;
	double revenue;
	FILE *fd;
	char filename[30];
	srand(time(NULL));
	for (year = 2013 - NUM_YEARS; year < 2013; year++) {
	    for (month = 1; month <= NUM_MONTHS; month++) {
	        sprintf(filename, FILENAME_BASE, year, month);
	        printf("%s\n", filename);
	        fd = fopen(filename, "w");
	        //fprintf(fd, HEADER);
	        for (day = 1; day <= NUM_DAYS; day++) {
	            for (hour = 0; hour < NUM_HOURS; hour++) {
	                for (state_id = 0; state_id < NUM_STATES; state_id++) {
	                    for (advertiser_id = 0; advertiser_id < NUM_ADVERTISERS; advertiser_id++) {
	                        for (publisher_id = 0; publisher_id < NUM_PUBLISHERS; publisher_id++) {
				    imps = rand() * 1000000.0 / RAND_MAX;
				    clicks = imps / (rand() * 20.0 / RAND_MAX + 10);
				    revenue = rand() * 10.0 * (double)imps / (double)(RAND_MAX * 100000.0);
		        	    fprintf(fd, "%d-%02d-%02d %02d:00:00,%d,%d,%d,%d,%d,%f\n",
					year,
					month, day, hour, state_id, advertiser_id,
					publisher_id, imps, clicks, revenue);
				}
			    }
		        }
		    }
		}
	        fclose(fd);
	    }
	}
	return 0;
}
