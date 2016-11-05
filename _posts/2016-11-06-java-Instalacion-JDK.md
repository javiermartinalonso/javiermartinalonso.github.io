---
layout: post
section: "JAVA"
title:  "Instalación JDK"
date:   2016-11-06
desc: "Instalación JDK"
keywords: "java,jdk,instalación, windows"
categories: [java]
tags: [java,jdk,instalación, windows]
icon: icon-java-bold
---

# Instalación JDK

Antes de empezar con la explicación de la instalación del JDK de java, me gustaría aclarar un par de conceptos que suelen confundir a los neófitos de java.

## Que son JRE y JDK y sus diferencias

- **Java Runtime Enviroment (JRE)** **incluye una implementación de la JVM**, librerías y el conjunto de software necesario para ejecutar las aplicaciones cliente de Java, al igual que el plugin para que los navegadores de internet ***(browser)*** ejecuten código especial de Java llamado ***“applet”***.

- **Java Development Kit (JDK)** está dirigido a desarrolladores, **incluye el JRE** y el conjunto de herramientas de línea de comandos necesario para compilar el código, empaquetarlo en archivos con extensión ***“JAR”***, generar documentación, entre otros. Es por esta razón por la que las herramientas de desarrollo requieren que el JDK se encuentre instalado.

## Instalar JDK

Debemos acudir a la página oficial de ORACLE para obtener la versión que deseamos instalar. A menudo resulta un poco complicado navegar por este tipo de ***"macrositios"***; te recomiendo ir por la vía rápida y buscar en Google ***"download java jdk"***. Esto te llevará a la página principal de descarga del JDK en el sito de Oracle.

En la página oficial de ORACLE, encontrará dos opciones: **Download JDK** y **Download JRE**. Debido a que vamos a escribir código para luego compilarlo, es necesario descargar el JDK porque, como vimos, el JRE no incluye las herramientas necesarias.

Hay diferentes [ediciones de la plataforma Java](https://javiermartinalonso.github.io/java/2016/11/05/java-Primeros-Pasos-1.html "ediciones de la plataforma Java"), y hay que tener clara cuál es la edición que necesitamos según el tipo de producto que deseamos desarrollar.

<div style="text-align: center;">
	<img src="/static/img/blog/java/ediciones_java.png" alt="Diagrama conceptual Java.">
</div>

> **Pendiente incluir algún vídeo explicativo**













## Variables de entorno de JAVA

### ¿Qué es una variable de sistema o entorno?

Una variable del entorno es un valor dinámico cargado en la memoria, que puede ser utilizado por varios procesos que funcionan simultáneamente. En la mayoría de los sistemas operativos, la ubicación de algunas bibliotecas o de los archivos ejecutables del sistema más importantes puede variar según la instalación.

Por eso es posible, para un programa dado, remitirse a una ubicación basada en las variables del entorno que definen estos datos.

En concreto para Java se suelen configurar 2 variables de entorno:***path y java\_home***

### Configurar variables del sistema path y java\_home
- **JAVA\_HOME**, es una variable de entorno del sistema que informa al sistema operativo sobre la ruta donde se encuentra instalado Java. Por ejemplo si tenemos instalada más una versión de java, sirve para indicar cuál es la activa en el sistema. Para configurarla seguiremos los siguientes pasos: Debemos establecer esta variable de entorno, después de instalar el JDK para asegurarnos de que la instalación es correcta y que java puede ser ejecutado por otras aplicaciones que dependan del JRE, por ejemplo: maven, eclipse, tomcat, ... 

- **PATH** es una variable de entorno del sistema que informa al Sistema Operativo sobre la ruta de distintos directorios fundamentales para el funcionamiento de los programas. En la variable PATH debemos indicar donde se encuentran los programas ejecutables de Java necesarios para el desarrollo de aplicaciones como pueden ser el compilador (***javac***)  y el intérprete(***java***). Es donde el intérprete de comandos buscará los comandos de ejecución que escribamos en la consola, siempre y cuando no usemos una ruta específica para llamar al comando.
Para configurar esta variable simplemente desde la pantalla de ***“Variables de entorno***” anterior, clickamos sobre ***“Nueva”*** variable de usuario:

#### Configuración en WINDOWS

- **JAVA\_HOME**:
Desde el ***“Panel de Control”*** pinchamos en ***“Sistema”*** o bien sobre ***“MiPC”*** pulsamos el botón derecho y clickamos sobre ***“Propiedades“***. Una vez en la pantalla que aparece a continuación hacemos click en ***“Configuración avanzada del sistemas“***.

<div style="text-align: center;">
	<img src="/static/img/blog/windows/conf-avanzada_sistema.png" alt="Configuración avanzada del Sistema.">
</div>

En la siguiente pantalla vamos a la pestaña ***“Opciones avanzadas”*** y clickamos sobre ***“Variables de entorno“***, tal y como se muestra a continuación:

<div style="text-align: center;">
	<img src="/static/img/blog/windows/variables-entorno.png" alt="opciones avanzadas variables de entorno.">
</div>

Creamos una ***“Nueva”*** variable del sistema:

<div style="text-align: center;">
	<img src="/static/img/blog/windows/nueva-variable-sistema.png" alt="Nueva Variable de Entorno.">
</div>

Le asignamos como ***“Nombre de la variable”***: **JAVA\_HOME** y como ***“Valor de variable”*** el path o ruta donde hemos instalado el JDK de nuestro java:

<div style="text-align: center;">
	<img src="/static/img/blog/windows/editar-variable-sistema-java-home.png" alt="Editar variable de Entorno Java\_home.">
</div>

> **NOTA**: En windows hay que reiniciar el sistema tras cambiar el valor a esta variable para que el valor de la variable se haga efectivo.


- **PATH**:

Para configurarla simplemente desde la pantalla de ***“Variables de entorno”*** anterior, clickamos sobre ***“Nueva”*** variable de entorno:

<div style="text-align: center;">
	<img src="/static/img/blog/windows/nueva-variable-sistema.png" alt="Crear nueva variable de sistema.">
</div>

> **OJO** : Si la variable ya esta creada, en vez de crear una nueva, editamos la que tenemos.

Asignamos los siguientes valores: ***“Nombre de la variable“***: PATH y  ***“Valor de la variable”***: ***%JAVA_HOME%\bin***.

<div style="text-align: center;">
	<img src="/static/img/blog/windows/editar-variable-sistema-path.png" alt="Asignación de los valores de la variable PATH.">
</div>

**OJO** : Si la variable ya esta creada, en vez de crear una nueva, editamos la que tenemos. En este caso NO BORRES el valor de la variable, simplemente introduce el nuevo valor separado por ***“;”***. Este podría ser un ejemplo: ***C:\WINDOWS;C:\WINDOWS\system32;%JAVA_HOME%\bin***

Con esto ya quedan configuradas las variable de entorno de Java en nuestro sistema de tal manera que podremos compilar y ejecutar nuestras clases independientemente de donde las tengas almacenadas.



> **Nota**: para comprobar que hemos configurado correctamente las variables de entorno en windows, desde la linea de comandos podemos ejecutar:
> 
>     echo %JAVA_HOME%
> 
> con esto deberíamos ver si el resultado obtenido por pantalla es el esperado.

## Referencias
<a href="http://www.oracle.com/technetwork/es/java/index.html">http://www.oracle.com/technetwork/es/java/index.html</a>

<a href="https://es.wikipedia.org/wiki/M%C3%A1quina_virtual_Java">https://es.wikipedia.org/wiki/Máquina_virtual_Java</a>

<a href="https://es.wikipedia.org/wiki/Java_(lenguaje_de_programaci%C3%B3n)">https://es.wikipedia.org/wiki/Java_(lenguaje_de_programación)</a>

<a href="https://es.wikipedia.org/wiki/Plataforma_Java">https://es.wikipedia.org/wiki/Plataforma_Java</a>