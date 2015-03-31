#!/bin/bash
: ${POSTGRES_USER:=postgres}
: ${POSTGRES_DB:=$POSTGRES_USER}

gosu postgres pg_ctl start -w -D ${PGDATA}

gosu postgres psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -d "$POSTGRES_DB" -U postgres <<EOSQL
	CREATE EXTENSION postgis;
	CREATE EXTENSION postgis_topology;
EOSQL

gosu postgres pg_ctl stop -w -D ${PGDATA}