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


## Referencias ##

https://es.wikipedia.org/wiki/GNU/Linux

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/

https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX