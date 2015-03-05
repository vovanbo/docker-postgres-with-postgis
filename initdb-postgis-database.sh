#!/bin/sh
gosu postgres postgres --single -E <<EOSQL
CREATE ROLE postgis CREATEDB LOGIN PASSWORD 'postgis'
CREATE DATABASE postgis TEMPLATE template_postgis OWNER postgis
EOSQL
