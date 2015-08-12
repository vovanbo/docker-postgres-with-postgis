#!/bin/bash
set -e

gosu postgres psql -U postgres -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -d "$POSTGRES_DB" <<EOSQL
    CREATE EXTENSION postgis;
    CREATE EXTENSION postgis_topology;
EOSQL
