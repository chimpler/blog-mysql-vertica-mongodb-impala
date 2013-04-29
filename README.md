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

	Import to MySQL, Vertica, MongoDB and Impala: ./import_all.sh
	Import to MySQL: ./import_mysql.sh
	Import to Vertica: ./import_vertica.sh
	Import to MongoDB: ./import_mongodb.sh
