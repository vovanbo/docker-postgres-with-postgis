# docker-postgis
Docker configuration for PostGIS

# Example usage

`Dockerfile`:

```dockerfile
FROM mcenirm/postgis:9.4-2.1
COPY ./schema.sql /tmp/schema.sql
COPY ./initdb-load-schema.sh /docker-entrypoint-initdb.d/03-load-schema.sh
```

`initdb-load-schema.sh`:

```sh
#!/bin/sh
gosu postgres -U postgis -d postgis --single -E < /tmp/schema.sql
```

`schema.sql`:

```sql
CREATE TABLE testgeog(gid serial PRIMARY KEY, the_geog geography(POINT,4326) );
```
