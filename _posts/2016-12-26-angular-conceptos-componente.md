---
layout: post
sections: [Angular]
title:  "Conceptos: Componente"
date:   2016-12-26
desc: "Estudiamos el concepto de componente dentro de la tecnología Angular."
keywords: "Angular, Componente,MVVM,MVC,template,class,decorator,controller"
categories: [angular]
tags: [Angular,MVVM,MVC]
icon: fab fa-angular
image: static/img/blog/angular/angular-logo_150.png
# variables para sustituir las llaves, sino no van a aparecer en el html hay que referenciarlas así {{ page.saludo }}
saludo: '{{ title }}'
---

# Componente #

En ***angular*** el componente está muy ligado con los patrones ***"MVVM"***, ***"MVC"***, ya que el componente toma en el papel de ***"controlador"*** o ***"vista de modelo"***.

Un ***Componente*** controla una zona de espacio de la pantalla que podríamos denominar ***vista***. Una vista es una parte de la pantalla que muestra información y responde a las acciones del usuario, como los clics y movimientos del ratón y las pulsaciones de teclado.

El ***componente*** es uno de los pilares más importantes en el sistema angular. Es, de hecho, una directiva angular que define propiedades y métodos que están disponibles en su ***template***, pero eso no te da licencia para meter ahí todo lo que te parezca. Es importante seguir una aproximación de diseño ***S.O.L.I.D.***, y extraer toda la lógica en servicios para que el controlador solo se encargue de gestionar una única cosa: ***la vista***.

## Las partes de un componente ##

Un componente está compuesto por tres partes fundamentales:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/angular/components.png" class="img-thumbnail" alt="components."/>
</div>

- Un **template**
- Una **clase**
- Una **función decoradora**

Las dos primeras partes corresponden con capas de lo que conocemos como ***MVC***. El ***template*** será lo que se conoce como ***vista*** y se escribe en ***HTML*** y lo que correspondería con el ***controlador*** se escribe en ***TypeScript*** por medio de una clase (de programación orientada a objetos).

Por su parte, tenemos el ***decorador***, que es una especie de registro del componente y que hace de "pegamento" entre el ***TypeScript*** y el ***HTML***.

## Estudiemos un caso real ##

Volvamos a nuestro ejemplo [hola mundo!!](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "hola mundo!!") que creamos en este post [hola-mundo!! con angular]({{ site.baseurl }}angular/2016/12/12/angular-hola-mundo.html "hola-mundo!! con angular"). El código de este componente está generado de antemano con [angular-cli]({{ site.baseurl }}angular/2016/12/09/angular-cli.html "angular-cli") en la carpeta ***"src/app***". Allí encontrarás varios ficheros que forman el componente completo, separados por el tipo de código que colocarás en ellos.

- **app.component.html**: Equivale a lo que conocemos por ***"vista"*** en la arquitectura ***MVC***.

- **app.component.css**: Permite colocar estilos al contenido, estando éstos encapsulados en este componente.

- **app.component.ts**: Es el archivo ***TypeScript***, que se traducirá a Javascript antes de entregarse al navegador. Sería el equivalente al ***"controlador"*** en el MVC.

- **app.component.spec.ts**: Un archivo TypeScript destinado a tareas de testing de componentes.

El archivo ***"app.component.html"***, sería la vista, admite toda clase de código HTML, con etiquetas estándar y el uso de otros componentes. Además podemos colocar expresiones (entre dobles llaves), expresar bindig entre componentes, eventos, etc.

    <h1>
      {{page.saludo}}
    </h1>

La expresión entre dobles llaves ***{{page.saludo}}*** es una expresión. Angular lo sustituirá por el contenido de una variable ***"title"*** antes de mostrarlo al cliente. Esa variable se define en lo que sería el controlador en el ***patrón MVC***, solo que en Angular 2 no se le llama ***controlador, o "controller***" es una clase que encontraremos en el archivo ***TypeScript*** ***"app.component.ts"***. Si lo abres encontrarás varias cosas.

- El import de la clase ***"Component"*** dentro de ***@angular/core***.
- Una función decoradora que hace la acción de registrar el componente
- La ***clase*** que hace las veces de ***controlador***.

        import { Component } from '@angular/core';
        
        @Component({
          selector: 'hola-mundo',
          templateUrl: './app.component.html',
          styleUrls: ['./app.component.css']
        })

        export class HolaMundoComponent {
          title = 'hola mundo!';
        }

Cada componente comienza con un decorador de función ***@Component*** que toma un objeto de metadatos. El objeto de metadatos describe cómo la plantilla HTML y la clase de componente deben trabajar juntos.

La función decoradora observarás que declara diversas cuestiones.

- La propiedad ***"selector"*** del componente, le indica a angular que debe usar el componente dentro de una custom-tag ***<app-root\>*** en el ***index.html***.

	Si vemos ahora el contenido de **hola-mundo\src\index.html (dentro de la etiqueta <body\>)**

	    <body>
	      <hola-mundo>Loading...</hola-mundo>
	    </body\>

- La propiedad ***"templateUrl"*** define la ruta de la ***"vista"*** html del componente. En este caso ***hola-mundo\src\app\app.component.html***

	    <h1>
	      {{page.saludo}}
	    </h1>

	Aqui vemos un mensaje dentro de una cabecera <h1\>. El mensaje está definido por la expresión \{\{title\}\} la cual es una expresión angular de ***interpolacion doble corchete (Interpolation binding) (Propiedad de unión/mapeo que ayuda a mostrar los datos de aplicaciones en la interfaz de usuario)***. En tiempo de ejecución, angular reemplaza \{\{title\}\} con el valor del componente de la propiedad **"title"**.

	> También podríamos haber usado la propiedad ***template*** en vez de ***templateUrl*** y haber codificado directamente el html dentro del decorador ***@component*** :
	> 
	>     template: `<h1> {{ page.saludo }} </h1>`
	> 
	> Véase que en este caso se hace el uso del símbolo de ***acento grave \`*** para rodear el código html y no confundir con la tilde normal, este es un error muy habitual que te puede volver loco cuando estas comenzando. Por norma general usaremos el ***acento grave \`*** para evitar errores. 
	> 
	> **El acento grave ` Sirve para definir el template de cadenas multi-línea.** esta es una caracteristica nueva de ES2015.
	> 
	> **El acento normal ' sólo funciona con cadenas de una única línea.**



- La propiedad ***"styleUrls"*** (propiedad estilo) es un array de todas las hojas de estilo que deseemos.

En la ***clase del componente***, que se debe colocar con un ***export*** para que se conozca fuera de este módulo, **es la parte que representa el controlador en una arquitectura MVC**. En ella colocaremos todas las propiedades y métodos que se deseen usar desde la vista.

    export class HolaMundoComponent {
      title = 'hola mundo!';
    }

**Esas propiedades representan el modelo de datos** y se podrán usar expresiones en las vistas para poder visualizarlas.


> **Nota**: Como buenas prácticas se recomienda que el nombre de la clase de un componente se nombre con una notación ***"CamelCase"*** típica de ***JavaScript*** y acabado en ***"Component"***, mientras que el ***nombre de la etiqueta del componente (su "selector")*** tenga las mismas palabras separadas por guiones en minúsculas.
> 
> Esto es debido a que en ***HTML no se reconocen mayúsculas y minúsculas y por tanto se separan las palabras por guiones, colocando todo en minúscula*** y ***los mismos nombres en Javascript se escriben con "CamelCase", todo junto y con la primera letra de cada palabra en mayúscula, además como representa a una clase debe empezar por mayúscula***.

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")