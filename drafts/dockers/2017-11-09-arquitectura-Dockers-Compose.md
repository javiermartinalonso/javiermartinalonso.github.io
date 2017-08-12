---
layout: post
section: "ARQUITECTURA"
title:  "Dockers Compose"
date:   2016-11-09
desc: "Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología."
keywords: "Dockers, virtualización, portabilidad,contenedor, maquina_virtual,integración_continua, DevOps"
categories: [arquitectura]
tags: [Dockers, virtualización, portabilidad,contenedor, maquina_virtualintegración_continua, DevOps]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

# Docker Compose #

https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch05-compose.adoc

https://docs.docker.com/compose


## Filosofía ##

- ***Los contenedores debería correr un sólo proceso***. Cada contenedor tenga la responsabilidad justa para resolver el servicio que implementa: una bbdd, un servidor de aplicaciones, ... Por tanto un proyecto complejo estará formado por múltiples contenedores Docker que deben estar orquestados correctamente.


- ***Los contenedores son efímeros***. Eso quiere decir que deberíamos crear y borrar contenedores a nuestro antojos sin problema, por lo tanto data que queremos que sea permanente no debería estar solamente en el contenedor, porque al borrarlo esta data se pierde con él.

Para resolver el punto 2 docker desarrollo algo llamado volúmenes, que es como una especie de disco duro o carpeta dentro del host en dónde esa data es guardada y permanece ahí aunque el contenedor se destruya.


***Docker Compose*** es una herramienta para ***definir opciones de configuración que se aplican en el tiempo de construcción y ejecutar aplicaciones en contenedores multiples de Docker***. ***Docker Compose***, utiliza un un único ***fichero Compose*** para configurar los servicios de su aplicación. Luego, con un solo comando, crea e inicia todos los servicios de su configuración.

El ***fichero Compose*** **proporciona una forma de documentar y configurar todas las dependencias de servicio de la aplicación (bases de datos, colas, cachés, API de servicio web, etc.)**. Mediante la herramienta de línea de comandos ***Compose*** puede crear e iniciar uno o más contenedores para cada dependencia con un solo comando `docker-compose up`.

***Compose*** es ideal para entornos de desarrollo, pruebas y estadificación, así como para flujos de trabajo de CI. Puede obtener más información sobre cada caso en casos de uso común .

El uso de Compose es básicamente un proceso de tres pasos.

- ***Defina el entorno de su aplicación con un Dockerfile*** para que pueda reproducirse en cualquier lugar.

- ***Defina los servicios que componen su aplicación docker-compose.yml*** para que puedan ejecutarse juntos en un entorno aislado.

- Por último, ejecute `docker-compose up` y ***Compose*** iniciará toda la aplicación.

Un `Docker-compose.yml` se parece a esto:

	version: '3'
	services:
	  web:
	build: .
	ports:
	- "5000:5000"
	volumes:
	- .:/code
	- logvolume01:/var/log
	links:
	- redis
	  redis:
	image: redis
	volumes:
	  logvolume01: {}

***Compose*** tiene comandos para administrar todo el ciclo de vida de su aplicación:

- Iniciar, detener y reconstruir servicios.
- Ver el estado de los servicios en ejecución.
- Transmitir la salida de registro de los servicios en ejecución.
- Ejecutar un comando único en un servicio.

## Documentación de Compose ##

- Instalación de Compose
- Empezando
- Comenzar con Django
- Comience con Rails
- Comience con WordPress
- Preguntas frecuentes
- Referencia de línea de comandos
- Redactar referencia de archivo


## Características ##

Las características de ***Compose*** que lo hacen efectivo son:

- Múltiples entornos aislados en un único host.
- Conservar los datos de volumen cuando se crean contenedores.
- Sólo recrea los contenedores que han cambiado.
- Variables y movimiento de una composición entre ambientes.


## Múltiples entornos aislados en un único host ##

***Compose*** utiliza un nombre de proyecto para aislar entornos entre sí. Puede utilizar este nombre de proyecto en varios contextos diferentes:

- En un host de dev, para crear varias copias de un solo entorno (por ejemplo, desea ejecutar una copia estable para cada rama característica de un proyecto).

- En un servidor de CI, para evitar que las compilaciones interfieran entre sí, puede establecer el nombre del proyecto en un número de compilación único.

- En un host compartido o un host de dev, para evitar que los diferentes proyectos, que pueden utilizar los mismos nombres de servicio, interfieran entre sí.

El nombre de proyecto predeterminado es el nombre base del directorio del proyecto. Puede establecer un nombre de proyecto personalizado mediante la opción `-p` de línea de comandos o la COMPOSE_PROJECT_NAME variable de entorno .

## Conservar los datos de volumen cuando se crean contenedores ##

***Compose*** conserva todos los volúmenes utilizados por sus servicios. Cuando se ejecuta `docker-compose up`, si encuentra contenedores de ejecuciones anteriores, copia los volúmenes del contenedor antiguo al nuevo contenedor. Este proceso garantiza que los datos que haya creado en los volúmenes no se pierdan.

Si utiliza docker-compose en una máquina Windows, consulte Variables de entorno y ajuste las variables de entorno necesarias para sus necesidades específicas.

## Sólo recreae los contenedores que han cambiado. ##

***Compose*** guarda en caché la configuración utilizada para crear un contenedor. Cuando reinicia un servicio que no ha cambiado, ***Compose*** vuelve a utilizar los contenedores existentes. Reutilizar contenedores significa que usted puede hacer cambios en su entorno muy rápidamente.

## Variables y movimiento de una composición entre ambientes ##

***Compose*** soporta variables en el archivo ***Compose***. Puede utilizar estas variables para personalizar su composición para diferentes entornos o diferentes usuarios. Consulte Substitución de variables para obtener más detalles.

Puede ampliar un archivo de composición utilizando el campo `extends` o creando varios archivos de composición. Ver se extiende para obtener más detalles.

## Casos de Uso Común ##

***Compose*** se puede utilizar de muchas maneras diferentes. A continuación se describen algunos casos de uso común.

1. ***Entornos de desarrollo***

	Cuando está desarrollando software, la capacidad de ejecutar una aplicación en un entorno aislado e interactuar con ella es crucial. ***La herramienta de línea de comandos Compose*** se puede utilizar para crear el entorno e interactuar con él.
	
	***El archivo Compose proporciona una forma de documentar y configurar todas las dependencias de servicio de la aplicación (bases de datos, colas, cachés, API de servicio web, etc.). Mediante la herramienta de línea de comandos Compose puede crear e iniciar uno o más contenedores para cada dependencia con un solo comando `docker-compose up`.***
	
	Juntas, estas características proporcionan una manera conveniente para que los desarrolladores comiencen un proyecto. Compose puede reducir una "página de inicio del desarrollador" de varias páginas a un solo archivo Compose legible por máquina y unos pocos comandos.

2. ***Entornos de prueba automatizados***

	Una parte importante de cualquier proceso de Integración continua es el conjunto de pruebas automatizado. Las pruebas automatizadas de extremo a extremo requieren un entorno en el que ejecutar pruebas. Compose proporciona una forma conveniente de crear y destruir entornos de prueba aislados para su suite de pruebas. Al definir el entorno completo en un ***archivo de Compose***, puede crear y destruir estos entornos en solo unos pocos comandos:

	    $ docker-compose up -d
	    $ ./run_tests
	    $ docker-compose down

3. ***Implementaciones de host único***

	***Compose*** se ha centrado tradicionalmente en los flujos de trabajo de desarrollo y pruebas, pero con cada lanzamiento estamos avanzando en más funciones orientadas a la producción. Puede utilizar Compose para implementar en un motor Docker remoto. El Docker Engine puede ser una instancia única provista con Docker Machine o un cluster de Docker Swarm entero .

Para obtener más información sobre el uso de funciones orientadas a la producción, consulte Composición en producción en esta documentación.

## Referencias ##

[https://docs.docker.com/compose](https://docs.docker.com/compose "https://docs.docker.com/compose")


[https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch05-compose.adoc](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch05-compose.adoc "https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch05-compose.adoc")

