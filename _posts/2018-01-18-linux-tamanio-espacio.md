---
layout: post
section: "LINUX"
title:  "Linux: Espacio en disco, tamaños de directorios"
date:   2018-01-18
desc: "Recopilatorio de los comandos de Unix usados para obtener información de tamaño de ficheros, espacio disponible u ocupado en disco."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux,shell]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# Linux Espacio en disco, tamaños de directorios #

Recopilatorio de los comandos de Unix usados para obtener información de tamaño de ficheros, espacio disponible u ocupado en disco:

- `df -h` Espacio disponible en disco. Esto nos devolverá las particiones montadas, el uso de espacio en cada una y lo que nos queda de resto, y todo de forma fácil para leer.

<!-- more -->
- `du -bsh [absolutePath]` Tamaño total de una carpeta. Uso de disco. Muestra el espacio que esta ocupado en disco:

	`Du` tiene más opciones, pero en este caso uso estas 3:
	
	- `-b` **[–bytes]**: Mostrar en bytes.
	- `-s` **[–sumarize]**: Mostrar solamente el tamaño total de cada argumento.
	- `-h` **[–human-readable]**: Imprime los tamaños de forma leíble (e.g., 1K, 234M, 2G)


	Si sólo quisiéramos ver cuáles son, por ejemplo, los 5 directorios más pesados en nuestro` /home` podríamos usa du con una serie de comandos extras, por ejemplo:

		$ du ‐hs * | sort ‐nr | head ‐5
		215G Videos
		171G Linux
		68G Documentos
		50G Música
		28G Imágenes

- `wc records.log` Imprimir todas las líneas que tiene un archivo y el número de bytes:

> `wc` ***wordcount*** cuenta el número de líneas (`-l`), palabras (separadas por espacio blanco) (`-w`), caracteres (`-c`) en filas especificadas o de stdin, dependiendo del flag.

- Contar número de archivos dentro de una carpeta. Este otro comando está un poco más rebuscado, ya que implica la utilización de `find` para encontrar todos los archivos, y luego los vamos a contar.

	Tenemos varias formas de hacerlo, pero todas nos van a devolver un solo número que será el número total de coincidencias de archivos. Vamos a ver los tipos más útiles a la hora de hacerlo 

	- `find . -maxdepth 2 -type f  | wc -l` Contar los archivos pero solo en carpetas dos niveles por debajo (si hay más de dos niveles de carpetas se omiten)
	
		> Nos devolverá un solo número como por ejemplo 2590. Fijate que he puesto `-type f` que lo que hace es contar solo archivos (ignoramos las carpetas) 

	- `find . -type f  | wc -l` Contar archivos de forma recursiva ilimitada
	
	- `find . | wc -l` Contar archivos y carpetas de forma recursiva

	- `find . -type f -name "*.php" | wc -l` Contar archivos con una extensión determinada

		> Con este comando estaríamos contando todos los archivos .php, fíjate que también puedes poner un nombre de archivo o una parte como por ejemplo “clase*” o “*log*” para buscar archivos con estas cadenas y contarlos.


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