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
image: static/img/blog/java/LOGO-Java.png
---

# Instalación JDK

Antes de empezar con la explicación de la instalación del JDK de java, me gustaría aclarar un par de conceptos que suelen confundir a los neófitos de java.

## Que son JRE y JDK y sus diferencias

- **Java Runtime Enviroment (JRE)** **incluye una implementación de la JVM**, librerías y el conjunto de software necesario para ejecutar las aplicaciones cliente de Java, al igual que el plugin para que los navegadores de internet ***(browser)*** ejecuten código especial de Java llamado ***“applet”***.

- **Java Development Kit (JDK)** está dirigido a desarrolladores, **incluye el JRE** y el conjunto de herramientas de línea de comandos necesario para compilar el código, empaquetarlo en archivos con extensión ***“JAR”***, generar documentación, entre otros. Es por esta razón por la que las herramientas de desarrollo requieren que el JDK se encuentre instalado.

## Instalar JDK

Debemos acudir a la página oficial de ORACLE para obtener la versión que deseamos instalar. A menudo resulta un poco complicado navegar por este tipo de ***"macrositios"***; te recomiendo ir por la vía rápida y buscar en Google ***"download java jdk"***. Esto te llevará a la página principal de descarga del JDK en el sito de Oracle.

<!--more-->

En la página oficial de ORACLE, encontrará dos opciones: **Download JDK** y **Download JRE**. Debido a que vamos a escribir código para luego compilarlo, es necesario descargar el JDK porque, como vimos, el JRE no incluye las herramientas necesarias.

Hay diferentes [ediciones de la plataforma Java](https://javiermartinalonso.github.io/java/2016/11/05/java-Primeros-Pasos-1.html "ediciones de la plataforma Java"), y hay que tener clara cuál es la edición que necesitamos según el tipo de producto que deseamos desarrollar.

<div style="text-align: center;">
	<img src="/static/img/blog/java/ediciones_java.png" class="img-thumbnail" alt="Diagrama conceptual Java.">
</div>

> **Pendiente incluir algún vídeo explicativo**

## Referencias
<a href="http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html">http://docs.oracle.com/javase/7/docs/webnotes/install/windows/jdk-installation-windows.html</a>

<a href="https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html">https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_jdk_install.html</a>