#############################################################
# Archivo Dockerfile para ejecutar contenedores postgres
#############################################################

# Establece la imagen de base a utilizar
FROM postgres

# Especifica el autor que mantiene la imagen
MAINTAINER javimartinalonso@gmail.com

# Variables de entorno
# documentacion oficial 
# https://hub.docker.com/_/postgres/
# USER
ENV POSTGRES_USER admin
# PASS
ENV POSTGRES_PASSWORD admin
# Nombre bbdd
ENV POSTGRES_DB world

# Añadimos nuestro ddl al directorio docker-entrypoint-initdb.d de la imagen. 
# Este se ejecutará al crear el contenedor
# ADD ddl.sql /docker-entrypoint-initdb.d/ddl.sql