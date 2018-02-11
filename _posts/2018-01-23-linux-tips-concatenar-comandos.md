---
layout: post
sections: [LINUX]
title:  "TIPS Concatenar comandos en linux"
date:   2018-01-23
desc: "Trucos para la concatenación y encadenamiento de comandos en linux. Esto te puede ser muy útil para crear scripts y aumentar tu productividad."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux,shell]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# TIPS Concatenar comandos en linux #

Trucos para la concatenación y encadenamiento de comandos en linux. Esto te puede ser muy útil para crear scripts y aumentar tu productividad.

<!-- more -->

## Concatenar comandos ##

- Con `|` hace que la salida del primero se convierta en la entrada del segundo.

		$ cmd1 | cmd2

- Con `&` hará que los dos (o más) comandos se ejecuten de manera simultanea.

		$ cmd1 & cmd2

- Con `||` El segundo comando se ejecutará si el primero termina sin éxito.

		$ cmd1 || cmd2

- Con `&&` El segundo comando se ejecutará solo si el primero termina con éxito.

		$ cmd1 && cmd2

- Con `;` El segundo comando se ejecutará sin importar el resultado del primero.

		$ cmd1 ; cmd2

## Hacer un comando más legible a un humano escribiéndolo en varias lineas ##

En el promt se puede usar para dar `enter` sin que eso signifique que se termino de escribir la orden. Solo se escribe al final de cada línea una **contrabarra (`\`)** y se da enter para pasar a la siguiente. Para dar por aceptado el script basta omitir la **back slash (`\`)** y dar enter.

Por ejemplo Escribir en la shell:

		FLOR=rosa; COLOR=roja; echo Esta \
		$FLOR \
		es \
		$COLOR

Nos devuelve:

		Esta rosa es roja

Después de cada retorno de carro aparece automáticamente un signo `>` en la terminal para indicarnos que todavía no terminamos con esa orden y podemos continuar. Muestra:

		FLOR=rosa; COLOR=roja; echo Esta \
		> $FLOR \
		> es \
		> $COLOR
		Esta rosa es roja

> ***Nota***: El usar la barra invertida `\` permite que un único comando abarque varias líneas no dando por terminado el comando al ejecutar `enter`. De este modo conseguimos scripts más legibles, comprensibles y mantenibles, aunque sus declaraciones sean largas o complejas.
> 
> Siempre que sea posible, facilite los cambios ordenando argumentos multilínea de forma alfanumérica. Esto le ayudará a evitar la duplicación de paquetes y hacer la lista mucho más fácil de actualizar. Esto también hace PRs mucho más fácil de leer y revisar. Agregar un espacio antes de una barra invertida (` \`) ayuda también.


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

[http://best-linux-server.blogspot.com.es/2012/05/concatenar-comandos-en-linux.html](http://best-linux-server.blogspot.com.es/2012/05/concatenar-comandos-en-linux.html "http://best-linux-server.blogspot.com.es/2012/05/concatenar-comandos-en-linux.html")