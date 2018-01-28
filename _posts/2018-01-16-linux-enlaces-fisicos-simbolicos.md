---
layout: post
section: "LINUX"
title:  "LINUX: Enlaces físicos (Hard links) y simbólicos (Soft links)"
date:   2018-01-16
desc: "Enlaces físicos (Hard links) y simbólicos (Soft links)."
keywords: "linux, shell, comandos, host, hard-link, soft_link"
categories: [linux]
tags: [linux,shell,hard-link,soft_link]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

## Enlaces físicos (Hard links) y simbólicos (Soft links) ##

### Enlaces físicos ###

En ***Linux***, cada uno de los archivos es representado por un **inode**, ***una especie de código de serie único que contiene toda la información sobre los datos que se pueden encontrar en dicho archivo.***

De esta manera, cada vez que se hace una partición de disco, el sistema establece un número determinado de ***inodes***, que es la cantidad de archivos de todo tipo que podremos tener al mismo tiempo. Además, cada vez que se crea un archivo, este recibe un ***inode*** que recoge información sobre ***su propietario, el tipo de archivo que es, los permisos que tiene y su fecha de creación o edición, así como su tamaño, su localización en el disco duro y la cantidad de enlaces que apuntan hacia él.***

<!-- more -->

Un enlace físico no es más que una etiqueta o un nuevo nombre asociado a un ***inode***. Es una forma de identificar el mismo contenido con diferentes nombres. Éste enlace no es una copia separada del archivo anterior sino un nombre diferente para exactamente el mismo contenido.

Para crear un enlace físico en ***Linux*** del archivo `archivo.txt` a `nuevo_nombre.txt`, ejecutamos:

`$ ln archivo.txt nuevo_nombre.txt`

El enlace aparecerá como otro archivo más en el directorio y apuntará al mismo contenido de `archivo.txt`. Cualquier cambio que se haga se reflejará de la misma manera tanto para `archivo.txt` como para `nuevo_nombre.txt`.

Un enlace se puede borrar usando el comando `rm` de la misma manera en que se borra un archivo, sin embargo el contenido no se eliminará mientras haya un enlace físico que le siga haciendo referencia. Esto puede tener varias ventajas, pero también puede complicar la tarea de seguimiento de los archivos. Un enlace físico tampoco puede usarse para hacer referencia a directorios o a archivos en otros equipos.

### Enlaces simbólicos ###

Un enlace simbólico también puede definirse como una etiqueta o un nuevo nombre asociado a un archivo pero a diferencia de los enlaces físicos, el enlace simbólico no contiene los datos del archivo, simplemente apunta al registro del sistema de archivos donde se encuentran los datos. Tiene mucha similitud a un acceso directo en Windows o un alias en OS X.

Para crear un enlace simbólico del archivo `archivo.txt` a `nuevo_nombre.txt`, ejecutamos:
`ln -s <SoftLink name> <Directory which soft link will point to>`
`$ ln -s archivo.txt nuevo_nombre.txt`

Ejemplo: 
`ln -s latest 1.0`

Entonces, aquí está apuntando el último enlace suave al directorio 1.0

Éste enlace también aparecerá como otro archivo más en el directorio y apuntará al mismo contenido de `archivo.txt`, reflejando todos los cambios que se hagan tanto para `archivo.txt` como para `nuevo_nombre.txt`.

Sobre un enlace simbólico también se pueden usar todos los comandos básicos de archivos (`rm`, `mv`, `cp`, etc). sin embargo cuando el archivo original es borrado o movido a una ubicación diferente el enlace dejará de funcionar y se dice que el enlace está roto.

Un enlace simbólico permite enlazar directorios y, usando NFS, también permite enlazar archivos fuera del equipo. En un principio puede parecer complicado, pero luego de leer detalladamente seguro que tendrás más claro cuándo usar un enlace simbólico y cuándo usar uno físico.

Para actualizar un enlace simbólico
`ln -nsf <New directory> <Soft link>`

Ejemplo: Supongamos que quiere apuntar el último enlace suave ahora al nuevo directorio `1.1`, luego ejecutará el siguiente comando:

 `ln -nsf 1.1 latest`


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

[https://hipertextual.com/archivo/2014/07/enlaces-fisicos-y-simbolicos-linux/](https://hipertextual.com/archivo/2014/07/enlaces-fisicos-y-simbolicos-linux/ "https://hipertextual.com/archivo/2014/07/enlaces-fisicos-y-simbolicos-linux/")