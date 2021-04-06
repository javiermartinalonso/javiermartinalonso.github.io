---
layout: post
sections: [docker]
title:  "Generación de datos para pruebas"
date:   2016-11-09
desc: "Muchas veces para hacer pruebas en diferentes bases de datos necesitamos crear o usar una base de datos para pruebas, ya sea para consultas sql, generar informes o probar el acceso de aplicaciones y presentación.

Aquí se detallan algunas posibilidades de bases de datos open source y de paginas que nos generan conjuntos de datos aleatorios para alimentar nuestros repositorios de datos."
keywords: "bases de datos , bases de datos para pruebas , database sample , posgresql ejemplos de bases de datos , postgresql bases de datos , postgresql database example , sql"
categories: [arquitectura]
tags: [bases_de_datos, bases_de_datos_para_pruebas,sql]
icon: fas fa-university
image: static/img/blog/bbdd/bbdd-logo.png
---

# Generación de datos para pruebas #

Muchas veces para hacer pruebas en diferentes bases de datos necesitamos crear o usar una base de datos para pruebas, ya sea para consultas sql, generar informes o probar el acceso de aplicaciones y presentación.

Aquí se detallan algunas posibilidades de bases de datos open source y de paginas que nos generan conjuntos de datos aleatorios para alimentar nuestros repositorios de datos.


## Bases de datos de ejemplo ##

Aquí se detallan algunas posibilidades de bases de datos open source:

- Para ***PosgresSQL*** se pueden encontrar ejemplos específicos en pgfoundry.org en el siguiente enlace: [http://pgfoundry.org/projects/dbsamples/](http://pgfoundry.org/projects/dbsamples/ "http://pgfoundry.org/projects/dbsamples/")

	- Ejemplos de bases de datos:
		- world
		- dellstore2
		- usda
		- iso-3166
		- pagila
		- french-towns-communes-francais.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/bbdd/postgresql-ejemplos-bbdd.png" alt="job" class="img-thumbnail" style="width: 90%"/>
</div>

- Para ***MySQL*** se pueden encontrar ejemplos específicos en la documentación oficial de MySQL en el enlace: [http://dev.mysql.com/doc/index-other.html](http://dev.mysql.com/doc/index-other.html "http://dev.mysql.com/doc/index-other.html")

	- Ejemplos de bases de datos:
		- employee data
		- world database 
		- sakila database
		- menagerie database

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/bbdd/mysql-ejemplos-bbdd.png" alt="job" class="img-thumbnail" style="width: 90%"/>
</div>

## Generadores de datos ##

A continuación pongo una lista de herramientas on-line para realizar la generación de datos para pruebas:

- [GenerateData](http://www.generatedata.com/ "http://www.generatedata.com/"): Se trata de una herramienta web, limitado a generar 200 registros.


- [Mockaroo](http://www.mockaroo.com/ "http://www.mockaroo.com/"): Se trata de una herramienta web que le permite generar hasta 1.000 filas de datos de prueba realistas en formatos CSV, JSON, SQL y Excel.


## Referencias ##

[http://pgfoundry.org/projects/dbsamples/](http://pgfoundry.org/projects/dbsamples/ "http://pgfoundry.org/projects/dbsamples/")

[http://dev.mysql.com/doc/index-other.html](http://dev.mysql.com/doc/index-other.html "http://dev.mysql.com/doc/index-other.html")

[http://www.generatedata.com/](http://www.generatedata.com/ "http://www.generatedata.com/")

[http://www.mockaroo.com/](http://www.mockaroo.com/ "http://www.mockaroo.com/")