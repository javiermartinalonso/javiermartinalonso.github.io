---
layout: post
section: "LINUX"
title:  "Linux: Guía de comandos"
date:   2017-12-25
desc: ""
keywords: "linux, shell, comandos"
categories: [Linux]
tags: linux, shell, comandos]
icon: fa-linux
image: static/img/blog/linux/linux-logo.png
---

## Información de la línea de comandos ##

- Mostrar la documentación de un comando:

	`man <command>`

	Ejemplo: Muestra la documentación del comando ls.

	`man ls`

## Operaciones con host remotos ##

- **Conectar a una terminal remota** `ssh`

	- Conectarte a un host especificando un usuario, una vez que lo ejecutes te pedirá un password:

		`ssh user@host`

	- Conectarte a un host utilizando una llave ssh, este comando solo requiere el usuario pero no es necesario escribir un password:

		`ssh -i sshKey user@host`

- **Subir o descargar ficheros a un host remoto** `scp`
	
	- Descarga lo que se encuentra en el servidor a la ruta local especificada.
	
		`scp user@host:absolutePath destinationPath`

	- Sube al servidor lo que se tiene en el `originPath` al `destinationPath` del servidor.
	

		`scp originPath user@host:destinationPath`

## Tratamiento de ficheros ##

### 1. Buscar ficheros ###

- Busca archivos en una jerarquía de directorios, imagina que quieres buscar el log de tu aplicación pero no sabes en que directorio está, veamos un ejemplo:

	`find / -name worker.log`

- Encontrar un archivo/directorio con un nombre que comience con un caracter particular:

	`ls -ltr | grep <character>*`

	Ejemplo: Encontrar fichero o directorios que comienzan con 'ab':
	
	`ls -lrt | grep ab*`


### 1. Leer y revisar documentos ###

- **Cómo ver el contenido del archivo (sin poder editarlo):**

	`cat <FileName>`

    Ejemplo: `cat abc.txt`

- **Cómo ver la última parte del contenido del archivo (sin poder editarlo):**

	- Despliega en la consola las últimas entradas en el archivo catalina.out
		
		`tail -f catalina.out`

	- Despliega en la consola las últimas 1000 entradas en el archivo catalina.out
	
		`tail -fn 1000 catalina.out`

- **Cómo ver el contenido del archivo (sin poder editarlo) con opciones avanzadas**

	`Less` es un visor de archivos, es muy similar al comando `more` pero con mucho más funcionalidad. Ejemplo:

	`less catalina.out`

	Con esto el archivo catalina.out será mostrado en la pantalla, pero nos permitirá ejecutar comandos para distintas operaciones, para ver la lista de comandos solo se debe oprimir la tecla `h`. Veamos algunas de las opciones disponibles:

	- Para moverse en el visor:
		- `h` : Muestra la ayuda en la consola.
		- `q :q Q :Q ZZ` : Salir
		- `e ^E j ^N CR` : Siguiente línea
		- `y ^Y k ^K ^P`: Ir atrás una línea
		- `f ^F ^V SPACE`: Ir adelante una ventana
		- `b ^B ESC-v` : Ir atrás una ventana
		- `f` : Adelante para siempre, es similar al comando `tail -f`

	- Búsqueda (Muy útil para búsqueda en logs):
		- `/pattern`: Busca la siguiente línea que haga match con el patron
		- `?patten`: Busca hacia atrás la línea que haga match con el patrón
		- `n`: Repite la búsqueda anterior
		- `N` :Repite la búsqueda anterior en sentido contrario
		- `&pattern`: Muestra solo las líneas que hagan match

- Hacer **búsquedas** dentro del contenido de un **fichero**. **Filtrar, resaltar** mediante expresiones regulares:

	- Busca el texto ERROR en el archivo catalina.out

		`grep ERROR catalina.out`

	- Busca el texto ERROR en el archivo catalina.out y lo marca con un color

 		`grep --color "ERROR" catalina.out`
 

### 2. Manipular ficheros: Crear / Modificar ###

- **Crear un nuevo archivo:**

	`touch <fileName>`

	Ejemplo: `touch abc.txt`

- Cómo **Editar un archivo** ***(también sirve para crear el archivo)***

	`vi <FileName>`
	
	Ejemplo: `vi abc.txt`

	- Proceso de edición:
		- Abrir el archivo con el siguiente comando
		
			`vi abc.txt`
		
		- Presione `i`, activará el modo de edición.
		
		- Modifica el archivo.
		
		- Guardar el cambio y salir (write & quit): `wq!`

### 3. Meta-Información de ficheros ###


- Imprimir todas las líneas que tiene un archivo y el número de bytes:

	`wc records.log`



## Gestión de los permisos de archivos o directorios ##

| Código | Permiso |
| ---------- | ---------- |
| 0 | sin permisos |
| 1 | sólo ejecución |
| 2 | sólo escritura |
| 3 | escritura y ejecución |
| 4 | sólo lectura |
| 5 | lectura y ejecución |
| 6 | lectura y escritura |
| 7 | lectura, escritura y ejecución |

De forma predeterminada, **cuando creamos un *archivo* en Unix**, se crea con el permiso `666 (lectura / escritura)`. 

De forma predeterminada, **cuando creamos un *Directorio* en Unix**, se crea con el permiso `777 (lectura / escritura / ejecución)`. Junto con la notación numérica, los permisos de Unix también se pueden representar con los siguientes caracteres:

| Código referencia | Clase | Descripción |
| ---------- | ---------- | ---------- |
| u | usuario | el dueño del archivo |
| g | grupo | usuarios del grupo que son miembros del grupo del archivo |
| o | otros | usuarios que no son el propietario del archivo o miembros del grupo |
| a | todos | los tres tipos anteriores, es lo mismo que `ugo` |
| r | read | Leer un archivo o enumerar los contenidos de un directorio |
| w | write | escribir en un archivo o directorio |
| x | execute | ejecutar un archivo |


## Información de los discos ##

- Espacio disponible en disco

	`df -h`

## Referencias ##

