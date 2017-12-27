---
layout: post
section: "LINUX"
title:  "Linux: Guía de comandos"
date:   2017-12-25
desc: "Recopilatorio de los comandos de Unix que son más usados habitualmente."
keywords: "linux, shell, comandos"
categories: [Linux]
tags: linux, shell, comandos]
icon: fa-linux
image: static/img/blog/linux/linux-logo.png
---

# Interface Linea de Comando (Command LineInterface, CLI) #

Si todo sistema operativo tiene una **Interfaz de Linea de Comandos (*Command LineInterface, CLI*)**, en **UNIX** esta interfaz tiene aun mayor importancia, ya que el uso de un **sistema UNIX** como servidor está más extendido que como sistema de escritorio. Que el interfaz sea *“austero”* permite que la potencia del sistema se use en los procesos y no en otra cosa. A estos servidores normalmente se accederá abriendo sesiones remotas en modo comando.

Las órdenes o comandos son generalmente programas ejecutables que el shell encuentra y ejecuta en respuesta a las instrucciones tecleadas, tales como `chmod`, `find`, `grep` o `ls`.

El shell es un intérprete de órdenes que puede expandir y modificar la orden antes de ejecutarla (por ejemplo con el uso de ***alias***, ***variables de entorno***, ***metacaracteres*** o ***caracteres comodines*** (`*`,`?`, `[]`, `-`) y el ***operador tuberí***a `|` (***pipe***) para la conexión de órdenes (***redirección y filtros***).

Por ejemplo, podríamos ver los procesos que están corriendo en el sistema usando `ps` y le redireccionamos la salida a `sort` para que los ordene por PID:

`$ ps -a | sort`

También podemos redireccionar la salida estándar del comando `cat` y pasarla como entrada estándar del comando `wc` para contar las líneas y palabras de un archivo:

`$ cat archivo.txt | wc`

Tanto las ***redirecciones*** como las ***tuberías*** son conceptos fundamentales que sin duda debes manejar para empezar a sentirte cómodo con la ***terminal***. Verás que al cabo de un tiempo no sabrás cómo pudiste vivir sin ellos.

## Comodines o metacaracteres ##

Los caracteres más frecuentes son:

- `*` representa cualquier cadena de caracteres, incluyendo la cadena vacía.
- `?` representa a cualquier carácter simple.

## El sistema de ficheros ##

### Jerárquía estándar ###

Un fichero ***UNIX*** es una secuencia de 0 o más bytes. El sistema no distingue entre ficherosASCII, binarios, no hacen ninguna diferencia entre archivos y directorios, entendiendo que un directorio es sólo un archivo que contiene los nombres de otros archivos. De la misma manera, otros elementos como imágenes, textos, programas y servicios son vistos por ***Linux*** sólo como archivos, igual que cualquier unidad extraíble o dispositivo que le conectemos. La interpretación del contenido de los ficheros se deja a los programas que los utilizan. 

La longitud de los nombres de los ficheros estaba limitada originariamente a 14 caracteres arbitrarios, pero BSD ***UNIX*** la incrementó hasta 255. Las mayúsculas y las minúsculas son significativas, lo que significa que *LEEME*, *leeme*, y *Leeme* serían nombres diferentes. 

Normalmente, muchos programas asumen que los nombres de los ficheros consistan en un nombre seguido por una extensión separados por un punto. De esta forma, `prueba.c` es normalmente un programa en C, `informe.pdf` un documento de Adobe, `leeme.txt` un fichero de texto plano, etc. Sin embargo, estas convenciones no son impuestas por el sistema operativo. La gran diferencia de ***UNIX*** con respecto a otros sistemas es que en ***UNIX*** existe un solo árbol de directorios y no uno para cada unidad de almacenamiento (disco duro, partición de disco, unidad flash, CD/DVD, etc.). 
Cualquier unidad de almacenamiento debe formar parte de esta estructura única. A la operación por la cual una unidad de almacenamiento entra a formar parte del árbol de directorios del sistema se la denomina ***montaje del dispositivo***. Existe un directorio que contiene el resto de archivos y directorios del sistema. Es el directorio raíz. El directorio raíz se representa siempre con el símbolo de barra inclinada `/`.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/linux/linux-filesystem.png" alt="jerarquía de ficheros" class="img-thumbnail" style="width: 70%"/>
</div>

> En ***Linux***, cada uno de los archivos es representado por un **inode**, ***una especie de código de serie único que contiene toda la información sobre los datos que se pueden encontrar en dicho archivo.***
> 
> De esta manera, cada vez que se hace una partición de disco, el sistema establece un número determinado de ***inodes***, que es la cantidad de archivos de todo tipo que podremos tener al mismo tiempo. Además, cada vez que se crea un archivo, este recibe un ***inode*** que recoge información sobre ***su propietario, el tipo de archivo que es, los permisos que tiene y su fecha de creación o edición, así como su tamaño, su localización en el disco duro y la cantidad de enlaces que apuntan hacia él.***

### Funcionalidad de la jerarquía de ficheros de sistemas Unix ###

Esta estructura de árbol y los nombres de los directorios no es al azar, tiene un sentido y una funcionalidad:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/linux/funcionalidad-filesystem.jpg" alt="explicación jerarquía de ficheros" class="img-thumbnail" style="width: 70%"/>
</div>

| Directorio | Descripción breve |
| ---------- | ---------- |
| `/` | Directorio raíz del sistema de ficheros. Denominado directorio Root (No confundir con el usuario root) Solo el usuario Root tiene privilegios de escritura en este directorio. No es lo mismo `/root` que `/`, el primero es el home del usuario root, el segundo es la raíz de todos los archivos|
| `/bin` | Comandos y programas esenciales disponibles para todos los usuarios del sistema. |
| `/boot` | Gestores de arranque. |
| `/dev` | Contiene los dispositivos esenciales (no solo los de almacenamiento, también terminales, micrófonos, impresoras, etc). |
| `/etc` | Ficheros de configuración del sistema. El nombre proviene de “etcétera”. |
| `/etc/network` | Fichero de configuración del servicio de red |
| `/etc/X11` | Ficheros de configuración para el X Window |
| `/home` | Directorios de los usuarios, excepto el del superusuario (root). Estos directorios contienen los ficheros propios de un usuario. A menudo se constituye una partición de disco separada para ellos. |
| `/lib` | Contiene todas las bibliotecas (mal traducidas como librerías) para el núcleo y las esenciales que son compartidas por los programas alojados `/bin` y `/sbin`. |
| `/media` | Contiene los puntos de montaje de los medios removibles de almacenamiento, tales como lectores de CD-ROM, Pendrives (memoria USB), e incluso sirve para montar otras particiones del mismo disco duro, por ejemplo alguna partición desde otro sistema operativo. |
| `/mnt` | Sistema de ficheros montados temporalmente. Es una directorio semejante a `/media`, pero es usada mayormente por los usuarios. Sirve para montar discos duros y particiones de forma temporal en el sistema. |
| `/opt` | Paquetes software opcionales, que pueden ser compartidos por los usuarios. Estas aplicaciones, utilizan el directorio de usuario para guardas sus configuraciones, y de esta forma, cada usuario puede tener una configuración diferente de la misma aplicación. |
| `/proc` | Ficheros de texto que identifican procesos activos en el sistema. |
| `/root` | Directorio personal (`home`) del usuario root. |
| `/sbin` | Sistema de binarios esencial, comandos y programas exclusivos del superusuario (root), por ejemplo: `init`, `route`). |
| `/tmp` | Ficheros temporales (véase también `/var/tmp`). |
| `/usr` | La mayoría de las utilidades y aplicaciones multiusuario. 
| `/var` | Ficheros variables, tales como logs, archivos spool, bases de datos, archivos de e-mail temporales, y archivos temporales en general. |
| `/var/log` | Ficheros de registro, Log. Varios registros, logs. |
| `/var/mail` | Buzón de mensajes de correo electrónico |
| `/var/tmp` | Ficheros temporales que, a diferencia de `/tmp`, no se borran entre sesiones o reinicios del sistema. |


## Información de la línea de comandos ##

- `man <command>` Muestra el manual de uso o configuración del comando <command>.

- `man ls` Muestra la documentación del comando ls.

- `man –k <word>` Muestra las páginas de manual que contengan la palabra <word>.

- `apropos <command>` Lista las páginas de manual que tratan acerca del comando <command>.

- `whereis <command>`: Muestra la localización más probable para el programa <command>.

## `SSH` Operaciones con host remotos ##

- `ssh`: **Conectar a una terminal remota**

	- Conectarte a un host especificando un usuario, una vez que lo ejecutes te pedirá un password:

		`ssh user@host`

	- Conectarte a un host utilizando una llave ssh, este comando solo requiere el usuario pero no es necesario escribir un password:

		`ssh -i sshKey user@host`

- **`SCP` Subir o descargar ficheros a un host remoto**
	
	- Descarga lo que se encuentra en el servidor a la ruta local especificada.
	
		`scp user@host:absolutePath destinationPath`

		Ejemplo: Si queremos copiar el fichero archivo.txt del servidor a nuestro ordenador en la carpeta Documentos, hacemos lo siguiente:
		
		`$ scp usuario@dominio.com:/home/usuario/archivo.txt Documentos`

	- Sube al servidor lo que se tiene en el `originPath` al `destinationPath` del servidor.
	
		`scp originPath user@host:destinationPath`

		Ejemplo: Si queremos subir el archivo archivo.txt de nuestro ordenador a la carpeta `/home/usuario` del servidor, hacemos lo siguiente:
		
		`$ scp archivo.txt usuario@dominio.com:/home/usuario`

		Ejemplo: Para copiar un directorio completo de mi ordenador al servidor, por ejemplo `/home/javi/` carpeta a `/home/usuario`, añadimos un `-r` en el comando:

		`$ scp -r /home/javi/carpeta usuario@dominio.com:/home/usuario`

	- Copiar archivos de un servidor a otro servidor:
	
		`scp user1@host1:absolutePath user2@host2:absolutePath`

		ejemplo: Para copiar un archivo de un servidor a otro, hacemos lo siguiente:
		`$ scp usuario1@dominio1.com:/home/usuario1/archivo.txt usuario2@dominio2.com:/home/usuario2/`


## Navegar por los directorios ##

- `pwd`: ***Print working directory***: Muestra el directorio de trabajo, nos mostrará la ruta en la que nos encontramos actualmente. Muy útil si hemos estado saltando de subcarpeta en subcarpeta y el prompt nos muestra sólo una ruta abreviada.

- `ls`: Nos muestra una lista con el contenido del directorio actual (o el que le pasemos como argumento, por ejemplo: `ls /home/usuario`).

- `ls –l` o `ll`: Muestra una lista del contenido del directorio añadiendo información adicional de los ficheros o carpetas, como permisos, fecha y hora de creación o modificación, etc…

- `ls –a`: Muestra una lista de todos los ficheros del directorio, incluyendo los ficheros o carpetas ocultos.

- `cd`: nos lleva al directorio raíz.

- `cd..` : Subiremos un nivel en el árbol de directorios. Si por ejemplo nos encontramos en `/home/usuario`, con este comando nos iremos a `/home`.


## Tratamiento de ficheros ##

### 1. Buscar ficheros ###

- Busca archivos en una jerarquía de directorios, imagina que quieres buscar el log de tu aplicación pero no sabes en que directorio está, veamos un ejemplo:

	`find [ruta] [expresión_de_búsqueda] [acción]`

	- `[ruta]` es cualquier directorio o path que se quiera indicar y desde donde inicia la búsqueda, ejemplos pueden ser `/etc`, `/home/javier`, `/`, `.` si no se indica una ruta se toma en cuenta entonces el directorio donde se este actualmente, es decir el directorio de trabajo actual, que es lo mismo que indicar punto `.`. De hecho es posible indicar más de un directorio de búsqueda como se verá más adelante en un ejemplo.

	- `[expresión_de_búsqueda]` es una o más opciones que puede devolver la búsqueda a realizar en si o acciones a realizar sobre la búsqueda, si no se indica ninguna expresión de búsqueda se aplica por defecto la opción ­`print` que muestra el resultado de la búsqueda.

	- `[acción]` es cualquier comando de ***Linux*** invocado a ejecutarse sobre cada archivo o directorio encontrado con la `[expresión_de_búsqueda]`.

	Los tres argumentos anterior son enteramente opcionales

	`find / -name catalina.log`

- Encontrar un archivo/directorio con un nombre que comience con un caracter particular:

	`ls -l | grep <character>*`

	Ejemplo: Encontrar fichero o directorios que comienzan con 'ab':
	
	`ls -l | grep ab*`


### 2. Leer y revisar documentos ###

- **Determinar el tipo de un archivo (fichero, directorio)**

	`file <Filename>`

	Ejemplos: file fichero, file *

- **Cómo ver el contenido del archivo o archivos (sin poder editarlo):**

	`cat <FileName>`

	Ejemplos: 
	
	`cat abc.txt` Muestra el contenido del fichero abc.txt.

	`cat log-*` Muestra el contenido de todos los ficheros que comienzan por 'log-' en el directorio actual
	
- **Cómo ver la última parte del contenido del archivo (sin poder editarlo):**

	- Despliega en la consola las últimas entradas en el archivo catalina.out
		
		`tail -f catalina.out`

	- Despliega en la consola las últimas 1000 entradas en el archivo catalina.out
	
		`tail -fn 1000 catalina.out`

- **Descripción: muestra el contenido de un fichero con pausas cada 25 lineas.**

	`more file`

	Ejemplos: `more fichero`

- **Cómo ver el contenido del archivo con opciones avanzadas**

	`Less` es un visor de archivos, se basa en el comando `more` pero con mucho más funcionalidad. Ejemplo:

	`less catalina.out`

	Con esto el archivo catalina.out será mostrado en la pantalla, pero nos permitirá ejecutar comandos para distintas operaciones, para ver la lista de comandos solo se debe oprimir la tecla `h`. Veamos algunas de las opciones disponibles:

	- Para moverse en el visor:
		- `h` : Muestra la ayuda en la consola.
		- `q :q Q :Q ZZ` : Salir
		- `e ^E j ^N CR INTRO` : Siguiente línea
		- `y ^Y k ^K ^P`: Ir atrás una línea
		- `f ^F ^V SPACE AvPág`: Ir adelante una pantalla de texto
		- `b ^B ESC-v RePág` : Ir atrás una pantalla de texto
		- `G` : Ir al final del texto
		- `g` : Ir al principio del texto
		- `f` : Adelante para siempre, es similar al comando `tail -f`
		- `R` : Repintar la pantalla. Útil cuando se está visualizando un archivo que ha sido modificado por otro programa.

	- Búsqueda (Muy útil para búsqueda en logs):
		- `/pattern`: Busca la siguiente línea que haga match con el patron
		- `?patten`: Busca hacia atrás la línea que haga match con el patrón
		- `n`: Repite la búsqueda anterior
		- `N` :Repite la búsqueda anterior en sentido contrario
		- `&pattern`: Muestra solo las líneas que hagan match

	- Edición
		- `v`: Cargar el editor de texto en el lugar donde se encuentre el usuario dentro del archivo. El editor que normalmente se utiliza es el `vi`










- Hacer **búsquedas** dentro del contenido de un **fichero**. **Filtrar, resaltar** mediante expresiones regulares. `grep` nos permite buscar dentro de los archivos, las líneas que concuerdan con un patrón. Pero si no especificamos ningún nombre de archivo, tomará la entrada estándar, con lo que podemos encadenarlo con otros filtros e imprimir las líneas encontradas en la salida estándar. 

	- Busca el texto ERROR en el archivo catalina.out

		`grep ERROR catalina.out`

	- Busca el texto ERROR en el archivo catalina.out y lo marca con un color

 		`grep --color "ERROR" catalina.out`
 

Por ejemplo si queremos listar los archivos cuyo nombre comiencen por 'ab' en el directorio actual:

`ls -l | grep ab*` 

Como tiene muchísimas opciones, vamos a ver tan sólo las más usadas:

- `-c` En lugar de imprimir las líneas que coinciden, muestra el número de líneas que coinciden.
- `-e` PATRON nos permite especificar varios patrones de búsqueda o proteger aquellos patrones de búsqueda que comienzan con el signo `-`.
- `-r` busca recursivamente dentro de todos los subdirectorios del directorio actual.
- `-v` nos muestra las líneas que no coinciden con el patrón buscado.
- `-i` ignora la distinción entre mayúsculas y minúsculas.
- `-n` Numera las líneas en la salida.
- `-E` nos permite usar expresiones regulares.
- `-o` le indica a grep que nos muestre sólo la parte de la línea que coincide con el patrón.
- `-f` ARCHIVO extrae los patrones del archivo que especifiquemos. Los patrones del archivo deben ir uno por línea.
- `-H` nos imprime el nombre del archivo con cada coincidencia.

Veamos algunos ejemplos:

- Buscar todas las líneas que contengan palabras que comiencen por `'a'` en un archivo:
`$ grep '\<a.*\>' archivo`

Otra forma de buscar, sería:
`$ cat archivo | grep "\<a.*\>" `

- Mostrar por pantalla, las líneas que contienen comentarios en el archivo `/boot/grub/menu.lst`:
`grep "#" /boot/grub/menu.lst`

- Enviar a un fichero las líneas del archivo `/boot/grub/menu.lst` que no son comentarios:
`$ grep -v "#" /boot/grub/menu.lst`

- Contar el número de interfaces de red que tenemos definidos en el fichero `/etc/network/interfaces`:
`$ grep -c "iface" /etc/network/interfaces`

- Mostrar las líneas de un fichero que contienen la palabra BADAJOZ o HUELVA:
`$ grep -e "BADAJOZ" -e "HUELVA" archivo`

- Mostrar las líneas de un fichero que contienen la palabra BADAJOZ o HUELVA, numerando las líneas de salida:
`$ grep -n -e "BADAJOZ" -e "HUELVA" archivo`

- Mostrar los ficheros que contienen la palabra TOLEDO en el directorio actual y todos sus subdirectorios:
`$ grep -r "TOLEDO" *`

Veamos algunos ejemplos con expresiones regulares:

- Obtener la dirección MAC de la interfaz de red eth0 de nuestra máquina:
`$ ifconfig eth0 | grep -oiE '([0-9A-F]{2}:){5}[0-9A-F]{2}'`

Sacamos la dirección MAC de la interfaz eth0 de nuestra máquina haciendo un:
`$ ifconfig eth0`

Y aplicando el filtro grep:
`$ grep -oiE '([0-9A-F]{2}:){5}[0-9A-F]{2}'`

Las opciones que he usado en grep son:

-`-o` Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
-`-i` Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
-`-E` Indica que vamos a usar una expresión regular extendida.

En cuanto a la expresión regular, podemos dividirla en dos partes:
`([0-9A-F]{2}:){5}` Buscamos 5 conjuntos de 2 caracteres seguidos de dos puntos `[0-9A-F]{2}` seguido por un conjunto de dos caracteres.

Como las direcciones MAC se representan en hexadecimal, los caracteres que buscamos son los números del 0 al 9 y las letras desde la A a la F.

- Extraer la lista de direcciones de correo electrónico de un archivo:
`grep -Eio '[a-z0-9._-]+@[a-z0-9.-]+[a-z]{2,4}' fichero.txt`

Utilizo las mismas opciones que en el caso anterior:

-`-o` Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
-`-i` Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
-`-E` Indica que vamos a usar una expresión regular extendida.

Analicemos ahora la expresión regular:
`[a-z0-9._-]+@[a-z0-9.-]+[a-z]{2,4}`

Al igual que antes, la vamos dividiendo en partes:
`[a-z0-9._-]+` Una combinación de letras, números, y/o los símbolos `. _` y `-` de uno o más caracteres, `@` seguido de una arroba
`[a-z0-9.-]+` seguido de una cadena de letras, números y/o los símbolos `.` y `-`
`[a-z]{2,4}` seguido de una cadena de entre dos y cuatro caracteres.

- Obtener la dirección IP de la interfaz de red eth1 de nuestra máquina:
`$ ifconfig eth1 | grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v 255`

En el ejemplo anterior, hemos tomado la información que nos ofrece ifconfig:
`ifconfig eth1`

Hemos filtrado dicha información con el comando grep, obteniendo todas las direcciones IP que aparecen:
`grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}'`

Por último, hemos filtrado la salida del comando anterior, para eliminar la dirección de broadcast junto con la máscara de red para quedarnos sólo con la dirección IP de la máquina:
`grep -v 255`

La línea anterior no mostraría las líneas que no contengan el valor 255, es decir, las direcciones de broadcast y máscara de red.

Analicemos ahora el comando grep:
`grep -oiE '([0-9]{1,3}\.){3}[0-9]{1,3}'`

Al igual que en los otros dos ejemplos de expresiones regulares uso las opciones `-oiE` en el comando grep:

- `-o` Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
- `-i` Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
- `-E` Indica que vamos a usar una expresión regular extendida.

En cuanto a la expresión regular:
`'([0-9]{1,3}\.){3}[0-9]{1,3}'`
`([0-9]{1,3}\.){3}` Representa 3 bloques de entre uno y tres dígitos separados por puntos. Observemos que como el punto es un metacaracter, tengo que usar el caracter de escape \ para que no sea interpretado como un metacaracter, sino como un caracter normal.
`[0-9]{1,3}` Representa el último bloque de la dirección IP, que está formado por un número de entre 1 y 3 dígitos.







### 3. Manipular archivos y directorios: Crear / Modificar ###

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

- `cp`: Copia un fichero o directorio.

- `cp –i`: Copia un fichero o directorio y pregunta antes de sobrescribir si se diese el caso.

- `cp –r`: Copia un directorio con todo su contenido.

- `mv`: Mueve o renombra un fichero o directorio. En la terminal de ***Linux***, en lugar de renombrar un fichero mediante un comando exclusivo, utilizamos el mismo que para mover archivos o directorios, y lo que hacemos para renombrarlo es moverlo a la misma ruta donde se encuentra y cambiarle el nombre.

- `mv –i`: Mueve o renombra un fichero o directorio preguntando antes de sobrescribir si se diese el caso.

- `mkdir`: Crea un directorio.

- `rmdir`: Elimina un directorio vacío.

- `rm file`: Elimina ficheros.

- `rm –r`: Elimina un directorio y todo su contenido.

- `rm –i fichero`: Elimina un fichero solicitando confirmación. Es muy recomendable usarlo con la opción `–r` para poder usarlo con directorios evitando problemas.

## Enlaces simbólicos ##

### Enlaces físicos ###

En ***Linux***, cada uno de los archivos es representado por un **inode**, ***una especie de código de serie único que contiene toda la información sobre los datos que se pueden encontrar en dicho archivo.***

De esta manera, cada vez que se hace una partición de disco, el sistema establece un número determinado de ***inodes***, que es la cantidad de archivos de todo tipo que podremos tener al mismo tiempo. Además, cada vez que se crea un archivo, este recibe un ***inode*** que recoge información sobre ***su propietario, el tipo de archivo que es, los permisos que tiene y su fecha de creación o edición, así como su tamaño, su localización en el disco duro y la cantidad de enlaces que apuntan hacia él.***

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


### 3. Compresión de ficheros ###

- `tar` Descripción: =Tape ARchiver. archivador de ficheros.

	Ejemplos: 
		`tar cvf fichero.tar directorio`
		`tar xvf fichero.tar`
		`tar zcvf fichero.tgz directorio`
		`tar zxvf fichero.tgz`

- `gunzip` Descripción: descompresor compatible con ZIP.
	
	Ejemplos: 
		`gunzip fichero`


## Gestión de los permisos de archivos o directorios ##

### Permisos de los ficheros ###

***UNIX*** proporciona un medio de asignar permisos para trabajar con ficheros y directorios de forma que se puede limitar el rango de usuarios que pueden acceder a los mismos y las operaciones que pueden llevar a cabo.***Todos los ficheros en UNIX tienen un propietario***, que normalmente es el usuario que los crea. Una vez creado, el propietario puede asignar permisos que permitan o impidan el acceso al fichero. Estos ***permisos o modo de acceso*** se definen para tres entidades:

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

- `chown` (change owner) nos permite cambiar de propietario en archivos y directorios de ***linux***. Hay diferentes formas de usar el comando. La más básica es:

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


## Espacio en disco, tamaños de carpeta ##

- Espacio disponible en disco

	`df -h`

	Esto nos devolverá las particiones montadas, el uso de espacio en cada una y lo que nos queda de resto, y todo de forma fácil para leer.

- Tamaño total de una carpeta. Uso de disco. Muestra el espacio que esta ocupado en disco:

	`du -bsh [absolutePath]` 

	Du tiene más opciones, pero en este caso uso estas 3:
	-b [–bytes]: Mostrar en bytes.
	-s [–sumarize]: Mostrar solamente el tamaño total de cada argumento.
	-h [–human-readable]: Imprime los tamaños de forma leíble (e.g., 1K, 234M, 2G)


Si sólo quisiéramos ver cuáles son, por ejemplo, los 5 directorios más pesados en nuestro /home podríamos usa du con una serie de comandos extras, por ejemplo:

	`$ du ‐hs * | sort ‐nr | head ‐5`
	215G Videos
	171G Linux
	68G Documentos
	50G Música
	28G Imágenes

- Imprimir todas las líneas que tiene un archivo y el número de bytes:

	`wc records.log`

- Contar número de archivos dentro de una carpeta. Este otro comando está un poco más rebuscado, ya que implica la utilización de `find` para encontrar todos los archivos, y luego los vamos a contar.

	Tenemos varias formas de hacerlo, pero todas nos van a devolver un solo número que será el número total de coincidencias de archivos. Vamos a ver los tipos más útiles a la hora de hacerlo 

	- Contar los archivos pero solo en carpetas dos niveles por debajo (si hay más de dos niveles de carpetas se omiten)
	
		`find . -maxdepth 2 -type f  | wc -l` 
		
		Nos devolverá un solo número como por ejemplo 2590. Fijate que he puesto -type f que lo que hace es contar solo archivos (ignoramos las carpetas) 

	- Contar archivos de forma recursiva ilimitada
	
		`find . -type f  | wc -l` 

	- Contar archivos y carpetas de forma recursiva

		`find . | wc -l` 

	- Contar archivos con una extensión determinada

		`find . -type f -name "*.php" | wc -l` 

		Con este comando estaríamos contando todos los archivos .php, fíjate que también puedes poner un nombre de archivo o una parte como por ejemplo “clase*” o “*log*” para buscar archivos con estas cadenas y contarlos.

## Atajos de teclado ##

- `Ctrl + Alt + Fn (1-6)`: Para abrir terminales a pantalla completa. Requiere autentificación con usuario y contraseña. Cambiaremos a la terminal correspondiente a la tecla Fn que pulsemos, correspondiendo ésta al orden en el que las abrimos. En ***Linux*** podemos tener múltiples terminales funcionando simultáneamente, por defecto controlaremos hasta 6 con esta combinación de teclas. Por ejemplo Ctrl + Alt + F1 nos lleva a la primera terminal abierta.

- `tty`: Con este comando, en el caso de tener varias terminales abiertas, nos dirá en cuál nos encontramos.

- `Ctrl + Alt + F7`: Nos devolverá al entorno gráfico (si usábamos alguno).

- `Shift (Mayus) + RePág`: Realizaremos scroll hacia arriba en la terminal.

- `Shift (Mayus) + AvPág`: Realizaremos scroll hacia abajo en la terminal.

- `Tab` (Tabulador) Función de  expansión. Completará el comando, nombre de fichero o directorio que estemos escribiendo. En caso de múltiples coincidencias, con una doble pulsación de esta tecla obtendremos todos los resultados posibles encontrados en el directorio o sistema.

- Flecha de dirección ‘arriba’ y /o ‘abajo’: La shell almacena un historial de las órdenes tecleadas anteriormente. Nos moveremos por el historial compuesto por los últimos comandos usados.

- `clear`limpia la pantalla.

- `history`: muestra el historial de comandos introducidos por el usuario.
	
	Ejemplos: 
	
	`history | more`

- `Ctrl + r`: Buscará en el historial el último comando usado según lo que vayamos escribiendo. Por ejemplo utilizamos el comando `clear` hace unas horas, si pulsamos `Ctrl + r` y escribimos `cl` nos mostrará el comando `clear`, puesto que lo ha buscado en el historial y es el más reciente que coincide.

- `Ctrl + c`: Interrumpe cualquier proceso en ejecución de forma inmediata y nos devuelve al prompt.

- `Ctrl + z`: Envía el proceso actual a segundo plano. Para recuperarlo sólo tendremos que escribir `fg` y pulsar Intro.

- `Ctrl + d`: Cierra la sesión de la terminal en la que nos encontramos. Si estamos usando una interfaz gráfica en la que hemos abierto una terminal, ésta sólo se cerrará.

- `Ctrl + w`: Elimina la palabra anterior a la posición del cursor.

- `Ctrl + k`: Corta todo aquello que se encuentra entre la situación del cursor y el final de la línea.

- `Ctrl + u`: Corta la línea en la que nos encontramos al completo.

- `Ctrl + y`: Pega el contenido copiado o cortado con `Ctrl + u` o `Ctrl + k`.

- `!!`: Repetirá el último comando usado.


## Comandos de Información del Sistema ##

- `date`: Muestra la fecha y hora al completo.

- `cal`: Muestra el calendario del mes en curso.

- `who`: muestra los usuarios de sistema que han iniciado una sesion.

	Ejemplos: 
	`who`
	`w`
	`who am i`

- `whoami`: Muestra el nombre del usuario con el que estamos trabajando.

- `w`: Muestra qué usuarios están conectados actualmente.

- `uptime`: Muestra el tiempo que lleva encendido el sistema, y cuántos usuarios lo han usado.

- `uname –a`: (unix name) Ofrece información del Kernel del sistema.Información sobre el tipo de ***unix*** en el que estamos, kernel, etc.

	Ejemplos: 
	`uname`
	`uname -a`

- `cat /proc/cpuinfo`: Muestra información del Microprocesador

- `cat /proc/meminfo`: Muestra información de la memoria del equipo.

- `free`: Muestra la cantidad de memoria total, usada y libre, así como el espacio en la unidad de intercambio.

## Comandos de administración ##

- `adduser xxxxxx`: Donde sustituiremos las x por el nombre del usuario que queramos añadir.

	Ejemplos: 
	`adduser pepe`
	`adduser -s /bin/false pepe`

- `userdel`: eliminar usuario de sistema.

	Ejemplos: 
	`userdel pepe`

- `passwd xxxxxxx`: Donde xxxxxxx será el nombre del usuario al que queramos cambiar la contraseña. Necesitaremos conocer la contraseña ya establecida si queremos cambiarla.

- `su`: Inicia sesión como superusuario o root desde la sesión actual.

- `exit`: Cierra la sesión del superusuario o root, volviendo al usuario desde la que se inició.

## Comandos de proceso ##

- `ps`: Muestra los procesos que se encuentran activos en el sistema actualmente.Despliega todos los procesos del sistema, con nombre y tiempo de inicio.

	Ejemplo: 
	`ps axu`

	Muestra los procesos de un usuario ejecutados desde la shell:
		`$ ps –u josema`
	Muestra todos los procesos del sistema con información ampliada:
		`$ ps –ef`

	Filtrar la lista anterior:
		`ps axu | grep java`
		`ps axu | grep tomcat`

- `pstree`: Muestra la estructura jerárquica de los procesos.

- `top`: Muestra todos los procesos en funcionamiento. Esta herramiente monitorea varios recursos del sistema y tiene un carácter dinámico, muestra uso de CPU por proceso, cantidad de memoria, tiempo desde su inicio,etc. vmstat Es muy similar a top ya que es un condensado de los procesos del sistema, para que esta herramienta se vuelva dinámica se deben especificar los argumentos: `vmstat -n`

- `kill “pid”` (process id): Detiene el proceso asignado al pid que muestra la salida del comando ps.

- `bg`: Muestra todos los procesos pausados o en segundo plano (recordamos que `Ctrl + z` establecía procesos en segundo plano).

- `fg`: Trae de vuelta el proceso más reciente puesto en segundo plano.

- `crontab`: Al igual que `at` especifica el tiempo al cual se ejecutará un programa “script”, `crontab` tiene la siguiente forma: minutos horas días meses fin_de_semana nombre_de_usuario instrucción argumentos
El siguiente ejemplo ejecutará el programa `oracle.pl` cada media hora todos los dias:
Código :
`30 * * * * root /usr/oracle.pl`

Si se desea realizarlo mensualmente:
Código :
`01 3 1 * * root /usr/oracle.pl`
Lo anterior ejecutará oracle.pl el dia primero de cada mes, a las 3:01 AM.
Para especificar trabajos cron cada usuario mantiene un archivo en el directorio `/var/spool/cron/` , este directorio lo accesa cada usario con el comando `crontab -e`
La ejecución de `crontab` se facilita debido al archivo `/etc/crontab` que especifica trabajos `crontab` por hora,dia,semana y mes, de esta forma solo se requiere que el usuario coloque un archivo en los
directorios correspondientes: `/etc/cron.hourly | /etc/cron.daily | /etc/cron.weekly | /etc/cron.monthly`








## Comandos de actualización del sistema ##

- `apt-get update`: Actualiza los repositorios para añadir nuevas fuentes que instalarán las versiones más recientes de los programas que indiquemos.

- `apt-get upgrade`: Actualizará las aplicaciones que el comando ‘apt-get update’ haya actualizado, en caso de existir versiones más recientes.

- `apt-get install xxxxx`: Donde xxxxx será el paquete correspondiente al programa que queremos instalar. Por ejemplo, ‘apt-get install libreoffice’.

- `dpkg –i xxxx.deb`: Instalador de paquetería para gestores de paquetes deb.

- `yum install xxxxxx`: Instalador de paquetería para gestores de paquetes rpm.

- `rpm –i xxxxxx.rpm`: Instalador de paquetería para gestores de paquetes rpm.


## Comandos de inicio y apagado ##

- `halt`: Detiene todos los procesos y apaga el equipo.

- `shutdown`: Programa el apagado del sistema en 1 minuto.

- `shutdown –r X`: Programa el reinicio del sistema, donde X será el número de minutos en el que se reiniciará el equipo.

- `shutdown –h now`: Apaga el equipo saltándose el minuto de espera programado.

- `shutdown –r now`: Reinicia el equipo saltándose la espera programada.

- `reboot`: Reinicia el sistema de la misma forma que el comando anterior.

- `init 0`: Apaga el sistema.

- `init 6`: Reinicia el sistema.

- `startx`: Inicia la interfaz gráfica si ésta se encuentra instalada en el sistema.

## Comandos de Red ##

- `host`: Determina la dirección IP de un “Host” , `host -a` despliega toda la información de DNS

- `ifconfig`: Configuración de interfaces de red, modems, etc. Lista las direcciones IP de todos los dispositivos del equipo.

- `ping xxxx`: Manda una señal que deberá ser devuelta por el equipo xxxx para comprobar si se encuentra en línea o no.

Ejemplos: 
`ping www.google.es`

- `whois xxxxx`: Obtiene información acerca de un dominio xxxxx, como por ejemplo www.google.com

- `traceroute`: herramienta de red que nos muestra el camino que se necesita para llegar a otra maquina.
	
	Ejemplos: 
	`traceroute www.rediris.es`

- `wget xxxx`: programa para descargar ficheros por http o ftp.Descargará el archivo xxxx. Deberemos proporcionarle una dirección completa como por ejemplo:  `https://direccionip/carpeta/subcarpeta/archivo.file`

	Ejemplos: 
	`wget http://www.rediris.es/documento.pdf`

- `ifup`: Habilita la interfase especificada,
	Ejemplo: 
	
	`ifup eth0`

- `ifdown`: Deshabilita la interfase especificada

	Ejemplo: 

	`ifdown eth0`

- `netstat -a`: Todas la conexiones de Red originadas y recibidas por el “Host”. la informacion sobre las conexiones de red activas.
Ejemplos: 
	`netstat`
	`netstat -ln`
	`netstat -l`
	`netstat -a`
	`netstat -r` Muestra la tabla de ruteo “routing table” del sistema
	`netstat -i` Estadisticas de red de cada interfase

- `nslookup`: Busca información en los servidores DNS,ejemplo: `nslookup -query=mx osomosis.com`, si no se especifican parámetros se entra en modo interactivo

- `route`: Permite agregar tablas de ruteo de y hacia el “Host”. Gestiona las rutas a otras redes.
`route add`
. Ejemplo: Para guiar toda la información de la red `206.171.55.16 netmask 255.255.255.240` vía la interfase `eth0`:
Código :
`route add ‐net 206.171.55.16 255.255.255.240 eth0`
Para routear todo el trafico por cierta interfase (“Default Gateway”):
Código :
`route add default gw 206.171.55.51 eth0`
Esto enviará toda la infromacion por la dirección `206.171.55.51`
`route -n` Despliega la tabla de ruteo del “Host”. NOTA: Debe de estar “IP Forwarding” ON en
/etc/sysconfig/network , además el “kernel” debe de estar configurado para “IP Forwarding” .

- `mail`: Envío y lectura de correo electrónico.
Ejemplos: 

`mail javimartinalonso@gmail.com < fichero`
`mail -v javimartinalonso@gmail.com < fichero`

https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX



















## Referencias ##

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/