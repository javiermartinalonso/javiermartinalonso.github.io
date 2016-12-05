---
layout: post
section: "Angular"
title:  "Instalacion NodeJs y NPM"
date:   2016-12-06
desc: "Información sobre como instalar NodeJs y NPM"
keywords: "node.js,npm"
categories: [Angular]
tags: [node.js,npm"]
icon: fa-font
image: static/img/blog/angular/angular-logo_150.png
---

# Instalación #

### Instalación de Node.js ###

Si está utilizando OS X o Windows, la mejor manera de instalar Node.js es utilizar uno de los [instaladores de la página de descarga Node.js](https://nodejs.org/en/download/ "instaladores de la página de descarga Node.js") . Si estás usando Linux, puede utilizar el programa de instalación, o se puede comprobar las [distribuciones binarias de NodeSource](https://github.com/nodesource/distributions "distribuciones binarias de NodeSource") para ver si hay o no una versión más reciente que funciona con su sistema.

Prueba: Ejecutar **`node -v`**. La versión debe ser mayor que v0.10.32.
<!--more-->

### Actualización de NPM ###

Node viene con NPM instalado por lo que debe tener una versión de la NGP. Sin embargo, la NGP se actualiza con más frecuencia que lo hace de nodo, por lo que querrá asegurarse de que es la versión más reciente.

    npm install npm@latest -g

Prueba: Ejecutar **`npm -v`**. La versión debe ser superior a 2.1.8.

## Referencias ##

[https://nodejs.org](https://nodejs.org "https://nodejs.org")

[https://docs.npmjs.com/](https://docs.npmjs.com/ "https://docs.npmjs.com/")

[https://docs.npmjs.com/getting-started/installing-node](https://docs.npmjs.com/getting-started/installing-node "https://docs.npmjs.com/getting-started/installing-node")