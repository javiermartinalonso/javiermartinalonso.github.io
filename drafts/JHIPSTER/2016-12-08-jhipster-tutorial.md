---
layout: post
section: "JHipster"
title:  "¿Qué es JHipster?"
date:   2016-12-08
desc: "Introducción y primeros pasos con JHipster"
keywords: "node.js,JHipster,YEOMAN, WEBPACK,Angular,Spring"
categories: [JHipster]
tags: [node.js,JHipster,YEOMAN, WEBPACK,Angular,Spring]
icon: fa-font
image: static/img/blog/JHipster/jhipster-logo.png
---

https://www.youtube.com/watch?v=WLRYF7R60LA

- lanzamos el wizard de jhipster

		yo jhipster
	
		jhipster

	
- respondemos las 15 preguntas para generar el scafolding del proyecto

- Definimos las entidades con JDL-Studio

- ejecutamos comando que importará el modelo en la aplicación

		yo jhipster:import-jdl [ruta-fichero.jh]

- creamos la bbdd

	- creamos el usuario
	- creamos la base de datos con el usurio anterior como propietario
	- configuracion del datasource desde la app
	
			aplication-dev.yml

	- arrancamos la app. (con el inicializador que viene en el propio paquete, es igual que maven pero ya viene preparado para jhipster)
		
			mvnw

	- arrancamos el servidor envevido

			yarn start

-----------------------








https://www.youtube.com/watch?v=LERTahPqVjo

desde el eclipse se puede instalar el pluging del jhipster

desde el eclipse se puede instalar el pluging de docker y generar las imágenes con la app.










== Referencias

http://www.jhipster.tech

http://www.jhipster.tech/tech-stack/