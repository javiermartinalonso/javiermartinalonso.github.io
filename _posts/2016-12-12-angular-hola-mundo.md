---
layout: post
section: "Angular"
title:  "!!Hola Mundo!! con Angular"
date:   2016-12-12
desc: "Primeros Pasos con Angular"
keywords: "node.js,Angular,AngularJS,TypeScript"
categories: [Angular]
tags: [node.js,Angular,AngularJS,TypeScript]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
# variables para sustituir las llaves, sino no van a aparecer en el html hay que referenciarlas así {{ page.saludo }}
saludo: '{{ title }}'
---

## Requisitos previos ##

- Un conocimiento básico de terminal y la ***línea de comandos***
- Conocimientos de ***HTML y CSS***
- Conocimientos de Javascript, concretamente ***JavaScript ES2015***.
- ***[NodeJS y NPM instalados]({{ site.baseurl }}angular/2016/12/06/angular-node-js-y-npm-instalacion.html)***
- Opcionalmente, pero muy aconsejable, tener instalado **[angular-cli]({{ site.baseurl }}angular/2016/12/08/angular-cli.html "angular-cli")**.

## !!Hola Mundo!! con Angular ##

Para generar la **creación del esqueleto, o scaffolding** de nuestra aplicación básica de angular de la que vamos a partir para generar nuestro **!!hola mundo!!**, puedes copiarte el ***[código fuente directamente](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")*** o puedes revisar un post anterior del blog donde explicamos como usar ***[angular-cli]({{ site.baseurl }}angular/2016/12/08/angular-cli.html "angular-cli")*** para crearlo.

Las aplicaciones angular están hechas de ***componentes*** . Un componente es la combinación de una ***plantilla HTML (Template)*** y una ***clase (class)*** de componente que controla una parte de la pantalla. En el fichero ***hola-mundo\src\app\app.component.ts*** se puede ver un ejemplo de un componente que muestra una cadena simple:

    import { Component } from '@angular/core';
    
    @Component({
      selector: 'app-root',
      templateUrl: './app.component.html',
      styleUrls: ['./app.component.css']
    })
    export class AppComponent {
      title = 'hola mundo!';
    }

En la primera línea del código del archivo .ts vemos el siguiente import:

    import { Component } from '@angular/core';

Ese import nos está importando la ***clase Component***.

Cada componente comienza con un decorador de función ***@Component*** que toma un objeto de metadatos. El objeto de metadatos describe cómo la plantilla HTML y la clase de componente deben trabajar juntos.

La propiedad ***"selector"*** del componente, le indica a angular que debe usar el componente dentro de una custom-tag ***<app-root\>*** en el ***index.html***.

Si vemos ahora el contenido de **hola-mundo\src\index.html (dentro de la etiqueta <body\>)**

    <body>
      <app-root>Loading...</app-root>
    </body>

La propiedad ***"templateUrl"*** define la ruta de la definición del componente html. En este caso ***hola-mundo\src\app\app.component.html***

    <h1>
      {{page.saludo}}
    </h1>

un mensaje dentro de una cabecera <h1\>. El mensaje está definido por la expresión \{\{title\}\} la cual es una expresión angular de ***interpolacion doble corchete (Interpolation binding) (Propiedad de unión/mapeo que ayuda a mostrar los datos de aplicaciones en la interfaz de usuario)***. En tiempo de ejecución, angular reemplaza \{\{title\}\} con el valor del componente de la propiedad **"title"**.

> También podríamos haber usado la propiedad ***template*** en vez de ***templateUrl*** y haber codificado directamente el html dentro del decorador ***@component*** :
> 
>     template: `<h1> {{ page.saludo }} </h1>`
> 
> Véase que en este caso se hace el uso del símbolo de ***acento grave `*** para rodear el código html y no confundir con la tilde normal, este es un error muy normal que te puede volver loco cuando estas comenzando. 

## Ficheros fuente: ##

[ver fuente del ejemplo](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")

## Artículos relacionados ##

[angular-cli]({{ site.baseurl }}angular/2016/12/08/angular-cli.html "angular-cli")

[NodeJS y NPM instalación]({{ site.baseurl }}angular/2016/12/06/angular-node-js-y-npm-instalacion.html)

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")

[https://angular.io/docs/ts/latest/quickstart.html](https://angular.io/docs/ts/latest/quickstart.html "https://angular.io/docs/ts/latest/quickstart.html")

[http://www.typescriptlang.org/](http://www.typescriptlang.org/ "http://www.typescriptlang.org/")