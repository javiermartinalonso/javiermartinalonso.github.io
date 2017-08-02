---
layout: post
section: "ARQUITECTURA"
title:  "Instalar Docker ToolBox en Windows"
date:   2016-11-02
desc: "Procedimiento de instalación de Docker Toolbox en Windows. Solución de escritorio legacy. Permite instalar y configurar un entorno docker para sistemas Mac y Windows antiguos que no cumplen los requisitos de ***Docker para Windows***."
keywords: "Dockers, Windows,Docker_Toolbox,Virtual_Box,Docker_Machine,Docker_for_Windows,Docker_CLI,Docker_Engine, docker-compose"
categories: [arquitectura]
tags: [Dockers, Windows]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

http://blog.marcnuri.com/docker-instalando-docker-en-windows/
https://pajarokillo.wordpress.com/2016/05/09/instalacion-de-docker-sobre-windows/
https://docs.docker.com/docker-for-windows/install "docker-for-windows"

## Requisitos previos ##

Aunque vamos a definir los conceptos a lo largo del camino, es bueno que usted entienda, [qué es Docker y por qué lo utilizaría]({{ site.baseurl }}arquitectura/2016/10/04/arquitectura-Introduccion-a-Dockers.html "qué es Docker y por qué lo utilizaría") antes de comenzar.

También debemos asumir que está familiarizado con algunos conceptos antes de continuar:

- ***Maquinas virtuales***
- Términos de uso de ***recursos de la máquina, como porcentajes de CPU, uso de RAM***, etc.

 
# Instalar Docker Toolbox en Windows #

## Visión de conjunto ##

El sistema más actual para usar docker en windows es mediante la aplicación ***Docker para Windows***.
El principal requisito para instalar ***Docker para Windows*** es **disponer de la versión 64 bits Windows 10 Pro, Enterprise y Educación (actualización 1511 noviembre, Build 10586 o posterior).**

Una de las ventajas de la nueva solución ***Docker para Windows*** es que utiliza virtualización nativa y no requiere VirtualBox para ejecutar ***Docker***. Se ejecuta de forma nativa en Windows, por lo que no hay necesidad de un ***shell Docker QuickStart preconfigurado***. También utiliza ***Hyper-V*** para la virtualización.

> ***Nota***:  Si dispones de esta versión de windows te recomiendo que instales mejor [Docker para Windows](https://docs.docker.com/docker-for-windows/install/ "Docker para Windows") y que no sigas explorando este post.

***Docker Toolbox*** proporciona una forma de utilizar ***Docker*** en sistemas Windows antiguos que no cumplen con los requisitos mínimos del sistema para la aplicación ***Docker para Windows***. 

El componente principal de ***Docker*** **requiere un sistema operativo Linux para poderse ejecutar**. Para ello necesitamos uno de los componentes principales de ***Docker***, el ***Docker Machine***, que ***permite crear servidores Docker en máquinas virtuales***. De este modo podemos tener servidores ***Docker*** en una ***máquina local*** o en un ***servidor en la nube (Amazon Web Services, Microsoft Azure, Openstack…)***

Para el caso de Windows, ***Docker Machine*** creará una máquina virtual empleando ***Virtual Box***.

El paquete ***Docker Toolbox***  incluye todo lo necesario para crear un ***servidor Docker***, entre otras cosas ***Virtual Box, Docker-Machine y Docker Engine***. Los componentes se pueden instalar de forma opcional, por ejemplo, es posible que ya contemos con una versión actualizada de ***Virtual Box*** en nuestro sistema, por lo que no será necesario instalarlo.



## Máquina utilizada para el tutorial ##

- Sistema operativo: **Windows 8.1 Pro 64bits**.
- Memoria: **16 Gb**

## Lo que obtienes y cómo funciona ##

***Docker Toolbox*** incluye las siguientes herramientas ***Docker***:

- ***Cliente Docker CLI*** para ejecutar ***Docker Engine*** para crear imágenes y contenedores.
- ***Docker Machine*** para que pueda ejecutar comandos de ***Docker Engine*** desde terminales de Windows.
- ***Docker Compose*** para ejecutar el comando ***docker-compose***.
- ***Kitematic***, la interfaz gráfica de usuario de ***Docker***.
- El ***shell Docker QuickStart*** preconfigurado para un entorno de ***línea de comandos Docker***.
-*** Oracle VM VirtualBox***.

Dado que el ***daemon de Docker Engine*** utiliza funciones de kernel específicas de Linux, no puede ejecutar ***Docker Engine*** de forma nativa en Windows. En su lugar, debe utilizar el ***comando Docker Machine*** para crear y adjuntar una pequeña maquina virtual de Linux en su máquina. Esta VM hospeda ***Docker Engine*** para usted en su sistema Windows.


## Paso 1: Revise su versión de windows ##

Para ejecutar ***Docker***, su máquina debe tener un ***sistema operativo de 64 bits que ejecute Windows 7 o superior***. Además, debe ***asegurarse de que la virtualización está habilitada en su máquina***. 

Para verificar que su máquina cumple estos requisitos, haga lo siguiente:

1. En la pantalla de Sistema debe asegurarse de que ***es un so de 64 bits***:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/windows/caracteristicas-sistema.png" alt="job" class="img-thumbnail" style="width: 90%"/>
</div>

2. Asegúrese de que su so Windows ***admite la tecnología de virtualización de hardware y que la virtualización esté habilitada***. Abra el administrador de tareas y observe la pestaña rendimiento:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/windows/virtualizacion-activado.png" alt="job" class="img-thumbnail" style="width: 90%"/>
</div>


## Paso 2: Instalar Docker Toolbox ##

En esta sección, se instala el software ***Docker Toolbox*** y varias aplicaciones "auxiliares". La instalación agrega el siguiente software a su máquina:

- ***Docker Client para Windows***.
- Herramienta de gestión ***Docker Toolbox y ISO***.
- ***Oracle VM VirtualBox***.
- ***Herramientas de Git MSYS-git UNIX***.



> ***Nota***: Si tiene instalada una versión anterior de ***VirtualBox***, no vuelva a instalarla con el instalador de ***Docker Toolbox***. Cuando se le solicite, desmarque la casilla. Si tiene Virtual Box funcionando, debe cerrarlo antes de ejecutar el instalador.
>
> Igualmente si ya tiene instalado el cliente de GIT para windows no vuelva a instalarla con el instalador de ***Docker Toolbox***. Cuando se le solicite, desmarque la casilla.

1. Vaya a la página de [Docker Toolbox](https://www.docker.com/products/docker-toolbox "https://www.docker.com/products/docker-toolbox").

2. Haga clic en el enlace del instalador para descargar e instale ***Docker Toolbox*** haciendo doble clic en el instalador.
 
3. El instalador inicia el cuadro de diálogo **"Setup - Docker Toolbox"**.

	Si el diálogo de seguridad de Windows le pide que permita que el programa realice un cambio, elija Sí . El sistema muestra el asistente Setup - ***Docker Toolbox for Windows***.



	Página de publicación





4. Pulse Siguiente para aceptar todos los valores predeterminados y luego Instalar .

	Cuando sea notificado por Windows Security, el instalador hará cambios, asegúrese de permitir que el instalador realice los cambios necesarios.

	Cuando se completa, el instalador informa de que tuvo éxito:

	Éxito

5. Desactive la opción "Ver accesos directos en el Explorador de archivos" y pulse Finalizar .

## Paso 3: Verificar la instalación ##

El instalador coloca ***Docker Toolbox*** y ***VirtualBox*** en su carpeta de aplicaciones . En este paso, inicia ***Docker Toolbox*** y ejecuta un comando ***Docker*** simple.

1. En el escritorio, busque el icono de ***Docker Toolbox***.





	Utilizando ***Docker Quickstart Terminal***
	
	Esta terminal la crea el programa de instalación en el escritorio (por lo general). Haciendo doble click sobre el icono, la aplicación abre una nueva ventana shell y crea una máquina virtual por defecto, llamada default. Desde ese momento ya podemos comenzar a utilizar comandos docker.




	Escritorio

2. Haga clic en el icono para iniciar un terminal ***Docker Toolbox***.

	Si el sistema muestra una solicitud de Control de cuentas de usuario para permitir que ***VirtualBox*** realice cambios en su equipo. Seleccione Sí .

	El terminal hace varias cosas para configurar ***Docker Toolbox*** para usted. Cuando se hace, el terminal muestra el $mensaje.

	Escritorio

	El terminal ejecuta un entorno bash especial en lugar del símbolo del sistema estándar de Windows. El entorno bash es requerido por ***Docker***.

3. Haga que el terminal esté activo haciendo clic en el ratón junto a la $solicitud.
	
	/ Terminal shell

4. Ejecuta el comando ***docker*** `run hello-world`.

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


## Cómo desinstalar Toolbox ##

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


	> ***Nota*** : Este proceso no elimina el docker-install.exearchivo. Debe eliminar el archivo usted mismo.

4. Opcionalmente, quite el directorio `C:\Users\<your-user>\.docker`.

	Si desea quitar completamente ***Docker***, puede verificar que la desinstalación eliminó el directorio `.docker` bajo su ruta de acceso de usuario. Si todavía está allí, retírelo manualmente. Este directorio almacena alguna configuración y / o estado del programa ***Docker*** (por ejemplo, información sobre máquinas creadas, como certificados). La eliminación de este directorio normalmente no es necesaria.

5. Desinstale ***Oracle VirtualBox***, que se instala como parte de la instalación de ***Toolbox***.

## Próximos pasos ##

Pruebe el tutorial de Inicio .

Explore más profundamente con más tutoriales y ejemplos sobre la construcción de imágenes, la ejecución de contenedores, la creación de redes, la administración de datos y el almacenamiento de imágenes en Docker Hub.

Más información sobre Kitematic

Aprenda sobre la máquina Docker

Más información sobre Docker Compose

Docker , documentation , install , toolbox , win











https://pajarokillo.wordpress.com/2016/05/09/instalacion-de-docker-sobre-windows/





Con el comando anterior, le hemos indicado al cliente Docker que cree un contenedor (instancia) de una imagen Docker llamada hello-world. El cliente Docker busca esa imagen en nuestro repositorio local (en nuestra máquina), y si no la encuentra la busca en un repositorio público de imágenes Docker, y si la encuentra, la descarga y la lanza.

Utilizando la línea de comandos

Instalando la Docker Toolbox ya tendríamos configuradas las variables de entorno necesarias para ejecutar comandos docker desde nuestro terminal preferido.

El primer paso sería crear una máquina virtual con el comando create

$ docker-machine create -d virtualbox default
Con este comando indicamos que hacemos que se cree una máquina virtual con el driver de VirtualBox y que lleve por nombre default. Una vez ejecutado el comando, deberíamos ver en la consola algo parecido a la siguiente imagen

docker_create

Este comando deja corriendo la máquina virtual; podríamos arrancar VirtualBox y comprobar que la máquina virtual se ha creado y está corriendo.

Si queremos ver un listado de las máquina docker disponibles, utilizamos el comando ls

$ docker-machine ls
docker_ls

Para trabajar con la máquina Docker debemos establecer variables de entorno para la máquina con el comando env

$ docker-machine env –shell cmd default
docker_env

Y ahora ejecutar un comando para conectar con el cliente Docker

$ eval “$(docker-machine env default)”
Y ya podríamos trabajar desde nuestra consola con el cliente Docker y ejecutar culquier comando (run, start, stop, …)








## Referencias ##

[https://www.docker.com/products/docker-toolbox](https://www.docker.com/products/docker-toolbox "https://www.docker.com/products/docker-toolbox")

[https://docs.docker.com/toolbox/toolbox_install_windows](https://docs.docker.com/toolbox/toolbox_install_windows "https://docs.docker.com/toolbox/toolbox_install_windows")