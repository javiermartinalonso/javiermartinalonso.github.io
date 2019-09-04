#############################################################
# Archivo Dockerfile para ejecutar contenedores postgres
# Basado en una imagen oficial de docker postgres
# https://hub.docker.com/_/postgres/
#############################################################

# Establece la imagen de base a utilizar
FROM postgres

# Especifica el autor que mantiene la imagen
MAINTAINER Javier Martín Alonso <javimartinalonso@gmail.com>

# Variables de entorno
# documentacion oficial 

# USER
ENV POSTGRES_USER admin
# PASS
ENV POSTGRES_PASSWORD admin
# Nombre bbdd
ENV POSTGRES_DB world
# Ruta para persistir la bbdd cuando usemos un gestor de volumenes de persistencia
#ENV PGDATA /var/lib/postgresql/data/pgdata

# Add VOLUMEs to allow backup of config, logs and databases
#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql", "PGDATA /var/lib/postgresql/data/pgdata"]

# Añadimos nuestro sql al directorio docker-entrypoint-initdb.d de la imagen. 
# Este se ejecutará al crear el contenedor
#dellstore.sql
ADD ./bbdd/world.sql /docker-entrypoint-initdb.d/ddl.sql
