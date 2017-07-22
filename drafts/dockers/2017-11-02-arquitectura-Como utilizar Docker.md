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

# Cómo utilizar Docker #

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started
https://docs.docker.com/get-started/part2/#recap-and-cheat-sheet-optional
http://www.muylinux.com/2016/04/19/tutorial-docker/

Una vez que tenga docker instalado, su experiencia de uso intuitivo hace que sea muy fácil de trabajar. Por ahora, tendrás el daemon docker ejecutándose en segundo plano. Si no es así, utilice el comando siguiente para ejecutar el daemon docker.

Para ejecutar el daemon de docker:

    sudo docker -d &

## Sintaxis de uso ##

Usar docker (vía CLI) consiste en pasarle una cadena de opciones y comandos seguidos de argumentos. Tenga en cuenta que docker necesita privilegios de sudo para poder trabajar.

    sudo docker [option] [command] [arguments]



> ***Nota***: A continuación se proporcionan instrucciones y explicaciones para ser usadas como una guía y para darle una idea general de usar y trabajar con docker. La mejor manera de familiarizarse con ella es la práctica en un nuevo VPS. No tengas miedo de romper algo, ¡de hecho, rompes cosas! Con docker, puede guardar su progreso y continuar desde allí muy fácilmente.

Comenzando

Comencemos con ver todos los comandos disponibles docker.

Solicite a docker una lista de todos los comandos disponibles:

    sudo docker

Todos los comandos actualmente disponibles (a partir de 0.7.1):

## Comandos de Docker ##

He aquí un resumen actual (versión 0.7.1) de los comandos de Docker:

- **attach**: Adjunta a un contenedor corriendo.
 
- **build**: Construye un contenedor de un archivo Docker.
 
- **commit**: Crea una nueva imagen de los cambios del contenedor.
 
- **cp**: Copia archivos/carpetas de los contenedores del sistema de archivos a la ruta de host.
 
- **diff**: Inspecciona los cambios en el sistema de archivos de un contenedor.
 
- **events**: Obtiene eventos en tiempo real desde el servidor.
 
- **export**: Transmite el contenido de un contenedor como un archivo tar.
 
- **history**: Muestra el historial de una imagen.
 
- **images**: Lista las imágenes.
 
- **import**: Crea una nueva imagen del sistema de archivos de los contenidos a partir de un archivo tar.
 
- **info**: Muestra el sistema de información de la pantalla.
 
- **insert**: Inserta un archivo en una imagen.
 
- **inspect**: Regresa información de bajo nivel en un contenedor.
 
- **kill**: Mata a un contenedor en ejecución (corriendo).
 
- **load**: Carga una imagen desde un archivo tar.
 
- **login**: Registra la sesión para el servidor de registro de Docker.
 
- **logs**: Obtiene los registros de un contenedor.
 
- **port**: Busca el puerto público el cual está NAT-eado y lo hace privado (PRIVATE_PORT).
 
- **ps**: Lista los Contenedores.
 
- **pull**: Descarga una imagen o un repositorio del servidor de registros Docker.
 
- **push**: Empuja una imagen o un repositorio del servidor de registro Docker.
 
- **restart**: Reinicia un contenedor en ejecución (corriendo).
 
- **rm**: Elimina uno o más contenedores.
 
- **rmi**: Elimina una o más imágenes.
 
- **run**: Ejecuta un comando en un contenedor.
 
- **save**: Guarda una imagen en un archivo tar.
 
- **search**: Busca una imagen en el índice de Docker.
 
- **start**: Inicia un contenedor detenido.
 
- **tag**: Etiqueta una imagen en un repositorio.
 
- **top**: Busca los procesos en ejecución de un contenedor.
 
- **versión**: Muestra la información de versión de Docker.






https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-getting-started


Compruebe la información de todo el sistema y la versión docker:

    # For system-wide information on docker:
    sudo docker info
    
    # For docker version:
    sudo docker version

## Trabajar con imágenes ##

http://www.muylinux.com/2016/04/19/tutorial-docker/

Como hemos discutido en detalle, la clave para empezar a trabajar con cualquier contenedor de muelle es el uso de imágenes. Hay muchas imágenes libremente disponibles compartidas a través del índice de la imagen del docker y la CLI permite el acceso simple para consultar el repositorio de la imagen y para descargar nuevos.

Cuando esté listo, también puede compartir su imagen allí también. Consulte la sección sobre "empujar" más abajo para obtener más detalles.

Búsqueda de una imagen de docker: *

    # Usage: sudo docker search [image name]
    sudo docker search ubuntu

Esto le proporcionará una lista muy larga de todas las imágenes disponibles que coincidan con la consulta: Ubuntu .

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

    sudo docker ps

Para tener una lista de las que se ejecutan y las que no se ejecutan , utilice:

    sudo docker ps -l

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

## Eliminación / eliminación de un contenedor: ##

Utilizando el ID de un contenedor, puede eliminar uno con rm .

    # Usage: sudo docker rm [container ID]
    sudo docker rm c629b7d70666

Puede obtener más información sobre Docker leyendo su documentación oficial

Recuerde: Las cosas están progresando muy rápido en docker. El impulso impulsado por la comunidad es increíble y muchas grandes empresas tratan de unirse en la oferta de apoyo. Sin embargo, el producto todavía no está etiquetado como listos para la producción , por lo tanto, no se recomienda para ser 100% fiel en la misión despliegues críticos - todavía . Asegúrese de revisar las salidas a medida que salen y continuar manteniéndose en la cima de todas las cosas docker.

***-----------------------------------------------------------------------------------------***

https://docs.docker.com/get-started/part2/#recap-and-cheat-sheet-optional

Aquí hay una lista de los comandos básicos de Docker de esta página, y algunos relacionados si desea explorar un poco antes de seguir adelante.

	docker build -t friendlyname .  # Create image using this directory's Dockerfile
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
















***-----------------------------------------------------------------------------------------***









https://www.adictosaltrabajo.com/tutoriales/docker-for-dummies/



En este ejemplo vamos a usar la imagen oficial de sonarqube , para crear un contenedor con Sonar instalado



En el repositorio de sonarqube encontraremos información relativa a la imagen y de cómo se usa, más o menos lo que vamos a describir a continuación.

El primer paso sería descargarnos la imagen


    docker pull sonarqube

Podemos listar las imágenes que tenemos en nuestro equipo


    docker images



Una vez tenemos la imagen, ya estamos en disposición de instanciar un contenedor a partir de ella.


    docker run -d --name sonarqube -p 9000:9000 sonarqube


Este comando lo que realiza es levantar un contenedor con los siguientes parámetros:

- ***-d*** : Levanta el contenedor en segundo plano.
- ***-name*** : Nombre asociado al contenedor
- ***-p***: Mapeamos el puerto 9000 de nuestro equipo con el 9000 del contenedor


Podemos comprobar los contenedores que están levantados


    docker ps



Para acceder al sonar instalado en el contenedor nos bastaría con abrir un al navegador con la URL http:/localhost:9000, pero al usar un Mac (o Windows) y necesitar de un software intermedio, boot2docker, necesitaremos conocer la ip de la máquina virtual que crea boot2docker


    boot2docker ip



Ahora ya podemos acceder a nuestro Sonar



Fácil no ?? Y si necesitamos tener otro Sonar ?? Pues nada, instanciamos de nuevo la imagen para crear otro contenedor

`docker run -d --name sonarqube2 -p 7000:9000 sonarqube `   
    
Sólo necesitamos cambiar el nombre y el mapeo de puertos, volvemos a comprobar los contenedores activos … y ahí tenemos nuestros dos contenedores


Podemos acceder al nuevo sonar



Podemos parar un contenedor:


    docker stop sonarqube



Vemos como sólo quedaría activo sonarqube2, podemos listar los contenedores independientemente de su estado con:


    docker ps -a



Para borrar un contenedor deberíamos ejecutar el siguiente comando


    docker rm sonarqube	

Hay que tener en cuenta que al borrar un contenedor perderíamos los cambios que hubiésemos realizado en él. Una de las opciones que tendríamos si queremos que los cambios que realicemos al contenedor sean permanentes, sería la de generar una imagen a partir del contenedor, para ello haríamos lo siguiente:


    docker commit -m "<comentario>" -a "<autor>" <id_contenedor> <nombre_imagen>:<etiqueta_imagen>



Con este comando lo que conseguimos es generar una imagen jpacheco/sonar construida a partir del contenedor sonarqube2, si volvemos a listar las imágenes:










***-----------------------------------------------------------------------------------------***





https://www.digitalocean.com/community/tutorials/docker-explicado-como-crear-contenedores-de-docker-corriendo-en-memcached-es


## Construyendo nuestra primera imagen ##

Para ello usaremos, como explicado antes, el comando docker build. Construiremos una imagen mediante el archivo Dockerfile en la ubicación actual.

    # Ejemplo: sudo docker build -t [nombre] .
    sudo docker build -t memcached_img .


Ahora podemos crear nuestra primera imagen Memcached siguiendo las instrucciones de uso explicadas en la sección de archivos Dockfile básicos.

Ejecuta el siguiente comando para crear una imagen, etiquetandolo como "memcached_img":

    sudo docker build -t memcached_img .

> **NOTA**: No olvides el punto . para que Docker pueda encontrar el archivo Dockerfile.


¿Dónde está su imagen construida? Está en el registro local de imagen de Docker de su máquina:

$ docker images

REPOSITORY            TAG                 IMAGE ID
friendlyhello         latest              326387cea398

## Correr Contenedores dockerised Memcached ##

Utilizando la imagen que tenemos construida, ahora podemos proceder al paso final: crear un contenedor que ejecute una instancia de MongoDB dentro, usando un nombre de nuestra elección (si lo desea con -name [name] ).

Es muy simple crear cualquier número de instancias memcached perfectamente aislados y autónomos - ahora - gracias a la imagen que hemos obtenido en la sección anterior. Todo lo que tenemos que hacer es crear un nuevo contenedor con `docker run`.

## Creación de un contenedor instalado en Memcached ##

Para crear un nuevo contenedor, utiliza el siguiente comando, modificándolo para que se adapte a tus necesidades siguiendo este ejemplo:

    # Ejemplo: sudo docker run -name [nombre del contenedor] -p [puerto de acceso: puerto expuesto] -i -t [nombre de imagen memcached]
    sudo docker run -name memcached_ins -d -p 45001:11211 memcached_img

Ahora tendremos un Docker llamado "memcached_ins", accesible desde el puerto 45001, córrelo ()run) utilizando nuestra imagen etiquetada como "memcached img", que hemos construido con anterioridad.



> ***Nota***: Si un nombre no está establecido, tendremos que tratar con identificaciones alfanuméricas complejas que se pueden obtener enumerando todos los contenedores que usan sudo docker ps -l.

> ***Nota***: Para separarse del contenedor, utilice la secuencia de escape CTRL + P seguida por CTRL + Q.

## Limitando la memoria para un contenedor en Memcached ##

Con el fin de limitar la cantidad de memoria de procesos del contenedor Docker que se puede usar, basta con ejecutar `-m [cantidad de memoria]` marcando así el límite.

Para ejecutar un contenedor con memoria limitada a 256 MB:

    # Ejemplo: sudo docker run -name [nombre] -m [Memory (int)][memory unit (b, k, m or g)] -d (para correr no adjuntar) -p (para configurar el acceso y exponer los puertos) [ID de la imagen]
    sudo docker run -name memcached_ins -m 256m -d -p 45001:11211 memcached_img

Para confirmar el límite de memoria, puedes inspeccionar el contenedor:

    # Ejemplo: docker inspect [ID del contenedor] | grep Memory
    sudo docker inspect memcached_ins | grep Memory

Nota: El comando anterior toma la información de la memoria relacionada desde la salida de inspección. Para ver toda la información relevante acerca de tu contenedor, puedes optar por `sudo docker inspect [ID del contenedor]`.

## Prueba del contenedor en Memcached ##

Para el conjunto completo de instrucciones para instalar y utilizar Docker, revisa la documentación de Docker en docker.io.





***-----------------------------------------------------------------------------------------***

https://www.adictosaltrabajo.com/tutoriales/docker-for-dummies/


En este último apartado vamos a ver como crear una nueva imagen a través de un fichero llamado Dockerfile.

























***-----------------------------------------------------------------------------------------***







## Referencias ##
[maven-introduction-to-profiles](http://maven.apache.org/guides/introduction/introduction-to-profiles.html "maven-introduction-to-profiles")

[spring-introduction-to-profiles](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-profiles.html "spring-introduction-to-profiles")

[Spring-boot-features-external-config](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html "Spring-boot-features-external-config")