---
layout: post
section: "maven"
title:  "maven tips"
date:   2018-02-15
desc: ""
keywords: ""
categories: []
tags: []
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---


http://www.notodocodigo.com/blog/tutorial-maven/


https://www.adictosaltrabajo.com/tutoriales/maven/
http://www.notodocodigo.com/maven/principales-comandos/
http://www.chuidiang.org/java/herramientas/maven.php
https://www.ibm.com/developerworks/ssa/library/j-5things16/index.html
http://maven.apache.org/plugins-archives/maven-surefire-plugin-2.12.4/examples/skipping-test.html




http://tirandolineasdecodigo.blogspot.com.es/2011/07/comandos-de-maven.html

Comandos de maven
Hoy vamos a explicar un poco más maven, en esta entrada vamos a explicar los comandos mas utilizado de maven para gestionar nuestro proyectos java.

mvn validate : nos valida nuestro proyecto
mvn clean :  elimina la carpeta target de nuesto proyecto
mvn compile : compila nuestra codigo fuente java
mvn test : nos ejecuta los test de nuestro proyecto
mvn site :  nos genera la documentacion de nuestro proyecto pmd, javadoc, etc.. 
mvn package :  nos genera jar o war de nuestro proyecto
mvn install :  nos instala nuestro proyecto en nuestro repositorio local
mvn deploy :  nos instala nuestro proyecto en un repositorio remoto

Estos son lo comandos más utilizados.













Saltar las pruebas en la construccion.

  	<properties>
  		<java.version>1.8</java.version>
  		
  		<project.build.skipTest>true</project.build.skipTest>
  		
    </properties>

includes y excludes en la construccion

https://maven.apache.org/plugins/maven-resources-plugin/examples/include-exclude.html


## Referencias ##


http://www.notodocodigo.com/maven/
