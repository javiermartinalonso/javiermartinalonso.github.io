---
layout: post
section: "ARQUITECTURA"
title:  "Introducción a Dockers"
date:   2017-01-19
desc: "Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología."
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

Sintaxis de uso:

Usar docker (vía CLI) consiste en pasarle una cadena de opciones y comandos seguidos de argumentos. Tenga en cuenta que docker necesita privilegios de sudo para poder trabajar.

    sudo docker [option] [command] [arguments]

Nota: A continuación se proporcionan instrucciones y explicaciones para ser usadas como una guía y para darle una idea general de usar y trabajar con docker. La mejor manera de familiarizarse con ella es la práctica en un nuevo VPS. No tengas miedo de romper algo, ¡de hecho, rompes cosas! Con docker, puede guardar su progreso y continuar desde allí muy fácilmente.

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

REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
my_img              latest              72461793563e        36 seconds ago      128 MB
ubuntu              12.04               8dbd9e392a96        8 months ago        128 MB
ubuntu              latest              8dbd9e392a96        8 months ago        128 MB
ubuntu              precise             8dbd9e392a96        8 months ago        128 MB
ubuntu              12.10               b750fe79269d        8 months ago        175.3 MB
ubuntu              quantal             b750fe79269d        8 months ago        175.3 MB

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




## Referencias ##
[maven-introduction-to-profiles](http://maven.apache.org/guides/introduction/introduction-to-profiles.html "maven-introduction-to-profiles")

[spring-introduction-to-profiles](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-profiles.html "spring-introduction-to-profiles")

[Spring-boot-features-external-config](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html "Spring-boot-features-external-config")