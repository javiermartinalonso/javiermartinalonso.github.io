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

# Angular CLI (Command Line Interface)#

Es un intérprete de línea de comandos de Angular 2 que te facilitará el inicio y desarrollo de proyectos, ocupándose de la **creación del esqueleto, o scaffolding**, de la mayoría de los componentes de una aplicación Angular.

**Facilita los flujos de desarrollo, depuración, testing o deploy**...  Durante la etapa de producción o testing también nos ayudará, permitiendo preparar los archivos que deben ser subidos al servidor, ***transpilar*** las fuentes, etc.
<!--more-->

Angular CLI no es una herramienta de terceros, sino que nos la ofrece el propio equipo de Angular.

## Requisitos previos ##

- Un conocimiento básico de terminal y la ***línea de comandos***
- ***[NodeJS](https://nodejs.org "NodeJS")*** y ***NPM [instalados]({{ site.baseurl }}angular/2016/12/06/angular-node-js-y-npm-instalacion.html)
 (se incluye en la instalacion de NodeJS)***

## Instalar Angular CLI ##

Esto lo conseguimos desde el terminal, lanzando el comando:

    npm install -g angular-cli

Durante el proceso de instalación se instalará el propio Angular CLI junto con todas sus dependencias. La instalación puede tardar varios minutos dependiendo de la velocidad de tu conexión a Internet. Entre las **[dependencias](https://david-dm.org/angular/angular-cli "dependencias")**, puedes ver alguna interesante como ***less*** (para minimificación), ***webpack*** (empaquetado, compilación ...), ***karma*** (para test unitarios)

Una vez instalado dispondrás del comando ***"ng"*** a partir del cual lanzarás cualquiera de las acciones que se pueden hacer mediante la interfaz de comandos de Angular. Puedes comenzar lanzando el comando de ayuda:

    ng --help

> **Nota**: ng (que se lee "enyi") es el apelativo familiar de "Angular" que se conoce desde el inicio del framework.
> También encontrarás una excelente ayuda si entras en la página de [Angular CLI](https://cli.angular.io/ "Angular-CLI"), navegando por sus secciones, o bien en el propio repositorio de [GitHub angular-cli](https://github.com/angular/angular-cli "GitHub angular-cli").

Crear el esqueleto de una aplicación Angular 2
Uno de los comandos que puedes lanzar con Angular CLI es el de creación de un nuevo proyecto Angular 2. Este comando se ejecuta mediante ***"new"***, seguido del nombre del proyecto que queramos crear.

    ng new hola-mundo

Lanzado este comando se creará una carpeta igual que el nombre del proyecto indicado y dentro de ella se generarán una serie de subcarpetas y archivos.

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/estructura-carpetas-prototipo.png" class="img-thumbnail" alt="estructura carpetas proyecto nuevo."/>
</div>

Además, como hemos dicho, se instalarán y se configurarán en el proyecto una gran cantidad de herramientas útiles para la etapa del desarrollo front-end. De hecho, gran cantidad de los directorios y archivos generados al crear un nuevo proyecto son necesarios para que estas herramientas funcionen. Entre otras cosas tendremos:

- Un servidor para servir el proyecto por HTTP
- Un sistema de live-reload, para que cuando cambiamos archivos de la aplicación se refresque el navegador
- Herramientas para testing
- Herramientas para despliegue del proyecto
- Etc.

## Lanzar el proyecto desde un servidor web ##

Angular CLI lleva integrado un servidor web, lo que quiere decir que podemos visualizar y usar el proyecto sin necesidad de cualquier otro software. Para servir la aplicación lanzamos el comando "serve".

    ng serve

Eso lanzará el servidor web y lo pondrá en marcha. Además, en el terminal verás como salida del comando la ruta donde el servidor está funcionando. Generalmente será algo como esto (pero te sugerimos verificar el puerto en la salida de tu terminal):

    http://localhost:4200/

En la siguiente imagen puedes ver la salida del terminal .

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/consola-ng-serve.png" class="img-thumbnail" alt="estructura carpetas proyecto nuevo."/>
</div>

Podrías modificar el puerto si lo deseas, simplemente con la opción --port:

    ng serve --port 4201

Angular CLI tiene mucho más

En esta pequeña introducción solo te hemos explicado cómo iniciar un nuevo proyecto de Angular 2 y cómo servirlo después por medio del comando serve. Pero lo cierto es que detrás de Angular CLI hay muchas otras **[instrucciones](https://cli.angular.io/reference.pdf "instrucciones")** de gran utilidad. Principalmente, como hemos comentado, encontrarás una gran cantidad de comandos que permiten crear el esqueleto de componentes, directivas, servicios, etc.

## Ficheros fuente: ##

[ver fuente del ejemplo](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")

[https://cli.angular.io/](https://cli.angular.io/ "https://cli.angular.io/")

[https://github.com/angular/angular-cli](https://github.com/angular/angular-cli "https://github.com/angular/angular-cli")