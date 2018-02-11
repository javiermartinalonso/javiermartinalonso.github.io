---
layout: post
section: "Angular"
title:  "Conceptos: Decorator"
date:   2016-12-11
desc: "Conceptos: Decorator"
keywords: "Angular, Decorator"
categories: [AngularJS]
tags: [Angular, Decorator]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

## Decorator ##

https://angular.io/docs/ts/latest/api/core/index/Component-decorator.html

http://www.desarrolloweb.com/articulos/decorador-componentes-angular2.html

Un decorador (***Decorator***) es una función que añade metadatos a una clase, a sus miembros (propiedades, métodos) y a los argumentos de funciones.

Decoradores son funciones del lenguaje Javascript, implementados en ***TypeScript*** y propuesto por ***ECMAScript 2016 (aka ES7)*** (También conocido como ***ES2016***).

Para aplicar un decorador, hay que posicionarlo inmediatamente a la izquierda de la cosa que decora.

Angular tiene su propio conjunto de decoradores que ayudan a interoperar con sus partes de la aplicación. He aquí un ejemplo de un decorador ***@Component***  que identifica una clase como un componente de angular y un decorador ***@Input*** aplicada a la propiedad ***name*** de ese componente. El argumento al que alude el objeto decorador ***@Component*** contendría los metadatos del componente pertinente.

    @Component({...})
    export class AppComponent {
      constructor(@Inject('SpecialFoo') public foo:Foo) {}
      @Input() name:string;
    }

El ***alcance (scope)*** de un decorador se limita a la función del lenguaje que decora. Ninguna de las decoraciones que se muestran aquí se ***"fuga (leak)"*** a otras clases que aparecen debajo de ella en el archivo.

> Nota: Siempre hay que incluir paréntesis () cuando estamos aplicando un decorador.

una de las funciones básicas que vas a tener que realizar en todo desarrollo con Angular 2 es la decoración de componentes. En sí, no es más que una declaración de cómo será un componente y las diversas piezas de las que consiste.

Básicamente es una implementación de un patrón de diseño de software que en sí sirve para extender una función mediante otra función, pero sin tocar aquella original, que se está extendiendo. El decorador recibe una función como argumento (aquella que se quiere decorar) y devuelve esa función con alguna funcionalidad adicional.

Las funciones decoradoras comienzan por una "@" y a continuación tienen un nombre. Ese nombre es el de aquello que queramos decorar, que ya tiene que existir previamente. Podríamos decorar una función, una propiedad de una clase, una clase, etc.

Mira la primera línea del código del archivo .ts de tu componente principal.

import { Component } from '@angular/core';
Ese import nos está trayendo la clase Component. En la siguiente línea se decora a continuación, con el correspondiente "decorator". No es nuestro objetivo hablar sobre el patrón decorator en sí, ni ver las posibilidades de esta construcción que seguramente tendremos en el futuro ES7, así que vamos a centrarnos en lo que conseguimos hacer con Angular 2 mediante estos decoradores.

Nota: Uno de los motivos por los que Angular 2 ha tomado TypeScript como lenguaje es justamente por permitir usar decoradores. Con TypeScript podemos realizar la decoración de código de ES7 ya mismo, lo que facilita la decoración del código.

Qué información se agrega por medio del decorador
Angular 2 usa los decoradores para registrar un componente, añadiendo información para que éste sea reconocido por otras partes de la aplicación. La forma de un decorador es la siguiente:

@Component({
  moduleId: module.id,
  selector: 'test-angular2-app',
  templateUrl: 'test-angular2.component.html',
  styleUrls: ['test-angular2.component.css']
})
Como apreciarás, en el decorador estamos agregando diversas propiedades específicas del componente. Esa información en este caso concreto se conoce como "anotación" y lo que le entregamos son unos "metadatos" (metadata) que no hace más que describir al componente que se está creando. En este caso son los siguentes:

moduleId: esta propiedad puede parecer un poco extraña, porque siempre se le asigna el mismo valor en todos los componentes. Realmente ahora nos importa poco, porque no agrega ninguna personalización. Es algo que tiene que ver con CommonJS y sirve para poder resolver Urls relativas.
selector: este es el nombre de la etiqueta nueva que crearemos cuando se procese el componente. Es la etiqueta que usarás cuando quieras colocar el componente en cualquier lugar del HTML.
templateUrl: es el nombre del archivo .html con el contenido del componente, en otras palabras, el que tiene el código de la vista.
styleUrls: es un array con todas las hojas de estilos CSS que deben procesarse como estilo local para este componente. Como ves, podríamos tener una única declaración de estilos, o varias si lo consideramos necesario.
Nota: Ese código de anotación o decoración del componente es generado por Angular CLI. Además, cuando creemos nuevos componentes usaremos el mismo Angular CLI para obtener el scaffolding (esqueleto) del cual partiremos. Por tanto, no hace falta que memorices la sintaxis para la decoración, porque te la darán hecha. En todo caso tendrás que modificarla si quieres cambiar el comportamiento del componente, los nombres de archivos del template (vista), hojas de estilo, etc.
De momento no necesitamos dar mucha más información sobre los decoradores. Es algo que debemos comenzar a usar para desarrollar componentes en Angular 2, pero no nos tiene que preocupar demasiado todavía, porque de momento no necesitaremos tocar mucho sobre ellos.

Era importante para finalizar nuestro análisis de la aplicación básica de Angular 2. Con esto creemos que debe quedar claro el código del primer componente que nos genera la aplicación de inicio creada por Angular CLI. Ahora que ya sabes lo básico, podemos continuar con otros asuntos que seguro serán más entretenidos.



## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")