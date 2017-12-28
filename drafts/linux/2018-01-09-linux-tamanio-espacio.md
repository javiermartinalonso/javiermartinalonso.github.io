---
layout: post
section: "LINUX"
title:  "Linux: Espacio en disco, tamaños de directorios"
date:   2017-12-25
desc: "Recopilatorio de los comandos de Unix usados para obtener información de tamaño de ficheros, espacio disponible u ocupado en disco."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux, shell, comandos, host]
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

- Contar número de archivos dentro de una carpeta. Este otro comando está un poco más rebuscado, ya que implica la utilización de `find` para encontrar todos los archivos, y luego los vamos a contar.

	Tenemos varias formas de hacerlo, pero todas nos van a devolver un solo número que será el número total de coincidencias de archivos. Vamos a ver los tipos más útiles a la hora de hacerlo 

	- `find . -maxdepth 2 -type f  | wc -l` Contar los archivos pero solo en carpetas dos niveles por debajo (si hay más de dos niveles de carpetas se omiten)
	
		> Nos devolverá un solo número como por ejemplo 2590. Fijate que he puesto `-type f` que lo que hace es contar solo archivos (ignoramos las carpetas) 

	- `find . -type f  | wc -l` Contar archivos de forma recursiva ilimitada
	
	- `find . | wc -l` Contar archivos y carpetas de forma recursiva

	- `find . -type f -name "*.php" | wc -l` Contar archivos con una extensión determinada

		> Con este comando estaríamos contando todos los archivos .php, fíjate que también puedes poner un nombre de archivo o una parte como por ejemplo “clase*” o “*log*” para buscar archivos con estas cadenas y contarlos.

## Referencias ##

https://es.wikipedia.org/wiki/GNU/Linux

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/

https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX