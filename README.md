# docker-postgres-with-postgis
Docker configuration of Postgres with PostGIS enabled.

# Example usage

`Dockerfile`:

```dockerfile
FROM vovanbo/postgres-with-postgis
COPY ./schema.sql /tmp/schema.sql
COPY ./initdb-load-schema.sh /docker-entrypoint-initdb.d/03-load-schema.sh
```

`initdb-load-schema.sh`:

```bash
#!/bin/bash
gosu postgres postgres -U "$POSTGRES_USER" -d "$POSTGRES_DB" --single -E < /tmp/schema.sql
```

`schema.sql`:

```sql
CREATE TABLE testgeog(gid serial PRIMARY KEY, the_geog geography(POINT,4326) );
```
