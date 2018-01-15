---
layout: post
section: "DOCKER"
title:  "Volumenes Dockers"
date:   2017-10-04
desc: "Volumenes"
keywords: "Dockers, virtualización, portabilidad, contenedor, maquina_virtual, integración_continua, DevOps, volumenes"
categories: [docker]
tags: [Dockers, virtualización, portabilidad,contenedor, maquina_virtual, integración_continua, DevOps, volumenes]
icon: fab fa-docker
image: static/img/blog/docker/docker-logo.png
---


https://gist.github.com/alister/ed664cb51c21bc801e9a
Example of creating a Docker data volume, exporting it, and re-importing it to a completely fresh container



https://docs.docker.com/engine/admin/volumes/#good-use-cases-for-tmpfs-mounts

https://docs.docker.com/engine/admin/volumes/volumes/#create-a-volume-using-a-volume-driver



# Volumenes #

Una de las mas importantes funcionalidades de **Docker** son los volúmenes.

**Estos no son mas que carpetas en nuestro sistema de ficheros que son capaces de sobrevivir al ciclo de vida normal del contenedor. Los volúmenes suponen el modo en el que Docker permite persistir los datos de tu aplicación. Los aloja fuera del propio contenedor, en el propio sistema de archivos del host donde está corriendo Docker, de tal manera que se puede cambiar, apagar o borrar el contenedor sin que afecte a los datos**.

Los volúmenes son bastante útiles porque permiten compartirse entre contenedores, o el propio *host*. Eso nos permite cosas como:

- **Montar el código fuente de una aplicación web, dentro de un volumen, accesible desde el contenedor web y así ver en tiempo real los cambios durante el desarrollo**.

- **Consultar todos los *logs* cómodamente desde un contenedor dedicado**.

- **Hacer *backups* de un contenedor desde otro dedicado, o recuperar esos mismo *backups* hacia nuestro *host***.

- **Compartir la misma información entre varios contenedores sin duplicarla**. Por ejemplo la información relativa al entorno: desarrollo, integración, preproducción, producción.

De hecho, he visto contenedores con la única función de producir ficheros (*.tar.gz*, *.deb*, ...) en volúmenes que luego son consumidos por servicios de *runtime*, por ejemplo un servidor web, un repositorio o simplemente un NFS. Para ello hay que definir qué parte del contenedor se dedica a la aplicación y qué parte a los datos.

- **Los volúmenes de datos están diseñados para conservar los datos, independientemente del ciclo de vida del contenedor**. 

- **Docker, por lo tanto, nunca elimina automáticamente los volúmenes cuando se elimina un contenedor, ni tampoco "recoge basura": *volúmenes huerfanos* a los que ya no hace referencia un contenedor**.

- **Los volúmenes son específicos de cada contenedor**, es decir, que puedes crear n contenedores a partir de una misma imagen y definir volúmenes diferentes para cada uno de ellos:

- **Los volúmenes también pueden usarse para compartir información entre contenedores**.

	<div style="text-align: center;margin: 1em;">
		<img src="{{ site.baseurl }}static/img/blog/docker/docker-volumenes.png" alt="volumenes" class="img-thumbnail" style="width: 100%"/>
	</div>
	<div style="text-align: center;margin: 1em;">
	<p>volumenes</p>
	</div>










https://raw.githubusercontent.com/Sirtea/www.linuxsysadmin.tk/master/content/articles/tipos-de-volumenes-en-docker.md

# Tipos de Volúmenes #

Los volúmenes pueden ser de 3 tipos distintos, y se categorizan según esta lista:

- Data volumes
	- Anonymous data volumes
	- Named data volumes
- Mounted volumes

## Data volumes ##

Se trata de carpetas que se crean en `/var/lib/docker/` y que pueden compartirse entre diferentes contenedores. A su vez este tipo de volúmenes se puede categorizar en:

### Anonymous data volumes ###

Se crean cuando se levanta un contenedor y no se le asigna un nombre concreto, mediante el comando `docker run`, por ejemplo:

	gerard@sirius:~$ docker run -ti --rm -v /data alpine:3.4 sh

Esto nos crea un volumen asociado al contenedor creado.

	root@sirius:~# docker volume ls
	DRIVER              VOLUME NAME
	local               1b39e6601cd3711c27f3a1a4eb50d82e182151fd14b82048f47b0d50ad22b97a
	root@sirius:~# tree /var/lib/docker/volumes/
	/var/lib/docker/volumes/
	├── 1b39e6601cd3711c27f3a1a4eb50d82e182151fd14b82048f47b0d50ad22b97a
	│   └── _data
	└── metadata.db
	
	2 directories, 1 file
	root@sirius:~# 


A su vez, otro contenedor puede montar los volúmenes de otro contenedor, ya sea porque los creó o porque los ha montado de un tercero.

	root@sirius:~# docker run -ti --rm --volumes-from adoring_lovelace alpine:3.4 sh

Ahora mismo, la carpeta */data/* pertenece al primer contenedor, pero es la misma para ambos contenedores.

> **Docker** mantiene una cuenta de los contenedores que están usando un volumen, y estos solo se eliminan cuando el último contenedor que lo usa sale con el parámetro `--rm` o si se hace un `docker rm -v`. En cualquier otro caso, el volumen se queda parasitando, hasta que lo eliminamos manualmente usado `docker volume rm`. Ver el apartado Eliminar Volúmenes


### Named data volumes ###

Estos volúmenes no dependen de ningún contenedor concreto, y se pueden montar en cualquier contenedor. Se crean específicamente usando el comando `docker volume create`, o al ejecutar un contenedor si le damos un nombre en la línea de comandos.

	gerard@sirius:~$ docker volume create --name vol1
	vol1
	gerard@sirius:~$ docker run -ti --rm -v vol2:/data alpine:3.4 true
	gerard@sirius:~$ docker volume ls
	DRIVER              VOLUME NAME
	local               vol1
	local               vol2
	gerard@sirius:~$ 

Estos volúmenes no se eliminan por si solos nunca y persisten cuando su contenedor desaparece. Para eliminarlos se necesita una intervención manual mediante el comando `docker volume rm`.


	gerard@sirius:~$ docker volume ls
	DRIVER              VOLUME NAME
	local               vol1
	local               vol2
	gerard@sirius:~$ docker volume rm vol1 vol2
	vol1
	vol2
	gerard@sirius:~$ docker volume ls
	DRIVER              VOLUME NAME
	gerard@sirius:~$ 


> REVISAR DONDE ENCAJO ESTA IDEA Y SI DE VERDAD ES ÚTIL
> 
> ## Etiquetas de volumen ##
> 
> Los sistemas de etiquetado como **SELinux** requieren que se coloquen etiquetas adecuadas en el contenido del volumen montado en un contenedor. Sin una etiqueta, el sistema de seguridad puede evitar que los procesos que se ejecutan dentro del contenedor utilicen el contenido. De forma predeterminada, **Docker** no cambia las etiquetas establecidas por el sistema operativo.
> 
> Para cambiar una etiqueta en el contexto del contenedor, puede agregar cualquiera de los dos sufijos `:z` o `:Z` al montaje del volumen. Estos sufijos indican a Docker que vuelva a etiquetar objetos de archivo en los volúmenes compartidos. La opción `z` le dice a Docker que dos contenedores comparten el contenido del volumen. Como resultado, **Docker etiqueta el contenido con una etiqueta de contenido compartido**. Las etiquetas de volumen compartido permiten que todos los contenedores lean/escriban contenido. La opción `Z` le dice a Docker que etiquete el contenido con una etiqueta privada no compartida. Solo el contenedor actual puede usar un volumen privado.


## Mounted volumes##

Otras veces nos interesa montar ficheros o carpetas desde la máquina *host*. En este caso, podemos montar la carpeta o el fichero especificando la ruta completa desde la máquina *host*, y la ruta completa en el contenedor. Es posible también especificar si el volumen es de lectura y escritura (por defecto) o de solo lectura.

		```bash
		gerard@sirius:~/docker$ docker run -ti --rm -v /etc/hostname:/root/parent_name:ro -v /opt/:/data alpine:3.4 sh
		/ # cat /root/parent_name 
		sirius
		/ # ls /data/
		/ # 
		```

	> Este último caso es ideal para recuperar *backups* o ficheros generados en un contenedor, en vistas a su utilización futura por parte de otros contenedores o del mismo *host*.



# Principales acciones a realizar con volúmenes #


## 1. Agregar un volumen de datos ##

**Puede agregar un volumen de datos a un contenedor utilizando el indicador `-v` con el comando `docker create` y `docker run`. Puede usar las `-v` múltiples veces para montar múltiples volúmenes de datos.**

Por ejemplo, montemos un solo volumen en su contenedor de aplicaciones web, arranquemos el contenedor en modo diferido (segundo plano `-d`), publicando los puertos en las interfaces de red del host (`-P`), asignándole el nombre `web` al contenedor a partir de la imagen `training/webapp` y lanza el comando `python` con el argumento `app.py`.

    $ docker run -d -P --name web -v /webapp training/webapp python app.py

Esto creará un nuevo volumen dentro de un contenedor en `/webapp`. Este volumen no tendrá un nombre fijado por nosotros, sino que docker le asignará uno.

> Nota : También puede usar las instrucciones `VOLUME` en un `Dockerfile` para agregar uno o más volúmenes nuevos a cualquier contenedor creado a partir de esa imagen.


## 2. Ubica un volumen ##

Puede ubicar el volumen (donde se localiza exactamente y cómo se llama) en el host utilizando el comando `docker inspect`.

    $ docker inspect web

La salida proporcionará detalles sobre las configuraciones del contenedor, incluidos los volúmenes. La salida debe ser similar a la siguiente:

	...
	"Mounts": [
	    {
	        "Name": "fac362...80535",
	        "Source": "/var/lib/docker/volumes/fac362...80535/_data",
	        "Destination": "/webapp",
	        "Driver": "local",
	        "Mode": "",
	        "RW": true,
	        "Propagation": ""
	    }
	]
	...


Notarás en lo anterior que en `Source` se especifica la ubicación en el host y en `Destination` se especifica la ubicación del volumen dentro del contenedor. `RW` muestra si el volumen es de lectura / escritura.

## 3. Listar todos los volúmenes ##

Puede enumerar todos los volúmenes existentes usando `docker volume ls`.

	$ docker volume ls
	DRIVER              VOLUME NAME
	local               ec75c47aa8b8c61fdabcf37f89dad44266841b99dc4b48261a4757e70357ec06
	local               f73e499de345187639cdf3c865d97f241216c2382fe5fa67555c64f258892128
	local               tmp_data

## 4. Eliminar volúmenes ##

**El volumen de datos de Docker persiste después de que se elimina un contenedor. Puede crear volúmenes con nombre o anónimos. Los volúmenes nombrados tienen una ruta fuente específico fuera del contenedor, por ejemplo `awesome:/bar`. Los volúmenes anónimos no tienen una ruta fuente específica. Cuando se elimina el contenedor, debe indicar al demonio Docker Engine que limpie los volúmenes anónimos. Para hacer esto, use la opción `--rm`**, por ejemplo:

    $ docker run --rm -v /foo -v awesome:/bar busybox top

Este comando crea un volumen anónimo `/foo`. Cuando se elimina el contenedor, Docker Engine elimina el volumen `/foo` pero no el volumen `awesome`.

Para eliminar todos los volúmenes no utilizados y liberar espacio,

    $ docker volume prune

> **Eliminará todos los volúmenes no utilizados que no estén asociados con ningún contenedor**.






# Ejemplos prácticos #


## 1. Montar un DIRECTORIO de host como un volumen de datos ##

Montar un directorio de host puede ser útil para probar. Por ejemplo, puede montar el código fuente dentro de un contenedor. Luego, cambie el código fuente y vea su efecto en la aplicación en tiempo real.

Además de crear un volumen usando el indicador `-v`, también puedes montar un directorio de la máquina host como volumen de un contenedor usando `-v host-dir:container-dir`. Podríamos modificar el ejemplo anterior:

    $ docker run -d -P --name web -v /src/webapp:/webapp training/webapp python app.py

**Este comando monta el directorio de host, `/src/webapp`, dentro del contenedor en `/webapp`. Si la ruta `/webapp` ya existe dentro de la imagen del contenedor, el montaje se superpone en `/src/webapp` pero no elimina el contenido preexistente. Una vez que se quita la montura, se puede volver a acceder al contenido. Esto es consistente con el comportamiento esperado del comando `mount`.**




ESTO HAY QUE ASEGURARSE MUCHO, MUCHO, MUCHO!!!!!!!

CAMBIAR EL EJEMPLO A ALGO MAS SIMPLE: UN SERVIDOR WEB Y UNA PAGINA HTML QUE VAMOS MODIFICANDO PARA VER LOS CAMBIOS.



**El `host-dir` puede ser o bien una ruta absoluta, como `/dst/docs` en Linux o `C:\dst\docs` en Windows, o un valor `name`. Si proporciona una ruta absoluta para el `host-dir`** ***Docker Engine*** **crea un montaje de enlace a la ruta que especifique. Si proporciona un `name`,** ***Docker Engine*** **crea un volumen nombrado por ese `name`.** 

Por ejemplo, puede especificar cualquiera `/foo` o `foo` para un valor de `host-dir`. Si proporciona el valor `/foo`, ***Docker Engine*** crea un montaje de enlace. Si proporciona la especificación `foo`, ***Docker Engine*** crea un volumen con nombre.

**Un valor `name` debe comenzar con un carácter alfanumérico, seguido de `a-z0-9`, `_` (guión bajo), `.` (punto) o `-` (guión). Una ruta absoluta comienza con a `/` (barra diagonal).**

**El `container-dir` siempre debe ser un camino absoluto como `/src/docs`.**

Si está utilizando ***Docker Machine*** en Mac o Windows, su daemon *Docker Engine* solo tiene acceso limitado a su sistema de archivos macOS o Windows. *Docker Machine* intenta compartir automáticamente su directorio `/Users` (macOS) o `C:\Users` (Windows). Por lo tanto, puede montar archivos o directorios en macOS usando.

    docker run -v /Users/<path>:/<container path> ...

En Windows, monte directorios usando:

    docker run -v c:\<path>:c:\<container path>

Todas las demás rutas provienen del sistema de archivos de su máquina virtual, por lo que si desea hacer que otra carpeta de host esté disponible para compartir, debe realizar un trabajo adicional. ***En el caso de VirtualBox, necesita hacer que la carpeta de host esté disponible como una carpeta compartida en VirtualBox***. Luego, puede montarlo usando la bandera Docker `-v`.

**El directorio en el host debe especificarse como una ruta absoluta y, si el directorio no existe, el daemon de Docker Engine lo creará automáticamente**.

**Los volúmenes de Docker se montan por defecto en el modo de lectura-escritura, pero también pueden configurarse para que sean montados de solo lectura**.

    $ docker run -d -P --name web -v /src/webapp:/webapp:ro training/webapp python app.py

Aquí ha montado el mismo directorio `/src/webapp` pero ha agregado la opción `ro` para especificar que el montaje debe ser de solo lectura.

También puede relajar los requisitos de coherencia de un directorio montado para mejorar el rendimiento agregando la opción `cached`:

    $ docker run -d -P --name web -v /src/webapp:/webapp:cached training/webapp python app.py

La opción `cached` generalmente mejora el rendimiento de las cargas de trabajo de lectura pesada en Docker para Mac, a costa de algunas incoherencias temporales entre el host y el contenedor. En otras plataformas, actualmente `cached` no tiene ningún efecto. El artículo [User-guided caching in Docker for Mac](https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/ "https://blog.docker.com/2017/05/user-guided-caching-in-docker-for-mac/") proporciona más detalles sobre el comportamiento de `cached` en macOS.

> Nota : **El directorio de host es, por su naturaleza, dependiente del host. Por esta razón, no puede montar un directorio de host desde Dockerfile, la instrucción `VOLUME` no admite pasar a `host-dir`, porque las imágenes construidas deben ser portátiles. Un directorio de host no estaría disponible en todos los hosts potenciales**.

## 2. Montar un ARCHIVO de host como volumen de datos ##

El indicador `-v` también se puede usar para montar un solo archivo, en lugar de solo directorios, desde el equipo host.

    $ docker run --rm -it -v ~/.bash_history:/root/.bash_history ubuntu /bin/bash

Esto lo llevará a un shell de bash en un contenedor nuevo, tendrá su historial de bash desde el host y cuando salga del contenedor, el host tendrá el historial de los comandos escritos en el contenedor.


> **Nota** : Muchas herramientas utilizadas para editar archivos incluidas `vi` y `sed --in-place` pueden dar como resultado un cambio de inodo. Desde Docker v1.1.0, esto producirá un error como *"sed: cannot rename ./sedKdJ9Dy: Device or resource busy"*. En el caso en que desee editar el archivo montado, a menudo es más fácil montar el directorio principal.






	ESTO NO LO ENTIENDO DEMASIADO, QUE YO SEPA NO HACE FALTA PLUGINS, REVISAR USO, PUEDE QUE ESTÉ ANTICUADO.








## 3. Montar un volumen de almacenamiento compartido como un volumen de datos ##

Además de montar un directorio de host en su contenedor, algunos [Docker volume plugins](https://docs.docker.com/v17.03/engine/extend/plugins_volume/ "https://docs.docker.com/v17.03/engine/extend/plugins_volume/") le permiten aprovisionar y montar almacenamiento compartido, como ***iSCSI***, ***NFS*** o ***FC***.

**Una ventaja del uso de volúmenes compartidos es que son independientes del host. Esto significa que un volumen puede estar disponible en cualquier host en el que se inicie un contenedor, siempre que tenga acceso al backend de almacenamiento compartido y tenga instalado el complemento.**

Una forma de usar controladores de volumen es a través del comando `docker run`. **Los controladores de volumen crean volúmenes por nombre, en lugar de por ruta como en los otros ejemplos.**

El siguiente comando crea un volumen nombrado, llamado `my-named-volume`, usando el `convoy` volume driver (`convoy` es un plugin para una variedad de discos de almacenamiento de back-ends) y lo hace disponible dentro del contenedor en `/webapp`. Antes de ejecutar el comando, [instale y configure convoy](https://github.com/rancher/convoy#quick-start-guide "https://github.com/rancher/convoy#quick-start-guide"). Si no desea instalar `convoy`, reemplace `convoy` con `local`, en los siguientes comandos de ejemplo se usará  el controlador `local`.

    $ docker run -d -P \
      --volume-driver=convoy \
      -v my-named-volume:/webapp \
      --name web training/webapp python app.py

También puede usar el comando `docker volume create` para crear un volumen antes de usarlo en un contenedor.

El siguiente ejemplo también crea el volumen `my-named-volume`, esta vez usando el comando `docker volume create`. Las opciones se especifican como pares clave-valor en el formato `o=<key>=<value>`.

    $ docker volume create -d convoy --opt o=size=20GB my-named-volume
    
    $ docker run -d -P \
      -v my-named-volume:/webapp \
      --name web training/webapp python app.py

Una lista de complementos disponibles, incluidos los complementos de volumen, está disponible [aquí](https://docs.docker.com/v17.03/engine/extend/legacy_plugins/ "https://docs.docker.com/v17.03/engine/extend/legacy_plugins/") .


## 4. Crear y montar un contenedor de volumen de datos ##

**Si tiene algunos datos persistentes que desea compartir entre contenedores, o desea utilizarlos desde contenedores no persistentes, es mejor crear un contenedor de volúmenes de datos con nombre y luego montar los datos desde él.**

Vamos a crear un nuevo contenedor con nombre con un volumen para compartir. Si bien este contenedor no ejecuta una aplicación, reutiliza la imagen `training/postgres` para que todos los contenedores utilicen capas en común, lo que ahorra espacio en el disco.

    $ docker create -v /dbdata --name dbstore training/postgres /bin/true

Luego puede usar la bandera `--volumes-from` para montar el volumen `/dbdata` en otro contenedor.

    $ docker run -d --volumes-from dbstore --name db1 training/postgres

Y otro:

    $ docker run -d --volumes-from dbstore --name db2 training/postgres

**En este caso, si la imagen postgres contiene un directorio llamado, `/dbdata` entonces el montaje de los volúmenes desde el contenedor `dbstore` oculta los archivos `/dbdata` de la imagen postgres. El resultado es que solo los archivos del contenedor `dbstore` son visibles.**

Puede usar múltiples parámetros `--volumes-from` para combinar volúmenes de datos de varios contenedores. Para encontrar información detallada sobre cómo `--volumes-from` deberias consultar [montaje de los volúmenes desde el contenedor](https://docs.docker.com/v17.03/engine/reference/commandline/run/#mount-volumes-from-container-volumes-from "https://docs.docker.com/v17.03/engine/reference/commandline/run/#mount-volumes-from-container-volumes-from") en la referencia del comando `run`.

También puede extender la cadena mediante el montaje del volumen que vino del contenedor `dbstore` en otro recipiente a través de los contenedores `db1` o `db2`.

    $ docker run -d --name db3 --volumes-from db1 training/postgres

**Si elimina contenedores que montan volúmenes, incluido el contenedor inicial `dbstore`, o los contenedores subsiguientes `db1` y `db2`, los volúmenes no se eliminarán. Para eliminar el volumen del disco, debe llamar explícitamente `docker rm -v` al último contenedor con una referencia al volumen. Esto le permite actualizar o migrar efectivamente volúmenes de datos entre contenedores.**


> **Nota** : **Docker no le avisará cuando retire un contenedor sin proporcionar la opción `-v` de eliminar sus volúmenes. Si quita contenedores sin usar la opción `-v`, puede terminar con volúmenes *"huerfanos"*; volúmenes a los que ya no hace referencia un contenedor. Puede usar `docker volume ls -f dangling=true` para encontrar volúmenes huerfanos y usar `docker volume rm <volume name>` para eliminar un volumen que ya no se necesita.**

REHACER EL TEXTO DE LA EXPLICACION PARA ENCAJAR ESTA IDEA, LA EXPLICACIÓN ACTUAL ES MALISIMA.

> ## Consejos importantes sobre el uso de volúmenes compartidos ##
> 
> **Varios contenedores también pueden compartir uno o más volúmenes de datos. Sin embargo, los contenedores múltiples que escriben en un único volumen compartido pueden causar daños en los datos. Asegúrese de que sus aplicaciones estén diseñadas para escribir en almacenes de datos compartidos.**
> 
> **Los volúmenes de datos son directamente accesibles desde el host de Docker. Esto significa que puede leer y escribir con las herramientas normales de Linux. En la mayoría de los casos, no debe hacer esto, ya que puede dañar los datos si sus contenedores y aplicaciones desconocen su acceso directo.**



## 5. Copia de seguridad, restauración o migración de volúmenes de datos ##

https://stackoverflow.com/questions/21597463/how-to-port-data-only-volumes-from-one-host-to-another

Otra función útil que podemos realizar con volúmenes es usarlos para copias de seguridad, restauraciones o migraciones. Para ello, usa la bandera `--volumes-from` para crear un nuevo contenedor que monte ese volumen, así:

    $ docker run --rm --volumes-from dbstore -v $(pwd):/backup ubuntu tar cvf /backup/backup.tar /dbdata

1. **Ha lanzado un nuevo contenedor y montado el volumen desde el contenedor `dbstore`**.
2. **Ha montado un directorio de host local** como `/backup`. 
3. **Ha pasado un comando que utiliza `tar` para hacer una copia de seguridad del contenido del volumen `dbdata` en un archivo de backup `.tar` dentro de nuestro directorio `/backup`**. Cuando el comando finalice y el contenedor se detenga, nos quedará una copia de seguridad de nuestro volumen `dbdata`.

Luego puede **restaurarlo** en el mismo contenedor u otro que haya creado en otro lugar. 

1. Crea un nuevo contenedor.

		$ docker run -v /dbdata --name dbstore2 ubuntu /bin/bash

2. A continuación, desactive el archivo de copia de seguridad en el volumen de datos del nuevo contenedor.

		$ docker run --rm --volumes-from dbstore2 -v $(pwd):/backup ubuntu bash -c "cd /dbdata && tar xvf /backup/backup.tar --strip 1"

> **NOTA**: Puede utilizar las técnicas anteriores para automatizar la copia de seguridad, la migración y las pruebas de restauración utilizando sus herramientas preferidas.







## Referencias ##

[https://juliomunoz.wordpress.com/2015/01/20/introduccion-a-docker/](https://juliomunoz.wordpress.com/2015/01/20/introduccion-a-docker/ "https://juliomunoz.wordpress.com/2015/01/20/introduccion-a-docker/")

[https://docs.docker.com/v17.03/engine/tutorials/dockervolumes/](https://docs.docker.com/v17.03/engine/tutorials/dockervolumes/ "https://docs.docker.com/v17.03/engine/tutorials/dockervolumes/")


[https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc "https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc")

ESTA DEBERIA SER LA DOCU OFICIAL PARA EL ARTICULO
https://docs.docker.com/engine/admin/volumes/volumes