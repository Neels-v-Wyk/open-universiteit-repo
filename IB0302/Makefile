# TODO: move stuff from the original _LINUX folder to makefile targets here
start:
	docker compose up -d
	docker exec -it firebird /bin/bash -c "chmod u+x /opt/*.sh"
	docker exec -it firebird /bin/bash -c "/opt/create_all_databases.sh"

stop:
	docker compose down
	docker rm -v firebird

split:
	split --bytes="40M" ./scripts/insertscripts_GrootOrderdatabase/insertOrderregel.sql sliceAA_
	split --bytes="40M" ./scripts/insertscripts_GrootOrderdatabaseKS/insertOrderregelKS.sql sliceKS_
	mv slice* multipart/

assemble:
	cat ./multipart/sliceAA_* > scripts/insertscripts_GrootOrderdatabase/insertOrderregel.sql
	cat ./multipart/sliceKS_* > scripts/insertscripts_GrootOrderdatabaseKS/insertOrderregelKS.sql

connect:
	docker exec -it firebird /bin/bash -c "/opt/connect_database.sh"

connect-empty:
	docker exec -it firebird /bin/bash -c "/usr/local/firebird/bin/isql -user sysdba -password ou localhost:/firebird/data/db"
