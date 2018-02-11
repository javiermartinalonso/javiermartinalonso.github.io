---
layout: post
section: "Angular"
title:  "Angular CLI"
date:   2016-12-09
desc: "Angular CLI: Es un intérprete de línea de comandos de Angular 2 que te facilitará el inicio y desarrollo de proyectos, ocupándose de la **creación del esqueleto, o scaffolding**, de la mayoría de los componentes de una aplicación Angular."
keywords: "node.js,npm,angular-cli,Karma,Angular,less,webpack"
categories: [Angular]
tags: [node.js,npm,angular-cli,Karma,Angular,less,webpack]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

https://angular.io/docs/ts/latest/guide/lifecycle-hooks.html

http://learnangular2.com/lifecycle/


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