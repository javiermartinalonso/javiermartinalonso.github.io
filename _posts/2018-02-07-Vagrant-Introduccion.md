---
layout: post
sections: [vagrant]
title:  "¿Qué es Vagrant y por qué lo necesitas conocer?"
date:   2018-02-07
desc: "Vagrant es una herramienta DevOps imprescindible. Es open-source y nos permite automatizar la creación de maquinas virtuales para entornos de desarrollo."
keywords: "vagrant, virtualización, maquina_virtual"
categories: [DevOps, DevOps/vagrant]
tags: [vagrant, virtualización, maquina_virtual]
icon: fab fa-vuejs
image: static/img/blog/vagrant/vagrant-logo.png
---

***Vagrant es una herramienta para crear y configurar máquinas virtuales para entornos de desarrollo portables y reproducibles, de manera automática.***

***[Vagrant](https://www.vagrantup.com "vagrant")*** es un software que se posiciona en **una capa por encima del sistema de virtualización (VirtualBox, VMware, Parallels)**, creando una interfaz de configuración sencilla e independiente del sistema de virtualización. Se podría decir que es como **una línea de comandos para VirtualBox**.

***Vagrant*** es capaz de instalar y configurar una máquina virtual con un simple archivo de configuración. Es capaz de **configurar automáticamente carpetas compartidas, las conexiones SSH, crear túneles HTTP en su entorno de desarrollo, y mucho más**.

<!--more-->

Si no tienes una herramienta como ***Vagrant*** y necesitas una máquina virtual, pues te tocaría más o menos hacerlo todo desde cero con **VirtualBox** u otro software de virtualización, y configurar todo paso por paso. Tendrías que crear la máquina, buscar la imagen del sistema operativo e instalarlo desde cero, configurar la red, instalar los programas o librerías que necesitas, etc. Para esto es necesario tener conocimientos de sistemas Además si esta máquina virtual es necesaria ya no para un desarrollador sino para un equipo de desarrollo aparece el problema de sincronizar estas máquinas y configurar de nuevo la máquina en cada equipo del grupo de desarrollo.

***Vagrant*** es muy sencillo de usar y de aprender. Se convertirá en una herramienta ***DevOps*** imprescindible si eres desarrollador de software.

> **NOTA**: ***DevOps*** es un acrónimo inglés de ***development (desarrollo)*** y ***operations (operaciones)***, que se refiere a una cultura o movimiento que se centra en la comunicación, colaboración e integración entre desarrolladores de software y los profesionales en las tecnologías de la información (IT).
> 
- ***DevOps*** es una metodología para creación de software
- ***DevOps*** se basa en la integración entre desarrolladores software y administradores de sistemas.
- ***DevOps*** permite fabricar software más rápidamente, con mayor calidad, menor coste y una altísima frecuencia de releases
 
Según la filosofía ***DevOps*** debemos buscar la manera más cómoda y rápida de elaborar nuestros proyectos. Para ello, en caso de trabajar en equipo, es primordial que todos los miembros tengan configurado un entorno de trabajo idéntico en sus computadoras. Nos permitirá evitar problemas de dependencias e incompatibilidades, el típico problema de *"en mi máquina funciona"*. 

Otras ventajas que proporciona **Vagrant** son:

- Necesitamos **montar un entorno entero de trabajo rápidamente**, para hacer un prototipo y no queremos perder tiempo y esfuerzo en configurar máquinas, aplicaciones, servidores y librerías que necesitamos.

- El automatizar dicho montaje a través de una herramienta también sirve para **documentar un entorno**.

- Si necesitamos **cambiar y configurar** a menudo **nuestro entorno de trabajo**, esta herramienta es ideal. Simplemente con guardar las carpetas compartidas en un repositorio, podemos destruir nuestro entorno de trabajo y levantar otro entorno de manera automática mientras aprovechamos para irnos a tomar un café.

Se nos podrían ocurrir muchisimas más, en fin el límite es nuestra imaginación!!!

# Vagrant vs. Docker #

Es muy habitual confundir conceptos y comparar estas 2 herramientas de DevOps, pero su fin es bien distinto. ***Vagrant*** ***se usa para configurar máquinas virtuales*** y **Docker** para ***crear contenedores***. Vamos a repasar estos conceptos para entenderlo mejor: 

- ***Vagrant*** está orientado a la ***creación y gestión sencilla de entornos de trabajo de desarrollo "portables y replicables"*** que funcionan sobre tecnologías de virtualización conocidas, ofreciendo además un modo de trabajo claro para poder transportar dichos entornos de desarrollo y que funcionen sin problemas en cualquier otra máquina.

	>  ***¡Atención!*** ***Vagrant no está pensado para usarse en producción.***

- **Docker** está orientado a la ***creación de contenedores ligeros y portables para cualquier aplicación, asegurándonos que va a funcionar exactamente de la misma manera en cualquier máquina que se ejecute***. Su uso es acto para entornos de producción.

Luego si lo hemos entendido bien veremos que ambas herramientas ni son competidoras ni son excluyentes de usar una u otra en un entorno **DevOps**. Ambas herramientas son excelentes para entornos de desarrollo y de pruebas. Es más ***Vagrant*** viene con soporte para usar un proveedor docker por defecto [https://www.vagrantup.com/docs/docker/](https://www.vagrantup.com/docs/docker/ "https://www.vagrantup.com/docs/docker/").

Por ejemplo, si tenemos una máquina windows que no puede ejecutar contenedores Linux de forma nativa y queremos un entorno de desarrollo con **dockers**. ***Con Vagrant podemos activar una "máquina virtual anfitriona" para ejecutar Docker***. **Vagrant** activará una única instancia de una máquina virtual anfitriona y ejecutará varios contenedores en esta máquina virtual. Esto significa que con **vagrant**, solo tiene la sobrecarga de una máquina virtual, y sólo si es absolutamente necesario.

> Para entrar en una comparación más igualitaria, **no compararía Vagrant con Docker, sino que compararía Vagrant con Boot2Docker**, la herramienta que permite ejecutar **Docker** en máquinas Windows y MacOs.
>
> Como hemos visto si necesitas ejecutar **contenedores de Docker **sobre sistemas windows o MacOs, ***tienes que crearte una máquina virtual con Linux o usar Boot2Docker***.
>
> **Boot2Docker es una maquina virtual Linux, con los artefactos docker (docker machine, docker engine...) necesarios para poder ejecutar Docker**.
>
> Sigue por aquí para saber más sobre ***[docker]({{ site.baseurl }}DevOps/docker/ "artículos sobre docker")***.

Sigue por aquí para saber más sobre ***[Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")***.

## Referencias ##

[Vagrant](https://www.vagrantup.com "vagrant")