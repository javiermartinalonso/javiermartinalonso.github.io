---
layout: post
sections: [LINUX]
title:  "Linux: Operaciones con host remotos"
date:   2018-01-11
desc: "Recopilatorio de los comandos de Unix que son más usados habitualmente para operaciones con host remotos: conectar con host remoto, copiar, subir o descargar ficheros."
keywords: "linux, shell, comandos, host, scp, shh"
categories: [linux]
tags: [linux,shell,scp,shh]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---


# Operaciones con host remotos #

Recopilatorio de los comandos de Unix que son más usados habitualmente para operaciones con host remotos: conectar con host remoto, copiar, subir o descargar ficheros.

<!-- more -->
- `ssh`: **Conectar a una terminal remota**

	- Conectarte a un host especificando un usuario, una vez que lo ejecutes te pedirá un password:

		`ssh user@host`

	- Conectarte a un host utilizando una llave ssh, este comando solo requiere el usuario pero no es necesario escribir un password:

		`ssh -i sshKey user@host`

- **`SCP` Subir o descargar ficheros a un host remoto**
	
	- Descarga lo que se encuentra en el servidor a la ruta local especificada.
	
		`scp user@host:absolutePath destinationPath`

		Si queremos copiar el fichero `archivo.txt` del servidor a nuestro ordenador en la carpeta *Documentos*, hacemos lo siguiente:
		
		`$ scp usuario@dominio.com:/home/usuario/archivo.txt Documentos`

	- Sube al servidor lo que se tiene en el `originPath` al `destinationPath` del servidor.
	
		`scp originPath user@host:destinationPath`

		Si queremos subir el archivo `archivo.txt` de nuestro ordenador a la carpeta `/home/usuario` del servidor, hacemos lo siguiente:
		
		`$ scp archivo.txt usuario@dominio.com:/home/usuario`

		Para copiar un directorio completo de mi ordenador al servidor, por ejemplo `/home/javi/` carpeta a `/home/usuario`, añadimos un `-r` en el comando:

		`$ scp -r /home/javi/carpeta usuario@dominio.com:/home/usuario`

	- Copiar archivos de un servidor a otro servidor:
	
		`scp user1@host1:absolutePath user2@host2:absolutePath`

		Para copiar un archivo de un servidor a otro, hacemos lo siguiente:
		`$ scp usuario1@dominio1.com:/home/usuario1/archivo.txt usuario2@dominio2.com:/home/usuario2/`


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