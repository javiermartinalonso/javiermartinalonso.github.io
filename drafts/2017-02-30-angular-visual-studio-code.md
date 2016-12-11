---
layout: post
section: "Angular"
title:  "Visual Studio Code"
date:   2016-12-11
desc: "Visual Studio Code: Es un ID perfecto para trabajar con Angular. Es gratuito, open source y multiplataforma. Creado por Microsoft y enfocado a trabajar con TypeScript"
keywords: "Visual Studio Code, VSCode,TypeScript"
categories: [Angular]
tags: []
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

# Visual Studio Code #

Después de ver la cantidad de ficheros que conforman una aplicación profesional con **Angular**, la complejidad de generar elementos como componentes, módulos, etc y lo fácil que sería equivocarse y perderse desarrollando entre tanto lio... seguro que ya te has preguntado si existe algún **IDE** enfocado a **Angular** que nos pueda facilitar este trabajo.

Para los que no sepáis que es un **IDE (Integrated Development Environment)**: Un **IDE** es un **entorno de desarrollo integrado**, se trata de una aplicación informática que proporciona servicios integrales para facilitarle al programador el desarrollo de software. Normalmente, un **IDE** ofrece un **editor de código fuente, herramientas de construcción automáticas y un depurador**. La mayoría de los **IDE tienen auto-completado inteligente de código (IntelliSense)**.
 
Existen en el mercado gran variedad de editores que podríamos usar con **Angular 2**:

Editores ligeros como **[Sublime](https://www.sublimetext.com/ "sublime")**, **[Atom](https://atom.io/ "Atom")** o **[Brackets](http://brackets.io/ "Brackets")**, que disponen de variedad de plugins para usar **ES6** o **[TypeScript](http://www.typescriptlang.org/ "TypeScrip")**, **snippets**, etc.

Pero personalmente creo que el editor ideal para trabajar con el **framework Angular 2** es **[Visual Studio Code](https://code.visualstudio.com/ "Visual Studio Code")** de Microsoft (**VSCode** para los amigos). Esto es así primero porque está desarrollado por Microsoft para tal fin y son los mismos que han desarrollado **[TypeScript](http://www.typescriptlang.org/ "TypeScrip")**, además es una herramienta gratuita, open source y multiplataforma…

## Instalando Visual Studio Code ##

Nos vamos a la web de **[Visual Studio Code](https://code.visualstudio.com/ "Visual Studio Code")** y además de información con todas sus bondades, tenemos el enlace para bajarnos el paquete en función de nuestro S.O. El instalable se descarga, doble click, y listo. El proceso es de lo más simple.

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/visual-studio-download.png" class="img-thumbnail" alt="visual studio download"/>
</div>

## Principales características o features ##

- **IntelliSense**: Autocompletar, contexto, información de la variable/método/clase que hemos seleccionado. Su sistema **IntelliSense** es muy potente y detecta las librerías importadas, nos muestra la definición de los métodos al ponernos encima con el cursor, nos oferece autocompletado al escribir…

- **Gestor de Git**: integrado en el propio **IDE** un **gestor de Git** que te muestra los cambios de código e incluso desde donde puedes hacer **commit, pull y push** es un plus para muchos developers.

- **Cursores múltiples**: facilidad para realizar selecciones en vertical o multiplicar el cursor y poder editar en varios sitios a la vez.
**VSCode** ofrece cantidad de estas opciones, solo necesitas saber la combinación adecuada de teclas. Las principales:

	- **Ctrl + Shift + L**: Si estás encima de una palabra o seleccionas una frase y tocas esta combinación de teclas, seleccionarás todas las instancias de esa palabra/frase que hayan en tu documento (poniendo múltiples cursores, uno al principio de cada una de ellas).

	- **Shift + Alt + Up/Down**: Si seleccionas Shift + Alt y te mueves hacia arriba o abajo con las flechas del teclado, multiplicarás el cursor en vertical.

	- **Shift + Alt + Drag**: Si seleccionas Shift + Alt y arrastras con el ratón, crearás una selección vertical.

	- **Ctrl + D**: Selecciona la palabra sobre la que tienes el cursor. Una vez seleccionada:

		- **Ctrl + D**: Selecciona también la siguiente palabra idéntica
		
		- **Ctrl + K**: Deselecciona la actual y selecciona la siguiente palabra idéntica.
		
		- **Seleccionar todos al hacer una búsqueda**: Relacionado con el anterior, podemos utilizar el buscador para encontrar una palabra, y haciendo **Alt + ENTER**, se seleccionan todas las ocurrencias de dicha palabra en el archivo.

## Terminal integrado ##

En la nueva release de **VSCode** puedes abrir tu terminal de línea de comandos integrado dentro del entorno de **VSCode** con una combinación de teclas `Ctrl + Shift + P`. Desde aquí puedes desde instalar extensiones.......... 

## Extensible y configurable ##

Una de las ventajas de que sea Open Source es que puedes manipular el código a tu antojo si lo necesitas. No deberías tener que llegar a ese extremo, ya que tiene varios archivos de configuración para personalizar cantidad de cosas y hay una gran cantidad de extensiones para personalizar tu entorno.

## Instalación de extensiones ##

Todas las extensiones de **VSCode** se instalan seleccionando el icono en forma de cuadrado.

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/vscode-extensiones.png" class="img-thumbnail" alt="vscode extensiones"/>
</div>

Una vez estamos en la terminal de comandos, Escribimos el nombre de la extensión y te aparecerán las coincidencias, cuando encontremos la extensión, la seleccionamos y hacemos click en el botón de instalar. Después de instalar la extensión, **VSCode** nos pedirá de forma reiniciar la vista para cargar el nuevo plugin. Un click y listo.

## Extensiones de VSCode para hacerte la vida más fácil ##

- **[RelativePath](https://marketplace.visualstudio.com/items?itemName=jakob101.RelativePath "RelativePath")** es una extensión que indexa los archivos del proyecto para autocompletar las rutas locales que escribimos (en los imports de código, por ejemplo). Allí donde queramos incluir un path relativo, clickamos la combinación de teclas `Ctrl + Shift + H` y se abrirá un desplegable con los archivos del proyecto y una caja de búsqueda en la que podemos empezar a escribir para filtrar. Seleccionamos el archivo que queremos incluir y nos aparece su path relativo en el editor, ahí donde habíamos colocado el cursor.

- **[TSLint](https://marketplace.visualstudio.com/items?itemName=eg2.tslint "TSLint")** es una herramienta que revisa nuestro código mientras lo editamos, para asegurar que usamos buenas prácticas. Requiere tener instalado a nivel local tslint y su dependencia typescript a nivel global.

	Vamos al terminal, y escribimos:

    $  npm install -g tslint typescript
    
    $  npm install tslint

	En la barra inferior de VSCode, a la izquierda, aparecen los símbolos de error (una X), y de aviso (una exclamación). Al hacer click te muestran los errores o mejoras que nos propone el propio **VSCode**, o **tslint**.

- **[Angular2 TypeScript snippets](https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2 "Angular2 TypeScript snippets")** proporciona fragmentos predefinidos de código para las tareas más básicas a desarrollar en Angular 2 como componentes, servicios, etc.

	Los snippets empiezan por ng2. Solo tienes que empezar a escribir y seleccionar el snippet deseado haciendo ENTER: ¡Tu archivo se llena de código como por arte de magia!

	<div style="text-align: center;">
		<img src="{{ site.baseurl }}static/img/blog/angular/typescript-snippets-vscode.gif" class="img-thumbnail" alt="typescript snippets vscode"/>
	</div>

	**Lista de principales TypeScript Snippets**:

	- ng2-component-root
	- ng2-bootstrap
	- ng2-component
	- ng2-pipe
	- ng2-route-config
	- ng2-route-path
	- ng2-service
	- ng2-subscribe
	
	**Lista de principales HTML Snippets**:

	- ng2-ngClass
	- ng2-ngFor
	- ng2-ngIf
	- ng2-ngModel
	- ng2-routerLink
	- ng2-ngStyle
	- ng2-ngSwitch

- **[Debugger for Chrome](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome "Debugger for Chrome")** extensión para debugar desde el propio **IDE VSCode** lo que estás ejecutando en Chrome. Creas puntos de interrupcion, hacemos click en el icono de debugger y seleccionando la rueda tipo settings elegimos la opción Chrome. Nos abre el archivo de configuración.

<div style="text-align: center;">
	<img src="{{ site.baseurl }}static/img/blog/angular/vscode-debugger-for-chrome.gif" class="img-thumbnail" alt="VS Code - Debugger for Chrome"/>
</div>



Es importante que tengamos la configuración como se muestra en la imagen teniendo en cuenta que nos centraremos en la opción **Launch localhost with sourcemaps**. La url tiene que coincidir con la URL en la que estés ejecutando tu servidor en local.

También será imprescindible que utilices **SourceMaps**. Esto es una herramienta de HTML5 que mapea el código minificado (en este caso TypeScript compilado y transpilado a plain javascript) con el código original (TypeScript). Muchos boilerplates que se utilizan como punto de partida de la app (como el Angular 2 Quick Start) ya lo incorporan.

Visual Studio Code Chrome Debugger


> Es importante que antes de ejecutar el debugger cierres completamente Chrome

Lo único que tienes que hacer entonces es:

1. Cierra todos los procesos de Chrome (hangouts incluido)
1. npm start (o lo que utilices para lanzar tu servidor en local)
1. Ves a la vista de debug de VSCode
1. Añade los breakpoints que quieras
1. Asegurarte de que la url del archivo de configuración coincide con la de tu servidor
1. Selecciona la opción Launch localhost with sourcemaps del desplegable
1. Haz click en el botón verde de ejecución
1. Eso debería lanzar una ventana de Chrome en la url base del servidor que estás ejecutando en local, con tu app cargada, y vinculada a tu debugger.




http://www.genbetadev.com/herramientas/eramos-pocos-y-pario-microsoft-visual-studio-code
http://www.genbeta.com/actualidad/asi-si-microsoft-visual-studio-code-gratuito-y-tambien-disponible-en-linux-y-os-x


## Referencias ##

[https://blogs.msdn.microsoft.com/vscode/2015/05/21/getting-started-with-angular-and-visual-studio-code/](https://blogs.msdn.microsoft.com/vscode/2015/05/21/getting-started-with-angular-and-visual-studio-code/ "https://blogs.msdn.microsoft.com/vscode/2015/05/21/getting-started-with-angular-and-visual-studio-code/")

[https://code.visualstudio.com/Docs/languages/javascript](https://code.visualstudio.com/Docs/languages/javascript "https://code.visualstudio.com/Docs/languages/javascript")







[https://marketplace.visualstudio.com/items?itemName=jakob101.RelativePath](https://marketplace.visualstudio.com/items?itemName=jakob101.RelativePath "https://marketplace.visualstudio.com/items?itemName=jakob101.RelativePath")

[https://marketplace.visualstudio.com/items?itemName=eg2.tslint](https://marketplace.visualstudio.com/items?itemName=eg2.tslint "https://marketplace.visualstudio.com/items?itemName=eg2.tslint")

[https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2](https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2 "https://marketplace.visualstudio.com/items?itemName=johnpapa.Angular2")

[https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome "https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome")