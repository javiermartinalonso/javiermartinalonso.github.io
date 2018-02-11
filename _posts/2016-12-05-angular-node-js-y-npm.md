---
layout: post
sections: [Angular]
title:  "NodeJs y NPM"
date:   2016-12-05
desc: "Información sobre NodeJs y NPM y como instalarlos "
keywords: "node.js,npm,AngularJS, Angular"
categories: [angular]
tags: [node.js,npm,AngularJS,Angular]
icon: fab fa-angular
image: static/img/blog/angular/angular-logo_150.png
---

# NodeJs y npm #

**Node.js®** Node.js® es un entorno de ejecución para JavaScript construido con el motor de JavaScript V8 de Chrome. Node.js usa un modelo de operaciones E/S sin bloqueo y **orientado a eventos asíncronos**, que lo hace liviano y eficiente y que nos permite **construir aplicaciones altamente escalables**.

Dada la capacidad de procesamiento asíncrono es una herramienta ideal para generar **sistemas que respondan en tiempo real**. Y por su escasa demanda de hardware **se usa también en proyectos de Internet of Things**.

**El ecosistema de paquetes de Node.js, npm**, es el ecosistema mas grande de librerías de código abierto en el mundo.

**Node.js** y **NPM** son esenciales para el desarrollo de webs modernas con plataformas angular o similares. **Node.js** provee de herramientas de desarollo. **NPM package manager**, es en sí mismo una aplicación construida con **Node.js**, y te ayuda a instalar bibliotecas de JavaScript.

Todo esto está muy bien, es lo que nos dice la documentación oficial, pero ...

## Entonces ¿que és node realmente? ##
<!--more-->
Hemos dicho que la meta número uno declarada de Node es ***"proporcionar una manera fácil para construir programas de red escalables"***.

En telecomunicaciones y en ingeniería informática, la **escalabilidad** es la propiedad deseable de un sistema, una red o un proceso, que indica su habilidad para reaccionar y adaptarse sin perder calidad, o bien manejar el crecimiento continuo de trabajo de manera fluida, o bien para estar preparado para hacerse más grande sin perder calidad en los servicios ofrecidos.

> ¿Cuál es el problema con los programas de servidor actuales? Hagamos cuentas. En lenguajes como Java™ y PHP, cada conexión genera un nuevo hilo que potencialmente viene acompañado de 2 MB de memoria. En un sistema que tiene 8 GB de RAM, esto da un número máximo teórico de conexiones concurrentes de cerca de 4.000 usuarios. A medida que crece su base de clientes, si usted desea que su aplicación soporte más usuarios, necesitará agregar más y más servidores. Desde luego, esto suma en cuanto a los costos de servidor del negocio, a los costos de tráfico, los costos laborales, y más. Además de estos costos están los costos por los problemas técnicos potenciales — un usuario puede estar usando diferentes servidores para cada solicitud, así que cualquier recurso compartido debe almacenarse en todos los servidores. Por todas estas razones, el cuello de botella en toda la arquitectura de aplicación Web (incluyendo el rendimiento del tráfico, la velocidad de procesador y la velocidad de memoria) era el número máximo de conexiones concurrentes que podía manejar un servidor.

Node resuelve este problema cambiando la forma en que se realiza una conexión con el servidor. En lugar de generar un nuevo hilo de OS para cada conexión (y de asignarle la memoria acompañante), cada conexión **dispara una ejecución de evento dentro del proceso del motor de Node**. Node también afirma que nunca se quedará en punto muerto, porque no se permiten bloqueos y porque no se bloquea directamente para llamados E/S. Node afirma que un servidor que lo ejecute puede soportar decenas de miles de conexiones concurrentes.

**Programación orientada por eventos**

A muchos programadores se les ha hecho creer que la programación orientada a objetos es el diseño perfecto de programación y que no deben usar nada más. Node utiliza lo que se conoce como modelo de programación orientado por eventos.

**Listado 1. Programación orientada por eventos del lado del cliente con jQuery**

    // jQuery code on the client-side showing how Event-Driven programming works
    
    // When a button is pressed, an Event occurs - deal with it
    // directly right here in an anonymous function, where all the
    // necessary variables are present and can be referenced directly
    $("#myButton").click(function(){
     if ($("#myTextField").val() != $(this).val())
     alert("Field must match button text");
    });

El lado del servidor realmente no es tan diferente del lado del cliente. Es verdad, no se están presionando botones, y no se está ingresando texto en campos, pero a un nivel superior, están sucediendo eventos. Se realiza una conexión — ¡evento! Se reciben datos a través de la conexión — ¡evento! Se dejan de recibir datos por la conexión — ¡evento!
¿Por qué este tipo de configuración es ideal para Node? JavaScript es un gran lenguaje para programación orientada por eventos, porque permite funciones y cierres anónimos, y más importante, la sintaxis es similar para casi cualquier persona que haya codificado. las funciones de devolución de llamado que se llaman cuando ocurre un evento pueden escribirse en el mismo punto en el que usted captura el evento. Fácil de codificar, fácil de mantener. No hay infraestructuras complicadas Orientadas a Objeto, no hay interfaces, no hay potencial para sobre-arquitectura de nada. Simplemente esperar por un evento, escribir una función de devolución de llamado, ¡y se ha resuelto todo!

## ¿qué puede usted construir en realidad con Node? ##

Como ha visto hasta ahora, Node está extremadamente bien diseñado para situaciones en que usted esté esperando una gran cantidad de tráfico y donde la lógica del lado del servidor y el procesamiento requeridos, no sean necesariamente grandes antes de responder al cliente. Aquí hay algunos buenos ejemplos en donde Node haría un gran trabajo:

- **Una API RESTful**

	Un servicio Web que proporcione una API RESTful toma algunos parámetros, los interpreta, arma una respuesta y descarga esa respuesta (usualmente una cantidad relativamente pequeña de texto) de vuelta al usuario. Esta es una situación ideal para Node, porque puede construirse para que maneje decenas de miles de conexiones. Tampoco requiere una gran cantidad de lógica y básicamente sólo busca valores de una base de datos y los reúne como una respuesta. Como la respuesta es una pequeña cantidad de texto y la solicitud entrante es una pequeña cantidad de texto, el volumen de tráfico no es alto, y una máquina probablemente puede manejar las demandas de API de incluso la API de la más ocupada de las empresas.

- **Fila de Twitter**

	Piense en una compañía como Twitter que recibe tweets y los escribe en una base de datos. Literalmente hay miles de tweets llegando cada segundo y la base de datos posiblemente no puede seguir el ritmo del número de escrituras necesarias durante los horarios pico de uso. Node se convierte en una pieza clave de la solución a este problema. Como hemos visto, Node puede manejar decenas de miles de tweets entrantes. Luego puede escribirlos rápida/fácilmente en un mecanismo de cola en memoria (memcached, por ejemplo), desde donde otro proceso separado puede escribirlos en la base de datos. El rol de Node en esto es reunir rápidamente el tweet y pasar esta información hacia otro proceso responsable de escribirlo. Imagine otro diseño — un servidor PHP normal que intente manejar escrituras en la base de datos misma — cada tweet podría causar una pequeña demora mientras se escribe en la base de datos, dado que el llamado de base de datos estaría bloqueando. Una máquina con este diseño sólo podría manejar 2.000 tweets entrantes por segundo, debido a la latencia de base de datos. A un millón de tweets por segundo, usted estaría hablando de 500 servidores. Node, en cambio, maneja cada conexión y no causa bloqueo, permitiéndole capturar tantos tweets como se le puedan arrojar. Una máquina nodo capaz de manejar 50.000 tweets por segundo, y usted estaría hablando de sólo 20 servidores.

- **Estadísticas de videojuegos**

	Si usted alguna vez jugó un juego como Call of Duty on-line, algunas cosas le habrán llamado la atención inmediatamente cuando observó las estadísticas del juego, principalmente el hecho de que deben estar rastreando toneladas de información sobre el juego para poder producir tal nivel de estadísticas. Luego, multiplique esto por los millones de personas que lo juegan en cualquier momento, y tendrá una idea de la inmensa cantidad de información que se genera con bastante rapidez. Node es una buena solución para este escenario, porque puede capturar los datos que están generando los juegos, hacer un mínimo de consolidación con ellos y luego ponerlos en una fila para escribirlos en una base de datos. Parecería algo tonto dedicar todo un servidor a rastrear cuántas balas disparan las personas en los juegos, lo cual podría ser el límite útil si usted utilizara un servidor como Apache, pero parecería menos tonto si en lugar de ello usted pudiera dedicar un solo servidor a rastrear casi todas las estadísticas de un juego, como usted puede llegar a hacerlo con un servidor que ejecute Node.

## Referencias ##

[https://www.ibm.com/developerworks/ssa/opensource/library/os-nodejs/](https://www.ibm.com/developerworks/ssa/opensource/library/os-nodejs/)