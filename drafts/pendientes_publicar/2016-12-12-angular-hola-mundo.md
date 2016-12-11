---
layout: post
section: "Angular"
title:  "!!Hola Mundo!! con Angular"
date:   2016-12-12
desc: "Primeros Pasos con Angular"
keywords: "node.js,Angular,TypeScript"
categories: [Angular]
tags: [node.js,Angular,TypeScript]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

## Requisitos previos ##

- Un conocimiento básico de terminal y de ***línea de comandos***
- Conocimientos de ***HTML y CSS***
- Conocimientos de Javascript, concretamente ***JavaScript ES2015***.
- ***[NodeJS y NPM instalados]({{ site.baseurl }}angular/2016/12/06/angular-node-js-y-npm-instalacion.html)***
- Opcionalmente, pero muy aconsejable, tener instalado **[angular-cli]({{ site.baseurl }}angular/2016/12/09/angular-cli.html "angular-cli")**.

## !!Hola Mundo!! con Angular ##

Para generar la **creación del esqueleto, o scaffolding** de nuestra aplicación básica de angular de la que vamos a partir para generar nuestro **!!hola mundo!!**, puedes copiarte el ***[código fuente directamente](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")*** o puedes revisar un post anterior del blog donde explicamos como usar ***[angular-cli]({{ site.baseurl }}angular/2016/12/09/angular-cli.html "angular-cli")*** para crearlo.

## Lanzar el proyecto desde un servidor web ##

Para servir la aplicación lanzamos el comando **"serve"** desde linea de comandos en la ruta del proyecto .

    ng serve

Eso lanzará el servidor web y lo pondrá en marcha. Además, en el terminal verás como salida del comando la ruta donde el servidor está funcionando. Generalmente será algo como esto (pero te sugerimos verificar el puerto en la salida de tu terminal):

    http://localhost:4200/

## Modificando el proyecto ##

En el fichero ***hola-mundo\src\app\app.component.ts*** se puede ver la definición del componente principal de la aplicación que muestra una cadena simple:

    import { Component } from '@angular/core';
    
    @Component({
      selector: 'app-root',
      templateUrl: './app.component.html',
      styleUrls: ['./app.component.css']
    })
    export class AppComponent {
      title = 'app works!';
    }

Vamos a codificarla de la siguiente manera para que muestre por pantalla **'hola mundo!'**:

    import { Component } from '@angular/core';
    
    @Component({
      selector: 'hola-mundo',
      templateUrl: './app.component.html',
      styleUrls: ['./app.component.css']
    })
    export class HolaMundoComponent {
      title = 'hola mundo!';
    }

hemos cambiado el nombre del ***selector*** y de ***la clase*** y el contenido de la ***variable title***.

> **Nota**: Como buenas prácticas se recomienda que el nombre de la clase de un componente se nombre con una notación ***"CamelCase"*** típica de ***JavaScript*** y acabado en ***"Component"***, mientras que el ***nombre de la etiqueta del componente (su "selector")*** tenga las mismas palabras separadas por guiones en minúsculas.
> 
> Esto es debido a que en ***HTML no se reconocen mayúsculas y minúsculas y por tanto se separan las palabras por guiones, colocando todo en minúscula*** y ***los mismos nombres en Javascript se escriben con "CamelCase", todo junto y con la primera letra de cada palabra en mayúscula, además como representa a una clase debe empezar por mayúscula***.

Como hemos cambiado el nombre del componente, debemos modificar todas sus referencias en el proyecto, tal como vemos en la siguiente imagen:

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/referencias-componente.png" class="img-thumbnail" alt="referencias componente."/>
</div>


> **Nota**: Como editor estoy usando [Visual Studio Code](https://code.visualstudio.com/ "Visual Studio Code") (en un futuro escribiré un post centrándonos en este IDE), seleccionando el nombre del componente y **apretando F2, podremos cambiar todas las referencias del componente**. Con **shift+F12 podemos comprobar todas las referencias**, ver imagen anterior.

En el fichero ***hola-mundo/src/index.html***, cambiaremos la etiqueta ***<app-root\>*** por el contenido del selector ***<hola-mundo\>***:

    <body>
      <app-root>Loading...</app-root>
    </body>

tal que así:

    <body>
      <hola-mundo>Loading...</hola-mundo>
    </body>

> **Nota**: Al modificar los archivos del componente, cualquiera de ellos, tanto el **html, css o ts**, se debería refrescar automáticamente la página donde estás visualizando tu proyecto una vez puesto en marcha con el comando `ng serve`, gracias al sistema de **"live-reload"** que te monta **[angular-cli]({{ site.baseurl }}angular/2016/12/09/angular-cli.html "angular-cli")** en cualquier proyecto Angular 2.

En la siguiente imagen puedes ver la salida del navegador .

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/hola-mundo.png" class="img-thumbnail" alt="hola mundo."/>
</div>

## Ficheros fuente: ##

[ver fuente del ejemplo](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")

## Artículos relacionados ##

[angular-cli]({{ site.baseurl }}angular/2016/12/09/angular-cli.html "angular-cli")

[NodeJS y NPM instalación]({{ site.baseurl }}angular/2016/12/06/angular-node-js-y-npm-instalacion.html)

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")

[https://angular.io/docs/ts/latest/quickstart.html](https://angular.io/docs/ts/latest/quickstart.html "https://angular.io/docs/ts/latest/quickstart.html")

[http://www.typescriptlang.org/](http://www.typescriptlang.org/ "http://www.typescriptlang.org/")

[https://cli.angular.io/](https://cli.angular.io/ "https://cli.angular.io/")

[https://code.visualstudio.com/](https://code.visualstudio.com/ "Visual Studio Code")