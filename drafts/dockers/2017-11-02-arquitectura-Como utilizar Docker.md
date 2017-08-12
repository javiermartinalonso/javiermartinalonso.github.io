---
layout: post
section: "ARQUITECTURA"
title:  "Cómo utilizar Docker"
date:   2016-11-02
desc: ""
keywords: "Dockers"
categories: [arquitectura]
tags: [Dockers]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

https://github.com/brunocascio/docker-espanol

https://github.com/docker/labs/blob/master/beginner/chapters/webapps.md


https://github.com/docker/labs/blob/master/beginner/chapters/alpine.md

http://www.josedomingo.org/pledin/2016/02/ejemplos-de-ficheros-dockerfile-creando-imagenes-docker/


https://docs.docker.com/engine/docker-overview/#docker-objects


https://pajarokillo.wordpress.com/2016/05/09/instalacion-de-docker-sobre-windows/

## Máquina utilizada para el tutorial ##

- Sistema operativo: **Windows 8.1 Pro 64bits**.
- Memoria: **16 Gb**
- **Docker toolbox** instalado.

## Requisitos previos ##
Aunque vamos a definir los conceptos a lo largo del camino, es bueno que usted entienda, [qué es Docker y por qué lo utilizaría]({{ site.baseurl }}arquitectura/2016/10/04/arquitectura-Introduccion-a-Dockers.html "qué es Docker y por qué lo utilizaría") antes de comenzar.

También debemos asumir que está familiarizado con algunos conceptos antes de continuar:

- Direcciones ***IP y puertos***.
- ***Maquinas virtuales***.
- Edición de ***archivos de configuración***.
- Familiaridad básica con las ideas de ***dependencias de código*** y construcción.
- Términos de uso de ***recursos de la máquina, como porcentajes de CPU, uso de RAM***, etc.


# Cómo utilizar Docker #

Vamos a ver como se trabaja con el ***daemon docker***, invocándolo a través del ***API*** por medio del ***Cli-docker***.



## Docker Engine ##

https://docs.docker.com/engine/docker-overview/#what-can-i-use-docker-for

Es lo que podemos llamar el ***motor del Docker***. ***Docker Engine*** es una aplicación cliente-servidor con estos componentes principales:

- Un servidor que es un tipo de programa de ejecución larga llamado ***proceso daemon***.
 
- Una ***API REST*** que especifica las interfaces que los programas pueden usar para hablar con el daemon e instruirlo qué hacer.
 
- Un ***cliente de interfaz de línea de comandos (CLI).***

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/docker/engine-components-flow.png" alt="job" class="img-thumbnail" style="width: 90%"/>
</div>
<div style="text-align: center;margin: 1em;">
<p>Flujo de componentes del motor Docker</p>
</div>


El ***cliente Docker (CLI)*** utiliza la ***API REST Docker***  para controlar o interactuar con el ***demonio Docker*** a través de scripts o comandos directos de ***CLI***. Muchas otras aplicaciones de ***Docker*** utilizan la ***API*** y la ***CLI*** subyacentes.

***El daemon crea y administra objetos de Docker, como imágenes, contenedores, redes y volúmenes.***



https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started

https://docs.docker.com/get-started/part2/#recap-and-cheat-sheet-optional

http://www.muylinux.com/2016/04/19/tutorial-docker/




## Sintaxis de uso ##

Usar ***docker vía CLI*** consiste en escribir una cadena de opciones y comandos seguidos de argumentos. 

    docker [option] [command] [arguments]

## Comandos del API Docker ##

Comencemos con ver todos los comandos disponibles del ***API docker***.

Solicite a ***docker*** una lista de todos los comandos disponibles:

    docker

He aquí un resumen de los comandos de Docker:

- **attach**: Adjunta a un contenedor corriendo.
- **build**: Construye un contenedor de un archivo Docker.
- **commit**: Crea una nueva imagen de los cambios del contenedor.
- **cp**: Copia archivos/carpetas de los contenedores del sistema de archivos a la ruta de host.
- **create**: Crea un nuevo contenedor.
- **deploy**: Despliega una nueva pila la actualiza si ya existe. 
- **diff**: Inspecciona los cambios en el sistema de archivos de un contenedor.
- **events**: Obtiene eventos en tiempo real desde el servidor.
- **exec**: Ejecuta un comando en contenedor en ejecucion.
- **export**: Transmite el contenido de un contenedor como un archivo tar.
- **history**: Muestra el historial de una imagen.
- **images**: Lista las imágenes.
- **import**: Crea una nueva imagen del sistema de archivos de los contenidos a partir de un archivo tar.
- **info**: Muestra el sistema de información de la pantalla.
- **inspect**: Regresa información de bajo nivel en un contenedor.
- **kill**: Mata a un contenedor en ejecución (corriendo).
- **load**: Carga una imagen desde un archivo tar.
- **login**: Registra la sesión para el servidor de registro de Docker.
- **logout**: Salir de un registro de docker.
- **logs**: Obtiene los registros de un contenedor.
- **pause**: Pausa todos los procesos dentro de uno o más contenedores.
- **port**: Busca el puerto público el cual está NAT-eado y lo hace privado (PRIVATE_PORT).
- **ps**: Lista los Contenedores.
- **pull**: Descarga una imagen o un repositorio del servidor de registros Docker.
- **push**: Empuja una imagen o un repositorio del servidor de registro.Docker.
- **rename**: renombra un contenedor.
- **restart**: Reinicia un contenedor en ejecución (corriendo).
- **rm**: Elimina uno o más contenedores.
- **rmi**: Elimina una o más imágenes.
- **run**: Ejecuta un comando en un contenedor.
- **save**: Guarda una imagen en un archivo tar.
- **search**: Busca una imagen en el índice de Docker.
- **start**: Inicia un contenedor detenido.
- **stats**: Mostrar una transmisión en vivo de estadísticas de uso de recursos de contenedor (es).
- **stop**: Detener uno o más contenedores en funcionamiento.
- **tag**: Etiqueta una imagen en un repositorio.
- **top**: Busca los procesos en ejecución de un contenedor.
- **unpause**: Desactiva la pausa de todos los procesos dentro de uno o más contenedores.
- **update**: Actualizar la configuración de uno o más contenedores.
- **versión**: Muestra la información de versión de Docker.
- **wait**: Bloquear hasta que uno o más contenedores se detengan, luego imprimir sus códigos de salida.






https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started



Para obtener la versión de docker:
    sudo docker version

Compruebe la información de todo el sistema docker
    docker info

## Trabajar con imágenes ##

http://www.muylinux.com/2016/04/19/tutorial-docker/

Como hemos discutido en detalle, la clave para empezar a trabajar con cualquier contenedor de muelle es el uso de imágenes. Hay muchas imágenes libremente disponibles compartidas a través del índice de la imagen del docker y la CLI permite el acceso simple para consultar el repositorio de la imagen y para descargar nuevos.

Cuando esté listo, también puede compartir su imagen allí también. Consulte la sección sobre "empujar" más abajo para obtener más detalles.

Búsqueda de una imagen de docker: *

    # Usage: docker search [image name]
    docker search ubuntu

Esto le proporcionará una lista muy larga de todas las imágenes disponibles que coincidan con la consulta: Ubuntu.

## Descargar (PULLing) una imagen: ##

Ya sea cuando se está creando o creando un contenedor o antes de hacerlo, tendrá que tener una imagen presente en la máquina host donde los contenedores existirán. Con el fin de descargar imágenes (tal vez después de "búsqueda") puede ejecutar tirar para obtener uno.

    # Usage: sudo docker pull [image name]
    sudo docker pull ubuntu

## Listado de imágenes: ##

Todas las imágenes de su sistema, incluidas las que ha creado mediante confirmación (ver más abajo para más detalles), se pueden enumerar usando "imágenes". Esto proporciona una lista completa de todos los disponibles.

    # Example: sudo docker images
    sudo docker images
	
	REPOSITORY  TAG IMAGE IDCREATED VIRTUAL SIZE
	my_img  latest  72461793563e36 seconds ago  128 MB
	ubuntu  12.04   8dbd9e392a968 months ago128 MB
	ubuntu  latest  8dbd9e392a968 months ago128 MB
	ubuntu  precise 8dbd9e392a968 months ago128 MB
	ubuntu  12.10   b750fe79269d8 months ago175.3 MB
	ubuntu  quantal b750fe79269d8 months ago175.3 MB

## Cometer cambios en una imagen: ##

A medida que trabaja con un contenedor y continúa realizando acciones en él (por ejemplo, descargar e instalar software, configurar archivos, etc.), para que mantenga su estado, debe "comprometerse". Cometer se asegura de que todo continúa desde donde se fueron la próxima vez que utilice uno (es decir, una imagen).

    # Usage: sudo docker commit [container ID] [image name]
    sudo docker commit 8dbd9e392a96 my_img

## Compartir imágenes (PUSH): ##

Aunque es un poco temprano en este momento - en nuestro artículo , cuando has creado tu propio contenedor que te gustaría compartir con el resto del mundo, puedes usar push para que tu imagen aparezca en el índice donde todos puedan descargar y use.

Recuerde "confirmar" todos los cambios.

    # Usage: sudo docker push [username/image name]  
    sudo docker push my_username/my_first_image

Nota: Debe registrarse en index.docker.io para enviar imágenes al índice de docker .

## Trabajar con contenedores ##

Cuando "ejecutas" cualquier proceso usando una imagen, a cambio, tendrás un contenedor. Cuando el proceso no se está ejecutando activamente, este contenedor será un contenedor que no se ejecuta . Sin embargo, todos ellos residirán en su sistema hasta que los elimine a través del comando rm .

Listando todos los contenedores actuales:

De forma predeterminada, puede utilizar lo siguiente para enumerar todos los contenedores en ejecución :

    docker ps

Para tener una lista de los contenedores tanto los que se ejecutan como los que no se ejecutan , utilice:

    docker ps -l

## Creación de un nuevo contenedor ##

Actualmente no es posible crear un contenedor sin ejecutar nada (es decir, comandos). Para crear un contenedor nuevo, debe utilizar una imagen base y especificar un comando para ejecutarlo.

    # Usage: sudo docker run [image name] [command to run]
    sudo docker run my_img echo "hello"
    
    # To name a container instead of having long IDs
    # Usage: sudo docker run -name [name] [image name] [comm.]
    sudo docker run -name my_cont_1 my_img echo "hello"

Esto saldrá "hola" y volverá a estar donde estaba. (Es decir, el shell de su anfitrión)

Como no se puede cambiar el comando que se ejecuta después de haber creado un contenedor (por lo tanto, especificando uno durante la "creación"), es práctica común utilizar gestores de procesos e incluso scripts de lanzamiento personalizados para poder ejecutar comandos diferentes.

## Ejecutar un contenedor: ##

Cuando crea un contenedor y se detiene (ya sea debido a su proceso de finalización o detenerlo explícitamente), puede utilizar "ejecutar" para obtener el contenedor de nuevo con el mismo comando utilizado para crearlo.

    # Usage: sudo docker run [container ID]
    sudo docker run c629b7d70666

¿Recuerdas cómo encontrar los contenedores? Véase más arriba la sección de lista de ing ellos.

## Detención de un contenedor: ##

Para detener el proceso de un contenedor:

    # Usage: sudo docker stop [container ID]
    sudo docker stop c629b7d70666

## Ahorro ( confirmación ) de un contenedor: ##

Si desea guardar el progreso y los cambios realizados con un contenedor, puede usar ***"commit"*** como se explicó anteriormente para guardarlo como una imagen .

Este comando convierte su contenedor en una imagen .

Recuerde que con docker, commits son baratos. No dude en utilizarlas para crear imágenes para guardar su progreso con un contenedor o para retroceder cuando lo necesite (por ejemplo, como instantáneas en el tiempo).





***-----------------------------------------------------------------------------------------***








***-----------------------------------------------------------------------------------------***
https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch04-run-container.adoc


***-----------------------------------------------------------------------------------------***

# Contenedor de postgres #

https://www.adictosaltrabajo.com/tutoriales/docker-para-bases-de-datos/

Postgres dispone de un repositorio official dentro de [Docker Hub postgres repo](https://hub.docker.com/_/postgres/ "https://hub.docker.com/_/postgres/") donde podemos encontrar diferentes versiones del gestor.


Se pueden obtener más detalles sobre la imagen mediante el comando:

    docker image history postgres

El funcionamiento de esta imagen difiere de las anteriores, mientras en las imágenes anteriores creábamos un Dockerfile en el que levantabamos la BBDD, ejecutábamos el script de creación generando una imagen con el esquema creado, con postgres, lo único que tenemos que realizar es dejar el archivo sql en un directorio determinado y este se ejecutará cuando arranque el contenedor.


    #############################################################
    # Archivo Dockerfile para ejecutar contenedores postgres
    #############################################################
    
    # Establece la imagen de base a utilizar
    FROM postgres
    
    # Especifica el autor que mantiene la imagen
    MAINTAINER Javier Martín Alonso <javimartinalonso@gmail.com>
    
    # Variables de entorno
    # documentacion oficial 
    # https://hub.docker.com/_/postgres/
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

Una vez tengamos definido el fichero Dockerfile, vamos a construir la imagen:

    docker build . -t jmartin/postgres

Le estamos indicando a docker que construya una imagen con el nombre jmartin/postgres a partir del DockerFile que se encuentra en la misma ruta donde ejecutamos el comando `"."` .

¿Dónde está su imagen construida? Está en el registro local de imagen de Docker de su máquina. Podemos listar las imágenes que tenemos en nuestro equipo para comprobar que la imagen se ha creado correctamente:

    docker images

Podemos comprobar los contenedores que están levantados

    docker ps

Podemos comprobar todos los contenedores independientemente de su estado, estén levantados o no.

    docker ps -a

## Creación de un contenedor ##

Una vez finalizada la construcción de la imagen, ya estamos en disposición de arrancar un contenedor a partir de la imagen que hemos creado:

    docker run --name [nombre del contenedor] -p [puerto de acceso host: puerto expuesto contenedor] -i -t [nombre de imagen]

    docker run --name postgres -p 5433:5432 -d jmartin/postgres

Este comando lo que realiza es levantar un contenedor con los siguientes parámetros:

- ***-d*** : Levanta el contenedor en segundo plano.
- ***-name*** : Nombre asociado al contenedor
- ***-p***: Mapeamos el puerto 5433 de nuestro equipo con el 5432 del contenedor

> ***Nota***: Si un nombre no está establecido, tendremos que tratar con identificaciones alfanuméricas complejas que se pueden obtener enumerando todos los contenedores
>  `docker ps -l.`
>  Cada vez que ejecutamos el comando `run` de ***Docker*** estamos creando un nuevo contenedor, que puede ser listado luego con `ps -a`.

Volvemos a comprobar los contenedores que están levantados



    docker container ps

    docker container inspect d258b6ba0919



Este contenedor al arrancar creará y configurará la instancia de la BBDD (con el nombre asociado a la variable POSTGRES_DB) y ejecutará los scripts que se encuentre en el directorio /docker-entrypoint-initdb.d/ del contenedor

Para acceder al servidor postgres instalado en el contenedor necesitamos conocer la ip del contenedor, pero al usar un Mac (o Windows) y necesitar de un software intermedio, boot2docker, necesitaremos conocer la ip de la máquina virtual (docker-machine) que crea boot2docker.

    docker-machine ip

    javier.martin@PC-MP05RUV MINGW64 ~
    $ docker-machine ip
    192.168.99.100

obtener los nombres e IPs de los contenedores desde el docker machine:

    docker inspect -f '{{.Name}} - {{.NetworkSettings.IPAddress }}' $(docker ps -aq)




Para comprobar que todo ha ido bien vamos a crearnos una conexión con DBeaver tal como muestra la figura (username=admin, password=admin)


Podemos comprobar como esta nuestro esquema creado


## Limitando la memoria para un contenedor ##

Con el fin de limitar la cantidad de memoria de procesos del contenedor Docker que se puede usar, basta con ejecutar `-m [cantidad de memoria]` marcando así el límite.

Para ejecutar un contenedor con memoria limitada a 256 MB:

    # Ejemplo: sudo docker run -name [nombre] -m [Memory (int)][memory unit (b, k, m or g)] -d (para correr no adjuntar) -p (para configurar el acceso y exponer los puertos) [ID de la imagen]
    sudo docker run -name memcached_ins -m 256m -d -p 45001:11211 memcached_img

Para confirmar el límite de memoria, puedes inspeccionar el contenedor:

    # Ejemplo: docker inspect [ID del contenedor] | grep Memory
    sudo docker inspect memcached_ins | grep Memory

Nota: El comando anterior toma la información de la memoria relacionada desde la salida de inspección. Para ver toda la información relevante acerca de tu contenedor, puedes optar por `sudo docker inspect [ID del contenedor]
 Y si necesitamos tener otro postgres ?? Pues nada, instanciamos de nuevo la imagen para crear otro contenedor

    docker run --name postgres2 -p 5434:5432 -d jmartin/postgres  
    
Sólo necesitamos cambiar el nombre y el mapeo de puertos, volvemos a comprobar los contenedores activos … y ahí tenemos nuestros dos contenedores

    docker ps


Podemos parar un contenedor:


    docker stop postgres



Vemos como sólo quedaría activo postgres2, podemos listar los contenedores independientemente de su estado con:

    docker ps -a

## Eliminación / eliminación de un contenedor: ##

Utilizando el ID de un contenedor, puede eliminar uno con rm .

    # Usage: docker rm [container ID]
    docker rm c629b7d70666

Para borrar un contenedor deberíamos ejecutar el siguiente comando

    docker rm postgres	

Hay que tener en cuenta que al borrar un contenedor perderíamos los cambios que hubiésemos realizado en él. Una de las opciones que tendríamos si queremos que los cambios que realicemos al contenedor sean permanentes, sería la de generar una imagen a partir del contenedor, para ello haríamos lo siguiente:


    docker commit -m "<comentario>" -a "<autor>" <id_contenedor> <nombre_imagen>:<etiqueta_imagen>



Con este comando lo que conseguimos es generar una imagen jmartin/postgres construida a partir del contenedor postgres2, si volvemos a listar las imágenes:

***-----------------------------------------------------------------------------------------***

https://docs.docker.com/get-started/part2/#recap-and-cheat-sheet-optional

Aquí hay una lista de los comandos básicos de Docker de esta página, y algunos relacionados si desea explorar un poco antes de seguir adelante.

	docker build -t friendlyname .  # Crea una imagen usando el fichero "dockerfile en la ruta indicada. En este caso ".", el directorio actual, que debe contener el Dockerfile.
	docker run -p 4000:80 friendlyname  # Run "friendlyname" mapping port 4000 to 80
	docker run -d -p 4000:80 friendlyname # Same thing, but in detached mode
	docker ps # See a list of all running containers
	docker stop <hash> # Gracefully stop the specified container
	docker ps -a   # See a list of all containers, even the ones not running
	docker kill <hash>   # Force shutdown of the specified container
	docker rm <hash>  # Remove the specified container from this machine
	docker rm $(docker ps -a -q)   # Remove all containers from this machine
	docker images -a   # Show all images on this machine
	docker rmi <imagename># Remove the specified image from this machine
	docker rmi $(docker images -q) # Remove all images from this machine
	docker login # Log in this CLI session using your Docker credentials
	docker tag <image> username/repository:tag  # Tag <image> for upload to registry
	docker push username/repository:tag# Upload tagged image to registry
	docker run username/repository:tag   # Run image from a registry

















## Referencias ##



[https://docs.docker.com/engine/userguide/](https://docs.docker.com/engine/userguide/ "https://docs.docker.com/engine/userguide/")

[https://docs.docker.com/samples](https://docs.docker.com/samples "https://docs.docker.com/samples")