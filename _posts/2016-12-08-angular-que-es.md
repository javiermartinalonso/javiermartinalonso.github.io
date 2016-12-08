---
layout: post
section: "Angular"
title:  "¿Qué es Angular?"
date:   2016-12-08
desc: "Introducción y primeros pasos con Angular"
keywords: "node.js,Angular,AngularJS,TypeScript"
categories: [Angular]
tags: [node.js,Angular,AngularJS,TypeScript]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

# Introducción #

Angular, es un framework de JavaScript de código abierto, mantenido por Google, que se utiliza para crear y mantener ***aplicaciones web de una sola página (SPA single-page application)***, es una aplicación web que cabe en una sola página con el propósito de dar una experiencia más fluida a los usuarios como una aplicación de escritorio. Su objetivo es aumentar las aplicaciones basadas en navegador con capacidad de ***Modelo Vista Controlador (MVC)***, en un esfuerzo para hacer que el desarrollo y las pruebas sean más fáciles.

Angular sigue el patrón ***MVVM (Model View View-Model)*** de ingeniería de software y alienta la articulación flexible entre la presentación, datos y componentes lógicos. Con el uso de la inyección de dependencias (esto suena un poco a Spring, no?), Angular lleva servicios tradicionales del lado del servidor, tales como controladores dependientes de la vista, a las aplicaciones web del lado del cliente. En consecuencia, gran parte de la carga en el backend se reduce, lo que conlleva a aplicaciones web mucho más ligeras.
<!--more-->
Presenta un rendimiento óptimo y mucho más simple y comprensible que la versión 1, y al igual que ésta, nos permite tener todo nuestro código bajo una red de seguridad de tests.

Angular 2 es otro framework, no simplemente una nueva versión de angularJS.

# Principales ventajas con respecto angularJS #

- **Velocidad**: Angular 2 mejora la velocidad.
- **Componentes**: la instanciación de controllers y scope es mas sencilla.
- **Directivas**: crear directivas propias a medida, es mas fácil.
- **Data binding (mapeo de datos) intuitivo**:cuando necesitas conectar o mapear un dato y un componente html o un evento de botón tiene una sintaxis más intuitiva. Ahora el databinding es unidireccional, para hacer un databinding bidireccional como en AngularJS, se tiene que hacer de forma explícita.
- **Services**: ahora se corresponde con un class.
- **Testabilidad**: Cualquier elemento de la aplicación es fácilmente testeable gracias a frameworks como ***Karma y Jasmine***. También es posible implementar tests de aceptación de selenium con Protractor.
- **Integración con otras tecnologías**:
No es un framework que se crea autosuficiente para todo, una de sus mayores fortalezas es que se integra a la perfección con otras tecnologías que permiten crear web components como: ***react, de Facebook; Polymer, del propio Google y X-Tag, de MicroSoft***. Además la empresa ***PrimeTek***, famosa por sus librerías de componentes ***PrimeFaces y PrimeUI***, está liberando todos estos componentes como directivas que se integran especialmente con ***Angular***, en su proyecto ***PrimeNG***.
- **Simplicidad**: El código de angular 2 está programado con ***[TypeScript](http://www.typescriptlang.org/ "TypeScrip")*** que es una extensión de Microsoft de javascript y que transpila (se compila y se transforma) a ***JavaScript ES2015***. Es un lenguaje tipado y orientado a objetos. Proporciona una sintaxis mucha más entendible y cercana a lenguajes de programación orientados a objetos como ***Java o C#*** y los templates definen claramente las características de la vista de un componente y sus relaciones con otros componentes.

Todo esto redunda en una curva de aprendizaje mucho más pequeña que hace que la productividad de los equipos aumente, permitiendo que se focalicen en la lógica de negocio y la presentación; el framework ya se encarga del resto.

> Así pasamos de escribir ficheros main.js a main.ts
> 
> También puede escribir código Angular en JavaScript en [esta guía](https://angular.io/docs/ts/latest/cookbook/ts-to-js.html "esta guía") se explica cómo.

## ¿Por qué dejar atrás JavaScript y usar TypeScript? ##

Angular desea aprovecha las últimas mejoras en los estándares front-end.

Estas mejoras son los web components, que son recomendación de la W3C desde Julio 2014 y permiten extender el HTML a nuestro antojo; y la nueva especificación de JavaScript que desde Junio 2015 cuenta con la especificación ECMAScript 6, de la que se nutre TypeScript para añadirle tipos de datos, interfaces y mejoras en la programación orientada a objetos.

Como ya he dicho los web components nos permiten extender el HTML como queramos, es decir, nos permiten crear etiquetas personalizadas que encapsulan el contenido en HTML, el comportamiento en JavaScript y el estilo en CSS y todo gracias a estas cuatro especificaciones:

- **Custom Elements**: es la tecnología que nos permite crear las etiquetas semánticamente correctas para la funcionalidad que le queramos dar. Es buena práctica que esta etiqueta incluya un ‘-‘, para reducir el riesgo de colisiones, ya que la W3C se compromete a no crear etiquetas que incluyan este carácter.
- **HTML Imports**: es la tecnología que nos permite importar un código HTML en otro HTML, se utiliza para la distribución de las librerías de web components.
- **Templates**: es la tecnología que permite crear la estructura visual del web component. No tiene ningún efecto sobre la página, es decir, no se incluye en el DOM hasta que algún elemento la procesa, hace una copia y la incluye en el DOM.
- **Shadow DOM**: es la tecnología que permite encapsular el web component para que no se vea afectado por el DOM general de la página a no ser que lo permitamos explícitamente. En otras palabras, es todo el contenido que encapsula la etiqueta del web component. En algunos navegadores podemos verlo inspeccionando la página.

Actualmente podemos hacer uso de ECMAscript 6 y de TypeScript pero los navegadores no se actualizan tan rápido a estos cambios en JavaScript, por lo que ahora estamos en un punto en el que si utilizamos las nuevas sintaxis, antes de poder ejecutarse en los navegadores tienen que pasar un proceso de transpilado, que convierte su contenido a sintaxis de ECMAScript 5 que es la que actualmente soportan todos los navegadores.

Todos los navegadores están trabajando en tener soporte para estos nuevos lenguajes lo antes posible, cuando llegue ese momento los transpiladores dejarán de tener sentido a no ser que salga una nueva especificación.

En el caso de ECMAScript 6 los transpiladores que se utilizan son babel o traceur, mientras que TypeScript ya proporciona su propio transpilador. En Angular 2 se puede utilizar cualquier tipo de sintaxis, ES5, ES6, TypeScript e incluso Dart.

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")

[http://www.typescriptlang.org/](http://www.typescriptlang.org/ "http://www.typescriptlang.org/")