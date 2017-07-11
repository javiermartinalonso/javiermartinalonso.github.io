---
layout: post
section: "Spring"
title:  "Spring-Boot"
date:   2017-01-02
desc: "Spring-boot establece un estándar en el diseño de aplicaciones basadas en spring de modo que estén listas para ponerse en funcionamiento tan pronto como sea posible, además ayuda durante la fase de desarrollo e incluso con la integración en producción."
keywords: "Spring, Spring-Boot"
categories: [spring]
tags: [Spring, Spring-Boot]
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---

**[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** es un sub-proyecto de Spring. Establece un estándar en el diseño de aplicaciones basadas en **[spring](https://spring.io/projects "spring")** de modo que estén **listas para ponerse en funcionamiento tan pronto como sea posible (out of the box)**.

Se posiciona en la capa superior del framework **[spring](https://spring.io/projects "spring")**. Sigue el patrón **Convención sobre Configuración (Convention-Over-Configuration)** permitiendo al desarrollador enfocarse en el desarrollo de la aplicación, y eliminando la necesidad de estar preocupado con todos los demás aspectos de su ciclo de vida, incluyendo el despliegue y la gestión. 

<!-- more -->

> **Convención sobre Configuración (Convention-Over-Configuration)** , también conocido como **CoC** es un paradigma de programación de software que busca minimizar el número de decisiones que un desarrollador necesita hacer, ganando así en simplicidad pero no perdiendo flexibilidad por ello.

En resumen **[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** busca facilitarnos la creación de proyectos con el framework **[spring](https://spring.io/projects "spring")** eliminando la necesidad de crear largos archivos de configuración xml, provee configuraciones por defecto para **[spring](https://spring.io/projects "spring")** y otra gran cantidad de librerías, además provee un modelo de programación parecido a las aplicaciones java tradicionales que se inician en el método main.

Además moderniza la forma de trabajar con ***[spring](https://spring.io/projects "spring")*** asemejandose a la forma en la que los frameworks más modernos gestionan sus dependencias en un único punto, proveen del ***scaffolding*** necesario para empezar a trabajar rápidamente, permiten mecanismos para un desarrollo agil, orientado a microservicios, etc.

> ¿Quién no ha necesitado alguna vez? al desarrollar, incorporar en el mismo proyecto diferentes jars o módulos de terceros, por ejemplo librerías de ***spring-rest, spring-data, JPA, hibernate, driver de bbdd*** y si no tienes una lista de versiones compatibles, a la hora de construir o incluso durante la ejecución de la aplicación se producen errores extrañísimos de dependencias y nos vemos obligados a pasar horas buscando las versiones correctas a usar.
> 
> **Pues estos problemas con [Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot") se reducen hasta casi desaparecer.**

## Objetivos de Spring Boot ##

Los objetivos de **[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** son:

- Proveer una ***forma muy sencilla de arrancar desarrollos [spring](https://spring.io/projects "spring")***.

- Ofrecer funcionalidad ***out-of-the-box (listo para usarse)*** pero permitir incorporar las peculiaridades del proyecto.

- Proporcionar una serie de características no funcionales comunes a los proyectos (por ejemplo: ***herramientas de ayuda al desarrollo como servidores embebidos, depuración remota, devtools y live reload y herramientas de producción enfocadas a la seguridad, métricas y monitorización de servicios, auditorias, configuración externalizada***).

- ***No necesitar generación código ni configuración XML***.

## Referencias ##

[https://projects.spring.io/spring-boot/](https://projects.spring.io/spring-boot/ "https://projects.spring.io/spring-boot/")

[spring-boot-reference.pdf](http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf "spring-boot-reference.pdf")