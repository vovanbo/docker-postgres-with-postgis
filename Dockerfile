FROM mdillon/postgis:9.4
RUN mv /docker-entrypoint-initdb.d/postgis.sh /docker-entrypoint-initdb.d/01-postgis-template.sh
COPY ./initdb-postgis-database.sh /docker-entrypoint-initdb.d/02-postgis-database.sh
