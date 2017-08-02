---
layout: post
section: "ARQUITECTURA"
title:  "Dockerfile"
date:   2016-10-25
desc: "Dockerfiles son scripts que contienen comandos declarados sucesivamente que serán ejecutados, en el orden dado, por Docker para crear automáticamente una nueva imagen Docker. Estos ayudan en gran medida durante los despliegues.."
keywords: "Dockers, Dockerfile"
categories: [arquitectura]
tags: [Dockers, Dockerfile]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

# Dockerfile #


https://docs.docker.com/get-started/part2/#conclusion-of-part-two


https://www.digitalocean.com/community/tutorials/docker-explicado-como-crear-contenedores-de-docker-corriendo-en-memcached-es

***Dockerfiles*** son scripts que contienen comandos declarados sucesivamente que serán ejecutados, en el orden dado, por ***Docker*** para crear automáticamente una nueva ***imagen Docker***. Estos ayudan en gran medida durante los despliegues.

Los ***contenedores Docker*** se crean utilizando imágenes [base]. Una imagen puede ser básica, con nada más que los fundamentos del sistema operativo, o puede consistir en una sofisticada pila de aplicaciones pre-construida lista para el lanzamiento.

Podemos usar los contenedores disponibles en ***Docker Hub***, donde están disponibles las aplicaciones de bases de datos, servidores de aplicaciones de mútiples lenguages, servidores web más populares y entre otras muchas. Pero también podemos definir nuestras propias imágenes personalizadas con las necesidades que tengamos. Lo que necesitamos es escribir un archivo que contenga la receta para construir la imagen del contenedor, este archivo es el ***Dockerfile***.

Al crear tus imágenes con ***dockerfile***, cada acción tomada (es decir, un comando ejecutado como `apt-get install`) forma una nueva capa encima de la anterior. Estas imágenes de base pueden utilizarse para crear nuevos contenedores.

***Dockerfile*** **definirá lo que sucede en el entorno dentro de su contenedor. El acceso a recursos como interfaces de red y unidades de disco se virtualiza dentro de este entorno, aislado del resto del sistema, por lo que debe asignar los puertos al mundo exterior y especificar qué archivos desea copiar en Ambiente**. Sin embargo, después de hacer eso, puede esperar que la compilación de su aplicación definida en este ***Dockerfile*** se comportará exactamente igual dondequiera que se ejecuta.

## Sintaxis de Dockerfile ##

La sintaxis de ***Dockerfile*** consiste en dos tipos de bloques de líneas principales: comentarios y comandos + argumentos.

    # Line blocks used for commenting
    command argument argument ..

Un ejemplo simple:

    # Print "Hello docker!"
    RUN echo "Hello docker!"

## Información general sobre comandos Dockerfile ##


https://picodotdev.github.io/blog-bitix/2014/11/como-crear-una-imagen-para-docker-usando-un-dockerfile/


- **ADD**: Por medio de este comando podemos copiar archivos dentro de nuestra nueva imagen ya sea desde una URL o desde una carpeta física que se encuentre en nuestra maquina host. El comando `ADD` obtiene dos argumentos: un origen y un destino. Básicamente copia los archivos de de origen en una ruta del host, en el propio sistema de archivos del contenedor en la ruta destino establecido. En muchas ocasiones se utiliza para proporcionar la configuración de los servicios (ssh, mysql, …):

		# Usage: ADD [source directory or URL] [destination directory]
		ADD /my_app_folder /my_app_folder

	> **NOTA**: Ojo, sólo se pueden copiar archivos que se localizan a la misma altura en el filesystem que la carpeta en la que se encuentra el Dockerfile, esto por temas de caché. Si quieren tener un directorio en local y en una imagen de docker, al mismo tiempo que está corriendo, tienen que hacerlo después del paso de crear la imagen con un Dockerfile, cuando inician la máquina.

- **CMD**: Configura comandos por defecto para ser ejecutado durante la compilación (cuando se instancia un contenedor utilizando la imagen que se está construyendo). Este comando es similar al comando RUN con la única diferencia que este no se ejecuta durante la fase de compilación (build) sino que se ejecuta cuando iniciamos el contenedor.

Esta instrucción sirve para ejecutar una acción por defecto en el arranque de un contenedor, si escribes más de una solo se ejecutará la última. Y si al arrancar un contenedor especificas un comando puedes sobrescribir esta instrucción por defecto.



		# Usage 1: CMD application "argument", "argument", ..
		CMD "echo" "Hello docker!"

- **ENTRYPOINT**: Ajusta el punto de entrada por defecto de la aplicación desde el contenedor. El argumento `ENTRYPOINT` establece la aplicación predeterminada concreta que se utiliza cada vez que se crea un contenedor con la imagen. Por ejemplo, si ha instalado una aplicación específica dentro de una imagen y utilizará esta imagen para ejecutar sólo esa aplicación, puede indicarla con `ENTRYPOINT` y cada vez que se cree un contenedor a partir de esa imagen, su aplicación será el destino.

	Si se combina `ENTRYPOINT` con `CMD`, puede quitar "application" de CMD y dejar "argumentos" que se pasarán al ENTRYPOINT.
	
	Ejemplo:

		# Usage: ENTRYPOINT application "argument", "argument", ..
		# Remember: arguments are optional. They can be provided by CMD
		#           or during the creation of a container. 
		ENTRYPOINT echo
		
		# Usage example with CMD:
		# Arguments set with CMD can be overridden during *run*
		CMD "Hello docker!"
		ENTRYPOINT echo  

- **ENV**: El comando `ENV` se utiliza para establecer las variables de entorno. Estas variables consisten en pares **"clave=valor"** que se pueden acceder dentro del contenedor por scripts y aplicaciones por igual. Esta funcionalidad de ***docker*** ofrece una enorme flexibilidad para ejecutar programas.

	Ejemplo:
	
		# Usage: ENV key value
		ENV HOME /root

- **EXPOSE**: El comando `EXPOSE` se utiliza para asociar un puerto especificado para habilitar la conexión en red entre el proceso en ejecución dentro del contenedor y el mundo exterior (es decir, el host). Indica los puertos TCP/IP por los que se pueden acceder a los servicios del contenedor, los típicos son 22 (SSH), 80 (HTTP) y en este caso el puerto por defecto de mysql 3306.

	Ejemplo:
	
		# Usage: EXPOSE [port]
		EXPOSE 8080

- **FROM**: Define la imagen base a utilizar para iniciar el proceso de generación. Puede ser cualquier imagen, incluyendo las que has creado anteriormente. Si no se encuentra una imagen FROM en el host, el ***docker*** intentará encontrarla (y descargarla) desde el índice de imagen de ***docker*** . Debe ser el primer comando declarado dentro de un ***Dockerfile***.

	Ejemplo:
	
		# Usage: FROM [image name]
		FROM ubuntu

- **MAINTAINER**: Establece los datos de autor/propietario del archivo ***Dockerfile***. Este comando se puede establecer en cualquier parte del archivo después del comando FROM.

	Ejemplo:
	
		# Usage: MAINTAINER [name] [e-mail]
		MAINTAINER authors_name authors_email

- **RUN**: Permite ejecutar una instrucción en el contenedor, por ejemplo, para instalar algún paquete mediante el gestor de paquetes (`apt-get, yum, rpm, …`). Ejecuta un comando y cambia (commit) el resultado de la la imagen final (contenedor). A diferencia de CMD, en realidad se utiliza para construir la imagen (formando otra capa encima de la anterior que está comprometida).

	Ejemplo:
	
		# Usage: RUN [command]
		RUN aptitude install -y riak

- **USER**: Establece el usuario (el UID o nombre de usuario) que debe ejecutar los contenedores en función de la imagen que se está construyendo.

	Ejemplo:
	
		# Usage: USER [UID]
		USER 751


- **VOLUMEN**: Monta un directorio desde el host al contenedor, permitiendo el acceso desde su contenedor a un directorio de la máquina host. Establece puntos de montaje que al usar el contenedor se pueden proporcionar, los volúmenes son la forma de externalizar un determinado directorio y proporcionar persistencia (las imágenes de docker son de solo lectura y no almacenan datos entre diferentes ejecuciones).


	Ejemplo:
	
		# Usage: VOLUME ["/dir_1", "/dir_2" ..]
		VOLUME ["/my_files"]

- **WORKDIR**: Establece el directorio para las directivas de CMD que se ejecutarán.

	Ejemplo:
	
		# Usage: WORKDIR /path
		WORKDIR ~/

## Creación del dockerFile ##

Dado que los ***archivos Dockerfile*** son documentos de texto sin formato, puedes crear uno desde tu editor de texto favorito y escribir los comandos que deseas que ***Docker*** ejecute con el fin de construir una imagen. Después de empezar a trabajar en el archivo, continúa con la adición de todo el contenido a continuación (uno tras otro) antes de guardar el resultado final.

Vamos a crear un archivo ***Dockerfile*** vacío utilizando el editor de texto nano:

    nano Dockerfile

Necesitamos tener todas las instrucciones (comandos) y directivas enumeradas sucesivamente. Sin embargo, todo comienza con la construcción de una imagen base (configurado con el comando `FROM`). A partir de ahí, el proceso de construcción se inicia y cada siguiente acción finalizando con commits (guardando el estado de imagen) en el host.

Vamos a definir el propósito de nuestro archivo ***Dockerfile*** y declarar la imagen base para usar:

> **NOTA**: Aunque sea opcional, siempre es una buena práctica permitir que usted y todo el mundo averigüen (cuando sea necesario) qué es este archivo y qué se piensa hacer. Para esto, comenzaremos nuestro ***Dockerfile*** con comentarios decorados con ***#*** para describirlo.

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

Después de tener todo por escrito dentro del archivo ***Dockerfile***, lo guardas y salimos pulsando CTRL+X seguido por Y.

¡Usando este ***Dockerfile***, estamos listos para empezar a trabajar con contenedores Memcached dockerizados!




https://www.adictosaltrabajo.com/tutoriales/docker-for-dummies/


En este ejemplo vamos a crear una imagen con un SO Ubuntu y le vamos a instalar el servidor web Apache, para ello contamos con un ***Dockerfile***:


    FROM ubuntu
    MAINTAINER Jorge Pacheco
    ENV http_proxy http://user:pass@proxy/
    ENV https_proxy http://user:pass@proxy/
    RUN apt-get update
    RUN apt-get install apache2 -y
    RUN echo "<h1>Apache with Docker</h1>" > /var/www/html/index.html
    EXPOSE 80
    ENTRYPOINT apache2ctl -D FOREGROUND	

Vamos a describir los comandos del ***Dockerfile***:

- ***FROM*** : Indica la imagen que tomamos como base, en este caso la imagen oficial de ***ubuntu***
- ***MAINTAINER***: Especifica el autor de la imagen.
- ***ENV***: Definimos una variables de entorno en la imagen base.

    http_proxy http://user:pass@proxy/ — Definimos la variable http_proxy
    https_proxy http://user:pass@proxy/ — Definimos la variable https_proxy
    RUN: Ejecuta una sentencia sobre la imagen base
    
    apt-get update : actualiza los repositorios de ubuntu
    apt-get install apache2 -y : Instala el apache
    echo “<h1>Apache with Docker</h1>” > /var/www/html/index.html : crea un fichero index.html

EXPOSE: Exponemos el puerto 80 del contenedor para que pueda ser mapeado por la máquina anfitrión.

ENTRYPOINT: Indicamos que se ejecute apache2ctl -D FOREGROUND cada vez que arranquemos el contenedor.

Una vez tengamos definido el fichero Dockerfile, vamos a construir la imagen:


`docker build -t jpacheco/apache .` 
 
Le estamos indicando a docker que construya una imagen con el nombre jpacheco/apache a partir del DockerFile que se encuentra en la misma ruta donde ejecutamos el comando



Listamos las imágenes disponibles:

¿Dónde está su imagen construida? Está en el registro local de imagen de Docker de su máquina:

	$ docker images
	
	REPOSITORYTAG IMAGE ID
	friendlyhello latest  326387cea398


Ya estamos en disposición de arrancar un contenedor a partir de la imagen que hemos creado:


    docker run --name apache1 -d -p 90:80 jpacheco/apache

Arrancamos un contenedor, que llamaremos apache1, mapeando el puerto 80 del contenedor (indicado con expose en el docker file) con el 90 de nuestra máquina, a partir de la imagen jpacheco/apache. Para comprobar que todo ha ido bien abrimos un navegador con la url http://192.168.59.103:90/











https://docs.docker.com/get-started/part2/#conclusion-of-part-two




También puede utilizar el curlcomando en un shell para ver el mismo contenido.

$ curl http://localhost:4000

<h3>Hello World!</h3><b>Hostname:</b> 8fc990912a14<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>
Nota : Esta reasignación de puerto 4000:80es para demostrar la diferencia entre lo que usted EXPOSEdentro de Dockerfile, y lo que está publishusando docker run -p. En los pasos posteriores, solo haremos un mapa del puerto 80 en el host al puerto 80 en el contenedor y lo usaremos http://localhost.
Golpee CTRL+Cen su terminal para salir.

Ahora vamos a ejecutar la aplicación en segundo plano, en modo independiente:

docker run -d -p 4000:80 friendlyhello
Obtiene el identificador de contenedor largo para su aplicación y, a continuación, se retroceden a su terminal. Su contenedor se está ejecutando en segundo plano. También puede ver el identificador de contenedor abreviado con docker ps(y ambos funcionan indistintamente al ejecutar comandos):

$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED
1fa4ab2cf395        friendlyhello       "python app.py"     28 seconds ago
Verás que CONTAINER IDcoincide con lo que hay http://localhost:4000.

Ahora usa docker stoppara terminar el proceso, usando el CONTAINER ID, así:

docker stop 1fa4ab2cf395
Comparta su imagen
Para demostrar la portabilidad de lo que acabamos de crear, vamos a subir nuestra imagen construida y ejecutarla en otro lugar. Después de todo, necesitará aprender a enviar a los registros cuando desee implementar contenedores en la producción.

Un registro es una colección de repositorios, y un repositorio es una colección de imágenes, algo así como un repositorio de GitHub, excepto que el código ya está construido. Una cuenta en un registro puede crear muchos repositorios. La dockerCLI utiliza el registro público de Docker de forma predeterminada.

Nota : Usaremos el registro público de Docker solo porque es gratis y preconfigurado, pero hay muchas opciones públicas para elegir, e incluso puedes configurar tu propio registro privado usando Docker Trusted Registry .
Inicie sesión con su Docker ID
Si no tiene una cuenta de Docker, regístrese en uno en cloud.docker.com . Anote su nombre de usuario.

Inicie sesión en el registro público de Docker en su máquina local.

docker login
Etiquetar la imagen
La notación para asociar una imagen local con un repositorio en un registro es username/repository:tag. La etiqueta es opcional, pero recomendada, ya que es el mecanismo que los registros utilizan para dar a las imágenes de Docker una versión. Dé al repositorio y etiquete nombres significativos para el contexto, como get-started:part1. Esto pondrá la imagen en el get-startedrepositorio y la etiquetará como part1.

Ahora, póngalo todo junto para etiquetar la imagen. Ejecutar docker tag imagecon su nombre de usuario, el repositorio y los nombres de las etiquetas para que la imagen se cargue en el destino deseado. La sintaxis del comando es:

docker tag image username/repository:tag
Por ejemplo:

docker tag friendlyhello john/get-started:part1
Ejecutar imágenes de acoplador para ver la imagen recién etiquetada. (También puede usar docker image ls.)

$ docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
friendlyhello            latest              d9e555c53008        3 minutes ago       195MB
john/get-started         part1               d9e555c53008        3 minutes ago       195MB
python                   2.7-slim            1c7128a655f6        5 days ago          183MB
...
Publicar la imagen
Sube tu imagen etiquetada al repositorio:

docker push username/repository:tag
Una vez completados, los resultados de esta subida están disponibles públicamente. Si inicia sesión en Docker Hub , verá la nueva imagen allí, con su comando pull.

Tire y ejecute la imagen desde el repositorio remoto
A partir de ahora, puedes usar docker runy ejecutar tu aplicación en cualquier máquina con este comando:

docker run -p 4000:80 username/repository:tag
Si la imagen no está disponible localmente en la máquina, Docker la extraerá del repositorio.

$ docker run -p 4000:80 john/get-started:part1
Unable to find image 'john/get-started:part1' locally
part1: Pulling from orangesnap/get-started
10a267c67f42: Already exists
f68a39a6a5e4: Already exists
9beaffc0cf19: Already exists
3c1fe835fb6b: Already exists
4c9f1fa8fcb8: Already exists
ee7d8f576a14: Already exists
fbccdcced46e: Already exists
Digest: sha256:0601c866aab2adcc6498200efd0f754037e909e5fd42069adeff72d1e2439068
Status: Downloaded newer image for john/get-started:part1
 * Running on http://0.0.0.0:80/ (Press CTRL+C to quit)
Nota : Si no especifica la :tagparte de estos comandos, :latestse asumirá la etiqueta de , tanto al construir como al ejecutar imágenes. Docker usará la última versión de la imagen que se ejecutó sin una etiqueta especificada (no necesariamente la imagen más reciente).
No importa donde se docker runejecuta, que tira de su imagen, junto con Python y todas las dependencias de requirements.txt, y ejecuta su código. Todo viaja juntos en un pequeño paquete limpio, y la máquina anfitriona no tiene que instalar nada excepto Docker para ejecutarlo.











## Conclusiones ##

Apenas hemos visto la potencia que nos brinda Docker, en posteriores tutoriales iremos viendo casos de uso y adentrándonos en la multitud de posibilidades que nos ofrece: simulación de entornos productivos, desarrollo de microservicios, empaquetamiento de infraestructuras, etc..

Aviso: Crea adicción y acabaremos intentando 'dockerizar' todo … 😉

Un saludo.


2. Entorno

El tutorial está escrito usando el siguiente entorno:

Hardware: MacBook Pro 15' (2.3 GHz Intel Core i7, 16GB DDR3 SDRAM)
Sistema Operativo: Mac OS X Mavericks 10.9.5.
Software: Docker 1.7




***-----------------------------------------------------------------------------------------***



## Referencias ##

[define-a-container-with-a-dockerfile](https://docs.docker.com/get-started/part2/#define-a-container-with-a-dockerfile "define-a-container-with-a-dockerfile")

