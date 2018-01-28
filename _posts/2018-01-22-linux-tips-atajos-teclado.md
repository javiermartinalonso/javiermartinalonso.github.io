---
layout: post
section: "LINUX"
title:  "TIPS Atajos de teclado shell Linux"
date:   2018-01-22
desc: "Trucos para optimizar la escritura y sacarle todo el provecho al shell de linux y aumentar así tu productividad."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux,shell]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# TIPS Atajos de teclado shell Linux #

Trucos para optimizar la escritura y sacarle todo el provecho al shell de linux y aumentar así tu productividad.

<!-- more -->

## Atajos de teclado ##

- `Ctrl + Alt + Fn (1-6)`: Para abrir terminales a pantalla completa. Requiere autentificación con usuario y contraseña. Cambiaremos a la terminal correspondiente a la tecla Fn que pulsemos, correspondiendo ésta al orden en el que las abrimos. En ***Linux*** podemos tener múltiples terminales funcionando simultáneamente, por defecto controlaremos hasta 6 con esta combinación de teclas. Por ejemplo `Ctrl + Alt + F1` nos lleva a la primera terminal abierta.

- `tty` Con este comando, en el caso de tener varias terminales abiertas, nos dirá en cuál nos encontramos.

- `Ctrl + Alt + F7` Nos devolverá al entorno gráfico (si usábamos alguno).

- `Shift (Mayus) + RePág` Realizaremos scroll hacia arriba en la terminal.

- `Shift (Mayus) + AvPág` Realizaremos scroll hacia abajo en la terminal.

- `Tab` (Tabulador) Función de  expansión. Completará el comando, nombre de fichero o directorio que estemos escribiendo. En caso de múltiples coincidencias, con una doble pulsación de esta tecla obtendremos todos los resultados posibles encontrados en el directorio o sistema.

- `Flecha de dirección ‘arriba’ y /o ‘abajo’`: La shell almacena un historial de las órdenes tecleadas anteriormente. Nos moveremos por el historial compuesto por los últimos comandos usados.

- `clear` limpia la pantalla.

- `history` muestra el historial de comandos introducidos por el usuario.
	
	Ejemplos: 
	
	`history | more`

- `Ctrl + r` Buscará en el historial el último comando usado según lo que vayamos escribiendo. Por ejemplo utilizamos el comando `clear` hace unas horas, si pulsamos `Ctrl + r` y escribimos `cl` nos mostrará el comando `clear`, puesto que lo ha buscado en el historial y es el más reciente que coincide.

- `Ctrl + c` Interrumpe cualquier proceso en ejecución de forma inmediata y nos devuelve al prompt.

- `Ctrl + z` Envía el proceso actual a segundo plano. Para recuperarlo sólo tendremos que escribir `fg` y pulsar Intro.

- `Ctrl + d`: Cierra la sesión de la terminal en la que nos encontramos. Si estamos usando una interfaz gráfica en la que hemos abierto una terminal, ésta sólo se cerrará.

- `Ctrl + w` Elimina la palabra anterior a la posición del cursor.

- `Ctrl + k`: Corta todo aquello que se encuentra entre la situación del cursor y el final de la línea.

- `Ctrl + u` Corta la línea en la que nos encontramos al completo.

- `Ctrl + y` Pega el contenido copiado o cortado con `Ctrl + u` o `Ctrl + k`.

- `!!` Repetirá el último comando usado.


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