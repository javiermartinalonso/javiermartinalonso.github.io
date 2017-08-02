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

**[Docker](https://www.docker.com/ "docker")** Es una tecnología que promete revolucionar la informática profesional. Se trata de una tecnología de contenedores, que básicamente consiste en ***la ejecución de sistemas operativos dentro de otros, obteniendo los sistemas “invitados” su propio sistema de ficheros, su propio espacio de usuarios, sus propios procesos y sus propias interfaces de red, pero compartiendo algunos elementos de la máquina anfitriona como el kernel.***

***Docker*** es una herramienta open-source que nos permite realizar una ‘***virtualización ligera***’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología.

Todo esto **permite separar la aplicación de la infraestructura subyacente de aplicaciones y servidores (Sistema operativo, Bases de datos, servidores de aplicaciones…) y centrarse únicamente en su desarrollo y puesta en marcha**. De este modo, podemos reproducir exactamente las mismas condiciones en cuanto a arquitectura en el entorno de desarrollo y en el entorno productivo lo que ademas de facilitar el desarrollo y testeo de la aplicación, nos evitará futuros bugs y defectos relacionados con las mismas.
<!--more -->


Para separar los contenedores entre sí y de la máquina anfitriona, ***Docker*** utiliza las características de aislamiento del kernel Linux. Para ello ***Docker*** extiende ***LXC (LinuX Containers)***, que es un sistema de ***virtualización*** que permite crear múltiples sistemas totalmente aislados entre sí, sobre la misma máquina o sistema anfitrión.. Estos contenedores se crean utilizando imágenes de ***docker***, que pueden crearse ejecutando comandos manualmente o automáticamente a través de ***[Dockerfiles]({{ site.baseurl }}arquitectura/2016/10/25/arquitectura-Dockerfile.html "Dockerfiles")*** . Todo este enfoque permite a los contenedores ser mucho más ligeros que las ***máquinas virtuales***, tanto en espacio en disco como de consumo de recursos. Además su naturaleza les otorga una gran ***portabilidad*** y ***seguridad***. Su principal función es la de poder empaquetar aplicaciones con todas las partes necesarias, incluyendo bibliotecas, dependencias, variables de entorno y archivos de configuración.

**Idea básica es empaquetar en un único bloque todas las dependencias que un aplicación necesita para ejecutarse: binarios, librerías, archivos de configuración, runtime...**

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

***Las imágenes de Docker*** constituyen la base de los ***contenedores docker***, desde los que todo empieza a formarse. Son muy similares a las imágenes predeterminadas del disco del sistema operativo que se utilizan para ejecutar aplicaciones en servidores o computadoras de escritorio.

**Una imagen es una plantilla de sólo lectura con instrucciones para crear un contenedor Docker.** **A menudo, una imagen se basa en otra imagen, con alguna personalización adicional**. Por ejemplo, puede crear una imagen basada en la imagen de ubuntu, pero instala el servidor web Apache y su aplicación, así como los detalles de configuración necesarios para que su aplicación se ejecute.

Puede crear sus propias imágenes o puede utilizar sólo las creadas por otros y publicadas en un registro. Para crear su propia imagen, cree un ***Dockerfile*** con una sintaxis sencilla para definir los pasos necesarios para crear la ***imagen*** y ejecutarla. Cada instrucción en un ***Dockerfile*** crea una capa en la imagen. Cuando cambia el ***Dockerfile*** y reconstruye la imagen, sólo se reconstruyen las capas que han cambiado. Esto es parte de lo que hace que las imágenes sean tan ligeras, pequeñas y rápidas, en comparación con otras tecnologías de virtualización.

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
| Cada imagen se ejecuta en un ***sistema operativo independiente*** | Cada ***contenedor*** se ejecuta ***dentro del mismo kernel del sistema operativo*** |
| ---------- | ---------- |
| Consumen los recursos del sistema operativo en el que residen más los del propio sistema operativo que contienen | Un ***contenedor*** tiene sus propios ***archivos de sistema*** y ***variables de entorno***, es autosuficiente y ligero pues sólo consume los recursos del ***kernel*** que estrictamente necesita. Se acerca mucho al rendimiento nativo. |
| ---------- | ---------- |
| Respecto al almacenamiento en disco, una ***máquina virtual*** puede ocupar varios gigas ya que tiene que contener el sistema operativo completo | Los ***contenedores Docker*** sólo contienen aquello que las diferencia del sistema operativo en las que se ejecutan |
| ---------- | ---------- |
| El tiempo de ***arranque de los servicios es mas lento***, debe arrancar el sistema operativo de la imagen, más el tiempo de arranque del servicio | Los ***contenedores docker*** se arrancan en pocos segundos |
| ---------- | ---------- |
|| Es fácil de automatizar e implantar en entornos de ***integración continua***|
| ---------- | ---------- |
|| Existen multitud de imágenes que pueden descargarse y modificarse libremente.|
| ---------- | ---------- |

## Beneficios de docker ##

- Gran rendimiento
- Creación y destrucción rápida
- Reducido tiempo de provisión
- Produce builds portables fáciles de distribuir
- Incluye todas las dependencias, evitando errores en la integración, eliminando ciclos de build-test-deploy
- Son portables, podemos desarrollar software sin preocuparnos en la plataforma en la que se va ejecutar.



## Piezas principales del Docker ##

## Docker Hub ##

https://hub.docker.com/

servicio SaaS para compartir y administrar sus pilas de aplicaciones.

Es un ***repositorio de imágenes pre-configuradas*** listas para usar (en otras palabras un ***github*** de imágenes). Un repositorio (público o privado) para imágenes de ***docker***.

El registro de imágenes de docker es un servicio en el que los usuarios comparten y colaboran en la creación de las imágenes. ***Docker Hub dispone de las imágenes oficiales de postgresql, redis, mysql, ubuntu, rabbitmq, sonarqube, mongodb … además de una multitud de imágenes que los usuarios van creando y subiendo al repositorio.***

Con esta herramienta online de Docker, ***es posible vincular un dockerfile en GitHub a docker hub; pues puede crear las imágenes por ustedes y almacenarlas online. De esta manera, podrán simplemente descargarla a sus servidores.*** Esta puede ser pública o privada, por un pago pequeño al estilo de Github.


## Docker para Windows ##

***Docker para Windows*** es una ***aplicación Docker Community Edition (CE)***. El paquete de instalación de Docker para Windows incluye todo lo que necesita para ejecutar Docker en un sistema Windows.

Los requisitos para poder instalar ***Docker para Windows***:

- ***Versión 64 bits Windows 10 Pro, Enterprise y Educación (actualización 1511 noviembre, Build 10586 o posterior).***
- ***La virtualización debe estar habilitada.***

## Docker ToolBox ##

Solución de escritorio legacy. Permite instalar y configurar un entorno docker para sistemas Mac y Windows antiguos que no cumplen los requisitos de ***Docker para Mac*** y ***Docker para Windows***. 

Lo que incluye la instalación de ***Docker para Windows*** : La instalación proporciona ***Docker Engine*** , ***Docker CLI***, ***Docker Compose*** , ***Docker Machine***,El ***shell Docker QuickStart*** preconfigurado para un entorno de línea de comandos ***Docker***, ***Oracle VM VirtualBox*** y ***Kitematic*** .

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


***CLI*** utiliza la ***API REST Docker***  para controlar o interactuar con el ***demonio Docker*** a través de scripts o comandos directos de ***CLI***. Muchas otras aplicaciones de ***Docker*** utilizan la ***API*** y la ***CLI*** subyacentes.

***El daemon crea y administra objetos de Docker, como imágenes, contenedores, redes y volúmenes.***

## Docker daemon ##

Se utiliza para administrar contenedores ***docker*** ***(LXC)*** en el host que ejecuta.
 
## Docker CLI ##

El ***cliente Docker (CLI)*** es la principal forma en que muchos usuarios de ***Docker*** interactúan con ***daemon Docker***. Cuando utiliza comandos como `docker run`, el cliente envía estos comandos a ***dockerd daemon***, que los lleva a cabo. El comando `docker` ***utiliza la API de Docker***. ***El cliente Docker*** puede comunicarse con más de un ***daemon***.

## Docker Compose ##

***Compose*** es una herramienta para ***definir opciones de configuración que se aplican en el tiempo de construcción y ejecutar aplicaciones en contenedores multiples de Docker***. ***Compose***, utiliza un ***fichero Compose*** para configurar los servicios de su aplicación. Luego, con un solo comando, crea e inicia todos los servicios de su configuración.

El ***fichero Compose*** **proporciona una forma de documentar y configurar todas las dependencias de servicio de la aplicación (bases de datos, colas, cachés, API de servicio web, etc.)**. Mediante la herramienta de línea de comandos ***Compose*** puede crear e iniciar uno o más contenedores para cada dependencia con un solo comando `docker-compose up`.

***Compose*** es ideal para entornos de desarrollo, pruebas y estadificación, así como para flujos de trabajo de CI. Puede obtener más información sobre cada caso en casos de uso común .

## Docker Machine ##

***Docker Machine*** es una herramienta que nos ayuda a crear, configurar y manejar máquinas virtuales con ***Docker Engine***.*** Con Docker Machine podemos iniciar, parar o reiniciar los nodos docker, actualizar el cliente o el demonio docker y configurar el cliente docker para acceder a los distintos Docker Engine***. ***El propósito principal del uso de esta herramienta es la de crear máquinas con Docker Engine en sistemas remotos y centralizar su gestión.***

## Kitematic ##

Solución de escritorio legacy. Kitematic es una solución heredada, incluida con ***Docker Toolbox***. Su uso ya no es necesario en la aplicación actual ***docker for windows***.

***Kitematic*** es un proyecto de código abierto construido para simplificar y agilizar el uso de Docker en un PC Mac o Windows. ***Kitematic*** automatiza el proceso de instalación y configuración de ***Docker*** y proporciona una interfaz gráfica de usuario intuitiva (GUI) para ejecutar contenedores ***Docker***. ***Kitematic*** se integra con ***Docker Machine*** para suministrar una ***VM VirtualBox***  e instalar el ***Docker Engine*** localmente en su máquina.







## Usos prácticos de Docker en el día a día. ##

https://openwebinars.net/blog/5-usos-practicos-de-Docker-en-el-dia-a-dia/



usar mismo servidor web o de bbdd en distintos proyectos con distintas configuraciones y contenidos pero con una única instalación.
Para un proyecto concreto se necesita unas actualizaciones o modificaciones que afectarían a los otros proyectos.

....



Algunos de los usos más habituales que se le dan a Docker:


1. ***Simplificación de las configuraciones.***

	Una de las ventajas de la virtualización, es que podemos crear una máquina virtual, guardar el/los archivo/s y montarla en otro equipo manteniendo el último estado y la configuración en la parte superior de su estructura.
	
	***Esto mismo hace Docker, pero omitiendo todo el sistema que normalmente tendríamos que generar para poder lanzar el servicio, ocupando menos espacio y tomando muchísimos menos recursos del equipo . Nos permitirá editar un fichero en el que configuramos un entorno que podemos bien desplegar, o bien aplicar a otro contenedor que ya tengamos creado consiguiendo una versatilidad que las máquinas virtuales tradicionales no nos ofrecen.***
	
	El poder implementar aplicaciones o configuraciones a múltiples contenedores en diferentes estructuras (IaaS, PaaS…) es ya posible, y en esto parte del mérito de es grandes empresas como Amazon o Google, compatibilizando sus servicios con la tecnología de Docker, convirtiéndose en aliados esenciales para proyectos de mediana o gran envergadura.


2. ***Gestión de proyectos.***

	Uno de los mayores problemas a los que se enfrentan los equipos de desarrollo, es el tener que trabajar todos bajo el mismo entorno . Cada equipo sobre el que se va a poner a prueba la aplicación o servicio siempre tendrá algo diferente al resto, una actualización de menos (o de más), una librería de la que otros no dispongan, o directamente un sistema operativo u otro.
	
	***Docker hace que el camino desarrollo à producción sea muchísimo más rápido , no teniendo más que desplegar el mismo contenedor todos los desarrolladores o testers, para recibir todos idénticos resultados.***
	
	El caso de una web-app que se alojará en un único servidor es el que mejor nos puede ilustrar. Si durante su desarrollo se prueba en un equipo bajo Linux y en otro gobernado por Windows, los resultados que se pueden obtener no tienen por qué coincidir. Se pueden dar falsos positivos a una situación deseada que luego en producción traerán de cabeza al equipo de desarrollo. La homogeneidad del desarrollo está a un “pull” de distancia, teniendo todos el mismo sistema base y pudiendo comparar resultados de una forma más fiable .


3. ***Aislamiento de Aplicaciones.***

	Tal y como comentábamos antes, Docker ofrecerá el mismo sistema base para desarrollar o testear aplicaciones o servicios. De igual forma es un sistema aislado del sistema anfitrión, por lo que la ejecución de una aplicación en esa máquina no afectará al puesto en el que estamos trabajando .
	
	***Un claro ejemplo de aislamiento de aplicaciones es cuando queremos desplegar dos servidores pero cada uno de ellos tiene diferentes dependencias que causan conflictos con las que necesita el otro. Por ejemplo: las aplicaciones de un servidor necesitan ejecutarse sobre java 7 y en el otro sobre java8. Desplegando cada servidor en contenedores distintos, solventamos este problema de forma fácil, pudiendo aislar los servidores y sus dependencias de posibles errores por dichos conflictos.***


4. ***Ahorro de costes en servidores.***

	De igual forma en la que creamos imágenes de sistemas para virtualizar equipos que desplegar para trabajar, ***podemos generar contenedores que desplieguen un servidor sobre el que ejecutar servicios .***
	
	Virtualizando estos servidores con Docker, el ahorro en hardware y el aprovechamiento o rendimiento del existente será considerable , sin un consumo de memoria tan alto y con la capacidad de gestionar más eficientemente la memoria disponible entre los servicios que lo requieran; a diferencia de las máquinas virtuales tradicionales que acapararán parte de esa memoria para desplegar el sistema de virtualización sobre el que irá el servidor que queramos virtualizar.


5. ***Control de versiones y Depuración.***

	***Una de las características de Docker que normalmente no se engloba en virtualización, es el sistema de control de versiones que nos ofrece , pudiendo regresar a la versión que queramos en caso de necesitarlo.***
	
	***Puesto que Docker funciona en tantas plataformas, es fácil mover sus aplicaciones de entornos. Puede mover fácilmente una aplicación de un entorno de prueba a la nube y viceversa siempre que lo necesite.***

	Muy útil por ejemplo en el caso de un servidor web , donde tras una actualización de seguridad nos hemos dejado una abertura por la que nos han tirado el servicio . Cerramos el contenedor, regresamos a una versión anterior y lo ponemos de nuevo en producción. Desplegamos otro contenedor aislado y trabajamos en la actualización de seguridad corrigiendo el error explotado para tirar el servicio. Una vez lo hemos resuelto, no tenemos más que volver a desplegar el contenedor corregido en el entorno de producción . Esto último es cuestión de minutos , contando así con cortes de servicio mínimos para la corrección de errores o implementación de novedades.


6. ***Aplicaciones multiusuario.***

	A la hora de gestionar una aplicación que ejecute diferentes niveles en función de cada usuario, podemos encontrarnos con más de un quebradero de cabeza en lo que se refiere a permisos, uso de recursos, limitaciones, etc… Montar la arquitectura de este tipo de aplicaciones suele llevar bastante tiempo, que se podría dedicar a otro proyecto o a otro apartado, en definitiva, tiempo que es igual a dinero.
	
	***Docker aporta un nuevo nivel de ejecución, pudiendo contener imágenes con diferentes permisos prestablecidos, distintos usos de recursos o limitaciones, en contenedores aislados; asignando así a un usuario determinado la imagen correspondiente , sin tener que preocuparnos el que vaya a acceder donde no deba o a usar servicios que no le corresponden, porque recordemos, los contenedores Docker son sistemas aislados.***

7. ***Escalar más facilmente***

	Los contenedores ligeros de Docker también hacen escala y bajada rápida y sencilla. Puede lanzar rápidamente más contenedores cuando sea necesario y luego apagarlos fácilmente cuando ya no se necesiten.

Estos son sólo algunos ejemplos prácticos en los que Docker facilita el desarrollo, testeo, implementación, sistema de trabajo o gestión de recursos y usuarios; ahorrando tiempo al desarrollador o la empresa y economizando los proyectos en los que se aplique.

## Referencias ##

[https://www.docker.com/](https://www.docker.com/ "https://www.docker.com/")