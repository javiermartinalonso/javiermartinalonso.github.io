---
layout: post
section: "ARQUITECTURA"
title:  "Instalar Docker ToolBox en Windows"
date:   2016-10-25
desc: "Procedimiento de instalación de Docker Toolbox en Windows. Solución de escritorio legacy. Permite instalar y configurar un entorno docker para sistemas Mac y Windows antiguos que no cumplen los requisitos de Docker para Windows."
keywords: "Dockers, Windows,Docker_Toolbox,Virtual_Box,Docker_Machine,Docker_for_Windows,Docker_CLI,Docker_Engine, docker-compose"
categories: [arquitectura]
tags: [Dockers, Windows]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---


# Requisitos previos #

Aunque vamos a definir los conceptos a lo largo del camino, es bueno que usted entienda, [qué es Docker y por qué lo utilizaría]({{ site.baseurl }}arquitectura/2017/10/04/arquitectura-Introduccion-a-Dockers.html "qué es Docker y por qué lo utilizaría") y [cuales son las principales piezas de la plataforma docker]({{ site.baseurl }}arquitectura/2017/10/11/arquitectura-plataforma-Docker.html "cuales son las principales piezas de la plataforma docker") antes de comenzar.

 
# Visión de conjunto #

El sistema más actual para usar ***docker en windows*** es mediante la aplicación ***Docker para Windows***.
El principal requisito para instalar ***Docker para Windows*** es **disponer de la versión 64 bits Windows 10 Pro, Enterprise y Educación (actualización 1511 noviembre, Build 10586 o posterior).**

Una de las ventajas de la nueva solución ***Docker para Windows*** es que utiliza virtualización nativa y no requiere VirtualBox para ejecutar ***Docker***. Se ejecuta de forma nativa en Windows, por lo que no hay necesidad de un ***shell Docker QuickStart preconfigurado***. También utiliza ***Hyper-V*** para la virtualización.

> ***Nota***:  Si dispones de esta versión de windows te recomiendo que instales mejor [Docker para Windows](https://docs.docker.com/docker-for-windows/install/ "Docker para Windows") y que no sigas explorando este post.

***Docker Toolbox*** proporciona una forma de utilizar ***Docker*** en sistemas Windows antiguos que no cumplen con los requisitos mínimos del sistema para la aplicación ***Docker para Windows***. 

El componente principal de ***Docker*** **requiere un sistema operativo Linux para poderse ejecutar**. Para ello necesitamos uno de los componentes principales de ***Docker***, el ***Docker Machine***, que ***permite crear servidores Docker en máquinas virtuales***. De este modo podemos tener servidores ***Docker*** en una ***máquina local*** o en un ***servidor en la nube (Amazon Web Services, Microsoft Azure, Openstack…)***

Para el caso de Windows, ***Docker Machine*** creará una máquina virtual empleando ***Virtual Box***.

El paquete ***Docker Toolbox***  incluye todo lo necesario para crear un ***servidor Docker***, entre otras cosas ***Virtual Box, Docker-Machine y Docker Engine***. Los componentes se pueden instalar de forma opcional, por ejemplo, es posible que ya contemos con una versión actualizada de ***Virtual Box*** en nuestro sistema, por lo que no será necesario instalarlo.


# Máquina utilizada para el tutorial #

- Sistema operativo: **Windows 8.1 Pro 64bits**.

- Memoria: **16 Gb**


# Lo que obtienes y cómo funciona #

***Docker Toolbox*** incluye las siguientes herramientas ***Docker***:

- ***Docker engine*** para manejar las imágenes, contendores, volumenes, etc.

- ***Cliente Docker CLI*** para poder comunicarse con el ***Docker Engine***.

- ***Docker Machine*** para que pueda ejecutar comandos de ***Docker Engine*** desde terminales de Windows.

- ***Docker Compose*** para ejecutar el comando ***docker-compose***.

- ***Kitematic***, la interfaz gráfica de usuario de Docker en window.

- El ***shell Docker QuickStart*** preconfigurado para un entorno de ***línea de comandos Docker***.

- ***Oracle VM VirtualBox***. Dado que el ***daemon de Docker Engine*** utiliza funciones de kernel específicas de Linux, no puede ejecutar ***Docker Engine*** de forma nativa en Windows. En su lugar, debe utilizar el ***comando Docker Machine*** para crear y adjuntar una pequeña maquina virtual de Linux (***Boot2docker***) en su máquina a través del ***Oracle VM VirtualBox***. Esta ***VM*** hospeda ***Docker Engine*** para usted en su sistema Windows y es accesible a través del ***shell Docker QuickStart***.


# Paso 1: Revise su versión de windows #

Para ejecutar ***Docker***, su máquina debe tener un ***sistema operativo de 64 bits que ejecute Windows 7 o superior***. Además, debe ***asegurarse de que la virtualización está habilitada en su máquina***. 

Para verificar que su máquina cumple estos requisitos, haga lo siguiente:

1. En la pantalla de Sistema debe asegurarse de que ***es un so de 64 bits***:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/windows/caracteristicas-sistema.png" alt="caracteristicas-sistema" class="img-thumbnail" style="width: 70%"/>
</div>

2. Asegúrese de que su so Windows ***admite la tecnología de virtualización de hardware y que la virtualización esté habilitada***. Abra el administrador de tareas y observe la pestaña rendimiento:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/windows/virtualizacion-activado.png" alt="virtualizacion-activado" class="img-thumbnail" style="width: 70%"/>
</div>


# Paso 2: Instalar Docker Toolbox #

En esta sección, se instala el software ***Docker Toolbox*** y varias aplicaciones "auxiliares". La instalación agrega el siguiente software a su máquina:

- ***Docker Client para Windows***.

- Herramienta de gestión ***Docker Toolbox y ISO***.

- ***Oracle VM VirtualBox***.

- ***Herramientas de Git MSYS-git UNIX***.

> ***Nota***: Si tiene instalada una versión anterior de ***VirtualBox***, no vuelva a instalarla con el instalador de ***Docker Toolbox***. Cuando se le solicite, desmarque la casilla. Si tiene Virtual Box funcionando, debe cerrarlo antes de ejecutar el instalador.
>
> Igualmente si ya tiene instalado el cliente de GIT para windows no vuelva a instalarla con el instalador de ***Docker Toolbox***. Cuando se le solicite, desmarque la casilla.

1. Vaya a la página de [Docker Toolbox](https://www.docker.com/products/docker-toolbox "https://www.docker.com/products/docker-toolbox").

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/docker-toolbox-page.png" alt="docker-toolbox-page" class="img-thumbnail" style="width: 50%"/>
	</div>

2. Haga clic en el enlace del instalador para descargar e instale ***Docker Toolbox*** haciendo doble clic en el instalador.
 
3. El instalador inicia el cuadro de diálogo **"Setup - Docker Toolbox"**.

	Si el diálogo de seguridad de Windows le pide que permita que el programa realice un cambio, elija Sí . El sistema muestra el asistente Setup - ***Docker Toolbox for Windows***.

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/installer_open.png" alt="docker installer open" class="img-thumbnail" style="width: 50%"/>
	</div>

4. Pulse Siguiente para aceptar todos los valores predeterminados y luego Instalar .

	Cuando sea notificado por Windows Security, el instalador hará cambios, asegúrese de permitir que el instalador realice los cambios necesarios.

	Cuando se completa, el instalador informa de que tuvo éxito:

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/finish.png" alt="finish" class="img-thumbnail" style="width: 50%"/>
	</div>

# Paso 3: Verificar la instalación #

El instalador coloca ***Docker Toolbox*** y ***VirtualBox*** en su carpeta de aplicaciones . En este paso, inicia ***Docker Toolbox*** y ejecuta un comando ***Docker*** simple.

1. En el escritorio, busque el icono de ***Docker Quickstart***.

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/quickstart-escritorio.png" alt="quickstart escritorio" class="img-thumbnail" style="width: 20%"/>
	</div>
	
2. Haga clic en el icono de ***Docker Quickstart*** para iniciar un terminal ***Docker Toolbox***.

	Si el sistema muestra una solicitud de Control de cuentas de usuario para permitir que ***VirtualBox*** realice cambios en su equipo. Seleccione Sí .

	Esta terminal la crea el programa de instalación en el escritorio. Haciendo doble click sobre el icono, ***la aplicación abre una nueva ventana shell y sin que nosotros seamos conscientes de ello crea una máquina virtual por defecto, llamada default en el virtual box***. Desde ese momento ya podemos comenzar a utilizar comandos docker.

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/machine-default.png" alt="machine-default" class="img-thumbnail" style="width: 70%"/>
	</div>

	Dado que el ***daemon de Docker Engine*** utiliza funciones de kernel específicas de Linux, no puede ejecutar ***Docker Engine*** de forma nativa en Windows. En su lugar, debe utilizar el ***comando Docker Machine*** para crear y adjuntar una pequeña maquina virtual de Linux en su máquina a través del ***Oracle VM VirtualBox***. Esta ***VM*** hospeda ***Docker Engine*** para usted en su sistema Windows y es accesible a través del ***shell Docker QuickStart***.

	Volviendo al terminal de ***Docker Quickstart*** hace varias cosas para configurar ***Docker Toolbox*** para usted. Cuando termina, el terminal muestra el caracter `$`.

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/quickstart-terminal.png" alt="quickstart-terminal" class="img-thumbnail" style="width: 60%"/>
	</div>	

	El terminal ejecuta un entorno bash especial en lugar del símbolo del sistema estándar de Windows. El entorno bash es requerido por ***Docker***.

3. Ejecuta el comando `docker run hello-world`.

	Si todo va bien, la salida del comando se ve así:

		 $ docker run hello-world
		 Unable to find image 'hello-world:latest' locally
		 Pulling repository hello-world
		 91c95931e552: Download complete
		 a8219747be10: Download complete
		 Status: Downloaded newer image for hello-world:latest
		 Hello from Docker.
		 This message shows that your installation appears to be working correctly.
		
		 To generate this message, Docker took the following steps:
		  1. The Docker Engine CLI client contacted the Docker Engine daemon.
		  2. The Docker Engine daemon pulled the "hello-world" image from the Docker Hub.
		     (Assuming it was not already locally available.)
		  3. The Docker Engine daemon created a new container from that image which runs the
		     executable that produces the output you are currently reading.
		  4. The Docker Engine daemon streamed that output to the Docker Engine CLI client, which sent it
		     to your terminal.
		
		 To try something more ambitious, you can run an Ubuntu container with:
		  $ docker run -it ubuntu bash
		
		 For more examples and ideas, visit:
		  https://docs.docker.com/userguide/

	Con el comando anterior, le hemos indicado al ***cliente Docker*** que cree un ***contenedor (instancia)*** de una ***imagen Docker*** llamada **hello-world**. El ***cliente Docker*** busca esa imagen en nuestro ***repositorio local (en nuestra máquina)***, y si no la encuentra la busca en un [repositorio público de imágenes Docker](https://hub.docker.com/ "https://hub.docker.com/"), y si la encuentra, la descarga y la lanza.


# Cómo desinstalar Toolbox #

Eliminar ***Toolbox*** implica eliminar todos los componentes ***Docker*** que incluye.

Una desinstalación completa también incluye la eliminación de los equipos locales y remotos que creó con ***Docker Machine***. En algunos casos, es posible que desee mantener máquinas creadas con ***Docker Machine***.

Por ejemplo, si planea reinstalar ***Docker Machine*** como parte de ***Docker for Windows***, puede continuar administrando dichas máquinas a través de ***Docker***. O bien, si tiene máquinas remotas en un proveedor en la nube y planea administrarlas utilizando el proveedor, no desea quitarlas. Por lo tanto, el paso para retirar las máquinas se describe aquí como opcional.

Para desinstalar ***Toolbox*** en Windows, haga lo siguiente:

1. Lista de sus máquinas.

		$ docker-machine ls
		NAME                ACTIVE   DRIVER       STATE     URL                        SWARM
		dev                 *        virtualbox   Running   tcp://192.168.99.100:2376
		my-docker-machine            virtualbox   Stopped
		default                      virtualbox   Stopped

2. Opcionalmente, retire cada máquina. Por ejemplo:
		
		$ docker-machine rm my-docker-machine
		Successfully removed my-docker-machine

	Este paso es opcional porque si planea reinstalar ***Docker Machine*** como parte de ***Docker para Windows***, puede importar y continuar administrando esas máquinas a través de ***Docker***.

3. Desinstale ***Docker Toolbox*** utilizando el proceso estándar de Window para desinstalar programas a través del panel de control (programas y características).

	> ***Nota*** : Este proceso no elimina el archivo docker-install.exe. Debe eliminar el archivo usted mismo.

4. Opcionalmente, quite el directorio `C:\Users\<your-user>\.docker`.

	Si desea quitar completamente ***Docker***, puede verificar que la desinstalación eliminó el directorio `.docker` bajo su ruta de acceso de usuario. Si todavía está allí, retírelo manualmente. Este directorio almacena alguna configuración y / o estado del programa ***Docker*** (por ejemplo, información sobre máquinas creadas, como certificados). La eliminación de este directorio normalmente no es necesaria.

5. Desinstale ***Oracle VirtualBox***, que se instala como parte de la instalación de ***Toolbox***.





http://blog.marcnuri.com/docker-accediendo-al-shell-ssh-de-docker-machine/


Accediendo al shell (SSH) de docker-machine

SSH
Por último, también podremos acceder al shell de la máquina virtual empleando cualquier cliente SSH como PuTTY. En este caso necesitaremos conocer la IP de la máquina virtual (normalmente 192.168.99.100).

Las credenciales para acceder serán usuario ‘docker’ y contraseña ‘tcuser’.

desde la línea de comandos de windows una vez arrancada la maquina virtual default


    docker-machine ssh default

Docker Machine SSH PuTTY

Tal como hemos visto en anteriores publicaciones, docker puede funcionar en Windows a través de una máquina virtual generalmente sobre Virtual Box. Para ello, Docker ofrece la herramienta docker-machine que permite automatizar y ajustar automáticamente todas las tareas relacionadas con la puesta a punto y configuración de esta máquina virtual.

En ocasiones, normalmente para hacer un ajuste completo del entorno, puede ser necesario acceder manualmente al Shell de esta máquina virtual. Para ello disponemos de las distintas opciones que se enumeran a continuación.

docker-machine ssh
La forma más sencilla de acceder es mediante el empleo de la propia herramienta docker-machine con el subcomando “ssh”. Con ello conseguiremos un acceso a la máquina virtual en la propia línea de comandos.

docker-machine ssh


docker-machine ssh dev
1
docker-machine ssh dev
Empleamos el comando anterior para acceder, en este caso estamos accediendo a la máquina ‘dev’ (creada en el ejemplo anterior).

Interfaz de Virtual Box
También podemos acceder de forma fácil empleando la interfaz gráfica de Virtual Box.

Para ello pulsamos en la opción “Mostrar” en la máquina virtual correspondiente y se nos abrirá una ventana con el Shell.

Docker Machine Virtual Box SSH

Docker Machine Virtual Box SSH Mostrar

SSH
Por último, también podremos acceder al shell de la máquina virtual empleando cualquier cliente SSH como PuTTY. En este caso necesitaremos conocer la IP de la máquina virtual (normalmente 192.168.99.100).

Las credenciales para acceder serán usuario ‘docker’ y contraseña ‘tcuser’.

Docker Machine SSH PuTTY

Hemos visto las 2 opciones distintas para acceder al shell de nuestra máquina virtual. En siguientes publicaciones, veremos cómo esto nos puede resultar necesario para, por ejemplo, poder compartir carpetas/directorios de nuestro host anfitrión con docker-machine y de este modo poder hacerlas accesibles a los distintos contenedores como volúmenes de datos.


## Referencias ##

[https://www.docker.com/products/docker-toolbox](https://www.docker.com/products/docker-toolbox "https://www.docker.com/products/docker-toolbox")

[https://docs.docker.com/toolbox/toolbox_install_windows](https://docs.docker.com/toolbox/toolbox_install_windows "https://docs.docker.com/toolbox/toolbox_install_windows")

[https://github.com/boot2docker/boot2docker](https://github.com/boot2docker/boot2docker "https://github.com/boot2docker/boot2docker")