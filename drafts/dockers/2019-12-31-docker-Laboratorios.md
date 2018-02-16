---
layout: post
sections: [docker]
title:  "Docker Laboratorios"
date:   2019-12-31
desc: ""
keywords: "Dockers, Dockerfile, imagen-Docker,docker-laboratios"
categories: [DevOps, DevOps/docker]
tags: [Dockers,Dockerfile,imagen-Docker,docker-laboratios]
icon: fab fa-docker
image: static/img/blog/docker/docker-logo.png
---


Vamos a definir el propósito de nuestro archivo ***Dockerfile*** y declarar la imagen base para usar:

> **NOTA**: Aunque sea opcional, siempre es una buena práctica permitir que usted y todo el mundo averigüen (cuando sea necesario) qué es este archivo y qué se piensa hacer. Para esto, comenzaremos nuestro ***Dockerfile*** con comentarios decorados con ***`#`*** para describirlo.

    #############################################################
    # Archivo Dockerfile para ejecutar contenedores postgres
    # Basado en una imagen de Ubuntu
    # Esta configuración de PostgreSQL es para propósitos de sólo desarrollo. 
    # Consulte la documentación de PostgreSQL para afinar estas configuraciones
    # https://hub.docker.com/_/postgres/.
    #############################################################
    
    # Establece la imagen de base a utilizar para Ubuntu
    FROM ubuntu
    
    # Especifica el autor que mantiene la imagen
    MAINTAINER Javier Martín Alonso <javimartinalonso@gmail.com>
    
    # Actualización de la lista de fuentes del repositorio de aplicaciones por defecto
    RUN apt-get update
    
	###################### EMPEZAR INSTALACION #######################
    # Configuración de argumentos y comandos
	# Instalar postgres
	##################################################################
    # Agregue la clave PGP de PostgreSQL para verificar sus paquetes Debian.
    # Debe ser la misma clave que https://www.postgresql.org/media/keys/ACCC4CF8.asc
    RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
	
	# Añade el repositorio de PostgreSQL. Contiene la versión estable más reciente de PostgreSQL.
	RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
	
	# Instala ``python-software-properties``, ``software-properties-common`` y PostgreSQL 9.3
	# Hay algunos avisos (en rojo) Que aparecen durante la construcción. 
	# Puedes ocultarlos prefijando cada sentencia apt-get con DEBIAN_FRONTEND=noninteractive
	RUN apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

	# Nota: Las imágenes oficiales de Debian y Ubuntu se limpian automáticamente ejecutando `` apt-get clean``, después de cada `` apt-get``

	# Ejecuta el resto de los comandos como el usuario `` postgres`` 
	# creado por el paquete `` postgres-9.3`` cuando ejecutamos `` apt-get installed``
	USER postgres

	# Crear un rol de PostgreSQL llamado `` docker`` con contraseña:`` docker``.
	# Luego cree una base de datos llamada `docker` propiedad del rol ` `docker`` que hemos creado antes.
	# Nota: aquí usamos `` && \ `` para ejecutar comandos uno tras otro - el `` \ ``
	# Permite que el comando RUN abarque varias líneas.
	RUN    /etc/init.d/postgresql start &&\
	    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
	    createdb -O docker docker

	# Ajustamos la configuración de PostgreSQL para que permita 
	# las conexiones remotas a la base de datos.
	RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
	
	# y añadimos ``listen_addresses`` a ``/etc/postgresql/9.3/main/postgresql.conf``
	RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
	##################################################################
	##################### INSTALACION TERMINADA ######################
    ##################################################################

	# Exponemos el puerto de conexion al servidor PostgreSQL
	EXPOSE 5432

	# añadimos volumenes para permitir copias de seguridad de la configuracón, logs and base de datos
	#VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]
	VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql", "/var/lib/postgresql/data/pgdata"]

	# Configuración del comando por defecto que se ejecutará cuando se inicie el contenedor
	CMD ["/usr/lib/postgresql/9.3/bin/postgres", "-D", "/var/lib/postgresql/9.3/main", "-c", "config_file=/etc/postgresql/9.3/main/postgresql.conf"]










http://www.nacionrosique.es/2016/06/manejo-de-contenedores.html


????????????
> ***Notas***: Hemos ejecutado el comando `docker run` y hemos pasado dos parámetros `–i` y `–t` , `-i` permite redirigir la entrada estándar, esto es necesario para poder tener una sesión interactiva con el Shell. El parámetro `–t` le dice a Docker que asigne un pseudo-tty al contenedor que hemos creado y es el que realmente permite una sesión interactiva con el Shell del nuevo contenedor. Esta línea es básica cuando queramos crear un contenedor que planeamos interactuar en línea de comandos.


Además de los contenedores interactivos, podemos crear contenedores con mayor duración de funcionamiento. Contenedores que se ejecutan como un servicio o demonio no tienen sesión interactiva y son ideales para la ejecución de aplicaciones y servicios. La mayoría de contenedores lo más probable es que funcionen como servicio.

Si hubiéramos lanzado el comando “docker run” con el parámetro “-d” para decirle a Docker que ejecute el contenedor en segundo plano. Esto es útil para la creación de contenedores como demonio o servicio

> ***Nota***: asigno el puerto 5433 en la maquina host, ya que tengo instalado un postgres que ya está usando el puerto 5432.



# Generar una imagen a partir del docker file #

Profundizaremos en post posteriores en el uso de dockers, creación de imágenes, ejecución de contenedores, volúmenes, etc. Por ahora nos bastará con ejecutar las siguientes instrucciones para crear una imagen a partir del docker file y arrancar un contenedor y probarlo.

- Construir la imagen a partir del `Dockerfile`, localizado en la ruta actual `.` y asignarle un nombre:

		docker build . -t jmartin/postgres-prueba-dockerfile

- Arrancar el contenedor creado antes, sin asignarle un puerto específico del host

		docker run -d --name postgres-prueba-dockerfile -P jmartin/postgres-prueba-dockerfile

> ***Nota***: hemos lanzado el comando “docker run” con el parámetro “-d” para decirle a Docker que ejecute el contenedor en segundo plano. Esto es útil para la creación de contenedores como demonio o servicio.

- Probar el funcionamiento del servidor postgres de la imagen creada

	Tenemos 2 opciones conectar desde el sistema host o conectar desde otro contenedor:

	1. Conexión desde el sistema host:

		Suponiendo que **tiene el postgresql-client instalado**, puede usar el puerto mapeado por el host para probarlo. Debe usar `docker ps` para averiguar a qué puerto del host al que se ha hecho el tunel al puerto del servidor postgres expuesto en el contenedor:

			$ docker ps
		
			CONTAINER ID        IMAGE                  COMMAND                CREATED             STATUS              PORTS                                      NAMES
			5e24362f27f6        eg_postgresql:latest   /usr/lib/postgresql/   About an hour ago   Up About an hour    0.0.0.0:49153->5432/tcp                    pg_test

		Ya podriamos conectar con el cliente postgres desde el host en ***localhost al puerto 49153 con el usuario: docker y password: docker***.

			$ psql -h localhost -p 49153 -d docker -U docker --password

	2. Conectar desde otro contenedor de la imagen de postgres, mediante el cliente postgres que contiene, usando `enlace de contenedor`:

		Si **no tenemos un cliente postgres instalado**, no pasa nada y no es necesario, ya que **podemos usar el cliente postgres que contiene la imagen que hemos creado**. Para ello la idea ***es crear un nuevo contenedor, interactuar con el cliente instalado dentro y atacar el servidor del otro contenedor postgres antes instanciado***.

		Los contenedores se pueden vincular a los puertos de otro contenedor directamente `-link remote_name:local_alias` en el cliente `docker run`. Esto establecerá una serie de variables de entorno que luego se pueden usar para conectarse:

		- creo el contenedor:

				$ docker run --rm -t -i --link postgres-prueba-dockerfile:pg jmartin/postgres-prueba-dockerfile bash

		- me conecto con el cliente postgres del contenedor al servidor postgres del contenedor inicialmente creado:

				postgres@7ef98b1b7243:/$ psql -h $PG_PORT_5432_TCP_ADDR -p $PG_PORT_5432_TCP_PORT -d docker -U docker --password

			> la pass es: ***docker***


	En este punto, ya podemos realizar la prueba contra el servidor Postgres. Una vez que se haya autenticado y tenga un mensaje `docker =#`, puede crear una tabla y rellenarlo.

		psql (9.3.1)
		Type "help" for help.
		
		$ docker=# CREATE TABLE cities (name varchar(80), location point);
		CREATE TABLE
		$ docker=# INSERT INTO cities VALUES ('San Francisco', '(-194.0, 53.0)');
		INSERT 0 1
		$ docker=# select * from cities;
		     name      | location
		---------------+-----------
		 San Francisco | (-194,53)
		(1 row)



## Uso de los volúmenes de contenedores ##
??
- obtener la información de un contenedor, por ejemplo los volúmenes con los que viene montado:

	docker inspect <containerName>



https://stackoverflow.com/questions/33126271/how-to-use-volume-option-with-docker-toolbox-on-windows

https://docs.docker.com/engine/admin/volumes/bind-mounts/

Bind mounts han existido desde los primeros días de Docker. Los montajes de unión tienen una funcionalidad limitada en comparación con los volúmenes . Cuando utiliza un montaje de vinculación, un archivo o directorio en el equipo host se monta en un contenedor. El archivo o directorio se referencia por su ruta completa o relativa en el equipo host. Por el contrario, cuando utiliza un volumen, se crea un nuevo directorio dentro del directorio de almacenamiento de Docker en el equipo host, y Docker administra el contenido de ese directorio.

# Montaje en un directorio no vacío en el contenedor#

Si realiza una vinculación de montaje en un directorio no vacío en el contenedor, los contenidos existentes del directorio quedarán ocultos por el montaje de vinculación. Esto puede ser beneficioso, como cuando quiere probar una nueva versión de su aplicación sin construir una nueva imagen. Sin embargo, también puede ser sorprendente y este comportamiento difiere del de los volúmenes de Docker .

Este ejemplo se ideó para ser extremo, pero reemplazará el contenido del /usr/directorio del contenedor con el /tmp/directorio de la máquina host. En la mayoría de los casos, esto daría como resultado un contenedor que no funciona.


https://docs.docker.com/engine/admin/volumes/volumes/#populate-a-volume-using-a-container

# Rellenar un volumen usando un contenedor #

Si inicia un contenedor que crea un nuevo volumen, como el anterior, y el contenedor tiene archivos o directorios en el directorio que se va a montar (como el /app/anterior), los contenidos del directorio se copiarán en el volumen. El contenedor luego se montará y usará el volumen, y otros contenedores que usen el volumen también tendrán acceso al contenido pre-llenado.

Para ilustrar esto, este ejemplo inicia un nginxcontenedor y rellena el nuevo volumen nginx-volcon el contenido del /usr/share/nginx/htmldirectorio del contenedor , que es donde Nginx almacena su contenido HTML predeterminado.

Los --mounty los -vejemplos tienen el mismo resultado final.

--mount
-v
$ docker run -d \
  -it \
  --name=nginxtest \
  -v nginx-vol:/usr/share/nginx/html \
  nginx:latest


















Aprender a trabajar con volumenes desde windows
????????????????????????????????????????????????????

Puede utilizar los volúmenes definidos para inspeccionar los archivos de registro de PostgreSQL y para hacer una copia de seguridad de la configuración y los datos:


	javi@javi-VirtualBox:~/postgresql$ docker run --rm --volumes-from postgres-prueba-dockerfile -t -i jmartin/postgres-prueba-dockerfile sh
	$ ls
	bin   dev  home  lib64	mnt  proc  run	 srv  tmp  var
	boot  etc  lib	 media	opt  root  sbin  sys  usr
	$ ls /etc/postgresql/9.3/main/
	environment  pg_ctl.conf  pg_hba.conf  pg_ident.conf  postgresql.conf  start.conf
	$ ls /var/log
	alternatives.log  bootstrap.log  dmesg	   faillog  lastlog	sysstat		     wtmp
	apt		  btmp		 dpkg.log  fsck     postgresql	unattended-upgrades
	$ 



- al arrancar un contenedor montamos una carpeta del host dentro del contenedor. esto se hace con la opción `-v ruta-host:ruta-contenedor`. esto nos puede servir para tener una carpeta de backup donde copiar archivos de configuración o lo que sea del contenedor a la carpeta física del host. también puede servir a la inversa para que al arrancar el contenedor arranque con unos ficheros de datos/configuración que se localizan en el host.

Como servidor:

		docker run -d --name postgres-prueba-dockerfile -v BACKUP:/BACKUP -p 5433:5432 jmartin/postgres-prueba-dockerfile

como maquina interactiva

		docker run --rm -ti jmartin/postgres-prueba-dockerfile bash



Como maquina temporal iterativa con los volúmenes compartidos del servidor

		docker run --rm -it --name slave1 --volumes-from postgres-prueba-dockerfile jmartin/postgres-prueba-dockerfile bash


> Cuidado con esto pues si el contenedor tiene esa carpeta, la pisaremos con la carpeta del host.

- montamos un contenedor y hacemos ***bind (montar un volumen)*** de este modo montamos directorios del host en el contenedor:

		docker run -it --name master -v backup:/backup -v logs:/logs ubuntu bash 

> Los directorios en el host deberían existir y cuidado con que existan estos directorios ya en la imagen del contenedor pues se sobrescribirían con los directorios montados del host.

Esto puede ser útil cuando tenemos directorios con ficheros de configuración que queremos que sean accesibles desde el contenedor pero que no estén fuertemente acoplados en la imagen. O por ejemplo cuando queremos modificar desde fuera del contenedor el contenido de estos directorios o al revés cuando queremos consultar desde el host el contenido de estos directorios, por ejemplo si contiene logs.

- montamos los volúmenes desde otro contenedor en el nuevo que creamos, así comparten la misma info:

	docker run -it --name slave1 --volumes-from master ubuntu bash

-listar los volumenes

	docker volume ls

- obtener información sobre un volumen concreto, donde se localiza en el host etc

	docker volume inspect backup




# mapear volumenes con directorios del host #
??????????




>Nota : `--rm` elimina el contenedor y su imagen cuando el contenedor sale exitosamente.


https://cerebro-digital.com/panel/knowledgebase/62/Como-hacer-SSH-en-tus-contenedores-de-Docker.html













	javi@javi-VirtualBox:~$ docker volume ls
	DRIVER              VOLUME NAME
	javi@javi-VirtualBox:~$ docker image ls
	REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
	jmartin/postgres-prueba-dockerfile   latest              91800ce8982f        4 hours ago         392MB
	ubuntu                               latest              00fd29ccc6f1        2 weeks ago         111MB
	hello-world                          latest              1815c82652c0        6 months ago        1.84kB
	javi@javi-VirtualBox:~$ docker ps -a
	CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
	javi@javi-VirtualBox:~$ 





- interactuar con la consola de un contenedor activo como demonio en segundo plano.

		docker exec -it <containeName> bash


- interactuar igual que antes pero como root

		docker exec -u 0 -it postgres-prueba-dockerfile bash









## Referencias ##

[https://docs.docker.com/engine/reference/builder](https://docs.docker.com/engine/reference/builder "https://docs.docker.com/engine/reference/builder")

[https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/ "https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/")

[https://docs.docker.com/engine/examples/postgresql_service/](https://docs.docker.com/engine/examples/postgresql_service/ "https://docs.docker.com/engine/examples/postgresql_service/")


[https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks/#communication-across-links](https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks/#communication-across-links "https://docs.docker.com/engine/userguide/networking/default_network/dockerlinks/#communication-across-links")