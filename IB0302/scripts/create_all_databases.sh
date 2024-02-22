#!/bin/bash

ls /firebird/data/*.fdb >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
	exit;
fi

for f in `ls /opt/*Create.sql`; do
	DB=`basename $f | sed 's/Create.sql//'`;
	[[ "${DB}" == "Security2" ]] && continue;
	[[ -f /opt/${DB}Insert.sql ]] || continue;
	echo -n "Creating Databse ${DB}..."
	echo "CREATE DATABASE '/firebird/data/${DB}.fdb' user 'sysdba' password 'ou';" | /usr/local/firebird/bin/isql -q -b
	/usr/local/firebird/bin/isql -user sysdba -password ou -i /opt/${DB}Create.sql localhost:/firebird/data/${DB}.fdb
	/usr/local/firebird/bin/isql -user sysdba -password ou -i /opt/${DB}Insert.sql localhost:/firebird/data/${DB}.fdb
	echo " Done."
done