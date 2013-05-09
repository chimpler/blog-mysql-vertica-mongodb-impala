blog-mysql-vertica-mongodb-impala
=================================

Comparing MySQL, Vertica, MongoDB and Impala

datagen
=======
Generate fake data for our tests

	$ make
	$ ./gendata 

Import data
===========

	Import to all: ./import_all.sh
	Import to MySQL: ./import_mysql.sh
	Import to Vertica: ./import_vertica.sh
	Import to MongoDB: ./import_mongodb.sh
	Import to Hive: ./import_hive.sh
	Import to Impala/Parquet: ./import_impala_parquet.sh

Tests
=====

	Test all: ./test_all.sh
	Test MySQL: ./import_mysql.sh
	Test Vertica: ./import_vertica.sh
	Test MongoDB: ./import_mongodb.sh
	Test Hive: ./import_hive.sh
	Test Impala/CSV: ./import_impala.sh
	Test Impala/Parquet: ./import_impala_parquet.sh
