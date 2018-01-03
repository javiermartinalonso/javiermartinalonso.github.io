---
layout: post
section: "LINUX"
title:  "TIPS Concatenar comandos en linux"
date:   2017-12-25
desc: "Trucos para la concatenación y encadenamiento de comandos en linux. Esto te puede ser muy útil para crear scripts y aumentar tu productividad."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux, shell, comandos, host]
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

## Referencias ##

[http://best-linux-server.blogspot.com.es/2012/05/concatenar-comandos-en-linux.html](http://best-linux-server.blogspot.com.es/2012/05/concatenar-comandos-en-linux.html "http://best-linux-server.blogspot.com.es/2012/05/concatenar-comandos-en-linux.html")