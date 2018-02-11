---
layout: post
section: "Angular"
title:  "Angular CLI"
date:   2016-02-20
desc: "Angular CLI: Es un intérprete de línea de comandos de Angular 2 que te facilitará el inicio y desarrollo de proyectos, ocupándose de la **creación del esqueleto, o scaffolding**, de la mayoría de los componentes de una aplicación Angular."
keywords: "node.js,npm,angular-cli,Karma,Angular,less,webpack"
categories: [Angular]
tags: [node.js,npm,angular-cli,Karma,Angular,less,webpack]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

http://www.desarrolloweb.com/articulos/concepto-teorico-componente-angular2.html

http://academia-binaria.com/componentes-los-bloques-de-construccion-de-angular-2/

https://platzi.com/blog/crea-componente-angular-2/

http://www.desarrolloweb.com/articulos/crear-componente-nuevo-angular2.html

http://www.desarrolloweb.com/articulos/usar-componente-angular2.html

http://www.desarrolloweb.com/articulos/introduccion-componentes-angular2.html
Alterando el código de nuestro componente
Para terminar este artículo vamos a hacer unos pequeños cambios en el código del componente para comprobar si la magia de Angular está funcionando.

Algo muy sencillo sería comenzar por crear una nueva propiedad en la clase del componente. Pero vamos además a colocar un método para poder usarlo también desde la vista.

export class ProyectoAngular2AppComponent {
  title = 'Manual de Angular 2 de DesarrolloWeb.com';
  visible = false;
  decirAdios() {
    this.visible = true;
  }
}
Nota: Esta clase "class" se escribe en un archivo TypeScript, pero realmente lo que vemos es todo Javascript válido en ES6. TypeScript entiende todo ES6 e incluso algunas cosas de ES7.
Ahora vamos a ver el código HTML que podría tener nuestra vista.

<h1>
  {{title}}
</h1>
<p [hidden]="!visible">
  Adiós
</p>
<button (click)="decirAdios()">Decir adiós</button>
En este HTML hemos incluido más cosas de las que puedes usar desde Angular. Habíamos mencionado la expresión, entre llaves. También encuentras el uso de una propiedad de un elemento, como es "hidden", entre corchetes (nuevo en Angular 2). Además de la declaración de un evento "click" que se coloca entre parénteis.

En este caso lo que tenemos en la propiedad "visible" de la clase, que hace las veces de controlador, se usa para asignarlo e la propiedad hidden del elemento "p". El método de la clase, decirAdios() se usa para asociarlo como manejador del evento "click".

Hablaremos más adelante de todas estas cosas que puedes colocar en las vistas y algunas otras, junto con las explicaciones sobre la sintaxis que se debe usar para declararlas.

Nota: Al modificar los archivos del componente, cualquiera de ellos, tanto el html, css o ts, se debería refrescar automáticamente la página donde estás visualizando tu proyecto una vez puesto en marcha con el comando "ng serve", gracias al sistema de "live-reload" que te monta Angular CLI en cualquier proyeto Angular 2.
Otra cosa interesante del entorno de trabajo es que, si usas Visual Studio Code u otro editor con los correspondientes plugin TypeScript, te informarán de posibles errores en los archivos .js. Es una ayuda muy útil que aparece según estás escribiendo.

Con esto acabamos nuestro primer análisis y modificaciones en el componente inicial. Estamos seguros que esta última parte, en la que hemos modificado el código del componente básico, habrá resultado ya algo más entretenida.



## Ficheros fuente: ##

[ver fuente del ejemplo](https://github.com/javiermartinalonso/Angular-2/tree/master/hola-mundo "ver fuente del ejemplo")

## Referencias ##

[https://angular.io](https://angular.io "https://angular.io")

[https://cli.angular.io/](https://cli.angular.io/ "https://cli.angular.io/")

[https://github.com/angular/angular-cli](https://github.com/angular/angular-cli "https://github.com/angular/angular-cli")