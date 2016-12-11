---
layout: post
section: "Angular"
title:  "Conceptos: Componente"
date:   2016-12-09
desc: "Conceptos: Componente"
keywords: "Angular, Componente, mcv"
categories: [Angular]
tags: [Angular, Componente]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
# variables para sustituir las llaves, sino no van a aparecer en el html hay que referenciarlas así {{ page.saludo }}
saludo: '{{ title }}'
---

http://www.desarrolloweb.com/articulos/concepto-teorico-componente-angular2.html

Árbol de componentes
Una aplicación Angular 2 se desarrolla a base de crear componentes. Generalmente tendrás un árbol de componentes que forman tu aplicación y cada persona lo podrá organizar de su manera preferida. Siempre existirá un componente padre y a partir de ahí podrán colgar todas las ramas que sean necesarias para crear tu aplicación.

Esto no resultará nada extraño, pues si pensamos en una página web tenemos un mismo árbol de etiquetas, siendo BODY la raíz de la parte del contenido. La diferencia es que las etiquetas generalmente son para mostrar un contenido, mientras que los componentes no solo encapsulan un contenido, sino también una funcionalidad.

En nuestro árbol, como posible organización, podemos tener en un primer nivel los bloques principales de la pantalla de nuestra aplicación.

Una barra de herramientas, con interfaces para acciones principales (lo que podría ser una barra de navegación, menús, botonera, etc.).
Una parte principal, donde se desplegarán las diferentes "pantallas" de la aplicación.
Un área de logueo de usuarios.
Etc.
Nota: Obviamente, ese primer nivel de componentes principales lo dictará el propio proyecto y podrá cambiar, pero lo anterior nos sirve para hacernos una idea.
Luego, cada uno de los componentes principales se podrá subdividir, si se desea, en nuevos árboles de componentes.

En la barra de herramientas principal podríamos tener un componente por cada herramienta.
En el área principal podríamos tener un componente para cada "pantalla" de la aplicación o "vista". A su vez, dentro de cada "vista" o "pantalla" podíamos tener otra serie de componentes que implementen diversas funcionalidades.
Etc.
Los niveles del árbol serán los que cada aplicación mande, atendiendo a su complejidad, y cada desarrollador estime necesario, en función de su experiencia o preferencias de trabajo. A medida que componetizamos conseguimos dividir el código de la aplicación en piezas menores, con menor complejidad, lo que seguramente sea beneficioso.

Si llegamos a un extremo, y nos pasamos en nuestra ansia de componetizar, quizás obtengamos el efecto contrario. Es decir, acabemos agregando complejidad innecesaria a la aplicación, puesto que existe un coste de tiempo de trabajo y recursos de procesamiento para posibilitar el flujo de comunicación entre componentes.

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")