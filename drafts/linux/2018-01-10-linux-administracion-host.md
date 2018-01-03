---
layout: post
section: "LINUX"
title:  "Comandos de administración Host Unix"
date:   2017-12-25
desc: "Recopilatorio de los comandos de administración de sistemas Unix que son más usados habitualmente: Administración de usuarios, sistema, procesos, configuración de red."
keywords: "linux, shell, comandos, host"
categories: [linux]
tags: [linux, shell, comandos, host]
icon: fab fa-linux
image: static/img/blog/linux/linux-logo.png
---

# Comandos de administración Host Unix #

Recopilatorio de los comandos de administración de sistemas Unix que son más usados habitualmente: Administración de usuarios, sistema, procesos, configuración de red.

<!-- more -->

## Administración de usuarios ##

- `adduser xxxxxx` Donde sustituiremos las x por el nombre del usuario que queramos añadir.

	Ejemplos: 

	`adduser pepe`

	`adduser -s /bin/false pepe`

- `userdel` eliminar usuario de sistema.

	Ejemplos: 

	`userdel pepe`

- `passwd xxxxxxx` Donde xxxxxxx será el nombre del usuario al que queramos cambiar la contraseña. Necesitaremos conocer la contraseña ya establecida si queremos cambiarla.

- `su` Inicia sesión como superusuario o root desde la sesión actual.

- `exit` Cierra la sesión del superusuario o root, volviendo al usuario desde la que se inició.

## Comandos de Información del Sistema ##

- `date` Muestra la fecha y hora al completo.

- `cal` Muestra el calendario del mes en curso.

- `who` muestra los usuarios de sistema que han iniciado una sesion.

	Ejemplos:
 
	`who`

	`w`

	`whoami`

- `whoami` Muestra el nombre del usuario con el que estamos trabajando.

- `w` Muestra qué usuarios están conectados actualmente.

- `uptime` Muestra el tiempo que lleva encendido el sistema, y cuántos usuarios lo han usado.

- `uname –a` (unix name) Ofrece información del Kernel del sistema.Información sobre el tipo de ***unix*** en el que estamos, kernel, etc.

	Ejemplos: 

	`uname`

	`uname -a`

- `cat /proc/cpuinfo` Muestra información del Microprocesador

- `cat /proc/meminfo` Muestra información de la memoria del equipo.

- `free` Muestra la cantidad de memoria total, usada y libre, así como el espacio en la unidad de intercambio.

## Actualización del sistema ##

- `apt-get update`: Actualiza los repositorios para añadir nuevas fuentes que instalarán las versiones más recientes de los programas que indiquemos.

- `apt-get upgrade`: Actualizará las aplicaciones que el comando ‘apt-get update’ haya actualizado, en caso de existir versiones más recientes.

- `apt-get install xxxxx`: Donde xxxxx será el paquete correspondiente al programa que queremos instalar. Por ejemplo, ‘apt-get install libreoffice’.

- `dpkg –i xxxx.deb`: Instalador de paquetería para gestores de paquetes deb.

- `yum install xxxxxx`: Instalador de paquetería para gestores de paquetes rpm.

- `rpm –i xxxxxx.rpm`: Instalador de paquetería para gestores de paquetes rpm.

## Administración de procesos ##

- `ps` Muestra los procesos que se encuentran activos en el sistema actualmente.Despliega todos los procesos del sistema, con nombre y tiempo de inicio.

	Ejemplo: 

	`ps axu`

	Muestra los procesos de un usuario ejecutados desde la shell:
		`$ ps –u josema`
	Muestra todos los procesos del sistema con información ampliada:
		`$ ps –ef`

	Filtrar la lista anterior:
		`ps axu | grep java`
		`ps axu | grep tomcat`

- `pstree` Muestra la estructura jerárquica de los procesos.

- `top` Muestra todos los procesos en funcionamiento. Esta herramiente monitorea varios recursos del sistema y tiene un carácter dinámico, muestra uso de CPU por proceso, cantidad de memoria, tiempo desde su inicio,etc. vmstat Es muy similar a top ya que es un condensado de los procesos del sistema, para que esta herramienta se vuelva dinámica se deben especificar los argumentos: `vmstat -n`

- `kill “pid”` (process id): Detiene el proceso asignado al pid que muestra la salida del comando ps.

- `bg` Muestra todos los procesos pausados o en segundo plano (recordamos que `Ctrl + z` establecía procesos en segundo plano).

- `fg` Trae de vuelta el proceso más reciente puesto en segundo plano.

- `crontab` Al igual que `at` especifica el tiempo al cual se ejecutará un programa “script”, `crontab` tiene la siguiente forma: 

	`minutos horas días meses fin_de_semana nombre_de_usuario instrucción argumentos`

	El siguiente ejemplo ejecutará el programa `oracle.pl` cada media hora todos los dias:

	`30 * * * * root /usr/oracle.pl`

	Si se desea realizarlo mensualmente:

	`01 3 1 * * root /usr/oracle.pl` Ejecutará oracle.pl el dia primero de cada mes, a las 3:01 AM.

	Para especificar trabajos cron cada usuario mantiene un archivo en el directorio `/var/spool/cron/`, este directorio lo accesa cada usuario con el comando `crontab -e`.

	La ejecución de `crontab` se facilita debido al archivo `/etc/crontab` que especifica trabajos `crontab` por hora, dia, semana y mes, de esta forma solo se requiere que el usuario coloque un archivo en los directorios correspondientes: `/etc/cron.hourly | /etc/cron.daily | /etc/cron.weekly | /etc/cron.monthly`

## Reinicio y apagado ##

- `halt`: Detiene todos los procesos y apaga el equipo.

- `shutdown`: Programa el apagado del sistema en 1 minuto.

- `shutdown –r X`: Programa el reinicio del sistema, donde X será el número de minutos en el que se reiniciará el equipo.

- `shutdown –h now`: Apaga el equipo saltándose el minuto de espera programado.

- `shutdown –r now`: Reinicia el equipo saltándose la espera programada.

- `reboot`: Reinicia el sistema de la misma forma que el comando anterior.

- `init 0`: Apaga el sistema.

- `init 6`: Reinicia el sistema.

- `startx`: Inicia la interfaz gráfica si ésta se encuentra instalada en el sistema.

## Administración de Red ##

- `host`: Determina la dirección IP de un “Host” , `host -a` despliega toda la información de DNS

- `ifconfig`: Configuración de interfaces de red, modems, etc. Lista las direcciones IP de todos los dispositivos del equipo.

- `ping xxxx`: Manda una señal que deberá ser devuelta por el equipo xxxx para comprobar si se encuentra en línea o no.

	Ejemplo: `ping www.google.es`

- `whois xxxxx`: Obtiene información acerca de un dominio xxxxx, como por ejemplo www.google.com

- `traceroute`: herramienta de red que nos muestra el camino que se necesita para llegar a otra maquina.
	
	Ejemplos: `traceroute www.rediris.es`

- `wget xxxx`: programa para descargar ficheros por http o ftp.Descargará el archivo xxxx. Deberemos proporcionarle una dirección completa como por ejemplo:  `https://direccionip/carpeta/subcarpeta/archivo.file`

	Ejemplos: `wget http://www.rediris.es/documento.pdf`

- `ifup`: Habilita la interfase especificada,
	
	Ejemplo:  `ifup eth0`

- `ifdown`: Deshabilita la interfase especificada

	Ejemplo: `ifdown eth0`

- `netstat -a`: Todas la conexiones de Red originadas y recibidas por el “Host”. la informacion sobre las conexiones de red activas.

	Ejemplos: 

	`netstat`

	`netstat -ln`

	`netstat -l`

	`netstat -a`

	`netstat -r` Muestra la tabla de ruteo “routing table” del sistema

	`netstat -i` Estadisticas de red de cada interfase

- `nslookup`: Busca información en los servidores DNS

	`nslookup -query=mx osomosis.com`, si no se especifican parámetros se entra en modo interactivo

- `route`: Permite agregar tablas de ruteo de y hacia el “Host”. Gestiona las rutas a otras redes.
`route add`

	Para guiar toda la información de la red `206.171.55.16 netmask 255.255.255.240` vía la interfase `eth0`:

	`route add ‐net 206.171.55.16 255.255.255.240 eth0`

	Para routear todo el trafico por cierta interfase (“Default Gateway”):

	`route add default gw 206.171.55.51 eth0` Esto enviará toda la informacion por la dirección `206.171.55.51`

	`route -n` Despliega la tabla de ruteo del “Host”. 

	> NOTA: Debe de estar “IP Forwarding” ON en `/etc/sysconfig/network` , además el “kernel” debe de estar configurado para “IP Forwarding”.

- `mail`: Envío y lectura de correo electrónico.

	Ejemplos: 

	`mail javimartinalonso@gmail.com < fichero`

	`mail -v javimartinalonso@gmail.com < fichero`

## Referencias ##

[https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/](https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/ "https://openwebinars.net/blog/La-guia-definitiva-para-aprender-a-usar-la-terminal-de-Linux/")

[https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX](https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX "https://es.scribd.com/document/284941275/01-Resumen-Comandos-UNIX")