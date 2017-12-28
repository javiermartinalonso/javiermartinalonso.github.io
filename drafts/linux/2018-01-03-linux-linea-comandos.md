---
layout: post
section: "LINUX"
title:  "Linux: Interface Linea de Comando"
date:   2017-12-25
desc: "Teoría que debemos concocer sobre la shell de linux."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux, shell, comandos, host]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# Interface Linea de Comando (Command Line Interface, CLI) #

Si todo sistema operativo tiene una **Interfaz de Linea de Comandos (*Command LineInterface, CLI*)**, en **UNIX** esta interfaz tiene aun mayor importancia, ya que el uso de un **sistema UNIX** como servidor está más extendido que como sistema de escritorio. Que el interfaz sea *“austero”* permite que la potencia del sistema se use en los procesos y no en otra cosa. A estos servidores normalmente se accederá abriendo sesiones remotas en modo comando.

<!-- more -->
Las órdenes o comandos son programas ejecutables que el shell encuentra y ejecuta en respuesta a las instrucciones tecleadas, tales como `chmod`, `find`, `grep` o `ls`.

El shell es un intérprete de órdenes que puede expandir y modificar la orden antes de ejecutarla, por ejemplo con el uso de ***alias***, ***variables de entorno***, ***metacaracteres*** o ***caracteres comodines*** (`*`,`?`, `[]`, `-`) y el ***operador `&`*** o el ***operador tubería*** `|` (***pipe***) para la conexión de órdenes (***redirección y filtros***).

Por ejemplo, podríamos ver los procesos que están corriendo en el sistema usando `ps` y le redireccionamos la salida a `sort` para que los ordene por PID:

`$ ps -a | sort`

También podemos redireccionar la salida estándar del comando `cat` y pasarla como entrada estándar del comando `wc` para contar las líneas y palabras de un archivo:

`$ cat archivo.txt | wc`

Tanto las ***redirecciones*** como las ***tuberías*** son conceptos fundamentales que sin duda debes manejar para empezar a sentirte cómodo con la ***terminal***. Verás que al cabo de un tiempo no sabrás cómo pudiste vivir sin ellos.

## Información de la línea de comandos ##

- `man <command>` Muestra el manual de uso o configuración del comando <command>.

- `man ls` Muestra la documentación del comando ls.

- `man –k <word>` Muestra las páginas de manual que contengan la palabra <word>.

- `apropos <command>` Lista las páginas de manual que tratan acerca del comando <command>.

- `whereis <command>` Muestra la localización más probable para el programa <command>.




## Referencias ##

https://es.wikipedia.org/wiki/GNU/Linux

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/

https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX