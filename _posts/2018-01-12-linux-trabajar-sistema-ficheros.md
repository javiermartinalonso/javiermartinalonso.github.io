---
layout: post
sections: [LINUX]
title:  "Linux: Trabajar con el sistema de ficheros"
date:   2018-01-12
desc: "Recopilatorio de los comandos de Unix que son más usados habitualmente para trabajar con el sistema de ficheros. Buscar, leer, crear y editar, comprimir ficheros."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux,shell]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---


# Trabajar con el sistema de ficheros #

Recopilatorio de los comandos de Unix que son más usados habitualmente para trabajar con el sistema de ficheros. Buscar, leer, crear y editar, comprimir ficheros.

<!-- more -->

## 1. Principales comandos para navegar por los directorios ##

- `pwd`: ***Print working directory***: Muestra el directorio de trabajo, nos mostrará la ruta en la que nos encontramos actualmente. Muy útil si hemos estado saltando de subcarpeta en subcarpeta y el prompt nos muestra sólo una ruta abreviada.

- `ls`: Nos muestra una lista con el contenido del directorio actual (o el que le pasemos como argumento).

	Ejemplo: `ls /home/usuario`

- `ls –l` o `ll`: Muestra una lista del contenido del directorio añadiendo información adicional de los ficheros o carpetas, como permisos, fecha y hora de creación o modificación, etc…

- `ls –a`: Muestra una lista de todos los ficheros del directorio, incluyendo los ficheros o carpetas ocultos.

- Listar un archivo/directorio con un nombre que comience con un caracter particular:

	`ls -l | grep <character>*`

	Ejemplo: Listar archivo/directorio que comienzan con 'ab':
	
	`ls -l | grep ab*`

- `cd`: nos lleva al directorio raíz.

- `cd..` : Subiremos un nivel en el árbol de directorios. Si por ejemplo nos encontramos en `/home/usuario`, con este comando nos iremos a `/home`.


## 2. Buscar ficheros ##

- Busca archivos en una jerarquía de directorios, imagina que quieres buscar el log de tu aplicación pero no sabes en que directorio está, veamos un ejemplo:

	`find [ruta] [expresión_de_búsqueda] [acción]`

	- `[ruta]` es cualquier directorio o path que se quiera indicar y desde donde inicia la búsqueda, ejemplos pueden ser `/etc`, `/home/javier`, `/`, `.` si no se indica una ruta se toma en cuenta entonces el directorio donde se este actualmente, es decir el directorio de trabajo actual, que es lo mismo que indicar punto `.`. De hecho es posible indicar más de un directorio de búsqueda.

	- `[expresión_de_búsqueda]` es una o más opciones que puede devolver la búsqueda a realizar en si o acciones a realizar sobre la búsqueda, si no se indica ninguna expresión de búsqueda se aplica por defecto la opción ­`print` que muestra el resultado de la búsqueda.

	- `[acción]` es cualquier comando de ***Linux*** invocado a ejecutarse sobre cada archivo o directorio encontrado con la `[expresión_de_búsqueda]`.

	Los tres argumentos anterior son enteramente opcionales

	`find / -name catalina.log`

## 3. Leer y revisar documentos ##

- **Determinar el tipo de un archivo (fichero, directorio)**

	`file <Filename>`

	Ejemplos: 

	`file fichero`

	`file *`

- **Cómo ver el contenido del archivo o archivos (sin poder editarlo):**

	`cat <FileName>`

	Ejemplos: 
	
	`cat abc.txt` Muestra el contenido del fichero abc.txt.

	`cat log-*` Muestra el contenido de todos los ficheros que comienzan por 'log-' en el directorio actual
	
- **Cómo ver la última parte del contenido del archivo (sin poder editarlo):**

	- Despliega en la consola las últimas entradas en el archivo `catalina.out`
		Ejemplos: 		

		`tail -f catalina.out`

	- Despliega en la consola las últimas 1000 entradas en el archivo `catalina.out`
	
		Ejemplos: 

		`tail -fn 1000 catalina.out`

- **Mostrar el contenido de un fichero con pausas cada 25 lineas.**

	`more <FileName>`

	Ejemplos:

	`more fichero.txt`

- **Cómo ver el contenido del archivo con opciones avanzadas**

	`Less` es un visor de archivos, se basa en el comando `more` pero con mucho más funcionalidad. 

	Ejemplo:

	`less catalina.out`

	Con esto el archivo `catalina.out` será mostrado en la pantalla, pero nos permitirá ejecutar comandos para distintas operaciones, para ver la lista de comandos solo se debe oprimir la tecla `h`. Veamos algunas de las opciones disponibles:

	- Para moverse en el visor:
		- `h` : Muestra la ayuda en la consola.
		- `q :q Q :Q ZZ` : Salir
		- `e ^E j ^N CR INTRO` : Siguiente línea
		- `y ^Y k ^K ^P`: Ir atrás una línea
		- `f ^F ^V SPACE AvPág`: Ir adelante una pantalla de texto
		- `b ^B ESC-v RePág` : Ir atrás una pantalla de texto
		- `G` : Ir al final del texto
		- `g` : Ir al principio del texto
		- `f` : Adelante para siempre, es similar al comando `tail -f`
		- `R` : Repintar la pantalla. Útil cuando se está visualizando un archivo que ha sido modificado por otro programa.

	- Búsqueda (Muy útil para búsqueda en logs):
		- `/pattern`: Busca la siguiente línea que haga match con el patron
		- `?patten`: Busca hacia atrás la línea que haga match con el patrón
		- `n`: Buscar la siguiente ocurrencia de la búsqueda
		- `N` :Repite la búsqueda anterior en sentido contrario
		- `&pattern`: Muestra solo las líneas que hagan match

	- Edición
		- `v`: Cargar el editor de texto en el lugar donde se encuentre el usuario dentro del archivo. El editor que normalmente se utiliza es el `vi`

## 4. Manipular archivos y directorios: Crear / Modificar ##

- `touch <fileName>` **Crear un nuevo archivo:**

	Ejemplo: `touch abc.txt`

- `vi <FileName>` **Editar un archivo** ***(también sirve para crear el archivo)***
	
	Ejemplo: `vi abc.txt`

	- Proceso de edición:
		- Abrir el archivo con el siguiente comando
		
			`vi abc.txt`
		
		- Presione `i`, activará el modo de edición.
		
		- Modifica el archivo.
		
		- Guardar el cambio y salir (write & quit): `wq!`

- `cp`: Copia un fichero o directorio.

- `cp –i`: Copia un fichero o directorio y pregunta antes de sobrescribir si se diese el caso.

- `cp –r`: Copia un directorio con todo su contenido.

- `mv`: Mueve o renombra un fichero o directorio. En la terminal de ***Linux***, en lugar de renombrar un fichero mediante un comando exclusivo, utilizamos el mismo que para mover archivos o directorios, y lo que hacemos para renombrarlo es moverlo a la misma ruta donde se encuentra y cambiarle el nombre.

- `mv –i`: Mueve o renombra un fichero o directorio preguntando antes de sobrescribir si se diese el caso.

- `mkdir`: Crea un directorio.

- `rmdir`: Elimina un directorio vacío.

- `rm file`: Elimina ficheros.

- `rm –r`: Elimina un directorio y todo su contenido.

- `rm –i fichero`: Elimina un fichero solicitando confirmación. Es muy recomendable usarlo con la opción `–r` para poder usarlo con directorios evitando problemas.

## 5. Compresión de ficheros ##

- Archivos `.tar`: Descripción: ***Tape ARchiver. archivador de ficheros. Fusionar varios ficheros en uno para facilitar su transmisión por la red.***

	- Comprimir: `tar -cvf empaquetado.tar path_carpeta_a_empaquetar`.

		- `-c` : indica a tar que cree un archivo de empaquetado.

		- `-v` : indica a tar que muestre lo que va empaquetando.

		- `-f` : indica a tar que el siguiente argumento es el nombre del `fichero.tar`.

	- Descomprimir: `tar -xvf archivo.tar`

		- `-x` : indica a tar que descomprima el fichero.tar.
		
		- `-v` : indica a tar que muestre lo que va desempaquetando.
		
		- `-f` : indica a tar que el siguiente argumento es el nombre del fichero a desempaquetar.

	Ejemplos:
	
		`tar cvf fichero.tar /home/javi/directorio`
	
		`tar xvf fichero.tar`

	- Si se quiere ver el contenido de un fichero .tar, se utiliza el siguiente comando:

		- `tar -tf archivo.tar`
		
		- `-t` : Lista el contenido del fichero .tar
		
		- `-f` : indica a tar que el siguiente argumento es el nombre del fichero a ver.


- Archivos `.tar.gz`: Descripción: Son iguales que los anteriores: ***Tape ARchiver. archivador de ficheros. Fusionar varios ficheros en uno para facilitar su transmisión por la red.*** ***Pero además están comprimidos con GZIP para reducir su tamaño***. La única diferencia es que tenemos que añadir la opción `z`.

	- Comprimir: `tar -czvf empaquetado.tar.gz path_carpeta_a_empaquetar`
	
	- Descomprimir: `tar -xzvf archivo.tar.gz`
	
	Ejemplos:
	
		`tar zcvf fichero.tgz /home/javi/directorio`
	
		`tar zxvf fichero.tgz`

- Archivos `.gz`: Archivos comprimidos con GZIP para reducir su tamaño.

	- Comprimir: `gzip -9 fichero path_carpeta_a_empaquetar`
	
	- Descomprimir: `gzip -d fichero.gz`
	
- Archivos `.zip`: Archivos comprimidos con ZIP para reducir su tamaño.

	- Comprimir: `zip fichero path_carpeta_a_empaquetar`
	
	- Descomprimir: `unzip fichero.zip`

- `gunzip` Descripción: descompresor compatible con ZIP para reducir su tamaño.
	
	Ejemplos: 

	`gunzip fichero`

- Archivos `.rar`: Descripción:.

	- Comprimir: `rar -a archivo.rar path_carpeta_a_empaquetar`
	
	- Descomprimir: `unrar -x archivo.rar`

	- Para ver el contenido de un fichero rar, se usa el siguiente comando: `unrar -v archivo.rar` o `unrar -l archivo.rar`.
	
	Ejemplos:
	
		`rar -a fichero.rar /home/javi/directorio`
	
		`unrar -x fichero.rar`

		`unrar -v fichero.rar`

		`unrar -l fichero.rar`


## Artículos relacionados ##

[Introducción al sistema operativo Linux]({{ site.baseurl }}linux/2018/01/02/linux-introduccion.html "Introducción al sistema operativo Linux")

[Jerárquía estándar sistema de ficheros UNIX]({{ site.baseurl }}linux/2018/01/03/linux-jerarquia-sistema-ficheros "Jerárquía estándar sistema de ficheros UNIX")

[Interface Linea de Comando]({{ site.baseurl }}linux/2018/01/10/linux-linea-comandos "Interface Linea de Comando")

[Operaciones con host remotos]({{ site.baseurl }}linux/2018/01/11/linux-trabajar-host-remotos "Operaciones con host remotos")

[Trabajar con el sistema de ficheros]({{ site.baseurl }}linux/2018/01/12/linux-trabajar-sistema-ficheros "Trabajar con el sistema de ficheros")

[Búsquedas avanzadas con el comando grep]({{ site.baseurl }}linux/2018/01/15/linux-grep-patrones-debug.html "Búsquedas avanzadas con el comando grep")

[Enlaces físicos (Hard links) y simbólicos (Soft links)]({{ site.baseurl }}linux/2018/01/16/linux-enlaces-fisicos-simbolicos "Enlaces físicos (Hard links) y simbólicos (Soft links)")

[Gestión de los permisos de archivos o directorios UNIX]({{ site.baseurl }}linux/2018/01/17/linux-gestion-permisos "Gestión de los permisos de archivos o directorios UNIX")

[Linux: Espacio en disco, tamaños de directorios]({{ site.baseurl }}linux/2018/01/18/linux-tamanio-espacio "Linux: Espacio en disco, tamaños de directorios")

[Comandos de administración Host Unix]({{ site.baseurl }}linux/2018/01/19/linux-administracion-host "Comandos de administración Host Unix")

[TIPS Atajos de teclado shell Linux]({{ site.baseurl }}linux/2018/01/22/linux-tips-atajos-teclado "TIPS Atajos de teclado shell Linux")

[TIPS Concatenar comandos en linux]({{ site.baseurl }}linux/2018/01/23/linux-tips-concatenar-comandos "TIPS Concatenar comandos en linux")

[Artículos sobre Linux]({{ site.baseurl }}linux/ "Artículos sobre Linux")

## Referencias ##

[https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/](https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/ "https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/")

[https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX](https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX "https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX")