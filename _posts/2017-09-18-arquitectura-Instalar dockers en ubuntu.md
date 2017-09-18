---
layout: post
section: "ARQUITECTURA"
title:  "Instalar Docker Ubuntu"
date:   2017-09-18
desc: "Procedimiento de instalación de Docker en Ubuntu. Este tutorial está basado en la documentación oficial de docker donde se explica el procedimiento de instalación de Docker en Ubuntu."
keywords: "Dockers, Ubuntu, Docker Community Edition, Docker CE"
categories: [arquitectura]
tags: [Dockers, Ubuntu, Docker_Community_Edition, Docker_CE]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

Este tutorial está basado en la documentación oficial de docker donde se explica el procedimiento de instalación de Docker en Ubuntu.

<!--more-->

# Máquina utilizada para el tutorial #

- Máquina virtual: ***VirtualBox 5.1.24 preconfigurada para usar Ubuntu 64 bits.***

- Sistema operativo: ***Ubuntu 16.04.1 LTS***: El sistema operativo virtual es Ubuntu Server 16.04 de 64 bits. Es una versión de soporte a largo plazo. 


# Requisitos previos #

Aunque vamos a definir los conceptos a lo largo del camino, es bueno que usted entienda, [qué es Docker y por qué lo utilizaría]({{ site.baseurl }}arquitectura/2017/09/04/arquitectura-Introduccion-a-Dockers.html "qué es Docker y por qué lo utilizaría") y [cuales son las principales piezas de la plataforma docker]({{ site.baseurl }}arquitectura/2017/09/11/arquitectura-plataforma-Docker.html "cuales son las principales piezas de la plataforma docker") antes de comenzar.


# Requisitos del sistema operativo #

Para ***instalar Docker CE***, ***necesita la versión de 64 bits de una de estas versiones de Ubuntu***:

- Zesty 17.04
- Yakkety 16.10
- Xenial 16.04 (LTS)
- Confiable 14.04 (LTS)

Para ***Ubuntu 16.04 y superior, el kernel de Linux incluye soporte para [OverlayFS](https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/#how-the-overlay2-driver-works "overlayfs"), y Docker CE usará el controlador [overlay2](https://docs.docker.com/engine/userguide/storagedriver/overlayfs-driver/#how-the-overlay2-driver-works "overlay2") de almacenamiento de forma predeterminada***.

# Visión de conjunto #

[Docker Community Edition (CE)](https://www.docker.com/community-edition "Docker Community Edition (CE)") es ideal para desarrolladores y equipos pequeños que buscan comenzar con ***Docker*** y experimentar con aplicaciones basadas en ***contenedores***. Disponible para muchas plataformas de infraestructura populares como escritorio, nube y sistemas operativos de código abierto, ***Docker CE*** proporciona un instalador para una instalación sencilla y rápida para que pueda comenzar a desarrollarse de inmediato. ***Docker CE*** está integrado y optimizado a la infraestructura para que pueda mantener una experiencia de aplicación nativa al comenzar a utilizar ***Docker***. Construye el primer ***contenedor***, comparte con los miembros del equipo y automatiza la canalización de desarrollo, todo ello con ***Docker Community Edition***.

# Instalar Docker #

La forma más sencilla de instalar ***docker*** es con una ***maquina virtual 64 bits Ubuntu***. Yo he instalado ***VirtualBox 5.1.24 y he creado una maquina virtual preconfigurada para usar Ubuntu 64 bits. a continuación he instalado el Sistema operativo: Ubuntu 16.04.1 LTS***

> ***Nota***: A este tipo de maquinas virtuales se les denomina Servidores Privados Virtuales o ***VPS (del inglés Virtual Private Server)***,

Puede instalar ***Docker CE*** de diferentes maneras, según sus necesidades:

La mayoría de los usuarios ***configuran los repositorios de Docker e instalan desde ellos***, para facilitar las tareas de instalación y actualización. ***Este es el enfoque recomendado***.

Algunos usuarios ***descargan el paquete DEB y lo instalan manualmente y administran las actualizaciones completamente manualmente***. Esto es útil en situaciones tales como la ***instalación de Docker en los air-gapped systems sin acceso a Internet***.

## Instalar utilizando el repositorio ##

Antes de instalar ***Docker CE*** por primera vez en una máquina host nueva, debe configurar el ***repositorio Docker***. Posteriormente, puede instalar y actualizar ***Docker*** desde el repositorio.

### Configurar el repositorio ###

1. En primer lugar refrescamos la ***caché del gestor de paquetes en Ubuntu***.

	    sudo apt-get update
	
	> ***Nota***: El [comando APT](https://help.ubuntu.com/lts/serverguide/apt.html "comando APT") ***Advanced Packaging Tool (APT)*** es una poderosa herramienta de línea de comandos, que trabaja con Ubuntu para llevar a cabo funciones tales como la instalación de nuevos paquetes de software, actualización de paquetes de software existentes, la actualización del índice de la lista de paquetes, e incluso actualizar todo el sistema Ubuntu.

2. En segundo lugar nos aseguramos de tener instalado ***apt-transport-https y ca-certificates***. Instale paquetes para permitir a APT el uso de un repositorio a través de HTTPS:

		$ sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

3. Añadir clave oficial de ***Docker GPG***:


		$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	Compruebe que la huella digital clave es: `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`.

		$ sudo apt-key fingerprint 0EBFCD88
		
		pub   4096R/0EBFCD88 2017-02-22
		      Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
		uid                  Docker Release (CE deb) <docker@docker.com>
		sub   4096R/F273FCD8 2017-02-22

4. Utilice el siguiente comando para configurar el `repositorio Stable` . Siempre necesitas el `repositorio Stable` , incluso si quieres instalar compilaciones desde repositorios `edge` o `testing` también. Para añadir los repositorios de `edge` o `testing` , añada la palabra `edge` o `testing` (o ambas) después de la palabra `stable` en los comandos siguientes.

		$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	> ***Nota*** : 
	>
	> ***Docker CE*** tiene dos canales de actualización, Stable y Edge :
	> 
	> - ***Stable*** le ofrece actualizaciones fiables cada trimestre
	> - ***Edge*** ofrece nuevas funciones cada mes.
	> 
	> El subcomando `lsb_release -cs`  a continuación devuelve el nombre de su ***distribución de Ubuntu***, como [Xenial Xerus](https://www.comoinstalarlinux.com/ubuntu-16-04-ya-tiene-nombre-xenial-xerus/ "Xenial Xerus") que es el nombre dado a la distribución 16.04 LST (Long Time Support) de Ubuntu.
	> A veces, en una distribución como Linux Mint, puede que tenga que cambiar `$(lsb_release -cs)` a su ***distribución de Ubuntu padre***. Por ejemplo: Si está utilizando `Linux Mint Rafaela`, podría utilizar `trusty`.

### INSTALAR DOCKER CE ###

1. En primer lugar refrescamos la caché del gestor de paquetes en ***Ubuntu***.

	    $ sudo apt-get update

2. Instale la versión más reciente de ***Docker CE***, o vaya al paso siguiente para instalar una versión específica. Se reemplaza cualquier instalación existente de ***Docker***.

	    $ sudo apt-get install docker-ce

	> ***Advertencia*** : si tiene varios ***repositorios Docker*** habilitados, la instalación o actualización sin especificar una versión en el comando `apt-get install` o `apt-get update` siempre instalará la versión más alta posible, lo que puede no ser apropiado para sus necesidades de estabilidad.

3. En los sistemas de producción, debe instalar una versión específica de ***Docker CE*** en lugar de utilizar siempre la última versión. Esta salida está truncada. Enumere las versiones disponibles.

	    $ apt-cache madison docker-ce
	    
	    docker-ce | 17.06.0~ce-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu xenial/stable amd64 Packages

	El contenido de la lista depende de qué repositorios están habilitados, y será específico para su versión de ***Ubuntu*** (en este ejemplo está indicado por el sufijo `xenial` en la versión). 

	La segunda columna es la cadena de versión. 
	
	La tercera columna es el nombre del repositorio, que indica de qué repositorio es el paquete y por extensión su nivel de estabilidad. 

	> ***Nota***: Para instalar una versión específica, agregue la cadena de versiones al nombre del paquete y separelo por un signo igual (` = `):
	>
	>
	>     $ sudo apt-get install docker-ce=<VERSION>

	El ***demonio Docker*** se inicia automáticamente.

4. Compruebe que ***Docker CE*** se instala correctamente ejecutando la imagen `hello-world`.

	    $ sudo docker run hello-world

	Este comando descarga una imagen de prueba y la ejecuta en un ***contenedor***. Cuando se ejecuta el ***contenedor***, imprime un mensaje informativo.

	***Docker CE*** está instalado y en funcionamiento. 

	Ahora mismo el usuario que puede utilizar ***Docker*** es root, lo que en ***Ubuntu*** fuerza a utilizar sudo cada vez que quiera hacer algo relacionado con los ***contenedores*** o su servicio. Para hacer su utilización más práctica se puede incluir nuestro usuario en el grupo del servicio de ***contenedores***.

	Continúe con [Linux postinstall](https://docs.docker.com/engine/installation/linux/linux-postinstall/#dns-resolver-found-in-resolvconf-and-containers-cant-use-it "linux postinstall") para permitir que usuarios sin privilegios ejecuten ***comandos de Docker*** y otros pasos de configuración opcionales.

### Administrar Docker como usuario no root ###

El ***docker daemon*** se enlaza a un socket Unix en lugar de un puerto TCP. De forma predeterminada, el socket Unix es propiedad del usuario `root` y otros usuarios sólo pueden acceder a él mediante `sudo`. El ***docker daemon*** siempre se ejecuta como el usuario `root`.

Si no desea usar `sudo` cuando utiliza el comando `docker`, cree un grupo Unix llamado `docker` y agregue usuarios al mismo. Cuando el ***docker daemon*** se inicia, hace que la propiedad del socket Unix sea leída / grabable por el grupo `docker`.

> ***Advertencia*** : El grupo  `docker` otorga privilegios equivalentes al usuario `root`. Para más detalles sobre cómo esto afecta la seguridad en su sistema, vea [Docker Daemon Attack Surface](https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface "Docker Daemon Attack Surface").

Con estos dos comandos vamos a crear el grupo `docker` y agregar el usuario actual al grupo:

1. Cree el grupo `docker`.

	    $ sudo groupadd docker

2. Añada al usuario al grupo `docker`.

	    $ sudo usermod -aG docker $USER

3. Cierre sesión y vuelva a iniciar sesión para que se reevalúe la pertenencia a su grupo.

	Si se está probando en una máquina virtual, puede ser necesario reiniciar la máquina virtual para que los cambios tengan efecto.

	En un entorno Linux de escritorio, como X Windows, cierre sesión completamente y vuelva a iniciar sesión.

	Compruebe que puede ***ejecutar comandos docker sin sudo***.

	    $ docker run hello-world

	Este comando descarga una imagen de prueba y la ejecuta en un ***contenedor***. Cuando se ejecuta el ***contenedor***, imprime un mensaje informativo.

### ACTUALIZACIÓN DOCKER CE ###

Para actualizar ***Docker CE***, ejecute primero y `sudo apt-get update`, a continuación, siga las instrucciones de instalación , eligiendo la nueva versión que desea instalar.


## Instalar desde un paquete ##

Si no puede usar el ***repositorio de Docker*** para instalar ***Docker CE***, puede descargar el archivo `.deb` de la release que necesitas e instalarlo manualmente. 

Tendrá que descargar un nuevo archivo cada vez que desee actualizar ***Docker CE***.

1. Ir a [https://download.docker.com/linux/ubuntu/dists/](https://download.docker.com/linux/ubuntu/dists/ "https://download.docker.com/linux/ubuntu/dists/") , elija su versión de Ubuntu, busque `pool/stable/` y seleccione amd64. Descargue el archivo `.deb` para la versión de ***Docker*** que desea instalar y para su versión de ***Ubuntu***.

	> ***Nota*** : Para instalar un paquete de `edge` , cambie la palabra `stable` en la URL a `edge`. 

2. Instale ***Docker CE***, cambiando la ruta de acceso a la ruta donde descargó el ***paquete Docker***.

	    $ sudo dpkg -i /path/to/package.deb

	El demonio Docker se inicia automáticamente.

3. Compruebe que ***Docker CE*** se instala correctamente ejecutando la imagen `hello-world`.

	    $ sudo docker run hello-world

	Este comando descarga una imagen de prueba y la ejecuta en un ***contenedor***. Cuando se ejecuta el ***contenedor***, imprime un mensaje informativo.

	***Docker CE*** está instalado y en funcionamiento. Debe utilizar `sudo` para ejecutar comandos de ***Docker***. Continúe con [Linux postinstall](https://docs.docker.com/engine/installation/linux/linux-postinstall/#dns-resolver-found-in-resolvconf-and-containers-cant-use-it "linux postinstall") para permitir que usuarios sin privilegios ejecuten ***comandos de Docker*** y otros pasos de configuración opcionales.

### ACTUALIZACIÓN DOCKER CE ###

Para actualizar ***Docker CE***, descargue el archivo de paquete más reciente y repita el procedimiento de instalación , señalando el nuevo archivo.

## Desinstalar Docker CE ##

1. Desinstale el paquete Docker CE:

	    $ sudo apt-get purge docker-ce

2. Las ***imágenes***, ***contenedores***, ***volúmenes o archivos de configuración*** personalizados del host no se eliminan automáticamente. Para eliminar todas las ***imágenes, contenedores y volúmenes***:

	    $ sudo rm -rf /var/lib/docker

Debe eliminar manualmente cualquier archivo de configuración editado.

## Referencias ##
[Docker Community Edition (CE)](https://www.docker.com/community-edition "Docker Community Edition (CE)")

[https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu "Installation docker linux ubuntu")

