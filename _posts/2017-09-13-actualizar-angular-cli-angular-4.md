---
layout: post
section: "Angular"
title:  "Proceso de actualización de Angular CLI para usar angular 4"
date:   2017-09-13
desc: "Con la aparición de Angular 4, debemos actualizar la instalación de Angular CLI. Aquí veremos en unos pequeños pasos como realizar esta tarea."
keywords: "node.js,npm,angular-cli,Angular-4"
categories: [angular]
tags: [node.js,npm,angular-cli,Angular-4]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

En el artículo [Angular CLI]({{ site.baseurl }}angular/2016/12/09/angular-cli.html) vimos como instalar [el cliente de angular](https://cli.angular.io/ "Angular-CLI"). Con la aparición de ***Angular 4***, debemos actualizar esta instalación.

> ATENCIÓN: Si utiliza `CLI angular 1.0.0-beta.28` o menos, debe desinstalar el paquete angular-cli. Debe hacerse debido al cambio del nombre y del alcance del paquete de `angular-cli` a `@angular/cli`.
> <!--more-->
> Recuerde realizar las siguientes operaciones con perfil de administrador.

## 1. Desinstalar el paquete clásico de Angular CLI ##

    npm uninstall -g angular-cli
    npm uninstall --save-dev angular-cli

## 2. Desinstalar el paquete nuevo de Angular CLI (por si acaso) ##

    npm uninstall -g @angular/cli

## 3. Vaciar la caché del gestor de paquetes npm ##

    npm cache clean

## 4. Instalar la última versión de Angular CLI ##
 
Para actualizar ***Angular CLI*** a una nueva versión, debe actualizar tanto el paquete global como el paquete local de su proyecto.

- Paquete global:

	    npm install -g @angular/cli@latest

- Paquete de proyectos locales:

	    rm -rf node_modules dist 
		# use rmdir /S/Q node_modules dist in Windows Command Prompt; use rm -r -fo node_modules,dist in Windows PowerShell
	    npm install --save-dev @angular/cli@latest
	    npm install

## 5 . Probar que la instalación es correcta. ##

### Generar un proyecto Angular 4 ###

Ahora ya tenemos actualizado ***Angular CLI*** y ya podemos generar un nuevo proyecto de ***Angular 4***

    ng new mi-fabulosa-app

### Lanzar el proyecto desde un servidor web ###

**Angular CLI** lleva integrado un servidor web, lo que quiere decir que podemos visualizar y usar el proyecto sin necesidad de cualquier otro software. Para servir la aplicación lanzamos el comando **"serve"**.

    cd mi-fabulosa-app
    ng serve

Eso lanzará el servidor web y lo pondrá en marcha. 

Además, en el terminal verás como salida del comando la ruta donde el servidor está funcionando. Generalmente será algo como esto (pero te sugerimos verificar el puerto en la salida de tu terminal):

    ** NG Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/new-app-angular-4.png" class="img-thumbnail" alt="app-works"/>
</div>

## Referencias ##

[https://github.com/angular/angular-cli](https://github.com/angular/angular-cli "https://github.com/angular/angular-cli")

[https://cli.angular.io/](https://cli.angular.io/ "https://cli.angular.io/")