---
layout: post
section: "ARQUITECTURA"
title:  "Introducción a Dockers"
date:   2016-10-04
desc: "Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología."
keywords: "Dockers, virtualización, portabilidad,contenedor, maquina_virtual,integración_continua, DevOps"
categories: [arquitectura]
tags: [Dockers, virtualización, portabilidad,contenedor, maquina_virtualintegración_continua, DevOps]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

# ¿Qué es Dockers? #

**[Docker](https://www.docker.com/ "docker")** Es una tecnología que promete revolucionar la informática profesional. Se trata de una tecnología de contenedores, que básicamente consiste en la ejecución de sistemas operativos dentro de otros, obteniendo los sistemas “invitados” su propio sistema de ficheros, su propio espacio de usuarios, sus propios procesos y sus propias interfaces de red, pero compartiendo algunos elementos de la máquina anfitriona como el kernel.

***Docker*** es una herramienta open-source que nos permite realizar una ‘***virtualización ligera***’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología.

Todo esto **permite separar la aplicación de la infraestructura subyacente de aplicaciones y servidores (Sistema operativo, Bases de datos, servidores de aplicaciones…) y centrarse únicamente en su desarrollo y puesta en marcha**. De este modo, podemos reproducir exactamente las mismas condiciones en cuanto a arquitectura en el entorno de desarrollo y en el entorno productivo lo que ademas de facilitar el desarrollo y testeo de la aplicación, nos evitará futuros bugs y defectos relacionados con las mismas.
<!--more -->


Para separar los contenedores entre sí y de la máquina anfitriona, ***Docker*** utiliza las características de aislamiento del kernel Linux. Para ello ***Docker*** extiende ***LXC (LinuX Containers)***, que es un sistema de ***virtualización*** que permite crear múltiples sistemas totalmente aislados entre sí, sobre la misma máquina o sistema anfitrión.. Estos contenedores se crean utilizando imágenes de ***docker***, que pueden crearse ejecutando comandos manualmente o automáticamente a través de ***[Dockerfiles]({{ site.baseurl }}arquitectura/2016/10/25/arquitectura-Dockerfile.html "Dockerfiles")*** . Todo este enfoque permite a los contenedores ser mucho más ligeros que las ***máquinas virtuales***, tanto en espacio en disco como de consumo de recursos. Además su naturaleza les otorga una gran ***portabilidad*** y ***seguridad***. Su principal función es la de poder empaquetar aplicaciones con todas las partes necesarias, incluyendo bibliotecas, dependencias, variables de entorno y archivos de configuración.

**Idea básica es empaquetar en un único bloque todas las dependencias que un aplicación necesita para ejecutarse: binarios, librerías, archivos de configuración, runtime...**

## Piezas principales del Docker ##

- ***Docker daemon***: se utiliza para administrar contenedores ***docker*** ***(LXC)*** en el host que ejecuta.
- ***Docker CLI***: se usa para mandar y comunicarse con el ***daemon docker***.
- ***Docker image index***: un repositorio (público o privado) para imágenes de ***docker***.

## Elementos Docker Principales ##

- ***Dockerfiles***: Scripts que automatizan el proceso de construcción de imágenes.
- ***Imágenes docker***: instantáneas de contenedores o imágenes de base del sistema operativo (por ejemplo, ***Ubuntu***).
- ***Contenedores docker***: Contienen todo-su-aplicación.

Las imágenes en ***Docker*** se podrían ver como un componente estático, pues no son más que un sistema operativo base, con un conjunto de aplicaciones empaquetadas, mientras que un ***contenedor*** es la instanciación o ejecución de una ***imagen***, pudiendo ejecutar varios ***contenedores*** a partir de una misma ***imagen***.

Haciendo una analogía con la ***POO***, el ***dockerfile*** es el fichero con el código que define la clase; una imagen es una clase y un ***contenedor*** es la instanciación de una clase, es decir un objeto.

Vale hasta aquí todo esto está muy bien, pero para entender realmente que es docker, deberemos saber ¿cómo funciona ***dockers***? 

## ¿Cómo funciona dockers? ##

***[Dockerfiles]({{ site.baseurl }}arquitectura/2016/10/25/arquitectura-Dockerfile.html "Dockerfiles")*** son secuencias de comandos que contienen una sucesiva serie de instrucciones, direcciones y comandos que se deben ejecutar para formar una nueva ***imagen de docker***. Cada comando ejecutado se traduce en una nueva capa de la cebolla, formando el producto final. Básicamente reemplazan el proceso de hacer todo manualmente y repetidamente. Cuando se termina de ejecutar un ***Dockerfile*** , se termina formando una imagen, que luego se utiliza para iniciar (es decir, crear) un nuevo ***contenedor***.

***Dockerfile*** definirá lo que sucede en el entorno dentro de su ***contenedor***. El acceso a recursos como interfaces de red y unidades de disco se virtualiza dentro de este entorno, aislado del resto del sistema, por lo que debe asignar los puertos al mundo exterior y especificar qué archivos desea copiar en Ambiente. Sin embargo, después de hacer eso, puede esperar que la compilación de su aplicación definida en este ***Dockerfile*** se comportará exactamente igual dondequiera que se ejecuta.

Las imágenes de ***Docker*** constituyen la base de los ***contenedores docker***, desde los que todo empieza a formarse. Son muy similares a las imágenes predeterminadas del disco del sistema operativo que se utilizan para ejecutar aplicaciones en servidores o computadoras de escritorio.

Tener estas imágenes (por ejemplo, base de ***Ubuntu***) permite la ***portabilidad*** sin problemas a través de los sistemas. Constituyen una base sólida, coherente y confiable con todo lo que se necesita para ejecutar las aplicaciones. Cuando todo es autónomo y se elimina el riesgo de que se eliminen las actualizaciones o modificaciones a nivel del sistema, el ***contenedor*** se vuelve inmune a exposiciones externas que podrían ponerlo fuera de servicio, evitando el infierno de la dependencia .

A medida que se agregan más capas (herramientas, aplicaciones, etc.) encima de la base, pueden formarse nuevas imágenes mediante la confirmación de estos cambios. Cuando un nuevo ***contenedor*** se crea a partir de una imagen guardada (es decir, comprometida), las cosas continúan desde donde lo dejaron. Y el [sistema de archivos de unión](https://es.wikipedia.org/wiki/UnionFS "sistema de archivos de unión"), reúne todas las capas como una sola entidad cuando se trabaja con un contenedor.

Estas ***imágenes*** de base se pueden expresar explícitamente cuando se trabaja con ***docker CLI*** para crear directamente un nuevo ***contenedor*** o pueden especificarse dentro de un ***Dockerfile*** para la creación automatizada de ***imágenes***.

## Dockers para DevOps ##

Permite a los ***DevOps*** resolver problemas comunes como son: ***la instalación, distribución y gestión del software***.

> **NOTA**: ***DevOps*** es un acrónimo inglés de ***development (desarrollo)*** y ***operations (operaciones)***, que se refiere a una cultura o movimiento que se centra en la comunicación, colaboración e integración entre desarrolladores de software y los profesionales en las tecnologías de la información (IT).
> 
- ***DevOps*** es una metodología para creación de software
- ***DevOps*** se basa en la integración entre desarrolladores software y administradores de sistemas.
- ***DevOps*** permite fabricar software más rápidamente, con mayor calidad, menor coste y una altísima frecuencia de releases

***Docker*** es la plataforma líder mundial en contenedores de software. Los desarrolladores utilizan ***Docker*** para eliminar problemas de ***"trabajo en mi máquina"*** al colaborar en código con compañeros de trabajo. Los operadores utilizan ***Docker*** para ejecutar y administrar aplicaciones lado a lado en contenedores aislados para obtener una mejor densidad de cálculo. Las empresas utilizan ***Docker*** para construir tuberías de entrega de software ágiles para enviar nuevas características de forma más rápida, segura y confiable para las aplicaciones de Linux y Windows Server.

***Docker*** automatiza las tareas repetitivas de configurar y configurar entornos de desarrollo para que los desarrolladores puedan concentrarse en lo que importa: ***crear un gran software***.

Los desarrolladores que utilizan ***Docker*** no tienen que instalar y configurar bases de datos complejas ni preocuparse por cambiar entre versiones de herramientas de idioma incompatibles. Cuando una aplicación está acoplada, esa complejidad se introduce en ***contenedores*** que se pueden construir, compartir y ejecutar fácilmente. Integrar un compañero de trabajo a una nueva base de código ya no significa horas dedicadas a instalar el software y explicar los procedimientos de configuración. El código que se envía con ***[Dockerfiles]({{ site.baseurl }}arquitectura/2016/10/25/arquitectura-Dockerfile.html "Dockerfiles")*** es más sencillo de trabajar: Las dependencias se extraen como ***imágenes Docker*** bien empaquetadas y cualquier persona con ***Docker*** y un editor instalado pueden crear y depurar la aplicación en cuestión de minutos.

## Docker vs Máquinas Virtuales ##

Un ***contenedor Docker*** no es una ***máquina virtual***.

La gran diferencia es que una ***máquina virtual*** necesita contener todo el sistema operativo mientras que un ***contenedor Docker*** aprovecha el sistema operativo sobre el cual se ejecuta, comparte el kernel del sistema operativo anfitrión e incluso parte de sus bibliotecas.

En la siguiente imagen podemos ver esta diferencia entre el enfoque de las ***máquinas virtuales*** y el utilizado por ***Docker***:

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

| ***Imágenes virtuales*** | ***Contenedores docker*** |
| :----------: | :----------: |
| Cada imagen se ejecuta en un sistema operativo independiente | Cada ***contenedor*** se ejecuta dentro del mismo kernel del sistema operativo |
| ---------- | ---------- |
| Consumen los recursos del sistema operativo en el que residen más los del propio sistema operativo que contienen | Un ***contenedor*** tiene sus propios ***archivos de sistema*** y ***variables de entorno***, es autosuficiente y ligero pues sólo consume los recursos del ***kernel*** que estrictamente necesita. Se acerca mucho al rendimiento nativo. |
| ---------- | ---------- |
|Respecto al almacenamiento en disco, una máquina virtual puede ocupar varios gigas ya que tiene que contener el sistema operativo completo|los ***contenedores Docker*** sólo contienen aquello que las diferencia del sistema operativo en las que se ejecutan|
| ---------- | ---------- |
|El tiempo de arranque de los servicios es mas lento, debe arrancar el sistema operativo de la imagen, más el tiempo de arranque del servicio |Los ***contenedores docker*** se arrancan en pocos segundos|
| ---------- | ---------- |
||Es fácil de automatizar e implantar en entornos de ***integración continua***|
| ---------- | ---------- |
||Existen multitud de imágenes que pueden descargarse y modificarse libremente.|
| ---------- | ---------- |

## beneficios de docker ##

- Gran rendimiento
- Creación y destrucción rápida
- Reducido tiempo de provisión
- Produce builds portables fáciles de distribuir
- Incluye todas las dependencias, evitando errores en la integración, eliminando ciclos de build-test-deploy
- Son portables, podemos desarrollar software sin preocuparnos en la plataforma en la que se va ejecutar.


## Docker Hub ##

https://hub.docker.com/

es un repositorio de imágenes pre-configuradas listas para usar (en otras palabras un github de imágenes).

Inmutabilidad de los contenedores
docker file, carpetas compartidas





Docker Hub dispone de las imágenes oficiales de postgresql, redis, mysql, ubuntu, rabbitmq, sonarqube, mongodb … además de una multitud de imágenes que los usuarios van creando y subiendo al repositorio.






## Docker para Windows ##

***Docker para Windows*** es una ***aplicación Docker Community Edition (CE)***. El paquete de instalación de Docker para Windows incluye todo lo que necesita para ejecutar Docker en un sistema Windows.

Los requisitos para poder instalar ***Docker para Windows***:

- Versión 64 bits Windows 10 Pro, Enterprise y Educación (actualización 1511 noviembre, Build 10586 o posterior).
- La virtualización debe estar habilitada.

Lo que incluye la instalación de ***Docker para Windows*** : La instalación proporciona ***Docker Engine*** , ***Docker CLI***, ***Docker Compose*** , ***Docker Machine*** y ***Kitematic*** .


## Docker ToolBox ##

Solución de escritorio legacy. Permite instalar y configurar un entorno docker para sistemas Mac y Windows antiguos que no cumplen los requisitos de ***Docker para Mac*** y ***Docker para Windows***. 



## Docker Engine ##


## Docker CLI ##

## Docker Compose ##

***Compose*** es una herramienta para definir opciones de configuración que se aplican en el tiempo de construcción y ejecutar aplicaciones en contenedores multiples de Docker. ***Compose***, utiliza un*** fichero Compose*** para configurar los servicios de su aplicación. Luego, con un solo comando, crea e inicia todos los servicios de su configuración. 

El ***fichero Compose*** **proporciona una forma de documentar y configurar todas las dependencias de servicio de la aplicación (bases de datos, colas, cachés, API de servicio web, etc.)**. Mediante la herramienta de línea de comandos ***Compose*** puede crear e iniciar uno o más contenedores para cada dependencia con un solo comando ( `docker-compose up`).



## Docker Machine ##

## Kitematic ##

Solución de escritorio legacy. Kitematic es una solución heredada, incluida con ***Docker Toolbox***. Su uso ya no es necesario en la aplicación actual ***docker for windows***.

***Kitematic*** es un proyecto de código abierto construido para simplificar y agilizar el uso de Docker en un PC Mac o Windows. ***Kitematic*** automatiza el proceso de instalación y configuración de ***Docker*** y proporciona una interfaz gráfica de usuario intuitiva (GUI) para ejecutar contenedores ***Docker***. ***Kitematic*** se integra con ***Docker Machine*** para suministrar una ***VM VirtualBox***  e instalar el ***Docker Engine*** localmente en su máquina.






## Referencias ##

[https://www.docker.com/](https://www.docker.com/ "https://www.docker.com/")