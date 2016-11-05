---
layout: post
section: "JAVA"
title:  "Primeros Pasos con Java (2 de 2)"
date:   2016-11-05
desc: "Primeros Pasos con Java (2 de 2)"
keywords: "java,JDK,JVM,JRE,IDE, Java SE,JavaFX,Java EE,Java ME"
categories: [java]
tags: [java,JDK,JVM,JRE,IDE, Java SE,JavaFX,Java EE,Java ME]
icon: icon-java-bold
---

# Primeros pasos con Java (2 de 2)

## ¿Que necesitamos para programar con Java?

Con ***descargarnos e instalar el JDK de java***, tenemos todo lo necesario para empezar a programar en java, basta con buscar en
Google ***"download java jdk"***. Esto te llevará a la página principal de descarga del JDK en el sitio de Oracle. elegir la distribución de JDK que necesitamos según el sistema en el que vamos a trabajar. Al instalar el JDK, también instalaremos la ***JVM***. Y para simplificar el trabajo del día a día deberíamos usar un ***IDE de desarrollo***. Veamos estos conceptos en detalle.

### 1. Java JDK (Java Development Kit)
	
***Java Development Kit o (JDK)***, es un software que provee herramientas de desarrollo para la creación de programas en Java.

### 2. JVM (Java Virtual Machine)

Java no genera código ejecutable sino que utiliza una ***máquina virtual Java*** denominada la **Java Virtual Machine (JVM)**, lo que implica que el código generado tiene una representación intermedia llamada **bytecode Java o codigo binario de Java**.

**El código binario de Java** no es un lenguaje de alto nivel, sino un verdadero código máquina de bajo nivel, viable incluso como lenguaje de entrada para un microprocesador físico.

La ***máquina virtual Java*** es una máquina virtual de proceso nativo, es decir, ejecutable en una plataforma específica, capaz de interpretar y ejecutar instrucciones expresadas en un código binario especial ***(el bytecode Java***), el cual es generado por el compilador del lenguaje Java.

La **JVM** es una de las piezas fundamentales de la plataforma Java. Básicamente se sitúa en un nivel superior al hardware del sistema sobre el que se pretende ejecutar la aplicación, y este actúa como un puente que entiende tanto el bytecode como el sistema sobre el que se pretende ejecutar.

Esta arquitectura permite que las aplicaciones de Java no estén obligatoriamente atadas al sistema operativo en el que se construyen y así un programa desarrollado en Windows puede ser ejecutado en Linux, Mac o Unix y viceversa.

<div style="text-align: center;">
	<img src="/static/img/blog/java/Java-jvm.png" alt="Esquema de la arquitectura general de un programa en ejecución en una Máquina Virtual Java." style="width: 90%">
</div>

Esta forma de hacer las cosas no hace de Java un lenguaje lento, de hecho las implementaciones de la **JVM** incluyen compiladores **Just in Time (JIT)** que se encargan de optimizar el código para la plataforma en la que se está ejecutando. La **JVM** es una especificación por cuanto pueden existir varias implementaciones. La más utilizada es la oficial distribuida por ORACLE aunque existen otras como el OpenJDK, Apache Harmony, entre otras. En el mismo equipo pueden convivir varias JVM y ser ejecutadas al mismo tiempo.

### 3. IDE (Integrated Development Environment)

En español: ***Entorno de Desarrollo Integrado***. Es una herramienta que te hará la vida como programador más fácil, te ayudará a crear un proyecto desde plantillas, compilar, refactorizar, etc. Te recomiendo usar ***Eclipse***, o si vas a usar el framework de java Spring, su id basado en eclipse ***Spring Tool Suite***.


## Articulos relacionados

[Primeros Pasos con Java (1 de 2)](https://javiermartinalonso.github.io/java/2016/11/05/java-Primeros-Pasos-1.html "Primeros Pasos con Java (1 de 2)")

## Referencias
<a href="http://www.oracle.com/technetwork/es/java/index.html">http://www.oracle.com/technetwork/es/java/index.html</a>

<a href="https://es.wikipedia.org/wiki/M%C3%A1quina_virtual_Java">https://es.wikipedia.org/wiki/Máquina\_virtual\_Java</a>

<a href="https://es.wikipedia.org/wiki/Java_(lenguaje_de_programaci%C3%B3n)">https://es.wikipedia.org/wiki/Java_(lenguaje\_de\_programación)</a>
