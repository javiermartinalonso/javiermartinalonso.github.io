---
layout: post
section: "LINUX"
title:  "Linux: Trabajar con el sistema de ficheros"
date:   2017-12-25
desc: "Recopilatorio de los comandos de Unix que son más usados habitualmente para trabajar con el sistema de ficheros. Buscar, leer, crear y editar, comprimir ficheros."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux, shell, comandos, host]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---


# Trabajar con el sistema de ficheros #

Recopilatorio de los comandos de Unix que son más usados habitualmente para trabajar con el sistema de ficheros. Buscar, leer, crear y editar, comprimir ficheros.

<!-- more -->

## 1. Buscar ficheros ##

- Busca archivos en una jerarquía de directorios, imagina que quieres buscar el log de tu aplicación pero no sabes en que directorio está, veamos un ejemplo:

	`find [ruta] [expresión_de_búsqueda] [acción]`

	- `[ruta]` es cualquier directorio o path que se quiera indicar y desde donde inicia la búsqueda, ejemplos pueden ser `/etc`, `/home/javier`, `/`, `.` si no se indica una ruta se toma en cuenta entonces el directorio donde se este actualmente, es decir el directorio de trabajo actual, que es lo mismo que indicar punto `.`. De hecho es posible indicar más de un directorio de búsqueda.

	- `[expresión_de_búsqueda]` es una o más opciones que puede devolver la búsqueda a realizar en si o acciones a realizar sobre la búsqueda, si no se indica ninguna expresión de búsqueda se aplica por defecto la opción ­`print` que muestra el resultado de la búsqueda.

	- `[acción]` es cualquier comando de ***Linux*** invocado a ejecutarse sobre cada archivo o directorio encontrado con la `[expresión_de_búsqueda]`.

	Los tres argumentos anterior son enteramente opcionales

	`find / -name catalina.log`

## 2. Leer y revisar documentos ##

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
		
		`tail -f catalina.out`

	- Despliega en la consola las últimas 1000 entradas en el archivo `catalina.out`
	
		`tail -fn 1000 catalina.out`

- **Descripción: muestra el contenido de un fichero con pausas cada 25 lineas.**

	`more file`

	Ejemplos: `more fichero.txt`

- **Cómo ver el contenido del archivo con opciones avanzadas**

	`Less` es un visor de archivos, se basa en el comando `more` pero con mucho más funcionalidad. Ejemplo:

	`less catalina.out`

	Con esto el archivo catalina.out será mostrado en la pantalla, pero nos permitirá ejecutar comandos para distintas operaciones, para ver la lista de comandos solo se debe oprimir la tecla `h`. Veamos algunas de las opciones disponibles:

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
		- `n`: Repite la búsqueda anterior
		- `N` :Repite la búsqueda anterior en sentido contrario
		- `&pattern`: Muestra solo las líneas que hagan match

	- Edición
		- `v`: Cargar el editor de texto en el lugar donde se encuentre el usuario dentro del archivo. El editor que normalmente se utiliza es el `vi`

## 3. Manipular archivos y directorios: Crear / Modificar ##

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

## 4. Compresión de ficheros ##

- `tar` Descripción: =Tape ARchiver. archivador de ficheros.

	Ejemplos:

	`tar cvf fichero.tar directorio`

	`tar xvf fichero.tar`

	`tar zcvf fichero.tgz directorio`

	`tar zxvf fichero.tgz`

- `gunzip` Descripción: descompresor compatible con ZIP.
	
	Ejemplos: 

	`gunzip fichero`



## Referencias ##

https://es.wikipedia.org/wiki/GNU/Linux

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/

https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX