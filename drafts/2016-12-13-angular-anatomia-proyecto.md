---
layout: post
section: "Angular"
title:  "Anatomía de un proyecto Angular"
date:   2016-12-20
desc: "En este post revisaremos el esqueleto, o scaffolding de un aplicación angular."
keywords: "node.js,npm,angular-cli,Karma,Angular,less,webpack"
categories: [Angular]
tags: [node.js,npm,angular-cli,Karma,Angular,less,webpack]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---


http://academia-binaria.com/hola-mundo-en-angular-2/

https://www.youtube.com/watch?v=Y7izsxhPpQY&feature=youtu.be

http://www.desarrolloweb.com/articulos/analisis-carpetas-proyecto-angular2.html

https://angular.io/docs/ts/latest/guide/setup-systemjs-anatomy.html

https://angular.io/docs/ts/latest/guide/setup.html




## Guía ##

- src\index.html : Página raíz que contiene al componente raíz <app-root>
- src\main.ts : Fichero de arranque de la aplicación que configura y carga el módulo ráiz AppModule.
- src\app\app.module.ts : Declaración del módulo raíz y sus dependencias. Exponen al AppComponent para el bootstraping de la aplicación
- src\app\app.component.ts : Componente raíz app-root
- src\app\app-routing.component.ts : Se usará para definir rutas en aplicaciones SPA
- src\app\index.ts : Fichero índice de una carpeta, para facilitar la importación de otros ficheros

## CLI ##

- angular-cli.json : Configuracíon del CLI
- package.json : Rependencias y scripts
- tslint.json : Reglas para código limpio
- .editorconfig : Configuración para el editor


## Ficheros fuente: ##

[ver fuente del ejemplo](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")

[https://cli.angular.io/](https://cli.angular.io/ "https://cli.angular.io/")

[https://github.com/angular/angular-cli](https://github.com/angular/angular-cli "https://github.com/angular/angular-cli")