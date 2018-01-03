---
layout: post
section: "LINUX"
title:  "Linux: Operaciones con host remotos"
date:   2017-12-25
desc: "Recopilatorio de los comandos de Unix que son más usados habitualmente para operaciones con host remotos: conectar con host remoto, copiar, subir o descargar ficheros."
keywords: "linux, shell, comandos, host, scp, shh"
categories: [linux]
tags: [linux, shell, comandos, host, scp, shh]
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
