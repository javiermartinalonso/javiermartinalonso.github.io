---
layout: post
section: "LINUX"
title:  "Jerárquía estandar de ficheros Unix"
date:   2017-12-25
desc: "Teoría sobre el sistema de ficheros de Unix que todo devOps debe conocer."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux, shell, comandos, host]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# Jerárquía estándar sistema de ficheros UNIX #

Un fichero ***UNIX*** es una secuencia de 0 o más bytes. El sistema no distingue entre ficheros ASCII, binarios, no hacen ninguna diferencia entre archivos y directorios, entendiendo que un directorio es sólo un archivo que contiene los nombres de otros archivos. De la misma manera, otros elementos como imágenes, textos, programas y servicios son vistos por ***Linux*** sólo como archivos, igual que cualquier unidad extraíble o dispositivo que le conectemos. La interpretación del contenido de los ficheros se deja a los programas que los utilizan. 

<!-- more -->
La longitud de los nombres de los ficheros estaba limitada originariamente a 14 caracteres arbitrarios, pero BSD ***UNIX*** la incrementó hasta 255. Las mayúsculas y las minúsculas son significativas, lo que significa que *LEEME*, *leeme*, y *Leeme* serían nombres diferentes. 

Normalmente, muchos programas asumen que los nombres de los ficheros consistan en un nombre seguido por una extensión separados por un punto. De esta forma, `prueba.c` es normalmente un programa en C, `informe.pdf` un documento de Adobe, `leeme.txt` un fichero de texto plano, etc. Sin embargo, estas convenciones no son impuestas por el sistema operativo. La gran diferencia de ***UNIX*** con respecto a otros sistemas es que en ***UNIX*** existe un solo árbol de directorios y no uno para cada unidad de almacenamiento (disco duro, partición de disco, unidad flash, CD/DVD, etc.). 
Cualquier unidad de almacenamiento debe formar parte de esta estructura única. A la operación por la cual una unidad de almacenamiento entra a formar parte del árbol de directorios del sistema se la denomina ***montaje del dispositivo***. Existe un directorio que contiene el resto de archivos y directorios del sistema. Es el directorio raíz. El directorio raíz se representa siempre con el símbolo de barra inclinada `/`.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/linux/linux-filesystem.png" alt="jerarquía de ficheros" class="img-thumbnail" style="width: 70%"/>
</div>

> En ***Linux***, cada uno de los archivos es representado por un **inode**, ***una especie de código de serie único que contiene toda la información sobre los datos que se pueden encontrar en dicho archivo.***
> 
> De esta manera, cada vez que se hace una partición de disco, el sistema establece un número determinado de ***inodes***, que es la cantidad de archivos de todo tipo que podremos tener al mismo tiempo. Además, cada vez que se crea un archivo, este recibe un ***inode*** que recoge información sobre ***su propietario, el tipo de archivo que es, los permisos que tiene y su fecha de creación o edición, así como su tamaño, su localización en el disco duro y la cantidad de enlaces que apuntan hacia él.***

## Funcionalidad de la jerarquía de ficheros de sistemas Unix ##

Esta estructura de árbol y los nombres de los directorios no es al azar, tiene un sentido y una funcionalidad:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/linux/funcionalidad-filesystem.jpg" alt="explicación jerarquía de ficheros" class="img-thumbnail" style="width: 100%"/>
</div>

| Directorio | Descripción breve |
| ---------- | ---------- |
| `/` | Directorio raíz del sistema de ficheros. Denominado directorio Root (No confundir con el usuario root) Solo el usuario Root tiene privilegios de escritura en este directorio. No es lo mismo `/root` que `/`, el primero es el home del usuario root, el segundo es la raíz de todos los archivos|
| `/bin` | Comandos y programas esenciales disponibles para todos los usuarios del sistema. |
| `/boot` | Gestores de arranque. |
| `/dev` | Contiene los dispositivos esenciales (no solo los de almacenamiento, también terminales, micrófonos, impresoras, etc). |
| `/etc` | Ficheros de configuración del sistema. El nombre proviene de “etcétera”. |
| `/etc/network` | Fichero de configuración del servicio de red |
| `/etc/X11` | Ficheros de configuración para el X Window |
| `/home` | Directorios de los usuarios, excepto el del superusuario (root). Estos directorios contienen los ficheros propios de un usuario. A menudo se constituye una partición de disco separada para ellos. |
| `/lib` | Contiene todas las bibliotecas (mal traducidas como librerías) para el núcleo y las esenciales que son compartidas por los programas alojados `/bin` y `/sbin`. |
| `/media` | Contiene los puntos de montaje de los medios removibles de almacenamiento, tales como lectores de CD-ROM, Pendrives (memoria USB), e incluso sirve para montar otras particiones del mismo disco duro, por ejemplo alguna partición desde otro sistema operativo. |
| `/mnt` | Sistema de ficheros montados temporalmente. Es una directorio semejante a `/media`, pero es usada mayormente por los usuarios. Sirve para montar discos duros y particiones de forma temporal en el sistema. |
| `/opt` | Paquetes software opcionales, que pueden ser compartidos por los usuarios. Estas aplicaciones, utilizan el directorio de usuario para guardas sus configuraciones, y de esta forma, cada usuario puede tener una configuración diferente de la misma aplicación. |
| `/proc` | Ficheros de texto que identifican procesos activos en el sistema. |
| `/root` | Directorio personal (`home`) del usuario root. |
| `/sbin` | Sistema de binarios esencial, comandos y programas exclusivos del superusuario (root), por ejemplo: `init`, `route`). |
| `/tmp` | Ficheros temporales (véase también `/var/tmp`). |
| `/usr` | La mayoría de las utilidades y aplicaciones multiusuario. 
| `/var` | Ficheros variables, tales como logs, archivos spool, bases de datos, archivos de e-mail temporales, y archivos temporales en general. |
| `/var/log` | Ficheros de registro, Log. Varios registros, logs. |
| `/var/mail` | Buzón de mensajes de correo electrónico |
| `/var/tmp` | Ficheros temporales que, a diferencia de `/tmp`, no se borran entre sesiones o reinicios del sistema. |

## Navegar por los directorios ##

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

## Referencias ##

https://es.wikipedia.org/wiki/GNU/Linux

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/

https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX