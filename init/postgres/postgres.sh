#!/bin/bash
echo "installing database environment ..."

if $postgres=true && ! which psql >/dev/null; then
	. postgres/postgres.properties
	echo "hello  $user "

	sudo apt-get update
	sudo apt-get install postgresql postgresql-contrib

	sudo -i -u $user
	createdb $db_name
	psql -t -d $db_name -c $'ALTER USER $user WITH PASSWORD \"$password\";'
	#psql -d $db_name
else
    echo "psql exists, skipping installing postgres"
fi

if $pgadmin3=true && ! which pgadmin3 >/dev/null; then
	sudo apt-get install pgadmin3
fi
echo "postgres is ready"

