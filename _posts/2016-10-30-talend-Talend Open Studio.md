---
layout: post
section: "TALEND"
title:  "Talend Open Studio Data Integration"
date:   2016-10-30
desc: "Herramienta ETL para la migración e integración de datos"
keywords: "Talend,Talend Open Studio, herramienta, Integration"
categories: [talend]
tags: [Talend,Talend_Open_Studio,Integration]
icon: fas fa-exchange-alt
image: static/img/blog/talend/talend-logo.png
---

# Talend Open Studio Data Integration #

Talend Open Studio es una herramienta Open Source de integración y gestión de datos, así como integración de aplicaciones empresariales: en palabras simples una herramienta ETL.

Talend está basado en Java, requiere específicamente JDK 6 y por tanto puede ser ejecutado en Windows y Linux sin mayor dificultad, solo basta con descomprimir su ***‘instalador’***.

## Niveles de Talend ##

Talend basa su diseño en 3 niveles:

- **Business Models (Modelos de Negocios):** nivel diseñado para modelar de manera teórica la aplicación, para lo cual se realizan diagramas de flujo básicos con actores de los procesos.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/talend/bussines-dessigner.png" class="img-thumbnail" alt="Business Model Dessigner"/>
</div>

<!--more-->

- **Job Designs (Diseño de Trabajos):** el nivel mas interesante, en el cual se diseña el trabajo en sí, el código que será ejecutado.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/talend/job-dessigns.png" class="img-thumbnail" alt="Business Model Dessigner"/>
</div>

- **Contexts (Contextos):** el es nivel que contiene los contextos, los cuales pueden ser definidos como variables globales de ejecución del programa, como la carpeta donde se ejecutará la aplicación final o variables iniciales de entrada.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/talend/contexts.png" class="img-thumbnail" alt="Business Model Dessigner"/>
</div>

### Job Designs ###

Es el nivel empleado con mayor frecuencia en Talend Open Studio. Formado por el conjunto de Jobs, o tareas a realizar. Cada Job inicialmente de una grilla (grid) en blanco, donde se arrastran elementos de una paleta ubicada en la parte derecha del diseñador.

En dicha paleta se encuentran varios elementos configurables, llamados Subjobs, los cuales se encargan de ejecutar tareas predeterminadas pero configurables como conexiones, consultas, código personalizado, etc.

Dichos Subjobs se encuentran separados en la paleta en diversas categorías: ***BI, Cloud, Custom Code, Data Quality, ETL, Orchestation, System***, etcétera.

Algunos Subjobs que pueden resultar interesantes son:

- **Conexiones estandarizadas y personalizables a bases de datos**, incluye soporte a gran cantidad de las bases de datos Open Source (MySQL, PostgreSQL, SLQLite) e incluso Sybase y Oracle.

- **Ejecutores de consultas y procedimientos almacenados** en las mencionadas bases de datos.
Código Java personalizable.

- **Iteradores, repetidores de subtareas**.

- **Inscripción de variables globales**, muy usado para mantener una variable global, ya que los subjobs solo crean variables locales.

- **Extractores e insertores de datos de archivos** (xml, properties), también configurables.

- **Conexión a FTP** para envío y descarga de archivos.

- **Compresión de archivos.**

- **Modificadores de carpetas** (crear, eliminar, modificar).

- **Filtros de información.**

Los mencionados y varios otros elementos más se unen mediante un flujo secuencial, guiado por flechas extraídas de cada uno de ellos (visibles haciendo click derecho) que hacen referencias a eventos de dos clases:

- **row:** evento que transmite datos del elemento del que parte al elemento apuntado.

- **trigger:** conjunto de eve﻿ntos, activados por posibles modos de ejecución.

	- **OnSubjobOk:** cuando el elemento ha sido ejecutado sin errores.

	- **OnSubjobError:** cuando el elemento ha tenido algún error en la ejecución.

	- **otros eventos**, dependiendo del tipo de Subjob.

Adicionalmente, un Job puede contener a uno o varios Jobs e invocarlos como parte de un nuevo flujo, ejecutando los Subjobs contenidos dentro de cada uno.

Finalmente, cada Job es exportable a un archivo comprimido en formato ZIP, que contiene el ejecutable: un archivo .jar llamado a partir de un archivo .bat (para Windows) o un archivo .sh (Linux).

En resumen, podemos decir que Talend es una herramienta versátil para el proceso de ETL, con un buen entorno de desarrollo visual y múltiples conexiones a bases de datos  sin embargo tiene una curva de aprendizaje un poco elevada y un par de bugs pendientes por resolver.


## Referencias ##

[http://www.talend.com](http://www.talend.com "http://www.talend.com")

[https://es.wikipedia.org/wiki/Extract, transform and load](https://es.wikipedia.org/wiki/Extract,_transform_and_load "https://es.wikipedia.org/wiki/Extract, transform and load")

[https://www.talendforge.org/tutorials/menu.php](https://www.talendforge.org/tutorials/menu.php "https://www.talendforge.org/tutorials/menu.php")