---
layout: post
section: "JAVA"
title:  "Primeros Pasos con Java (1 de 2)"
date:   2016-11-05
desc: "Primeros Pasos con Java (1 de 2)"
keywords: "java,JDK,JVM,JRE,IDE, Java SE,JavaFX,Java EE,Java ME"
categories: [java]
tags: [java,JDK,JVM,JRE,IDE, Java SE,JavaFX,Java EE,Java ME]
icon: icon-java-bold
image: static/img/blog/java/LOGO-Java.png
---

# Primeros pasos con Java (1 de 2)

## ¿Qué es Java?

Java es un lenguaje de programación de propósito general, concurrente, orientado a objetos. Su intención es permitir que los desarrolladores de aplicaciones escriban el programa una vez y lo ejecuten en cualquier dispositivo.

Pero cuando nos referimos a java no nos referimos sólo a un lenguaje de programación sino a **la plataforma Java** que es el nombre de un entorno o plataforma de computación originaria de Sun Microsystems, capaz de ejecutar aplicaciones desarrolladas usando el lenguaje de programación Java u otros lenguajes que compilen a bytecode y un conjunto de herramientas de desarrollo. La plataforma no es un hardware específico o un sistema operativo, sino más bien una máquina virtual encargada de la ejecución de las aplicaciones, y un conjunto de bibliotecas estándar que ofrecen una funcionalidad común.

<div style="text-align: center;">
	<img src="/static/img/blog/java/diagrama-conceptual-java.png" class="img-thumbnail" alt="Diagrama conceptual Java."/>
</div>

<!--more-->
## Ediciones de la plataforma Java

La configuración de una plataforma Java afecta fundamentalmente a los servicios que esta ofrece, las herramientas adicionales que incorpora y también a aspectos menos visibles, como el modo de funcionamiento de la JVM. De acuerdo a la documentación actual de Oracle **podemos distinguir las siguientes cuatro plataformas Java**:

- **Java SE**: la conocida como **Standard Edition** es la edición más difundida de la plataforma Java. Incorpora los elementos necesarios para crear aplicaciones de escritorio con o sin interfaz gráfica de usuario, acceso al sistema de archivos, comunicación a través de redes, concurrencia y otros servicios básicos.

- **JavaFX**: originalmente JavaFX era una alternativa a Java SE para el desarrollo de proyectos de tipo RIA (Rich Internet Applications), con un núcleo más ligero y fácil de distribuir, capacidad de aceleración 3D aprovechando la GPU, servicios avanzados para producción de gráficos y animaciones, y un mecanismo simplificado para el diseño de interfaces de usuario. JavaFX forma parte de Java SE desde la versión 7 de dicha edición de la plataforma.

- **Java EE**: es la **Enterprise Edition** de la plataforma Java, dirigida al desarrollo de soluciones software que se ejecutarán en un servidor de aplicaciones. A las capacidades de Java SE, la edición EE agrega servicios para gestionar la persistencia de objetos en bases de datos, hacer posible la invocación remota de métodos, crear aplicaciones con interfaz de usuario web, etc.

- **Java ME**: esta edición de la plataforma, **Micro Edition**, está enfocada a la creación de programas que se ejecutarán en sistemas con recursos limitados, tales como teléfonos móviles, electrodomésticos y dispositivos de domótica o equipos para entornos empotrados como la Rasperry Pi y similares.

<div style="text-align: center;">
	<img src="/static/img/blog/java/ediciones_java.png" class="img-thumbnail" alt="Diagrama conceptual Java."/>
</div>

> **Nota**: ***Java SE, EE, ME, la JVM y otras partes de Java*** son en realidad especificaciones abstractas de los servicios y modos de funcionamiento de los distintos elementos de la plataforma. Encontraremos múltiples implementaciones de dichas especificaciones. Por ejemplo, HotSpot es la implementación de Oracle de la JVM, existiendo implementaciones alternativas de esa misma especificación como la de OpenJDK o la de IBM.

## Articulos relacionados

[Primeros Pasos con Java (2 de 2)](https://javiermartinalonso.github.io/java/2016/11/05/java-Primeros-Pasos-2.html "Primeros Pasos con Java (2 de 2)")

## Referencias
<a href="http://www.oracle.com/technetwork/es/java/index.html">http://www.oracle.com/technetwork/es/java/index.html</a>

<a href="https://es.wikipedia.org/wiki/Java_(lenguaje_de_programaci%C3%B3n)">https://es.wikipedia.org/wiki/Java_(lenguaje\_de\_programación)</a>

<a href="https://es.wikipedia.org/wiki/Plataforma_Java">https://es.wikipedia.org/wiki/Plataforma\_Java</a>