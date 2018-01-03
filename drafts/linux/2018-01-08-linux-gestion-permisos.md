---
layout: post
section: "LINUX"
title:  "Gestión de los permisos de archivos o directorios UNIX"
date:   2017-12-25
desc: "Gestión de los permisos de archivos o directorios UNIX."
keywords: "linux, shell, comandos, host, chmod, chow, permisos, grupos, usuarios"
categories: [linux]
tags: [linux, shell, comandos, host, chmod, chow, permisos, grupos, usuarios]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# Gestión de los permisos de archivos o directorios UNIX #

## Permisos de los ficheros ##

***UNIX*** proporciona un medio de asignar permisos para trabajar con ficheros y directorios de forma que se puede limitar el rango de usuarios que pueden acceder a los mismos y las operaciones que pueden llevar a cabo.***Todos los ficheros en UNIX tienen un propietario***, que normalmente es el usuario que los crea. Una vez creado, el propietario puede asignar permisos que permitan o impidan el acceso al fichero. Estos ***permisos o modo de acceso*** se definen para tres entidades:

<!-- more -->
- **Propietario**: la persona que crea el fichero, aunque es posible ceder la propiedad a otro usuario.

- **Grupo del propietario**: los usuarios que pertenecen al mismo grupo que el propietario.

- **Otros usuarios**: el resto de los usuarios del sistema.

| Código referencia | Clase | Descripción |
| ---------- | ---------- | ---------- |
| u | usuario | el dueño del archivo |
| g | grupo | usuarios del grupo que son miembros del grupo del archivo |
| o | otros | usuarios que no son el propietario del archivo o miembros del grupo |
| a | todos | los tres tipos anteriores, es lo mismo que `ugo` |
| r | read | Leer un archivo o enumerar los contenidos de un directorio |
| w | write | escribir en un archivo o directorio |
| x | execute | ejecutar un archivo |

### `chown` (change owner) ###

`chown` Nos permite cambiar de propietario en archivos y directorios de ***linux***. Hay diferentes formas de usar el comando. La más básica es:

`chown nuevousuario archivo`

Por ejemplo:

`chown root /var/home/musica.mp3`

Establece como propietario del archivo `musica.mp3` al usuario `root`. Para cambiar recursivamente el propietario a todos los archivos y subcarpetas, podemos usar:

`chown -R root /var/home`

Aclarar que el comando `chown` en ***linux***, usado de forma recursiva modifica el propietario de los archivos y subdirectorios, dejando el directorio principal sin cambios de propietario. Si añadimos el modificador `-c` nos informará acerca de los cambios que haga, por ejemplo

`chown -R -c root /var/home`

Para cambiar el grupo además del propietario, podemos poner dos puntos despues del owner y a continuación añadir el grupo. Por ejemplo para cambiar de usuario y grupo a un archivo lo haríamos de la siguiente manera:

Ejemplos: `chown root:root fichero, chown javi:usuarios directorio -R`
`chown web1:client1 /var/www/clients/client1/web1/robots.txt` En éste ejemplo el archivo `robots.txt` pasará a tener como propietario `web1` y como grupo `client1`.

Para cambiar el usuario del los archivos y carpetas del directorio donde nos encontramos podemos usar:

`chown nuevousuario *`

Si además queremos que lo haga de forma recursiva bajo todos los subdirectorios y sus archivos usaremos `-R`:

`chown -R nuevousuario *`

Tambien podemos además de usar el nombre de usuario y el nombre de grupo usar el formato numérico mediante el UID (identificador numérico del usuario) y el GID (identificador numérico de grupo) en el comando chown, por ejemplo:

`chown -R 0:0 /etc`

Asignará recursivamente a `/etc` y a sus subdirectorios y archivos el usuario con UID 0 y el grupo con GID 0 (usuario 0 = root y grupo 0=root)

El modificador `-v` dentro del comando `chown` nos dará informará de los permisos aplicados.

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

De forma predeterminada, **cuando creamos un *Directorio* en Unix**, se crea con el permiso `777 (lectura / escritura / ejecución)`. Junto con la notación numérica, los permisos de ***Unix*** también se pueden representar con los siguientes caracteres:

Para ver los permisos de ficheros y directorios, utiliza el comando `ls` con la opción `–l`:

	`ls –l`

Para cambiar los permisos de un fichero, utiliza el comando [chmod[:

	`chmod 755 documento`
    
Ejemplos: `chmod +r fichero`, `chmod +w directorio`, `chmod +rw directorio -R`, `chmod -r fichero`

`chmod ugo+rwx test` (da permisos rwx a todos, user,group,others)
`chmod ugo‐x test` (quita permiso x (ejecucion) a todos, user,group,others)
`chmod o‐rwx test` (quita permisos rwx a others)
`chmod u=rwx,g=rx test` (da permisos rwx a user, rx a group y ninguno a others)

## Referencias ##

[https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/](https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/ "https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/")

[https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX](https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX "https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX")