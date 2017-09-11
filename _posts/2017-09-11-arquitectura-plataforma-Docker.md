---
layout: post
section: "ARQUITECTURA"
title:  "Piezas principales de la plataforma Docker"
date:   2017-09-11
desc: "El ecosistema Docker está formado por una multitud de componentes y herramientas. Aquí intento recoger y dar una pequeña introducción a las más importantes de forma que nos sea más fácil entender Docker."
keywords: "Dockers, virtualización, contenedor, maquina_virtual, Docker-Hub, Docker-for-Windows, Docker-ToolBox, Boot2docker, Docker-Engine, Docker-daemon, Docker-CLI, Docker-Compose, Docker-Machine, cgroups, union-filesystems, Union-Fs, Kitematic"
categories: [arquitectura]
tags: [Dockers, virtualización, contenedor, maquina_virtual, Docker-Hub, Docker-for-Windows, Docker-ToolBox, Boot2docker, Docker-Engine, Docker-daemon, Docker-CLI, Docker-Compose, Docker-Machine, cgroups, union-filesystems, Union-Fs, Kitematic]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

El ecosistema ***Docker*** está formado por una multitud de componentes y herramientas. Aquí intento recoger y dar una pequeña introducción a las más importantes de forma que nos sea más fácil entender ***Docker***.

<!--more-->

## Docker Hub ##

***[Indice de imágenes de docker](https://hub.docker.com/ "https://hub.docker.com/")*** es un [servicio SaaS (Software como un Servicio, del inglés: Software as a Service, SaaS)](https://es.wikipedia.org/wiki/Software_como_servicio "https://es.wikipedia.org/wiki/Software_como_servicio") para compartir y administrar sus pilas de aplicaciones.

Es un ***repositorio de imágenes pre-configuradas*** listas para usar (en otras palabras un ***github*** de imágenes). Un repositorio (público o privado) para imágenes de ***docker***.

El ***registro de imágenes de docker*** es un servicio en el que los usuarios comparten y colaboran en la creación de las imágenes. ***Docker Hub dispone de las imágenes oficiales de postgresql, redis, mysql, ubuntu, rabbitmq, sonarqube, mongodb … además de una multitud de imágenes que los usuarios van creando y subiendo al repositorio.***

Con esta herramienta online de Docker, ***es posible vincular un dockerfile en GitHub a docker hub; pues puede crear las imágenes por ustedes y almacenarlas online. De esta manera, podrán simplemente descargarla a sus servidores.*** Esta puede ser pública o privada, por un pago pequeño al estilo de Github.


## Docker para Windows ##

***Docker para Windows*** es una ***aplicación Docker Community Edition (CE)***. El paquete de instalación de ***Docker para Windows*** incluye todo lo que necesita para ejecutar ***Docker*** en un sistema Windows.

Los requisitos para poder instalar ***Docker para Windows***:

- ***Versión 64 bits Windows 10 Pro, Enterprise y Educación (actualización 1511 noviembre, Build 10586 o posterior).***
- ***La virtualización debe estar habilitada.***


## Docker ToolBox ##

Solución de escritorio legacy. ***Permite instalar y configurar un entorno docker para sistemas Mac y Windows antiguos que no cumplen los requisitos de Docker para Mac y Docker para Windows***. 

La instalación proporciona ***Docker Engine*** , ***Docker CLI***, ***Docker Compose*** , ***Docker Machine***, el ***shell Docker QuickStart*** preconfigurado para un entorno de línea de comandos ***Docker***, ***Kitematic*** y ***Oracle VM VirtualBox*** con una maquina virtual con ***Boot2docker*** .


## Boot2docker ##

***Boot2docker*** **es una distribución ligera de Linux basada en Tiny Core Linux hecha específicamente para ejecutar contenedores Docker**. Funciona completamente desde RAM, pesa unos 40Mb y arranca en unos 5s. Con la instalación de ***Docker ToolBox*** se crea una maquina virtual en el virtualBox con esta distribución y es lo que ***nos permite ejecutar contenedores en un sistema windows o Mac***.


## Docker Engine ##

Es lo que podemos llamar el ***motor del Docker***. ***Docker Engine*** es una aplicación cliente-servidor con estos componentes principales:

- Un servidor que es un tipo de programa de ejecución larga llamado ***proceso daemon***.
 
- Una ***API REST*** que especifica las interfaces que los programas pueden usar para hablar con el ***daemon Docker*** e instruirlo qué hacer.
 
- Un ***cliente de interfaz de línea de comandos (CLI).***

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/docker/engine-components-flow.png" alt="job" class="img-thumbnail" style="width: 40%"/>
</div>
<div style="text-align: center;margin: 1em;">
<p>Flujo de componentes del motor Docker</p>
</div>

***CLI*** utiliza la ***API REST Docker***  para controlar o interactuar con el ***demonio Docker*** a través de scripts o comandos directos de ***CLI***. Muchas otras aplicaciones de ***Docker*** utilizan la ***API*** y la ***CLI*** subyacentes.

***El daemon crea y administra objetos de Docker, como imágenes, contenedores, redes y volúmenes.***


## Docker daemon ##

Se utiliza para administrar ***contenedores docker*** ***(LXC)*** en el host que ejecuta.
 

## Docker CLI ##

El ***cliente Docker (CLI)*** es la principal forma en que muchos usuarios de ***Docker*** interactúan con ***daemon Docker***. Cuando utiliza comandos como `docker run`, el cliente envía estos comandos a ***dockerd daemon***, que los lleva a cabo. El comando `docker` ***utiliza la API de Docker***. ***El cliente Docker*** puede comunicarse con más de un ***daemon***.


## Docker Compose ##

La filosofia de ***docker*** es que cada ***contenedor*** tenga la responsabilidad justa para resolver el servicio que implementa: una bbdd, un servidor de aplicaciones, ... Por tanto un proyecto complejo estará formado por múltiples ***contenedores Docker*** que deben estar orquestados correctamente.

***Docker Compose*** es una herramienta para ***definir opciones de configuración que se aplican en el tiempo de construcción y ejecutar aplicaciones en contenedores multiples de Docker***. ***Docker Compose***, utiliza un un único ***fichero Compose*** para configurar los servicios de su aplicación. Luego, con un solo comando, crea e inicia todos los servicios de su configuración.

El ***fichero Compose*** **proporciona una forma de documentar y configurar todas las dependencias de servicio de la aplicación (bases de datos, colas, cachés, API de servicio web, etc.)**. Mediante la herramienta de línea de comandos ***Compose*** puede crear e iniciar uno o más ***contenedores*** para cada dependencia con un solo comando `docker-compose up`.


## Docker Machine ##

***Docker Machine*** es una herramienta que nos ayuda a crear, configurar y manejar máquinas virtuales con ***Docker Engine***. ***Con Docker Machine podemos iniciar, parar o reiniciar los nodos docker (máquinas virtuales docker), actualizar el cliente o el demonio docker y configurar el cliente docker para acceder a los distintos Docker Engine***. ***El propósito principal del uso de esta herramienta es la de crear máquinas con Docker Engine en sistemas remotos y centralizar su gestión.***.

Las ***docker machines***, máquinas locales (y virtuales) o remotas (como Amazon AWS) ejecutando un ***Docker***. Como cualquier otra máquina, tiene una dirección IP física. Cada ***máquina Docker*** puede gestionar varias ***imágenes*** y ***contenedores***.


## Sistema de archivos de unión (Union FileSystem)##

[Sistema de archivos de unión](https://es.wikipedia.org/wiki/UnionFS "sistema de archivos de unión"), ***reúne todas las capas como una sola entidad cuando se trabaja con un contenedor***.

***Union filesystem*** permite lo que se conoce como acumulación de capas de cambios a través de un mount. Esto viene a ser que distintos sistemas de ficheros pueden montarse, uno por encima de otro, y el resultado es una capa fruto del conjunto de cambios individuales.


## Cgroups ##

Es una funcionalidad del kernel de linux que permite:

- Limitar los recursos que utilizan  grupos de procesos.

- Proveer espacios de nombre o “namespaces” a estos grupos de procesos para las funcionalidades ID, UTS, IPC, Network, User y mount.


## Kitematic ##

Solución de escritorio legacy. Kitematic es una solución heredada, incluida con ***Docker Toolbox***. Su uso ya no es necesario en la aplicación actual ***docker for windows***.

***Kitematic*** es un proyecto de código abierto construido para simplificar y agilizar el uso de ***docker*** en un PC Mac o Windows. ***Kitematic automatiza el proceso de instalación y configuración de Docker y proporciona una interfaz gráfica de usuario intuitiva (GUI) para ejecutar contenedores Docker***. ***Kitematic*** se integra con ***Docker Machine*** para suministrar una ***VM VirtualBox*** e instalar el ***Docker Engine*** localmente en su máquina.


## Referencias ##

[https://www.docker.com/](https://www.docker.com/ "https://www.docker.com/")

[https://hub.docker.com/](https://hub.docker.com/ "https://hub.docker.com/")

[https://www.docker.com/docker-windows](https://www.docker.com/docker-windows "https://www.docker.com/docker-windows")

[https://www.docker.com/products/docker-toolbox](https://www.docker.com/products/docker-toolbox "https://www.docker.com/products/docker-toolbox")

[https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc "https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc")

[https://docs.docker.com/engine/docker-overview/](https://docs.docker.com/engine/docker-overview/ "https://docs.docker.com/engine/docker-overview/")

[https://docs.docker.com/machine/overview/#whats-the-difference-between-docker-engine-and-docker-machine](https://docs.docker.com/machine/overview/#whats-the-difference-between-docker-engine-and-docker-machine "https://docs.docker.com/machine/overview/#whats-the-difference-between-docker-engine-and-docker-machine")

[https://docs.docker.com/compose](https://docs.docker.com/compose "https://docs.docker.com/compose")

[https://docs.docker.com/kitematic](https://docs.docker.com/kitematic "https://docs.docker.com/kitematic")