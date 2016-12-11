---
layout: post
section: "Angular"
title:  "Primeros Pasos con AngularJS"
date:   2016-12-08
desc: "Primeros Pasos con AngularJS"
keywords: "node.js,Yeoman,Grunt,Bower,Karma,AngularJS generator,TypeScript"
categories: [Angular]
tags: [node.js,Yeoman,Grunt,Bower,Karma,AngularJS generator,TypeScript]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

# Tutorial Angular #

Si te gusta o lo odias, no se puede negar que ***AngularJS*** es el marco en boca de todos los desarrolladores. Puede que no sea para todo el mundo, pero ***AngularJS*** tiene un conjunto de características peculiares que lo hacen eficiente y potente. Combinado con unas pocas herramientas de desarrollo útiles como ***Yeoman, Grunt y Bower*** y usted se tiene un proceso de prototipado increíblemente rápido.

Lo que vamos a cubrir con este tutorial de ***AngularJS***:

- Generación de un esqueleto de aplicación AngularJS con ***Yeoman***.
- El uso del ***Grunt*** para acelerar el desarrollo y ayudar a realizar tareas repetitivas.
- El uso de ***Bower*** para agregar  plugins/frameworks de terceros.
- Hacer pequeños cambios en su aplicación AngularJS.

## Requisitos previos ##

Para obtener el máximo provecho de este tutorial se recomienda tener las siguientes habilidades y los recursos disponibles:

- Un conocimiento básico de terminal y la ***línea de comandos***
- ***[NodeJS](https://nodejs.org "NodeJS")*** y ***NPM instalado***
- Conocimientos básicos de ***JS***, ***CSS*** y de ***HTML***


##  Vamos a empezar: Yo! ##
Muy bien, vamos a obtener esta cosa en marcha. Lo primero que hay que hacer es instalar ***Yeoman, grunt y Bower***. Vamos a utilizar el ***Node Package Manager (NPM)*** que viene con la instalación de ***node.js*** para hacerlo todo a la vez. En un terminal, ejecute el siguiente:

    npm install -g yo grunt-cli bower

Tan simple como eso, ahora ya tenemos un potente conjunto de herramientas a nuestra disposición. Voy a explicar como usamos cada una.

### Yeoman ###
Se utiliza para generar por usted el ***scaffolding (andamiaje de su aplicación)***. Va a crear las carpetas básicas, archivos y configuraciones para que pueda ponerse en marcha rápidamente. No sólo eso, sino que hay algunos grandes generadores personalizados disponibles para crear aplicaciones de un tipo particular. Nosotros vamos a utilizar ***AngularJS generator***.

Una de las mejores características de Yeoman es la capacidad de utilizar generadores personalizados. Vamos a instalar ***AngularJS generator*** para ayudarnos a empezar a funcionar con angular lo más rápido posible.

Ejecute el siguiente para instalar el ***AngularJS generator***:

    npm install -g generator-angular

Ahora es el momento de generar una aplicación AngularJS. En un directorio vacío que desees usar como directorio raíz del proyecto, ejecute:

    yo angular 

El generador pasará a hacerle un par de preguntas. Usted puede responder sí a incluir ***Twitter’s bootstrap***. También responda afirmativamente a incluir ***ngResource***. El resto no vamos a necesitar por ahora Así que la respuesta no.

Sentarse (durante unos segundos) y ver al generador que haga su magia. ***Yeoman*** creará sus archivos y carpetas, a continuación, se ejecutará la instalación ***Bower*** (más sobre esto en un momento) y ***NPM*** seguirá en busca de cualquier dependencia y por último se va a realizar la configuración obligatoria.

## ¿Qué hay en la caja? ##

Vamos a echar un vistazo a lo que nos ha dado de Yeoman:

- .bowerrc
- .editorconfig
- .gitattributes
- .gitignore
- .jshintrc
- Gruntfile.js
- **app/**
- component.json
- karma-e2e.conf.js
- karma.conf.js
- **node_modules/**
- package.json
- **test/**

Vamos a repasar algunas de las cosas más importantes que notar aquí:

**- app**

El directorio de aplicación contiene su aplicación estática. Tiene su html, css y javascript en ella y es donde pasará la mayor parte de su tiempo en desarrollo. 

**- package.json**

El archivo ***package.json*** ayuda NPM para identificar nuestro proyecto, así como para gestionar todas sus dependencias. También puede contener todo tipo de otros metadatos relevantes para su proyecto.

**- node_modules**

Éste es auto explicativo. Aquí es donde se almacenan todos los módulos de nodo que su proyecto depende.

**- Gruntfile.js**

El ***Gruntfile*** es un archivo javascript que es responsable de la configuración de su proyecto, así como todas las tareas o plugins que su proyecto requiere. Por ejemplo, su ***gruntfile*** podría especificar que el proyecto utiliza ***Uglify*** y que desea que se ejecute ***Uglify*** en un directorio en particular en tiempo de compilación. Más acerca del ***Grunt*** en un momento.
 
***- .bower.json***

El archivo ***component.json*** se utiliza para informar al gestor de paquetes ***Bower*** de sus dependencias proyectos, así como otros metadatos. En versiones antiguas de ***Bower*** este archivo se llama ***component.json*** -. Más sobre esto en un momento 

**- .bowerrc**

El archivo ***.bowerrc*** se utiliza para pasar las opciones generales de configuración de Bower. 

**- Karma files**

***Karma*** es un marco de pruebas. Lo usaremos para realizar algunas pruebas para nuestra aplicación angular.

¡Uf! Eso es mucho para tomar en - una vez que se familiarice con la salida de un generador de ***Yeoman*** sin embargo, usted aprenderá a amar el hecho de que se encarga de todo esto para usted!

Vamos a añadir algunas cosas más a nuestro proyecto antes de empezar a llegar a un cierto desarrollo real.

## Bower - Un gestor de paquetes para la web ##

Antes de usar ***Bower***, hay un poco de configuración que tenemos que hacer nosotros mismos. Bower ha cambiado recientemente su convención de nomenclatura de archivos, de ***component.json*** pasa a ser ***bower.json***, así que tenemos que llevar nuestra base de código de acuerdo con eso.

Lo primero que tenemos que hacer es hacer un pequeño cambio en nuestra configuración de Bower, en ***.bowerrc*** hay que abrirlo y añadir la siguiente línea:

    {
    	"directory": "app/components",
    	"json": "bower.json" // Add this line
    }

Lo que esto hace, es que le indica a Bower que debe utilizar bower.json para obtener instrucciones sobre cómo instalar ese paquete.

Puesto que estamos utilizando bower para gestionar las dependencias de nuestro proyecto, tendremos que cambiar el nombre del archivo component.json en la raíz de nuestro proyecto a bower.json.

## Bower ##

Bower es un gestor de paquetes. Nos ayudará a encontrar e instalar rápidamente nuestros marcos CSS favoritos, bibliotecas JavaScript y plugins con sólo unos simples comandos.

Yeoman amablemente utiliza Bower para instalar Bootstrap para nosotros antes, pero eso fue sólo el CSS Bootstrap. Queremos todos los widgets Javascript también.

Dado que estamos construyendo una aplicación AngularJS, necesitaremos Javascript de Bootstrap que trabaja con angular.

Por suerte, el equipo que desarrolla la plataforma [angular-ui](http://angular-ui.github.io/bootstrap/ "angular-ui") han portado todo el Bootstrap Javascript en angular. Vamos a usar Bower para instalar su biblioteca.

    bower install angular-bootstrap --save

La bandera --save indica a Bower que debe añadir este elemento a nuestro archivo bower.json como una dependencia.

¡Fantástico! Eso fue fácil no? Ahora, navegue en su aplicación / directorio y vamos a ver lo que tenemos que trabajar.

## Nuestra aplicación estática ##

Echar un vistazo a los contenidos de la aplicación / directorio.

- favicon.ico
- index.html
- robots.txt
- componentes /
- guiones/
- estilos /
- puntos de vista/

### index.html ###

Esta debe ser familiar para la mayoría de ustedes, esta es la página html núcleo de su aplicación. 

### components/ directory ###

El directorio de componentes es como el directorio node_modules pero para Bower. Es el lugar donde se guardan todos los paquetes que se instalan con Bower. AngularUI Bootstrap, por ejemplo, va a estar ahí. 

### scripts/ directory ###

Una vez más, un territorio familiar para la mayoría. Aquí es donde las aplicaciones se almacenan Javascript. Tenga en cuenta que existirán bibliotecas como AngularJS en el directorio de componentes, lo que los scripts / es para los archivos que se escriben!

### styles/ directory ###

Todo el CSS / Sass para mejorar el estilo o aspecto de su aplicación.

### Views ###

Esta carpeta es donde residen sus plantillas Angular.

El siguiente paso vamos a echar un vistazo más de cerca a los archivos AngularJS

## AngularJS ##
El generador angular Yeoman nos ha dado lo esencial: un módulo, un controlador y una vista. Vamos a echar un vistazo a cada una de ellas:

**El módulo: /app/scripts/app.js**

    'use strict';
      // Aquí montamos un módulo angular. Adjuntaremos controladores y
       // otros componentes de este módulo.
      angular.module('testApp', [])
        // Angular soporta el encadenamiento, así que aquí encadenamos la 
        //función de configuración en el módulo que estamos configurando.
    	.config(function ($routeProvider) {
      		// Utilizamos la inyección de dependencia AngularJS para obtener el proveedor de la ruta.
      		// El proveedor de rutas se utiliza para configurar las rutas de nuestra aplicación.
      		// La configuración abajo simplemente dice cuando usted visita '/' lo hará
      		// la plantilla views / main.html controlada por el controlador MainCtrl.
      		// El método else especifica qué debe hacer la aplicación si no reconoce
      		// la ruta ingresada por un usuario. En este caso, redirigir a home.
      		$routeProvider
	    		.when('/', {
	     			templateUrl: 'views/main.html',
	      			controller: 'MainCtrl'
	    		})
	    		.otherwise({
	      			redirectTo: '/'
	    		});
    	});

**El controlador: /app/scripts/controllers/main.js**

    'use strict';
    
     // Aquí adjuntamos este controlador a nuestro módulo testApp
     Angular.module ( 'testApp')
     
     // La función del controlador nos permite darle un nombre a nuestro controlador: MainCtrl
     // Luego pasaremos una función anónima para servir como el propio controlador.
    .controller('MainCtrl', function ($scope) {
     
     // Utilizando la inyección de dependencia AngularJS, hemos inyectado la variable $scope
     // Cualquier cosa que adjuntamos al ámbito estará disponible para nosotros en la vista.
     
     // En este caso, estamos adjuntando una colección de cosas impresionantes para mostrar
     // en app/views/main.html 

      $scope.awesomeThings = [
        'HTML5 Boilerplate',
        'AngularJS',
        'Karma'
      ];
    });

**La Vista: app/views/main.html**

    <div class="hero-unit">
    <h1>'Allo, 'Allo!</h1>
    <p>You now have</p>
    <ul>
 
        <!-- Aquí usamos la directiva AngularJS: ng-repeat para recorrer nuestros bucles e imprimirlos 
        como elementos de la lista utilizando el doble corchete \{\{\}\} para realizar el mapeo o atadura (bindings) -->
        <li ng-repeat="thing in awesomeThings">{{thing}}</li>
    </ul>
    <p>installed.</p>
    <h3>Enjoy coding! - Yeoman</h3>
    </div>
    [/js]
     
    <strong>The Index File: app/index.html</strong>
    [html]  <!doctype html>
      <html>
    	<head>...</head>
    	<!-- La directiva ng-app indica a angular qué módulo usaremos 
    	para nuestra aplicación. En este caso, el definido en scripts/app.js -->
    	<body ng-app="testApp">
      		...
      		<!-- La directiva ng-view especifica que plantillas (templates)
      		(Como views/main.html) se cargarán en esta div. -->
      		<div class="container" ng-view></div>
 
      		<!-- Aquí se carga AngularJS y el componente de recursos AngularJS -->
      		<script src="components/angular/angular.js"></script>
      		<script src="components/angular-resource/angular-resource.js"></script>
 
      		<!-- Aqui vamos a incluir nuestros propios scripts de angular -->
      		<!-- build:js scripts/scripts.js -->
      		<script src="scripts/app.js"></script>
      		<script src="scripts/controllers/main.js"></script>
      		<!-- endbuild -->
 
      		...
    	</body>
    </html>

## Vamos a verlo en acción! ##

Estamos listos para echar nuestro primer vistazo a nuestra aplicación. Desde la línea de comandos navegar de vuelta al directorio raíz de la aplicación y ejecutar:

    grunt server

## Grunt ##

Grunt es una poderosa feature para ejecutar Javascript. En resumen, se le permite automatizar tareas repetitivas como la compilación de CoffeeScript, minifying css, validación de código, etc. Vamos a utilizarlo para hacer todo eso, así es como preparamos nuestro código para el desarrollo y despliegue.

Grunt se va a ejecutar desde nuestra carpeta de proyecto y preparará todo para nosotros, como la compilación de nuestra Bootstrap SASS y css.

Al cabo de unos segundos una ventana del navegador debería aparecer con su aplicación en ejecución.

Sólo para estar seguro, ver el código fuente de la página y echar un vistazo a la main.css del archivo que se incluye. Debe estar lleno de código de arranque - gracias a la magia de Bower y Grunt.

## Vamos a realizar unos cambios ##

Ya es hora de hacer algunos cambios con nuestras propias manos. Dado que esto es angular, vamos a empezar con algunas pruebas (testing) de AngularJS.

Yeoman fue lo suficientemente amable para generar una prueba de ejemplo para nuestro controlador, así que vamos a empezar por ahí.

Vamos a añadir otra cosa a nuestra lista de cosas impresionantes, para ello abrimos **test/spec/controllers/main.js** y vamos a cambiar nuestro test para que espere 4 cosas impresionantes (awesome things) en lugar de 3:

**test/spec/controllers/main.js**

    'use strict';

    describe('Controller: MainCtrl', function () {
 
      // load the controller's module
      beforeEach(module('testApp'));
 
      var MainCtrl,
        scope;
 
      // Inicializar el controlador y un simulacro de ámbito (mock scope)
      beforeEach(inject(function ($controller, $rootScope) {
        scope = $rootScope.$new();
        MainCtrl = $controller('MainCtrl', {
          $scope: scope

        });
      }));

      it('deberiamos enviar una lista de awesomeThings al scope', function () {
        // Cambia esta linea
        expect(scope.awesomeThings.length).toBe(3);
 
        // por esta
        expect(scope.awesomeThings.length).toBe(4);
      });
    });

Ahora podemos utilizar otra feature de Grunt:

    grunt test

Esto ejecutará nuestras pruebas Karma. Ellos deben fallar debido a la prueba de espera 4 awesomeThings y todavía sólo tienen 3. Vamos a arreglar eso para hacer pasar nuestras pruebas.

Abrir **app/scripts/controllers/main.js** y añadir otra awesomeThings a la lista:

**app/scripts/controllers/main.js**

    .controller('MainCtrl', function ($scope) {
      $scope.awesomeThings = [
        'HTML5 Boilerplate',
        'AngularJS',
        'Karma',
        'SitePoint'
      ];
    });

Guarde el archivo y ejecute nuevamente las pruebas:

    grunt test

Esta vez deben pasar. Ahora se puede disparar hasta la aplicación en su navegador (grunt server) y el aviso de que hay un punto adicional.

## Utilizando nuestro paquete Bower incluido ##

Vamos a usar la biblioteca AngularUI Bootstrap que incluimos anteriormente para convertir nuestra lista de awesomeThings en un desplegable de awesomeThings.

Importante Bower es sólo un gestor de paquetes, no es responsable de añadir nuestros archivos a nuestro index.html. Tenemos que hacerlo nosotros mismos.

Para hacer eso abre app/index.html y añade la siguiente línea:

    <script src="components/angular-bootstrap/ui-bootstrap.js"></script>

Entonces, según la documentación de introducción en el sitio de AngularUI Bootstrap, tenemos que añadir el módulo como una dependencia en nuestro propio módulo angular

Abrir **app/scripts/app.js** y agregar el módulo ui.bootstrap como una dependencia:

**app/scripts/app.js**

    'use strict';
     
      angular.module('testApp', ['ui.bootstrap'])
      ...

Todo está listo para su uso. Ahora tenemos que hacer algunos cambios en nuestra view:

**The View: app/views/main.html**

    <ul>
    	<li class="dropdown">
      	<a class="dropdown-toggle">
        	Click me to see some awesome things!
      	</a>
      	<ul class="dropdown-menu">
        	<li ng-repeat="thing in awesomeThings">
          	<a>{{thing}}</a>
        	</li>
      	</ul>
    	</li>
    </ul>

Hemos utilizado algunas clases CSS de bootstrap, y hemos cambiado nuestra directiva ng-repeat para crear elementos de menú en lugar de sólo una lista simple y llano.

Las directivas AngularUI Bootstrap trabajan en class de css, por lo que simplemente mediante la adición de la class dropdown-toggle para nuestra tag tendremos un menú desplegable en pleno funcionamiento!

Tendremos que añadir el módulo de interfaz de usuario para Bootstrap en nuestras pruebas de lo contrario, fallarán de modo realizar los siguientes cambios:

**test/spec/controllers/main.js**

    'use strict';
 
    describe('Controller: MainCtrl', function () {
 
      // carga del modulo del controller
      beforeEach(module('testApp'));
      // carga del módulo de BootstrapUI
      beforeEach(module('ui.bootstrap')); // Add this line
     ...
    });

**/karma.conf.js**'

    // Karma configuration
     
      // base path, debe usarse para resolver rutas de ficheros y excludes
      basePath = '';
     
      // list of files / patterns to load in the browser
      files = [
    JASMINE,
    JASMINE_ADAPTER,
    'app/components/angular/angular.js',
    'app/components/angular-mocks/angular-mocks.js',
    'app/components/angular-bootstrap/ui-bootstrap.js', // Add this line
    'app/scripts/*.js',
    ...
Ejecutar **grunt test** para asegurarse de que todo pasa

Ahora puede abrir su aplicación en el navegador (**grunt server**) una vez más y echar un vistazo a su trabajo práctico.

## Conclusión ##

¡Bueno, ahí lo tienes! Una simple aplicación angular, una biblioteca de terceros JS, algunas pruebas, minimización y todo un montón de otras cosas con el mínimo esfuerzo!

Sólo hemos arañado la superficie de lo que es posible con Yeoman y sus compañeros - pero espero que esto le inspire para preparar una AngularJS rápidas APP la próxima vez que tenga una gran idea!

Mirar hacia fuera para más tutoriales de AnuglarJS y artículos sobre AngularJS las mejores prácticas disponibles en breve!

## Referencias ##

[https://nodejs.org](https://nodejs.org "https://nodejs.org")

[https://angular.io](https://angular.io "https://angular.io")

[http://www.typescriptlang.org/](http://www.typescriptlang.org/ "http://www.typescriptlang.org/")