---
layout: post
section: "ARQUITECTURA"
title:  "Introducción a Dockers"
date:   2017-09-04
desc: "Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología. Docker le permite obtener su código probado y desplegado en producción lo más rápido posible"
keywords: "Dockers, virtualización, portabilidad, contenedor, maquina_virtual, integración_continua, DevOps"
categories: [arquitectura]
tags: [Dockers, virtualización, portabilidad,contenedor, maquina_virtual, integración_continua, DevOps]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

# ¿Qué es Dockers? #

***[Docker](https://www.docker.com/ "docker")*** es la plataforma líder mundial en contenedores de software. ***Docker*** es una tecnología que promete revolucionar la informática profesional. Se trata de una tecnología de contenedores, que básicamente consiste en ***la ejecución de sistemas operativos dentro de otros, obteniendo los sistemas “invitados” su propio sistema de ficheros, su propio espacio de usuarios, sus propios procesos y sus propias interfaces de red, pero compartiendo sólo los elementos necesarios de la máquina anfitriona como puede ser el kernel.***

***Docker*** es una herramienta open-source que nos permite realizar una ‘***virtualización ligera***’, con la que ***poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología***.

Todo esto **permite separar la aplicación de la infraestructura subyacente de aplicaciones y servidores (Sistema operativo, Bases de datos, servidores de aplicaciones…) y centrarse únicamente en su desarrollo y puesta en marcha**. De este modo, podemos reproducir exactamente las mismas condiciones en cuanto a arquitectura en el entorno de desarrollo y en el entorno productivo lo que ademas de facilitar el desarrollo y testeo de la aplicación, nos evitará futuros bugs y defectos relacionados con las mismas.
***Docker le permite obtener su código probado y desplegado en producción lo más rápido posible***.
<!--more-->

Para separar los contenedores entre sí y de la máquina anfitriona, ***Docker*** utiliza las características de aislamiento del kernel Linux. Para ello ***Docker*** extiende ***LXC (LinuX Containers)***, que es un sistema de ***virtualización*** que permite crear múltiples sistemas totalmente aislados entre sí, sobre la misma máquina o sistema anfitrión.. Estos contenedores se crean utilizando imágenes de ***docker***, que pueden crearse ejecutando comandos manualmente o automáticamente a través de ***[Dockerfiles]({{ site.baseurl }}arquitectura/2017/09/25/arquitectura-Dockerfile.html "Dockerfiles")*** . Todo este enfoque permite a los contenedores ser mucho más ligeros que las ***máquinas virtuales***, tanto en espacio en disco como de consumo de recursos. Además su naturaleza les otorga una gran ***portabilidad*** y ***seguridad***.

**Idea básica es empaquetar en un único bloque todas las dependencias que un aplicación necesita para ejecutarse: binarios, librerías, archivos de configuración, runtime...**

## Dockers para DevOps ##

Permite a los ***DevOps*** resolver problemas comunes como son: ***la instalación, distribución y gestión del software***.

> **NOTA**: ***DevOps*** es un acrónimo inglés de ***development (desarrollo)*** y ***operations (operaciones)***, que se refiere a una cultura o movimiento que se centra en la comunicación, colaboración e integración entre desarrolladores de software y los profesionales en las tecnologías de la información (IT).
> 
- ***DevOps*** es una metodología para creación de software
- ***DevOps*** se basa en la integración entre desarrolladores software y administradores de sistemas.
- ***DevOps*** permite fabricar software más rápidamente, con mayor calidad, menor coste y una altísima frecuencia de releases

Los desarrolladores utilizan ***Docker*** para eliminar problemas de ***"trabajo en mi máquina"*** al colaborar en código con compañeros de trabajo. Los operadores utilizan ***Docker*** para ejecutar y administrar aplicaciones lado a lado en contenedores aislados para obtener una mejor densidad de cálculo. Las empresas utilizan ***Docker*** para construir tuberías de entrega de software ágiles para enviar nuevas características de forma más rápida, segura y confiable para las aplicaciones de Linux y Windows Server.

***Docker*** automatiza las tareas repetitivas de configurar y configurar entornos de desarrollo para que los desarrolladores puedan concentrarse en lo que importa: ***crear un gran software***.

Los desarrolladores que utilizan ***Docker*** no tienen que instalar y configurar bases de datos complejas ni preocuparse por cambiar entre versiones de herramientas de idioma incompatibles. Cuando una aplicación está acoplada, esa complejidad se introduce en ***contenedores*** que se pueden construir, compartir y ejecutar fácilmente. Integrar un compañero de trabajo a una nueva base de código ya no significa horas dedicadas a instalar el software y explicar los procedimientos de configuración. El código que se envía con ***[Dockerfiles]({{ site.baseurl }}arquitectura/2017/09/25/arquitectura-Dockerfile.html "Dockerfiles")*** es más sencillo de trabajar: Las dependencias se extraen como ***imágenes Docker*** bien empaquetadas y cualquier persona con ***Docker*** y un editor instalado pueden crear y depurar la aplicación en cuestión de minutos.

## ¿Cómo funciona dockers? ##

Sin entrar en muchos detalles acerca de ***imágenes***, ***directorios***, ***contenedores***, ***volúmenes***, etc. vamos a tratar de sintetizar un poco ***cómo se fundamenta la arquitectura de docker***.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/docker/arquitectura_docker.png" alt="Arquitectura plataforma Docker" class="img-thumbnail" style="width: 40%"/>
</div>
<div style="text-align: center;margin: 1em;">
<p>Arquitectura plataforma Docker</p>
</div>

***En una primera capa encontramos el sistema operativo***, aquí es dónde se ejecuta el ***componente principal de Docker, el demonio o proceso principal (Docker Daemon)***. El sistema operativo debe de estar basado en el Kernel de Linux 3.10 como mínimo. Es por ello que si vamos a trabajar con ***Docker*** desde windows, necesitaremos una máquina virtual dónde ejecutar este sistema operativo, pero eso lo veremos más adelante (***Boot2docker***).

En una ***siguiente capa encontramos las imágenes***. Éstas ***son plantillas de solo lectura que pueden contener el sistema operativo, el servidor de aplicaciones, etc. Una imagen puede basarse en otra imagen y añadir un componente más, de esta forma, las imágenes se van apilando hasta conseguir los componentes necesarios***. Hay un directorio público que contiene infinidad de imágenes, con lo que es posible que alguien ya haya creado una imagen que necesitemos (***[índice de imágenes de docker](https://hub.docker.com/ "https://hub.docker.com/")***).

Finalmente, en la ***última capa encontramos el contenedor***. ***Aquí se agrupa todo lo necesario para que pueda ejecutarse la aplicación. Cada contenedor se crea a partir de una imagen. Cada contenedor es un entorno aislado y seguro dónde ejecutar la aplicación, por lo que en general se recomienda ejecutar cada proceso en un contenedor distinto***.


## Elementos Docker Principales ##

Como acabamos de ver los principales elementos de la plataforma ***Docker*** son:

- ***Registro*** : Es el componente "distribuidor". Es el almacén, público y/o privado, donde se guardan las imágenes. El repositorio oficial es el ***[índice de imágenes de docker](https://hub.docker.com/ "https://hub.docker.com/")***.

- ***Imágenes docker***: instantáneas de contenedores o imágenes de base del sistema operativo (por ejemplo, ***Ubuntu***).

- ***Contenedores docker***: Contienen toda su aplicación con las dependencias de librerías y software que necesita. Son muy ligeros y aislados, ya que se ejecutan en un único proceso Linux. Los contenedores se pueden ejecutar, iniciar, detener, mover y eliminar.

El registro es el repositorio donde se guardan las imágenes.

Las imágenes en ***Docker*** se podrían ver como un componente estático, pues no son más que un sistema operativo base, con un conjunto de aplicaciones empaquetadas, mientras que un ***contenedor*** es la instanciación o ejecución de una ***imagen***, pudiendo ejecutar varios ***contenedores*** a partir de una misma ***imagen***.

Las imágenes también se pueden crear a través de otras imágenes por medio de  ***Dockerfiles***: Scripts que automatizan el proceso de construcción de imágenes.

Haciendo una analogía con la ***POO***, el ***dockerfile*** es el fichero con el código que define la clase; una imagen es una clase y un ***contenedor*** es la instanciación de una clase, es decir un objeto.


## Docker vs Máquinas Virtuales ##

Un ***contenedor Docker*** no es una ***máquina virtual***.

La gran diferencia es que una ***máquina virtual*** necesita contener todo el sistema operativo mientras que un ***contenedor Docker*** aprovecha el sistema operativo sobre el cual se ejecuta, comparte el kernel del sistema operativo anfitrión e incluso parte de sus bibliotecas.

En la siguiente imagen podemos ver esta diferencia entre el enfoque de las ***máquinas virtuales*** y el utilizado por ***Docker***:

 <div class="container" style="margin: 1em;">
	<div>
		<div class="col-lg-6">
			<img src="{{ site.baseurl }}static/img/blog/docker/VM.png" class="img-thumbnail" style="border: none;" alt="Diagrama de la máquina virtual"/>
		</div>	  
		<div class="col-lg-6">
			<img src="{{ site.baseurl }}static/img/blog/docker/Container.png" class="img-thumbnail" style="border: none;" alt="Diagrama del contenedor"/>
		</div>
	</div>
	<div>
		<div class="col-lg-6" style="text-align: center;">
			<strong><em>Imágenes virtuales</em></strong>
		</div>	  
		<div class="col-lg-6" style="text-align: center;">
			<strong><em>Contenedores docker</em></strong>
		</div>
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

- Gran rendimiento.
- Creación y destrucción rápida.
- Reducido tiempo de provisión.
- Produce builds portables fáciles de distribuir.
- Incluye todas las dependencias, evitando errores en la integración, eliminando ciclos de build-test-deploy.
- Son portables, podemos desarrollar software sin preocuparnos en la plataforma en la que se va ejecutar.


## Usos prácticos de Docker en el día a día. ##

Algunos de los usos más habituales que se le dan a ***Docker***:

1. ***Simplificación de las configuraciones.***

	Una de las ventajas de la virtualización, es que podemos crear una máquina virtual, guardar el/los archivo/s y montarla en otro equipo manteniendo el último estado y la configuración en la parte superior de su estructura.
	
	***Esto mismo hace Docker, pero omitiendo todo el sistema que normalmente tendríamos que generar para poder lanzar el servicio, ocupando menos espacio y tomando muchísimos menos recursos del equipo . Nos permitirá editar un fichero en el que configuramos un entorno que podemos bien desplegar, o bien aplicar a otro contenedor que ya tengamos creado consiguiendo una versatilidad que las máquinas virtuales tradicionales no nos ofrecen.***
	
	El poder implementar aplicaciones o configuraciones a múltiples contenedores en diferentes estructuras (IaaS, PaaS…) es ya posible, y en esto parte del mérito de es grandes empresas como Amazon o Google, compatibilizando sus servicios con la tecnología de ***Docker***, convirtiéndose en aliados esenciales para proyectos de mediana o gran envergadura.

2. ***Gestión de proyectos.***

	Uno de los mayores problemas a los que se enfrentan los equipos de desarrollo, es el tener que trabajar todos bajo el mismo entorno . Cada equipo sobre el que se va a poner a prueba la aplicación o servicio siempre tendrá algo diferente al resto, una actualización de menos (o de más), una librería de la que otros no dispongan, o directamente un sistema operativo u otro.
	
	***Docker hace que el camino de desarrollo a producción sea muchísimo más rápido , no teniendo más que desplegar el mismo contenedor todos los desarrolladores o testers, para recibir todos idénticos resultados.***
	
	El caso de una web-app que se alojará en un único servidor es el que mejor nos puede ilustrar. Si durante su desarrollo se prueba en un equipo bajo Linux y en otro gobernado por Windows, los resultados que se pueden obtener no tienen por qué coincidir. Se pueden dar falsos positivos a una situación deseada que luego en producción traerán de cabeza al equipo de desarrollo. La homogeneidad del desarrollo está a un “pull” de distancia, teniendo todos el mismo sistema base y pudiendo comparar resultados de una forma más fiable .

3. ***Aislamiento de Aplicaciones.***

	Tal y como comentábamos antes, ***Docker*** ofrecerá el mismo sistema base para desarrollar o testear aplicaciones o servicios. De igual forma es un sistema aislado del sistema anfitrión, por lo que la ejecución de una aplicación en esa máquina no afectará al puesto en el que estamos trabajando .
	
	***Un claro ejemplo de aislamiento de aplicaciones es cuando queremos desplegar dos servidores pero cada uno de ellos tiene diferentes dependencias que causan conflictos con las que necesita el otro. Por ejemplo: las aplicaciones de un servidor necesitan ejecutarse sobre java 7 y en el otro sobre java8. Desplegando cada servidor en contenedores distintos, solventamos este problema de forma fácil, pudiendo aislar los servidores y sus dependencias de posibles errores por dichos conflictos.***

4. ***Ahorro de costes en servidores.***

	De igual forma en la que creamos imágenes de sistemas para virtualizar equipos que desplegar para trabajar, ***podemos generar contenedores que desplieguen un servidor sobre el que ejecutar servicios .***
	
	Virtualizando estos servidores con ***Docker***, el ahorro en hardware y el aprovechamiento o rendimiento del existente será considerable , sin un consumo de memoria tan alto y con la capacidad de gestionar más eficientemente la memoria disponible entre los servicios que lo requieran; a diferencia de las máquinas virtuales tradicionales que acapararán parte de esa memoria para desplegar el sistema de virtualización sobre el que irá el servidor que queramos virtualizar.

5. ***Control de versiones y Depuración.***

	***Una de las características de Docker que normalmente no se engloba en virtualización, es el sistema de control de versiones que nos ofrece , pudiendo regresar a la versión que queramos en caso de necesitarlo.***
	
	***Puesto que Docker funciona en tantas plataformas, es fácil mover sus aplicaciones de entornos. Puede mover fácilmente una aplicación de un entorno de prueba a la nube y viceversa siempre que lo necesite.***

	Muy útil por ejemplo en el caso de un servidor web , donde tras una actualización de seguridad nos hemos dejado una abertura por la que nos han tirado el servicio . Cerramos el contenedor, regresamos a una versión anterior y lo ponemos de nuevo en producción. Desplegamos otro contenedor aislado y trabajamos en la actualización de seguridad corrigiendo el error explotado para tirar el servicio. Una vez lo hemos resuelto, no tenemos más que volver a desplegar el contenedor corregido en el entorno de producción . Esto último es cuestión de minutos , contando así con cortes de servicio mínimos para la corrección de errores o implementación de novedades.

6. ***Aplicaciones multiusuario.***

	A la hora de gestionar una aplicación que ejecute diferentes niveles en función de cada usuario, podemos encontrarnos con más de un quebradero de cabeza en lo que se refiere a permisos, uso de recursos, limitaciones, etc… Montar la arquitectura de este tipo de aplicaciones suele llevar bastante tiempo, que se podría dedicar a otro proyecto o a otro apartado, en definitiva, tiempo que es igual a dinero.
	
	***Docker aporta un nuevo nivel de ejecución, pudiendo contener imágenes con diferentes permisos prestablecidos, distintos usos de recursos o limitaciones, en contenedores aislados; asignando así a un usuario determinado la imagen correspondiente , sin tener que preocuparnos el que vaya a acceder donde no deba o a usar servicios que no le corresponden, porque recordemos, los contenedores Docker son sistemas aislados.***

7. ***Escalar más facilmente***

	Los contenedores ligeros de ***Docker*** también hacen escala y bajada rápida y sencilla. Puede lanzar rápidamente más contenedores cuando sea necesario y luego apagarlos fácilmente cuando ya no se necesiten.

Estos son sólo algunos ejemplos prácticos en los que ***Docker*** facilita el desarrollo, testeo, implementación, sistema de trabajo o gestión de recursos y usuarios; ahorrando tiempo al desarrollador o la empresa y economizando los proyectos en los que se aplique.

## Referencias ##

[https://www.docker.com/](https://www.docker.com/ "https://www.docker.com/")

[https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc "https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc")