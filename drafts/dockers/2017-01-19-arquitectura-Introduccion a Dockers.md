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

# ¿Qué es Dockers? #

http://www.muylinux.com/2016/04/19/tutorial-docker/
https://www.youtube.com/playlist?list=PLEtcGQaT56chIpnSavOSvaU2ZGAW7d1vE


**[Docker](https://www.docker.com/ "docker")** Es una tecnología que promete revolucionar la informática profesional. Se trata de una tecnología de contenedores, que básicamente consiste en la ejecución de sistemas operativos dentro de otros, obteniendo los sistemas “invitados” su propio sistema de ficheros, su propio espacio de usuarios, sus propios procesos y sus propias interfaces de red, pero compartiendo algunos elementos de la máquina anfitriona como el kernel.

Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología.

<!--more -->


Para separar los contenedores entre sí y de la máquina anfitriona, Docker utiliza las características de aislamiento del kernel Linux. Para ello Docker extiende ***LXC (LinuX Containers)***, que es un sistema de virtualización que permite crear múltiples sistemas totalmente aislados entre sí, sobre la misma máquina o sistema anfitrión.. Estos contenedores se crean utilizando imágenes de docker, que pueden crearse ejecutando comandos manualmente o automáticamente a través de Dockerfiles. Todo este enfoque permite a los contenedores ser mucho más ligeros que las máquinas virtuales, tanto en espacio en disco como de consumo de recursos. Además su naturaleza les otorga una gran portabilidad y seguridad. Su principal función es la de poder empaquetar aplicaciones con todas las partes necesarias, incluyendo bibliotecas, dependencias, variables de entorno y archivos de configuración.

Idea básica es empaquetar en un único bloque todas las dependencias que un aplicación necesita para ejecutarse: binarios, librerías, archivos de configuración, runtime...

## Piezas principales del Docker ##

- ***Docker daemon***: se utiliza para administrar contenedores docker (LXC) en el host que ejecuta.
- ***Docker CLI***: se usa para mandar y comunicarse con el daemon docker.
- ***Docker image index***: un repositorio (público o privado) para imágenes de docker.

## Elementos Docker Principales ##

- ***Dockerfiles***: Scripts que automatizan el proceso de construcción de imágenes.
- ***Imágenes docker***: instantáneas de contenedores o imágenes de base del sistema operativo (por ejemplo, Ubuntu).
- ***Contenedores docker***: Contienen todo-su-aplicación.

Las imágenes en Docker se podrían ver como un componente estático, pues no son más que un sistema operativo base, con un conjunto de aplicaciones empaquetadas, mientras que un contenedor es la instanciación o ejecución de una imagen, pudiendo ejecutar varios contenedores a partir de una misma imagen.

Haciendo una analogía con la POO, el dockerfile es el fichero con el código que define la clase; una imagen es una clase y un contenedor es la instanciación de una clase, es decir un objeto.

Vale hasta aquí todo esto está muy bien, pero para entender realmente que es docker, deberemos saber ¿cómo funciona dockers? 

## ¿Cómo funciona dockers? ##

Dockerfiles son secuencias de comandos que contienen una sucesiva serie de instrucciones, direcciones y comandos que se deben ejecutar para formar una nueva imagen de docker. Cada comando ejecutado se traduce en una nueva capa de la cebolla, formando el producto final. Básicamente reemplazan el proceso de hacer todo manualmente y repetidamente. Cuando se termina de ejecutar un Dockerfile , se termina formando una imagen, que luego se utiliza para iniciar (es decir, crear) un nuevo contenedor.

Dockerfile definirá lo que sucede en el entorno dentro de su contenedor. El acceso a recursos como interfaces de red y unidades de disco se virtualiza dentro de este entorno, aislado del resto del sistema, por lo que debe asignar los puertos al mundo exterior y especificar qué archivos desea copiar en Ambiente. Sin embargo, después de hacer eso, puede esperar que la compilación de su aplicación definida en esto Dockerfilese comportará exactamente igual dondequiera que se ejecuta.

Las imágenes de Docker constituyen la base de los contenedores docker, desde los que todo empieza a formarse . Son muy similares a las imágenes predeterminadas del disco del sistema operativo que se utilizan para ejecutar aplicaciones en servidores o computadoras de escritorio.

Tener estas imágenes (por ejemplo, base de Ubuntu) permite la portabilidad sin problemas a través de los sistemas. Constituyen una base sólida, coherente y confiable con todo lo que se necesita para ejecutar las aplicaciones. Cuando todo es autónomo y se elimina el riesgo de que se eliminen las actualizaciones o modificaciones a nivel del sistema, el contenedor se vuelve inmune a exposiciones externas que podrían ponerlo fuera de servicio, evitando el infierno de la dependencia .

A medida que se agregan más capas (herramientas, aplicaciones, etc.) encima de la base, pueden formarse nuevas imágenes mediante la confirmación de estos cambios. Cuando un nuevo contenedor se crea a partir de una imagen guardada (es decir, comprometida), las cosas continúan desde donde lo dejaron. Y el [sistema de archivos de unión](https://es.wikipedia.org/wiki/UnionFS "sistema de archivos de unión"), reúne todas las capas como una sola entidad cuando se trabaja con un contenedor.

Estas imágenes de base se pueden expresar explícitamente cuando se trabaja con docker CLI para crear directamente un nuevo contenedor o pueden especificarse dentro de un Dockerfile para la creación automatizada de imágenes.


## Dockers para DevOps ##

Permite a los DevOps resolver problemas comunes como son: la instalación, distribución y gestión del software.


> **NOTA**: DevOps es un acrónimo inglés de development (desarrollo) y operations (operaciones), que se refiere a una cultura o movimiento que se centra en la comunicación, colaboración e integración entre desarrolladores de software y los profesionales en las tecnologías de la información (IT).
> 
- DevOps es una metodología para creación de software
- DevOps se basa en la integración entre desarrolladores software y administradores de sistemas.
- DevOps permite fabricar software más rápidamente, con mayor calidad, menor coste y una altísima frecuencia de releases

Docker es la plataforma líder mundial en contenedores de software. Los desarrolladores utilizan Docker para eliminar problemas de "trabajo en mi máquina" al colaborar en código con compañeros de trabajo. Los operadores utilizan Docker para ejecutar y administrar aplicaciones lado a lado en contenedores aislados para obtener una mejor densidad de cálculo. Las empresas utilizan Docker para construir tuberías de entrega de software ágiles para enviar nuevas características de forma más rápida, segura y confiable para las aplicaciones de Linux y Windows Server.

Docker automatiza las tareas repetitivas de configurar y configurar entornos de desarrollo para que los desarrolladores puedan concentrarse en lo que importa: crear un gran software.

Los desarrolladores que utilizan Docker no tienen que instalar y configurar bases de datos complejas ni preocuparse por cambiar entre versiones de herramientas de idioma incompatibles. Cuando una aplicación está acoplada, esa complejidad se introduce en contenedores que se pueden construir, compartir y ejecutar fácilmente. Integrar un compañero de trabajo a una nueva base de código ya no significa horas dedicadas a instalar el software y explicar los procedimientos de configuración. El código que se envía con Dockerfiles es más sencillo de trabajar: Las dependencias se extraen como imágenes Docker bien empaquetadas y cualquier persona con Docker y un editor instalado pueden crear y depurar la aplicación en cuestión de minutos.

https://www.adictosaltrabajo.com/tutoriales/docker-for-dummies/


## Docker vs Máquinas Virtuales ##

Un contenedor Docker no es una máquina virtual.

La gran diferencia es que una máquina virtual necesita contener todo el sistema operativo mientras que un contenedor Docker aprovecha el sistema operativo sobre el cual se ejecuta, comparte el kernel del sistema operativo anfitrión e incluso parte de sus bibliotecas.

En la siguiente imagen podemos ver esta diferencia entre el enfoque de las máquinas virtuales y el utilizado por Docker:

 <div class="row" style="margin: 1em;">
	<div class="col-lg-6">
		<img src="{{ site.baseurl }}static/img/blog/docker/VM.png" class="img-thumbnail" style="border: none;" alt="Diagrama de la máquina virtual"/>
	</div>	  
	<div class="col-lg-6">
		<img src="{{ site.baseurl }}static/img/blog/docker/Container.png" class="img-thumbnail" style="border: none;" alt="Diagrama del contenedor"/>
	</div>

	<div class="col-lg-6" style="text-align: center;">
		<strong><em>Imágenes virtuales</em></strong>
	</div>	  
	<div class="col-lg-6" style="text-align: center;">
		<strong><em>Contenedores docker</em></strong>
	</div>
</div>




|imágenes virtuales | contenedores docker|
| :----------: | :----------: |
| Cada imagen se ejecuta en un sistema operativo independiente | Cada contenedor se ejecuta dentro del mismo kernel del sistema operativo |
| ---------- | ---------- |
| Consumen los recursos del sistema operativo en el que residen más los del propio sistema operativo que contienen | Un contenedor tiene sus propios archivos de sistema y variables de entorno, es autosuficiente y ligero pues sólo consume los recursos del kernel que estrictamente necesita. Se acerca mucho al rendimiento nativo. |
| ---------- | ---------- |
|Respecto al almacenamiento en disco, una máquina virtual puede ocupar varios gigas ya que tiene que contener el sistema operativo completo|los contenedores Docker sólo contienen aquello que las diferencia del sistema operativo en las que se ejecutan|
| ---------- | ---------- |
|El tiempo de arranque de los servicios es mas lento, debe arrancar el sistema operativo de la imagen, más el tiempo de arranque del servicio |Las instancias se arrancan en pocos segundos|
| ---------- | ---------- |
||Es fácil de automatizar e implantar en entornos de integración continua|
| ---------- | ---------- |
||Existen multitud de imágenes que pueden descargarse y modificarse libremente.|
| ---------- | ---------- |
||Sólo puede usarse de forma nativa en entornos Unix aunque se puede virtualizar gracias a boot2docker tanto en OSX como en Windows.
| ---------- | ---------- |
||Las imágenes sólo pueden estar basadas en versiones de Linux modernas (kernel 3.8 mínimo).|
| ---------- | ---------- |
||Es relativamente nuevo, puede haber errores de código entre versiones|





## beneficios de docker ##

- gran rendimiento
- creación y destrucción rápida
- reducido tiempo de provisión
- produce builds portables fáciles de distribuir
- incluye todas las dependencias, evitando errores en la integración, eliminando ciclos de build-test-deploy
- Son portables, podemos desarrollar software sin preocuparnos en la plataforma en la que se va ejecutar.







## Docker Hub ##

es un repositorio de imágenes pre-configuradas listas para usar (en otras palabras un github de imágenes).

Inmutabilidad de los contenedores
docker file, carpetas compartidas





Docker Hub dispone de las imágenes oficiales de postgresql, redis, mysql, ubuntu, rabbitmq, sonarqube, mongodb … además de una multitud de imágenes que los usuarios van creando y subiendo al repositorio.

En este ejemplo vamos a usar la imagen oficial de sonarqube , para crear un contenedor con Sonar instalado



En el repositorio de sonarqube encontraremos información relativa a la imagen y de cómo se usa, más o menos lo que vamos a describir a continuación.

El primer paso sería descargarnos la imagen


docker pull sonarqube
1
docker pull sonarqube


Podemos listar las imágenes que tenemos en nuestro equipo


docker images
1
docker images


Una vez tenemos la imagen, ya estamos en disposición de instanciar un contenedor a partir de ella.


docker run -d --name sonarqube -p 9000:9000 sonarqube
1
docker run -d --name sonarqube -p 9000:9000 sonarqube
Este comando lo que realiza es levantar un contenedor con los siguientes parámetros:

-d : Levanta el contenedor en segundo plano
–name : Nombre asociado al contenedor
-p: Mapeamos el puerto 9000 de nuestro equipo con el 9000 del contenedor


Podemos comprobar los contenedores que están levantados


docker ps
1
docker ps


Para acceder al sonar instalado en el contenedor nos bastaría con abrir un al navegador con la URL http:/localhost:9000, pero al usar un Mac (o Windows) y necesitar de un software intermedio, boot2docker, necesitaremos conocer la ip de la máquina virtual que crea boot2docker


boot2docker ip
1
boot2docker ip


Ahora ya podemos acceder a nuestro Sonar



Fácil no ?? Y si necesitamos tener otro Sonar ?? Pues nada, instanciamos de nuevo la imagen para crear otro contenedor


docker run -d --name sonarqube2 -p 7000:9000 sonarqube
1
docker run -d --name sonarqube2 -p 7000:9000 sonarqube
Sólo necesitamos cambiar el nombre y el mapeo de puertos, volvemos a comprobar los contenedores activos … y ahí tenemos nuestros dos contenedores



Podemos acceder al nuevo sonar



Podemos parar un contenedor:


docker stop sonarqube
1
docker stop sonarqube


Vemos como sólo quedaría activo sonarqube2, podemos listar los contenedores independientemente de su estado con:


docker ps -a
1
docker ps -a


Para borrar un contenedor deberíamos ejecutar el siguiente comando


docker rm sonarqube	
1
docker rm sonarqube	
Hay que tener en cuenta que al borrar un contenedor perderíamos los cambios que hubiésemos realizado en él. Una de las opciones que tendríamos si queremos que los cambios que realicemos al contenedor sean permanentes, sería la de generar una imagen a partir del contenedor, para ello haríamos lo siguiente:


docker commit -m "<comentario>" -a "<autor>" <id_contenedor> <nombre_imagen>:<etiqueta_imagen>
1
docker commit -m "<comentario>" -a "<autor>" <id_contenedor> <nombre_imagen>:<etiqueta_imagen>


Con este comando lo que conseguimos es generar una imagen jpacheco/sonar construida a partir del contenedor sonarqube2, si volvemos a listar las imágenes:





## Docker ToolBox ##

Permite instalar y configurar un entorno docker.



## Dockerfile ##

https://www.digitalocean.com/community/tutorials/docker-explicado-como-crear-contenedores-de-docker-corriendo-en-memcached-es

Dockerfiles son scripts que contienen comandos declarados sucesivamente que serán ejecutados, en el orden dado, por Docker para crear automáticamente una nueva imagen Docker. Estos ayudan en gran medida durante los despliegues.


Los contenedores Docker se crean utilizando imágenes [base]. Una imagen puede ser básica, con nada más que los fundamentos del sistema operativo, o puede consistir en una sofisticada pila de aplicaciones pre-construida lista para el lanzamiento.

Al crear tus imágenes con dockerfile, cada acción tomada (es decir, un comando ejecutado como apt-get install) forma una nueva capa encima de la anterior. Estas imágenes de base pueden utilizarse para crear nuevos contenedores.

## Sintaxis de Dockerfile ##

La sintaxis de Dockerfile consiste en dos tipos de bloques de líneas principales: comentarios y comandos + argumentos.

    # Line blocks used for commenting
    command argument argument ..

Un ejemplo simple:

    # Print "Hello docker!"
    RUN echo "Hello docker!"

## Información general sobre comandos Dockerfile ##

- **ADD**: Copia un archivo desde el host en el contenedor. El comando ADD obtiene dos argumentos: un origen y un destino. Básicamente copia los archivos de de origen en una ruta del host, en el propio sistema de archivos del contenedor en la ruta destino establecido:

		# Usage: ADD [source directory or URL] [destination directory]
		ADD /my_app_folder /my_app_folder

- **CMD**: Configura comandos por defecto para ser ejecutado durante la compilación (cuando se instancia un contenedor utilizando la imagen que se está construyendo). Podríamos decir que es similar a RUN, pero debe considerarse como un comando inicial, predeterminado que se ejecuta con la creación de contenedores basados ​​en la imagen.

		# Usage 1: CMD application "argument", "argument", ..
		CMD "echo" "Hello docker!"

- **ENTRYPOINT**: Ajusta el punto de entrada por defecto de la aplicación desde el contenedor. El argumento ENTRYPOINT establece la aplicación predeterminada concreta que se utiliza cada vez que se crea un contenedor con la imagen. Por ejemplo, si ha instalado una aplicación específica dentro de una imagen y utilizará esta imagen para ejecutar sólo esa aplicación, puede indicarla con ENTRYPOINT y cada vez que se cree un contenedor a partir de esa imagen, su aplicación será el destino.

	Si se combina ENTRYPOINT con CMD, puede quitar "application" de CMD y dejar "argumentos" que se pasarán al ENTRYPOINT.
	
	Ejemplo:

		# Usage: ENTRYPOINT application "argument", "argument", ..
		# Remember: arguments are optional. They can be provided by CMD
		#           or during the creation of a container. 
		ENTRYPOINT echo
		
		# Usage example with CMD:
		# Arguments set with CMD can be overridden during *run*
		CMD "Hello docker!"
		ENTRYPOINT echo  

- **ENV**: El comando ENV se utiliza para establecer las variables de entorno. Estas variables consisten en pares "clave=valor" que se pueden acceder dentro del contenedor por scripts y aplicaciones por igual. Esta funcionalidad de docker ofrece una enorme flexibilidad para ejecutar programas.

	Ejemplo:
	
		# Usage: ENV key value
		ENV SERVER_WORKS 4

- **EXPOSE**: El comando EXPOSE se utiliza para asociar un puerto especificado para habilitar la conexión en red entre el proceso en ejecución dentro del contenedor y el mundo exterior (es decir, el host).

	Ejemplo:
	
		# Usage: EXPOSE [port]
		EXPOSE 8080

- **FROM**: Define la imagen base a utilizar para iniciar el proceso de generación. Puede ser cualquier imagen, incluyendo las que has creado anteriormente. Si no se encuentra una imagen FROM en el host, el docker intentará encontrarla (y descargarla) desde el índice de imagen de docker . Debe ser el primer comando declarado dentro de un Dockerfile.

	Ejemplo:
	
		# Usage: FROM [image name]
		FROM ubuntu

- **MAINTAINER**: Establece los datos de autor/propietario del archivo Dockerfile. Uno de los comandos que se pueden establecer en cualquier parte del archivo después del comando FROM.

	Ejemplo:
	
		# Usage: MAINTAINER [name]
		MAINTAINER authors_name

- **RUN**: Ejecuta un comando y cambia (commit) el resultado de la la imagen final (contenedor). A diferencia de CMD, en realidad se utiliza para construir la imagen (formando otra capa encima de la anterior que está comprometida).

	Ejemplo:
	
		# Usage: RUN [command]
		RUN aptitude install -y riak

- **USER**: Establece el usuario (el UID o nombre de usuario) que debe ejecutar los contenedores en función de la imagen que se está construyendo.

	Ejemplo:
	
		# Usage: USER [UID]
		USER 751


- **VOLUMEN**: Monta un directorio desde el host al contenedor, permitiendo el acceso desde su contenedor a un directorio de la máquina host.

	Ejemplo:
	
		# Usage: VOLUME ["/dir_1", "/dir_2" ..]
		VOLUME ["/my_files"]

- **WORKDIR**: Establece el directorio para las directivas de CMD que se ejecutarán.

	Ejemplo:
	
		# Usage: WORKDIR /path
		WORKDIR ~/

## Creación del dockerFile ##

Dado que los archivos Dockerfile son documentos de texto sin formato, puedes crear uno desde tu editor de texto favorito y escribir los comandos que deseas que Docker ejecute con el fin de construir una imagen. Después de empezar a trabajar en el archivo, continúa con la adición de todo el contenido a continuación (uno tras otro) antes de guardar el resultado final.

Vamos a crear un archivo Dockerfile vacío utilizando el editor de texto nano:

    nano Dockerfile

Necesitamos tener todas las instrucciones (comandos) y directivas enumeradas sucesivamente. Sin embargo, todo comienza con la construcción de una imagen base (configurado con el comando FROM). A partir de ahí, el proceso de construcción se inicia y cada siguiente acción finalizando con commits (guardando el estado de imagen) en el host.

Vamos a definir el propósito de nuestro archivo Dockerfile y declarar la imagen base para usar:

> **NOTA**: Aunque sea opcional, siempre es una buena práctica permitir que usted y todo el mundo averigüen (cuando sea necesario) qué es este archivo y qué se piensa hacer. Para esto, comenzaremos nuestro Dockerfile con comentarios decorados con ***#*** para describirlo.

    #############################################################
    # Archivo Dockerfile para ejecutar contenedores en Memcached
    # Basado en una imagen de Ubuntu
    #############################################################
    
    # Establece la imagen de base a utilizar para Ubuntu
    FROM ubuntu
    
    # Establece el autor (maintainer) del archivo (tu nombre - el autor del archivo)
    MAINTAINER nombre del autor
    
    # Actualización de la lista de fuentes del repositorio de aplicaciones por defecto
	# Nota: Este paso no es necesario, dado que no estamos usando el repositorio inmediatamente después. 
	# Sin embargo, puede considerarse una buena práctica.
    RUN apt-get update
    
    # Configuración de argumentos y comandos
	# Instalar Memcached
	################## BEGIN INSTALLATION ######################
    RUN apt-get install -y memcached
	##################### INSTALLATION END #####################
    
    # Puerto para exponer la ehecuición del entrypoint (por defecto: 11211)
    EXPOSE 11211
    
    # Establecer el comando de ejecución por defecto y el punto de entrada (es decir demonio Memcached). Comando Memcached por defecto con algunos argumentos
    CMD ["-u", "root", "-m", "128"]
    
    # Establece el usuario para ejecutar el demonio Memcached
    USER daemon
    
    # Establece el punto de entrada para los binarios de Memcached
    ENTRYPOINT memcached

Después de tener todo por escrito dentro del archivo Dockerfile, lo guardas y salimos pulsando CTRL+X seguido por Y.

¡Usando este Dockerfile, estamos listos para empezar a trabajar con contenedores Memcached dockerizados!

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







https://www.adictosaltrabajo.com/tutoriales/docker-for-dummies/


En este último apartado vamos a ver como crear una nueva imagen a través de un fichero llamado Dockerfile.

Un fichero Dockerfile es simplemente un fichero de texto que nos permite definir las instrucciones a seguir por Docker para construir una imagen, en otras palabras es como una receta para crear nuestras imágenes, que servirán de forma posterior para correr nuestros contenedores.

En este ejemplo vamos a crear una imagen con un SO Ubuntu y le vamos a instalar el servidor web Apache, para ello contamos con un Dockerfile:


    FROM ubuntu
    MAINTAINER Jorge Pacheco
    ENV http_proxy http://user:pass@proxy/
    ENV https_proxy http://user:pass@proxy/
    RUN apt-get update
    RUN apt-get install apache2 -y
    RUN echo "<h1>Apache with Docker</h1>" > /var/www/html/index.html
    EXPOSE 80
    ENTRYPOINT apache2ctl -D FOREGROUND	
1
2
3
4
5
6
7
8
9
    FROM ubuntu
    MAINTAINER Jorge Pacheco
    ENV http_proxy http://user:pass@proxy/
    ENV https_proxy http://user:pass@proxy/
    RUN apt-get update
    RUN apt-get install apache2 -y
    RUN echo "<h1>Apache with Docker</h1>" > /var/www/html/index.html
    EXPOSE 80
    ENTRYPOINT apache2ctl -D FOREGROUND	

Vamos a describir los comandos del Dockerfile:

FROM : Indica la imagen que tomamos como base, en este caso la imagen oficial de ubuntu

MAINTAINER: Especifica el autor de la imagen.

ENV: Definimos una variables de entorno en la imagen base.

    http_proxy http://user:pass@proxy/ — Definimos la variable http_proxy
    https_proxy http://user:pass@proxy/ — Definimos la variable https_proxy
    RUN: Ejecuta una sentencia sobre la imagen base
    
    apt-get update : actualiza los repositorios de ubuntu
    apt-get install apache2 -y : Instala el apache
    echo “<h1>Apache with Docker</h1>” > /var/www/html/index.html : crea un fichero index.html

EXPOSE: Exponemos el puerto 80 del contenedor para que pueda ser mapeado por la máquina anfitrión.

ENTRYPOINT: Indicamos que se ejecute apache2ctl -D FOREGROUND cada vez que arranquemos el contenedor.

Una vez tengamos definido el fichero Dockerfile, vamos a construir la imagen:


docker build -t jpacheco/apache . 
1
docker build -t jpacheco/apache . 
Le estamos indicando a docker que construya una imagen con el nombre jpacheco/apache a partir del DockerFile que se encuentra en la misma ruta donde ejecutamos el comando



Listamos las imágenes disponibles:



Ya estamos en disposición de arrancar un contenedor a partir de la imagen que hemos creado:


docker run --name apache1 -d -p 90:80 jpacheco/apache
1
docker run --name apache1 -d -p 90:80 jpacheco/apache
Arrancamos un contenedor, que llamaremos apache1, mapeando el puerto 80 del contenedor con el 90 de nuestra máquina, a partir de la imagen jpacheco/apache. Para comprobar que todo ha ido bien abrimos un navegador con la url http://192.168.59.103:90/





## Conclusiones ##

Apenas hemos visto la potencia que nos brinda Docker, en posteriores tutoriales iremos viendo casos de uso y adentrándonos en la multitud de posibilidades que nos ofrece: simulación de entornos productivos, desarrollo de microservicios, empaquetamiento de infraestructuras, etc..

Aviso: Crea adicción y acabaremos intentando 'dockerizar' todo … 😉

Un saludo.


2. Entorno

El tutorial está escrito usando el siguiente entorno:

Hardware: MacBook Pro 15' (2.3 GHz Intel Core i7, 16GB DDR3 SDRAM)
Sistema Operativo: Mac OS X Mavericks 10.9.5.
Software: Docker 1.7




## Kitematic ##








## Referencias ##
[maven-introduction-to-profiles](http://maven.apache.org/guides/introduction/introduction-to-profiles.html "maven-introduction-to-profiles")

[spring-introduction-to-profiles](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-profiles.html "spring-introduction-to-profiles")

[Spring-boot-features-external-config](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html "Spring-boot-features-external-config")