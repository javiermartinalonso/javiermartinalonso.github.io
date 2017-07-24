---
layout: post
section: "Angular"
title:  "Conceptos: Componente"
date:   2016-12-11
desc: "Conceptos: Componente"
keywords: "Angular, Componente, mcv"
categories: [Angular]
tags: [Angular, Componente]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

## Piezas declarables en una vista ##
http://www.desarrolloweb.com/articulos/sintaxis-vistas-angular2.html

Comenzaremos por describir las cosas que disponemos para su declaración en una vista, de modo que todos podamos usar un único vocabulario.

**Propiedad**: Cualquier valor que podemos asignar por medio de un atributo del HTML. Ese elemento puede ser simplemente un atributo del HTML estándar, un atributo implementado mediante el propio Angular 2 o un atributo personalizado, creado para un componente en específico.

Era el caso de la propiedad "hidden" que usamos para mostrar / ocultar determinados elementos. En este caso, hidden no es una propiedad estándar del HTML, sino que está generada por Angular 2 y disponible para aplicar tanto en etiquetas HTML comunes como en componentes personalizados.

<p [hidden]="!visible">Adiós</p>
También podríamos aplicar valores a atributos del HTML con datos que están en propiedades del modelo, aunque no soporta todos los atributos del HTML estándar. Por ejemplo, podríamos asignar una clase CSS (class) con lo que tuviésemos en una propiedad del modelo llamada "clase".

<div [class]="clase">Una clase marcada por el modelo</div>
O el enlace de un enlace podríamos también definirlo desde una variable del modelo con algo como esto:

<a [href]="enlace">Pulsa aquí</a>

Lo que de momento debe quedar claro es que las propiedades van desde el modelo a la vista y, por tanto, si se modifica el valor de una propiedad en el modelo, también se modificará la vista. Pero , si dentro de la vista se modifica una propiedad no viajará al modelo automáticamente, pues el enlace es de una sola dirección.

El caso de propiedades del HTML con valores que vienen del modelo también podríamos implementarlo por medio de expresiones, tal como sigue.

<a href="{{enlace}}">Clic aquí</a>
Nota: Las dos alternativas (usar expresiones con las llaves o los corchetes para propiedades, como hemos visto para el ejemplo de un href de un enlace cuyo valor traes del modelo) funcionan exactamente igual, no obstante para algunos casos será mejor usar la sintaxis de propiedades en vez de la de expresiones, como es el caso del enlace. Algo que entenderemos mejor cuando lleguemos al sistema de rutas.

**Expresión**: Es un volcado de cualquier información en el texto de la página, como contenido a cualquier etiqueta. La expresión es una declaración que Angular procesará y sustituirá por su valor, pudiendo realizar pequeñas operaciones.

Es el caso de la propiedad del modelo "title" que se vuelca como contenido de la página en el encabezamiento.

<h1>
  {{title}}
</h1>
Simplemente existe esa sustitución del valor de la propiedad, colocándose en el texto de la página. El enlace es de una única dirección, desde el modelo a la vista. En la vista tampoco habría posibilidad de modificar nada, porque es un simple texto.

**Binding**: Es un enlace entre el modelo y la vista. Mediante un binding si un dato cambia en el modelo, ese cambio se representa en la vista. Pero además en Angular se introduce el "doble binding", por el cual si un valor se modifica en la vista, también viaja hacia el modelo.

Como se dijo, usamos la notación "banana in a box" para conseguir este comportamiento de binding en dos direcciones. Los datos viajan de la vista al modelo y del modelo a la vista.

<p>
  ¿Cómo te llamas?  <input type="text" [(ngModel)]="quien">
</p>
En este caso, desde el HTML estaríamos creando una propiedad dentro del modelo. Es decir, aunque no declaremos la propiedad "quien" en el Javascript, por el simple hecho de usarla en la estructura de binding va a producir que se declare automáticamente y se inicialice con lo que haya escrito en el campo de texto. Si la declaramos, o la inicializamos desde la clase que hace las veces de controlador, tanto mejor, pero no será necesario.

Nota: La notación "banana in a box" tiene una explicación y es que usa tanto el flujo de datos desde el modelo a la vista, que conseguimos con los corchetes para las propiedades, como el flujo desde la vista al modelo que conseguimos con los paréntesis para los eventos.

Si quisiéramos visualizar ese dato en algún otro de la vista, por ejemplo en un párrafo, usaríamos una expresión. Por ejemplo:

<p>
  Hola \{{quien}}
</p>

**Evento**: es un suceso que ocurre y para el cual se pueden definir manejadores, que son funciones que se ejecutarán como respuesta a ese suceso.

Indicamos entre paréntesis el tipo de evento y como valor el código que se debe de ejecutar, o mejor, la función que se va a ejecutar para procesar el evento.

<button (click)="decirAdios()">Decir adios</button>





Nota: Generalmente cuando hablemos de "binding" en la mayoría de las ocasiones nos referimos a "doble binding", que es la principal novedad que trajo Angular 1 y que le produjo tanto éxito para este framework.
El problema del doble binding es que tiene un coste en tiempo de procesamiento, por lo que si la aplicación es muy compleja y se producen muchos enlaces, su velocidad puede verse afectada. Es el motivo por el que se han producido nuevas sintaxis para poder expresar bindings de varios tipos, de una y de dos direcciones. Dicho de otra manera, ahora se entrega al programador el control del flujo de la información, para que éste pueda optimizar el rendimiento de la aplicación.


## Flujo de la información de la vista al modelo y modelo a vista ##

El programador ahora será capaz de expresar cuándo una información debe ir del modelo hacia la vista y cuándo debe ir desde la vista al modelo. Para ello usamos las anteriores "piezas" o "herramientas" en el HTML, las cuales tienen definida de antemano un sentido para el flujo de los datos.

En el siguiente diagrama puedes ver un resumen del flujo de la información disponible en Angular, junto con las piezas donde podemos encontrarlo y su sintaxis.



Las propiedades tienen un flujo desde el modelo a la vista. Una información disponible en el modelo se puede asignar como valor en un elemento del HTML mediante una propiedad, usando la notación corchetes. Por ej: [propiedad]
Las expresiones también viajan desde el modelo a la vista. La diferencia de las propiedades es que en este caso las usamos como contenido de un elemento y además que se expresan con dobles llaves. Por ej: {{expresion}}
El binding (a dos sentidos, o doble binding) lo expresamos entre corchetes y paréntesis. En este caso la información fluye en ambos sentidos, desde el modelo a la vista y desde la vista al modelo. Por ej: [(ngBind)]
Los eventos no es que necesariamente hagan fluir un dato, pero sí se considera un flujo de aplicación, en este caso de la vista al modelo, ya que se originan en la vista y generalmente sirven para ejecutar métodos que acabarán modificando cosas del modelo. Por ej: (evento)
Nota: Como ves, ahora existen diversas sintaxis para expresar cosas en las vistas. Quizás nos resulte extraño, pero enseguida nos familiarizaremos. La notación más rara es la que usamos para expresar un binding en dos direcciones [(ngBing)], pero una manera sencilla de acordarnos de ella es con su denominación anglosajona "banana in a box". Los paréntesis parecen una banana, dentro de los corchetes, que parecen una caja.

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")