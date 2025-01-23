FROM postgres:latest 

ENV postgres_PASSWORD=password
ENV postgres_USER=postgres

COPY init.sql /docker-entrypoint-initdb.d
COPY queries.sql /docker-entrypoint-initdb.d
 
