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

# Interface Linea de Comando #

Si todo sistema operativo tiene una **Interfaz de Linea de Comandos (*Command LineInterface, CLI*)**, en **UNIX** esta interfaz tiene aun mayor importancia, ya que el uso de un **sistema UNIX** como servidor está más extendido que como sistema de escritorio. Que el interfaz sea *“austero”* permite que la potencia del sistema se use en los procesos y no en otra cosa. A estos servidores normalmente se accederá abriendo sesiones remotas en modo comando.

Las órdenes o comandos son generalmente programas ejecutables que el shell encuentra y ejecuta en respuesta a las instrucciones tecleadas, tales como `chmod`, `find`, `grep` o `ls`.

El shell es un intérprete de órdenes que puede expandir y modificar la orden antes de ejecutarla (por ejemplo con el uso de alias, variables de entorno, metacaracteres o caracteres comodines(*,?, [], -) y el  operador tubería (pipe) para la conexión de órdenes (redirección yfiltros).

## Comodines o metacaracteres ##

Los caracteres más frecuentes son:
- `*` representa cualquier cadena de caracteres, incluyendo la cadena vacía.
- `?` representa a cualquier carácter simple.

## Comandos de comandos. Información de la línea de comandos ##

- `man <command>`: Muestra el manual de uso o configuración del comando <command>.

	Ejemplo: Muestra la documentación del comando ls.

	`man ls`

- `man –k <word>`: Muestra las páginas de manual que contengan la palabra <word>.

- `apropos <command>`: Lista las páginas de manual que tratan acerca del comando <command>.

- `whereis <command>`: Muestra la localización más probable para el programa <command>.

## `SSH` Operaciones con host remotos ##

- **Conectar a una terminal remota** `ssh`

	- Conectarte a un host especificando un usuario, una vez que lo ejecutes te pedirá un password:

		`ssh user@host`

	- Conectarte a un host utilizando una llave ssh, este comando solo requiere el usuario pero no es necesario escribir un password:

		`ssh -i sshKey user@host`

- **Subir o descargar ficheros a un host remoto** `scp`
	
	- Descarga lo que se encuentra en el servidor a la ruta local especificada.
	
		`scp user@host:absolutePath destinationPath`

		Ejemplo: Si queremos copiar el Òchero archivo.txt del servidor a nuestro ordenador en la carpeta Documentos, hacemos lo siguiente:
		
		`$ scp usuario@dominio.com:/home/usuario/archivo.txt Documentos`

	- Sube al servidor lo que se tiene en el `originPath` al `destinationPath` del servidor.
	
		`scp originPath user@host:destinationPath`

		Ejemplo: Si queremos subir el archivo archivo.txt de nuestro ordenador a la carpeta `/home/usuario` del servidor, hacemos lo siguiente:
		
		`$ scp archivo.txt usuario@dominio.com:/home/usuario`

		Ejemplo: Para copiar un directorio completo de mi ordenador al servidor, por ejemplo /home/javi/carpeta a /home/usuario, añadimos un -r en el comando:

		`$ scp -r /home/javi/carpeta usuario@dominio.com:/home/usuario`

	- Copiar archivos de un servidor a otro servidor:
	
		`scp user1@host1:absolutePath user2@host2:absolutePath`

		ejemplo: Para copiar un archivo de un servidor a otro, hacemos lo siguiente:
		`$ scp usuario1@dominio1.com:/home/usuario1/archivo.txt usuario2@dominio2.com:/home/usuario2/`


## Navegar por los directorios ##

`pwd`: “Print working directory” (Muestra el directorio de trabajo), nos mostrará la ruta en la que nos encontramos actualmente. Muy útil si hemos estado saltando de subcarpeta en subcarpeta y el prompt nos muestra sólo una ruta abreviada.

`ls`: Nos muestra una lista con el contenido del directorio actual (o el que le pasemos como argumento, por ejemplo: “ls /home/usuario”).

`ls –l` o `ll`: Muestra una lista del contenido del directorio añadiendo información adicional de los ficheros o carpetas, como permisos, fecha y hora de creación o modificación, etc…

`ls –a`: Muestra una lista de todos los ficheros del directorio, incluyendo los ficheros o carpetas ocultos.

`cd`: nos lleva al directorio raíz.

`cd..` : Subiremos un nivel en el árbol de directorios. Si por ejemplo nos encontramos en /home/usuario, con este comando nos iremos a /home.





## Tratamiento de ficheros ##

### 1. Buscar ficheros ###

- Busca archivos en una jerarquía de directorios, imagina que quieres buscar el log de tu aplicación pero no sabes en que directorio está, veamos un ejemplo:

	`find / -name worker.log`

- Encontrar un archivo/directorio con un nombre que comience con un caracter particular:

	`ls -ltr | grep <character>*`

	Ejemplo: Encontrar fichero o directorios que comienzan con 'ab':
	
	`ls -lrt | grep ab*`


### 1. Leer y revisar documentos ###
- **Determinar el tipo de un archivo (fichero, directorio)**
	file <Filename>

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

- Hacer **búsquedas** dentro del contenido de un **fichero**. **Filtrar, resaltar** mediante expresiones regulares:

	- Busca el texto ERROR en el archivo catalina.out

		`grep ERROR catalina.out`

	- Busca el texto ERROR en el archivo catalina.out y lo marca con un color

 		`grep --color "ERROR" catalina.out`
 



https://enavas.blogspot.com.es/2008/04/el-shell-de-linux-comando-grep.html


grep nos permite buscar dentro de los archivos, las líneas que concuerdan con un patrón. Pero si no especificamos ningún nombre de archivo, tomará la entrada estándar, con lo que podemos encadenarlo con otros filtros e imprimir las líneas encontradas en la salida estándar. 

Por ejemplo si queremos listar los archivos cuyo nombre comiencen por 'ab' en el directorio actual:

	`ls -l | grep ab*` 


Como tiene muchísimas opciones, vamos a ver tan sólo las más usadas:

- `-c` En lugar de imprimir las líneas que coinciden, muestra el número de líneas que coinciden.
- `-e` PATRON nos permite especificar varios patrones de búsqueda o proteger aquellos patrones de búsqueda que comienzan con el signo -.
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
([0-9A-F]{2}:){5} Buscamos 5 conjuntos de 2 carateres seguidos de dos puntos
[0-9A-F]{2} seguido por un conjunto de dos caracteres.

Como las direcciones MAC se representan en hexadecimal, los caracteres que buscamos son los números del 0 al 9 y las letras desde la A a la F.

- Extraer la lista de direcciones de correo electrónico de un archivo:
grep -Eio '[a-z0-9._-]+@[a-z0-9.-]+[a-z]{2,4}' fichero.txt

Utilizo las mismas opciones que en el caso anterior:

-`-o` Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
-`-i` Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
-`-E` Indica que vamos a usar una expresión regular extendida.

Analicemos ahora la expresión regular:
[a-z0-9._-]+@[a-z0-9.-]+[a-z]{2,4}

Al igual que antes, la vamos dividiendo en partes:
[a-z0-9._-]+ Una combinación de letras, números, y/o los símbolos . _ y - de uno o más caracteres
@ seguido de una arroba
[a-z0-9.-]+ seguido de una cadena de letras, números y/o los símbolos . y -
[a-z]{2,4} seguido de una cadena de entre dos y cuatro caracteres.

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

Al igual que en los otros dos ejemplos de expresiones regulares uso las opciones -oiE en el comando grep:

- `-o` Indica que la salida del comando debe contener sólo el texto que coincide con el patrón, en lugar de toda la línea, como es lo habitual.
- `-i` Lo he usado para que ignore la distinción entre mayúsculas y minúsculas.
- `-E` Indica que vamos a usar una expresión regular extendida.

En cuanto a la expresión regular:
'([0-9]{1,3}\.){3}[0-9]{1,3}'
([0-9]{1,3}\.){3} Representa 3 bloques de entre uno y tres dígitos separados por puntos. Observemos que como el punto es un metacaracter, tengo que usar el caracter de escape \ para que no sea interpretado como un metacaracter, sino como un caracter normal.
[0-9]{1,3} Representa el último bloque de la dirección IP, que está formado por un número de entre 1 y 3 dígitos.






### 2. Manipular archivos y directorios: Crear / Modificar ###

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

cp: Copia un fichero o directorio.

cp –i: Copia un fichero o directorio y pregunta antes de sobrescribir si se diese el caso.

cp –r: Copia un directorio con todo su contenido.

mv: Mueve o renombra un fichero o directorio. En la terminal de Linux, en lugar de renombrar un fichero mediante un comando exclusivo, utilizamos el mismo que para mover archivos o directorios, y lo que hacemos para renombrarlo es moverlo a la misma ruta donde se encuentra y cambiarle el nombre.

mv –i: Mueve o renombra un fichero o directorio preguntando antes de sobrescribir si se diese el caso.

mkdir: Crea un directorio.

rmdir: Elimina un directorio vacío.

rm: Elimina un fichero.

rm –r: Elimina un directorio y todo su contenido.

rm –i: Elimina un fichero solicitando confirmación. Es muy recomendable usarlo con la opción –r para poder usarlo con directorios evitando problemas.

### 3. Meta-Información de ficheros ###


- Imprimir todas las líneas que tiene un archivo y el número de bytes:

	`wc records.log`



## Gestión de los permisos de archivos o directorios ##

### Permisos de los ficheros ###

UNIX proporciona un medio de asignar permisos para trabajar con ficheros y directorios de forma que se puede limitar el rango de usuarios que pueden acceder a los mismos y las operaciones que pueden llevar a cabo.***Todos los ficheros en UNIX tienen un propietario***, que normalmente es el usuario que los crea. Una vez creado, el propietario puede asignar permisos que permitan o impidan el acceso al fichero. Estos ***permisos o modo de acceso*** se definen para tres entidades:

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

De forma predeterminada, **cuando creamos un *archivo* en Unix**, se crea con el permiso `666 (lectura / escritura)`. 

De forma predeterminada, **cuando creamos un *Directorio* en Unix**, se crea con el permiso `777 (lectura / escritura / ejecución)`. Junto con la notación numérica, los permisos de Unix también se pueden representar con los siguientes caracteres:

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

Para ver los permisos de ficheros y directorios, utiliza el comando `ls` con la opción `–l`:

    ls –l

Para cambiar los permisos de un fichero, utiliza el comando chmod:

    chmod 755 documento
    
    ls –l
    
    -rwxr-xr-x documento

## Información de los discos ##

- Espacio disponible en disco

	`df -h`


## Atajos de teclado ##


Ctrl + Alt + Fn (1-6): Para abrir terminales a pantalla completa. Requiere autentificación con usuario y contraseña. Cambiaremos a la terminal correspondiente a la tecla Fn que pulsemos, correspondiendo ésta al orden en el que las abrimos. En Linux podemos tener múltiples terminales funcionando simultáneamente, por defecto controlaremos hasta 6 con esta combinación de teclas. Por ejemplo Ctrl + Alt + F1 nos lleva a la primera terminal abierta.

tty: Con este comando, en el caso de tener varias terminales abiertas, nos dirá en cuál nos encontramos.

Ctrl + Alt + F7: Nos devolverá al entorno gráfico (si usábamos alguno).

Shift (Mayus) + RePág: Realizaremos scroll hacia arriba en la terminal.

Shift (Mayus) + AvPág: Realizaremos scroll hacia abajo en la terminal.

Tab (Tabulador) Función de  expansión. Completará el comando, nombre de fichero o directorio que estemos escribiendo. En caso de múltiples coincidencias, con una doble pulsación de esta tecla obtendremos todos los resultados posibles encontrados en el directorio o sistema.


Flecha de dirección ‘arriba’ y /o ‘abajo’: La shell almacena un historial de las órdenes tecleadas anteriormente. Nos moveremos por el historial compuesto por los últimos comandos usados.

Ctrl + r: Buscará en el historial el último comando usado según lo que vayamos escribiendo. Por ejemplo utilizamos el comando clear hace unas horas, si pulsamos Ctrl + r y escribimos cl nos mostrará el comando clear, puesto que lo ha buscado en el historial y es el más reciente que coincide.

Ctrl + c: Interrumpe cualquier proceso en ejecución de forma inmediata y nos devuelve al prompt.

Ctrl + z: Envía el proceso actual a segundo plano. Para recuperarlo sólo tendremos que escribir fg y pulsar Intro.

Ctrl + d: Cierra la sesión de la terminal en la que nos encontramos. Si estamos usando una interfaz gráfica en la que hemos abierto una terminal, ésta sólo se cerrará.

Ctrl + w: Elimina la palabra anterior a la posición del cursor.

Ctrl + k: Corta todo aquello que se encuentra entre la situación del cursor y el final de la línea.

Ctrl + u: Corta la línea en la que nos encontramos al completo.

Ctrl + y: Pega el contenido copiado o cortado con Ctrl + u o Ctrl + k.

!!: Repetirá el último comando usado.








## Comandos de Información del Sistema ##


date: Muestra la fecha y hora al completo.

cal: Muestra el calendario del mes en curso.

whoami: Muestra el nombre del usuario con el que estamos trabajando.

w: Muestra qué usuarios están conectados actualmente.

uptime: Muestra el tiempo que lleva encendido el sistema, y cuántos usuarios lo han usado.

uname –a: Ofrece información del Kernel del sistema.

cat /proc/cpuinfo: Muestra información del Microprocesador

cat /proc/meminfo: Muestra información de la memoria del equipo.

free: Muestra la cantidad de memoria total, usada y libre, así como el espacio en la unidad de intercambio.

## Comandos de administración ##


adduser xxxxxx: Donde sustituiremos las x por el nombre del usuario que queramos añadir.

passwd xxxxxxx: Donde xxxxxxx será el nombre del usuario al que queramos cambiar la contraseña. Necesitaremos conocer la contraseña ya establecida si queremos cambiarla.

su: Inicia sesión como superusuario o root desde la sesión actual.

exit: Cierra la sesión del superusuario o root, volviendo al usuario desde la que se inició.

## Comandos de proceso ##


ps: Muestra los procesos que se encuentran activos en el sistema actualmente.

top: Muestra todos los procesos en funcionamiento.

kill “pid” (process id): Detiene el proceso asignado al pid que muestra la salida del comando ps.

bg: Muestra todos los procesos pausados o en segundo plano (recordamos que Ctrl + z establecía procesos en segundo plano).

fg: Trae de vuelta el proceso más reciente puesto en segundo plano.

## Comandos de actualización del sistema ##


apt-get update: Actualiza los repositorios para añadir nuevas fuentes que instalarán las versiones más recientes de los programas que indiquemos.

apt-get upgrade: Actualizará las aplicaciones que el comando ‘apt-get update’ haya actualizado, en caso de existir versiones más recientes.

apt-get install xxxxx: Donde xxxxx será el paquete correspondiente al programa que queremos instalar. Por ejemplo, ‘apt-get install libreoffice’.

dpkg –i xxxx.deb: Instalador de paquetería para gestores de paquetes deb.

yum install xxxxxx: Instalador de paquetería para gestores de paquetes rpm.

rpm –i xxxxxx.rpm: Instalador de paquetería para gestores de paquetes rpm.


## Comandos de inicio y apagado ##


halt: Detiene todos los procesos y apaga el equipo.

shutdown: Programa el apagado del sistema en 1 minuto.

shutdown –r X: Programa el reinicio del sistema, donde X será el número de minutos en el que se reiniciará el equipo.

shutdown –h now: Apaga el equipo saltándose el minuto de espera programado.

shutdown –r now: Reinicia el equipo saltándose la espera programada.

reboot: Reinicia el sistema de la misma forma que el comando anterior.

init 0: Apaga el sistema.

init 6: Reinicia el sistema.

startx: Inicia la interfaz gráfica si ésta se encuentra instalada en el sistema.

## Comandos de Red ##


ifconfig: Lista las direcciones IP de todos los dispositivos del equipo.

ping xxxx: Manda una señal que deberá ser devuelta por el equipo xxxx para comprobar si se encuentra en línea o no.

whois xxxxx: Obtiene información acerca de un dominio xxxxx, como por ejemplo www.google.com

wget xxxx: Descargará el archivo xxxx. Deberemos proporcionarle una dirección completa como por ejemplo: https://direccionip/carpeta/subcarpeta/archivo.file





https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX

## 3. El sistema de ficheros ##
3.1.
 Jerárquía estándar
Un fichero UNIX es una secuencia de 0 o más bytes. El sistema no distingue entre ficherosASCII, binarios, o cualquier otro tipo. La interpretación del contenido de los ficheros se dejaa los programas que los utilizan.La longitud de los nombres de los ficheros estaba limitada originariamente a 14 caracteres arbitrarios, pero BSD UNIX la incrementó hasta 255. Las mayúsculas y las minúsculas son significativas, lo que significa que RESUMEN, resumen, y ResumeN serían nombres diferentes.Normalmente, muchos programas asumen que los nombres de los ficheros consistan en un nombre seguido por una extensión separados por un punto. De esta forma, prueba.c es normalmente un programa en C, informe.pdf un documento de Adobe, leeme.txt un fichero de texto plano, etc. Sin embargo, estas convenciones no son impuestas por el sistema operativo.La gran diferencia de UNIX con respecto a otros sistemas es que en UNIX existe un soloárbol de directorios y no uno para cada unidad de almacenamiento (disco duro, partición de disco, unidad flash, CD/DVD, etc.). Cualquier unidad de almacenamiento debe formar parte de esta estructura única.A la operación por la cual una unidad de almacenamiento entra a formar parte del árbol de directorios del sistema se la denomina montaje del dispositivo. Existe un directorio que contiene el resto de archivos y directorios del sisterma. Es el directorio raíz. El directorio raíz se representa siempre con el símbolo de barra inclinada /.

dibujo jerarquia de directorios

| Directorio | Descripción breve |
| ---------- | ---------- |
| `/` | Directorio raíz del sistema de ficheros. |
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
| `/sbin` | Sistema de binarios esencial, comandos y programas exclusivos del superusuario (root), por ejemplo: `init`, `route`, `ifup`). |
| `/tmp` | Ficheros temporales (véase también `/var/tmp`). |
| `/usr` | La mayoría de las utilidades y aplicaciones multiusuario. 
| `/var` | Ficheros variables, tales como logs, archivos spool, bases de datos, archivos de e-mail temporales, y archivos temporales en general. |
| `/var/log` | Ficheros de registro, Log. Varios registros, logs. |
| `/var/mail` | Buzón de mensajes de correo electrónico |
| `/var/tmp` | Ficheros temporales que, a diferencia de `/tmp`, no se borran entre sesiones o reinicios del sistema. |

















## Referencias ##

https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/