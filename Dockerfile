FROM postgres:9.4

MAINTAINER Vladimir Bolshakov "vovanbo@gmail.com"

ENV POSTGIS_MAJOR 2.1
ENV POSTGIS_VERSION 2.1.7+dfsg-3~94.git954a8d0.pgdg80+1

RUN apt-get update && apt-get install -y --no-install-recommends \
    postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
    postgis=$POSTGIS_VERSION \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /
COPY ./initdb-postgis-database.sh /docker-entrypoint-initdb.d/postgis.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
