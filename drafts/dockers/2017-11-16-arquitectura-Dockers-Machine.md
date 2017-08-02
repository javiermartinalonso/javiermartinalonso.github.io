---
layout: post
section: "ARQUITECTURA"
title:  "Dockers Machine"
date:   2016-11-16
desc: "Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología."
keywords: "Dockers, virtualización, portabilidad,contenedor, maquina_virtual,integración_continua, DevOps"
categories: [arquitectura]
tags: [Dockers, virtualización, portabilidad,contenedor, maquina_virtualintegración_continua, DevOps]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

https://docs.docker.com/machine/overview


Docker Machine Descripción general
Tiempo estimado de lectura: 4 minutos
Puede utilizar Docker Machine para:

Instalar y ejecutar Docker en Mac o Windows
Provisión y administración de múltiples hosts Docker remotos
Clusters Provision Swarm
¿Qué es Docker Machine?
Docker Machine es una herramienta que le permite instalar Docker Engine en hosts virtuales y administrar los hosts con docker-machinecomandos. Puede utilizar Machine para crear hosts Docker en su Mac local o en su caja de Windows, en su red de empresa, en su centro de datos o en proveedores en la nube como Azure, AWS o Digital Ocean.

Utilizando docker-machinecomandos, puede iniciar, inspeccionar, detener y reiniciar un host gestionado, actualizar el cliente y daemon Docker y configurar un cliente Docker para hablar con su host.

Apunte la CLI de la máquina a un host administrado y administrado, y puede ejecutar docker comandos directamente en ese host. Por ejemplo, ejecute docker-machine env defaultpara que apunte a una serie llamada default, siga las instrucciones que aparecen en pantalla para completar envla configuración y gestión docker ps, docker run hello-worldy así sucesivamente.

La máquina era la única manera de ejecutar Docker en Mac o Windows anterior a Docker v1.12. Comenzando con el programa beta y Docker v1.12, Docker para Mac y Docker para Windows están disponibles como aplicaciones nativas y la mejor opción para este caso de uso en nuevos equipos de escritorio y portátiles. Le recomendamos que pruebe estas nuevas aplicaciones. Los instaladores para Docker para Mac y Docker para Windows incluyen Docker Machine, junto con Docker Compose.

Si no está seguro por dónde empezar, consulte Comenzar con Docker , que le guía a través de un breve tutorial de extremo a extremo en Docker.

¿Por qué debo usarlo?
Docker Machine le permite proveer múltiples hosts Docker remotos en varios sabores de Linux.

Además, Machine permite ejecutar Docker en sistemas Mac o Windows más antiguos, como se describe en el tema anterior.

Docker Machine tiene estos dos amplios casos de uso.

Tengo un sistema de escritorio más antiguo y quiero ejecutar Docker en Mac o Windows

Docker Machine en Mac y Windows

Si trabaja principalmente en un ordenador portátil o escritorio de Mac o Windows que no cumple los requisitos para las nuevas aplicaciones Docker para Mac y Docker para Windows , entonces necesita Docker Machine para "ejecutar Docker" (es decir, Docker Engine ) Localmente. La instalación de Docker Machine en un Mac o una caja de Windows con el instalador de Docker Toolbox provee una máquina virtual local con Docker Engine, le da la capacidad de conectarlo y ejecutar dockercomandos.

Quiero proporcionar hosts Docker en sistemas remotos

Docker Machine para la provisión de sistemas múltiples

Docker Engine funciona de forma nativa en sistemas Linux. Si tiene un sistema Linux como su sistema principal y desea ejecutar dockercomandos, todo lo que necesita hacer es descargar e instalar Docker Engine. Sin embargo, si desea una forma eficiente de proporcionar varios hosts Docker en una red, en la nube o incluso localmente, necesita Docker Machine.

Ya sea que su sistema principal sea Mac, Windows o Linux, puede instalar Docker Machine en él y usar docker-machinecomandos para proporcionar y administrar un gran número de hosts Docker. Automáticamente crea hosts, instala Docker Engine en ellos y luego configura los dockerclientes. Cada host gestionado (" máquina ") es la combinación de un host Docker y un cliente configurado.

¿Cuál es la diferencia entre Docker Engine y Docker Machine?
Cuando la gente dice "Docker" normalmente significa Docker Engine , la aplicación cliente-servidor compuesta por el daemon Docker, una API REST que especifica interfaces para interactuar con el daemon y un cliente de interfaz de línea de comandos (CLI) que habla con el daemon (A través del reiniciador REST API). Docker Engine acepta dockercomandos de la CLI, como docker run <image>, docker pspara listar contenedores en ejecución, docker images para listar imágenes, etc.

Motor del Docker

Docker Machine es una herramienta para aprovisionar y administrar sus hosts Dockerized (hosts con Docker Engine en ellos). Normalmente, instala Docker Machine en tu sistema local. Acoplable máquina tiene su propio cliente de línea de comandos docker-machiney el cliente del estibador del motor, docker. Puede utilizar Machine para instalar Docker Engine en uno o más sistemas virtuales. Estos sistemas virtuales pueden ser locales (como cuando se utiliza Machine para instalar y ejecutar Docker Engine en VirtualBox en Mac o Windows) o remota (como cuando se utiliza Machine para proporcionar hosts Dockerized en proveedores de nube). Los anfitriones Dockerized ellos mismos se pueden pensar de, y se refieren a veces, como " máquinas manejadas ".

Docker Machine





https://docs.docker.com/machine/overview
## Referencias ##

[https://www.docker.com/](https://www.docker.com/ "https://www.docker.com/")