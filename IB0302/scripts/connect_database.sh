#!/bin/bash

ls /firebird/data/*.fdb | nl
DBS=($(ls /firebird/data/*.fdb ))
while :; do
	read -ep "Input the number of the database you want to use " idx
	idx=$((idx-1))
	#echo "${DBS[idx]}"
	[[ -f ${DBS[idx]} ]] && break;
done;
echo "Connecting to database ${DBS[idx]}"
/usr/local/firebird/bin/isql -user sysdba -password ou localhost:${DBS[idx]}