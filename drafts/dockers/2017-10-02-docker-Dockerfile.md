---
layout: post
sections: [docker]
title:  "Dockerfile"
date:   2017-10-02
desc: "Dockerfiles son scripts que contienen comandos declarados sucesivamente que serán ejecutados, en el orden dado, por Docker para crear automáticamente una nueva imagen Docker. Estos ayudan en gran medida durante los despliegues.."
keywords: "Dockers, Dockerfile, imagen-Docker"
categories: [DevOps, DevOps/docker]
tags: [Dockers,Dockerfile,imagen-Docker]
icon: fab fa-docker
image: static/img/blog/docker/docker-logo.png
---

***Dockerfiles*** son scripts que contienen comandos declarados sucesivamente que serán ejecutados, en el orden dado, por ***Docker*** para crear automáticamente una nueva ***imagen Docker***. ***Estos ayudan en gran medida durante los despliegues***.

Los ***contenedores Docker*** se crean utilizando **imágenes base**. **Una imagen puede ser básica, con nada más que los fundamentos del sistema operativo, o puede consistir en una sofisticada pila de aplicaciones pre-construida lista para el lanzamiento**.



https://store.docker.com/



Podemos usar las imágenes disponibles en el ***[índice de imágenes de docker](https://hub.docker.com/ "https://hub.docker.com/")***, donde están disponibles las aplicaciones de bases de datos, servidores de aplicaciones de mútiples lenguages y servidores web más populares entre otras muchas. 

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/docker/docker-hub.png" alt="docker-hub" class="img-thumbnail" style="width: 90%"/>
</div>

Estas imágenes de base pueden utilizarse para crear nuevos contenedores, pero también nos sirven para definir nuestras propias imágenes personalizadas con las necesidades que tengamos. Lo que necesitamos es escribir un archivo que contenga la receta para construir la imagen del contenedor, este archivo es el ***Dockerfile***.

Al crear tus imágenes con ***dockerfile***, cada acción tomada (es decir, un comando ejecutado como `apt-get install`) forma una nueva capa encima de la anterior.

***Dockerfile*** **definirá lo que sucede en el entorno dentro de su contenedor. El acceso a recursos como interfaces de red y unidades de disco se virtualiza dentro de este entorno, aislado del resto del sistema, por lo que debe asignar los puertos al mundo exterior y especificar qué archivos desea copiar desde el host**. Sin embargo, después de hacer eso, puede esperar que la compilación de su aplicación definida en este ***Dockerfile*** se comportará exactamente igual dondequiera que se ejecuta.

# Sintaxis de Dockerfile #

La sintaxis de ***Dockerfile*** consiste en dos tipos de bloques de líneas principales: comentarios y comandos + argumentos.

    # Linea de bloque usada para comentarios
    command argument argument ..

Un ejemplo simple:

    # Escribe "Hello docker!"
    RUN echo "Hello docker!"

# Información general sobre comandos Dockerfile #

- **ADD**: Por medio de este comando podemos copiar archivos dentro de nuestra nueva ***imagen*** ya sea desde una URL o desde una carpeta física que se encuentre en nuestra maquina host. El comando `ADD` obtiene dos argumentos: un origen y un destino. Básicamente **copia los archivos de origen en una ruta del host, en el propio sistema de archivos del contenedor en la ruta destino establecido. En muchas ocasiones se utiliza para proporcionar la configuración de los servicios (ssh, mysql, …)**:

		# Usage: ADD [ruta path del host o URL] [directorio destino en el contenedor]
		ADD /my_app_folder /my_app_folder

	> **NOTA**: Ojo, sólo se pueden copiar archivos que se localizan a la misma altura en el filesystem que la carpeta en la que se encuentra el Dockerfile, esto por temas de caché. Si quieren tener un directorio en local y en una imagen de docker, al mismo tiempo que está corriendo, tienen que hacerlo después del paso de crear la imagen con un Dockerfile, cuando inician la máquina.

- **CMD**: **Establece el comando de inicio del proceso que se usará si no se indica uno al iniciar un contenedor con la imagen**.

	Configura comandos por defecto para ser ejecutado **durante la inicialización del contenedor (cuando se instancia un contenedor utilizando la imagen que se está construyendo)**. Este comando es similar al comando `RUN` con la única diferencia que este no se ejecuta durante la fase de compilación (`build`) sino que **se ejecuta cuando iniciamos el contenedor**.

	**Esta instrucción sirve para ejecutar una acción por defecto en el arranque de un contenedor, si escribes más de una solo tendrá efecto la última instrucción que escribas. Y si al arrancar un contenedor especificas un comando puedes sobrescribir esta instrucción por defecto**.

		# Usage: CMD application "argument", "argument", ..
		CMD "echo" "Hello docker!"

- **ENTRYPOINT**: Ajusta el punto de entrada por defecto de la aplicación desde el ***contenedor***. El argumento `ENTRYPOINT` **establece la aplicación predeterminada concreta que se utiliza cada vez que se crea un contenedor con la imagen**. Por ejemplo, si ha instalado una aplicación específica dentro de una imagen y utilizará esta imagen para ejecutar sólo esa aplicación, puede indicarla con `ENTRYPOINT` y cada vez que se cree un contenedor a partir de esa imagen, su aplicación será el destino del comando `cmd`.

	Si se combina `ENTRYPOINT` con `CMD`, puede quitar *"application"* de `CMD` y dejar "argumentos" que se pasarán al `ENTRYPOINT`.

		# Usage: ENTRYPOINT application "argument", "argument", ..
		# Remember: arguments are optional. They can be provided by CMD
		#           or during the creation of a container. 
		ENTRYPOINT echo
		
		# Usage example with CMD:
		# Arguments set with CMD can be overridden during *run*
		CMD "Hello docker!"

- **ENV**: El comando `ENV` se utiliza para **establecer las variables de entorno**. Estas variables consisten en pares **"clave=valor"** que se pueden acceder dentro del contenedor por scripts y aplicaciones por igual. Esta funcionalidad de ***docker*** ofrece una enorme flexibilidad para ejecutar programas.

		# Usage: ENV [CLAVE] [VALOR]
		# establece la variable de entorno JAVA_HOME
		ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

- **EXPOSE**: El comando `EXPOSE` se utiliza para **asociar un puerto especificado para habilitar la conexión en red entre el proceso en ejecución dentro del contenedor y el mundo exterior (es decir, el host)**. Indica los puertos TCP/IP por los que se pueden acceder a los servicios del contenedor, los típicos son `22 (SSH)`, `80 (HTTP)`.

		# Usage: EXPOSE [port]
		EXPOSE 8080

- **FROM**: **Define la imagen base a utilizar para iniciar el proceso de generación**. Puede ser cualquier imagen, incluyendo las que has creado anteriormente. Si no se encuentra una *imagen* `FROM` en el host, el ***docker*** intentará encontrarla (y descargarla) desde el ***[índice de imágenes de docker](https://hub.docker.com/ "https://hub.docker.com/")***. Debe ser el primer comando declarado dentro de un ***Dockerfile***.
	
		# Usage: FROM [image name]
		FROM ubuntu

- **MAINTAINER**: **Establece los datos de autor/propietario del archivo *Dockerfile***. Este comando se puede establecer en cualquier parte del archivo después del comando `FROM`.
	
		# Usage: MAINTAINER [name] [e-mail]
		MAINTAINER authors_name authors_email

- **RUN**: **Permite ejecutar una instrucción en el contenedor**, por ejemplo, para instalar algún paquete mediante el gestor de paquetes o ejecutar algún fichero ejecutable…(`apt-get, yum, …`). **Ejecuta un comando y cambia (commit) el resultado de la la imagen final (contenedor). A diferencia de CMD, en realidad se utiliza para construir la imagen (formando otra capa encima de la anterior que está comprometida)**.

	> ***Nota***: La razón de tener un único comando `RUN` de Docker y encadenar los comandos de shell con `&&` es que Docker creará una capa adicional en la imagen para cada comando `RUN`. Cuantos menos comandos `RUN` contenga un archivo Docker, menor será la imagen resultante.
	>
	> El usar la barra invertida `\` permite que el comando RUN abarque varias líneas no dando por terminado el comando al ejecutar `enter`. De este modo conseguimos scripts más legibles, comprensibles y mantenibles, aunque sus declaraciones sean largas o complejas.
	> 
	> Siempre que sea posible, facilite los cambios ordenando argumentos multilínea de forma alfanumérica. Esto le ayudará a evitar la duplicación de paquetes y hacer la lista mucho más fácil de actualizar. Esto también hace PRs mucho más fácil de leer y revisar. Agregar un espacio antes de una barra invertida (` \`) ayuda también.
	
		# Usage: RUN [command]
		RUN apt-get update && apt-get install -y \
		aufs-tools \
		automake \
		build-essential \
		curl \
		dpkg-sig \
		libcap-dev \
		libsqlite3-dev \
		mercurial \
		reprepro \
		ruby1.9.1 \
		ruby1.9.1-dev \
		s3cmd=1.1.* \
		 && rm -rf /var/lib/apt/lists/*

	> ***Nota***: Limpiar la caché apt mediante la eliminación de `/var/lib/apt/lists` reduce el tamaño de la imagen, ya que la caché apt no se almacena en una capa. Dado que la sentencia `RUN` comienza con `apt-get update`, la caché del paquete siempre se actualizará antes de `apt-get install`.

- **USER**: **Establece el usuario (el UID o nombre de usuario) que debe ejecutar los contenedores en función de la imagen que se está construyendo**.

		# Usage: USER [UID]
		USER 751

- **VOLUMEN**: **Monta un directorio desde el host al contenedor, permitiendo el acceso desde su contenedor a un directorio de la máquina host**. Establece puntos de montaje que al usar el contenedor se pueden proporcionar, los volúmenes son la forma de externalizar un determinado directorio y proporcionar persistencia (las imágenes de docker son de solo lectura y no almacenan datos entre diferentes ejecuciones).
	
		# Usage: VOLUME ["/dir_1", "/dir_2" ..]
		VOLUME ["/my_files"]

- **WORKDIR**: Establece el directorio para las directivas de CMD que se ejecutarán.

		# Usage: WORKDIR /path
		WORKDIR ~/

# Creación del dockerFile #

Dado que los ***archivos Dockerfile*** son documentos de texto sin formato, puedes crear uno desde tu editor de texto favorito y escribir los comandos que deseas que ***Docker*** ejecute con el fin de construir una imagen. Después de empezar a trabajar en el archivo, continúa con la adición de todo el contenido a continuación (uno tras otro) antes de guardar el resultado final.

Vamos a crear un archivo ***Dockerfile*** vacío utilizando el editor de texto nano:

    nano Dockerfile

Necesitamos tener todas las instrucciones (comandos) y directivas enumeradas sucesivamente. Sin embargo, todo comienza con la construcción de una imagen base (configurado con el comando `FROM`). A partir de ahí, el proceso de construcción se inicia y cada siguiente acción finalizando con commits (guardando el estado de imagen) en el host.

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


# Generar una imagen a partir del docker file #

Profundizaremos en post posteriores en el uso de dockers, creación de imágenes, ejecución de contenedores, volúmenes, etc. Por ahora nos bastará con ejecutar las siguientes instrucciones para crear una imagen a partir del docker file y arrancar un contenedor y probarlo.

- Construir la imagen a partir del `Dockerfile`, localizado en la ruta actual `.` y asignarle un nombre:

		docker build . -t jmartin/postgres-prueba-dockerfile

- Arrancar el contenedor creado antes, sin asignarle un puerto específico del host

		docker run -d --name postgres-prueba-dockerfile -P jmartin/postgres-prueba-dockerfile

> ***Nota***: hemos lanzado el comando `docker run` con el parámetro `-d` para decirle a Docker que ejecute el contenedor en segundo plano. Esto es útil para la creación de contenedores como demonio o servicio.

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

## Principales usos de dockerfile ##

- **Documentar las dependencias del entorno de la aplicación/servicio que contendrá el contenedor**. Podemos crear fácilmente imágenes con la configuración y dependencias que se necesitan, destruirlas, hacer pequeñas modificaciones y volver a crear con el ***Dockerfile***. Al poder sustituir los ficheros de configuración en la imagen que se está creando, podemos definir los ficheros de configuración y empaquetarlos junto con el ***Dockerfile*** facilitando su distribución. Cuando cambia el ***Dockerfile*** y reconstruye la imagen, sólo se reconstruyen las capas que han cambiado. Esto es parte de lo que hace que las imágenes sean tan ligeras, pequeñas y rápidas, en comparación con otras tecnologías de virtualización.
 
- **Publicar y compartir de una manera cómoda y rápida una imagen operativa de nuestra aplicación/servicio**. Empaquetar por ejemplo un war + ficheros de configuración + Dockerfile puede ocupar alrededor de 100Mb. Esto permite que sea fácil de de distribuir y de instalar en cualquier entorno ya sea de desarrollo o de producción.

- **Generar Tags o release de entornos completos que podamos reutilizar por ejemplo para dar soporte en la versión instalada en producción**. Podemos hacer un tag en un repositorio con las versiones de ***Dockerfile*** que se instalan en cada entrega.

## Referencias ##

[https://docs.docker.com/engine/reference/builder](https://docs.docker.com/engine/reference/builder "https://docs.docker.com/engine/reference/builder")

[https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/ "https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/")

[https://docs.docker.com/engine/examples/postgresql_service/](https://docs.docker.com/engine/examples/postgresql_service/ "https://docs.docker.com/engine/examples/postgresql_service/")
