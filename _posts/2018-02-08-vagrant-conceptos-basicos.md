---
layout: post
sections: [vagrant]
title:  "Conceptos básicos"
date:   2018-02-08
desc: "Veremos los conceptos básicos que hay que conocer sobre vagrant antes de empezar a trabajar con esta herramienta."
keywords: "vagrant, box, vagrantfile, virtualización, maquina_virtual"
categories: [DevOps, DevOps/vagrant]
tags: [vagrant, box, vagrantfile, virtualización, maquina_virtual]
icon: fab fa-vuejs
image: static/img/blog/vagrant/vagrant-logo.png
---

***Vagrant es una herramienta para crear y configurar máquinas virtuales para entornos de desarrollo portables y reproducibles, de manera automática.***

Para trabajar con ***Vagrant*** necesitamos instalar, por un lado el software de virtualización y por otro lado el propio ***Vagrant***.

En cuanto al ***software de virtualización*** nos decantaremos por **VirtualBox**, ya que es gratuito y multiplataforma. Obtenerlo es tan fácil como ir a la página de **VirtualBox** [virtualbox.org](https://www.virtualbox.org/ "virtualbox.org") y en la sección de downloads escoger la de nuestro sistema operativo.

<!--more-->

Para instalar ***Vagrant*** también tenemos versiones para cada sistema operativo, de nuevo es tan sencillo como ir a la página de ***[vagrantup.com](https://www.vagrantup.com/ "vagrantup.com")*** y seleccionar la descarga que se ajusta a nuestro sistema. También es un software gratuito.

La instalaciones de ambas herramientas se realizan con wizards muy sencillos de seguir.

Tras la instalación de vagrant, para comprobar que está instalado correctamente podemos ejecutar desde línea de comandos:

		$ vagrant -v

Y tendremos que ver que en la terminal se muestra la versión actual, con algo similar a esto:

		Vagrant 2.0.2


# Boxes cajas #

En lugar de construir una máquina virtual desde cero, lo que sería un proceso lento y tedioso, **Vagrant** ***usa una imagen base para clonar rápidamente una máquina virtual***. Estas imágenes base se conocen como **boxes**, "cajas", en **Vagrant**. Especificar el box a usar para su **entorno Vagrant** ***es siempre el primer paso después de crear un nuevo Vagrantfile***.

## Portales de Cajas (box) para vagrant ##

Podemos ver las box disponibles de vagrant en los siguientes portales:

- [vagrantbox](http://www.vagrantbox.es/ "vagrantbox.es")

- [app.vagrantup.com/boxes](https://app.vagrantup.com/boxes/search "app.vagrantup.com/boxes")

Desde ellos podemos acceder a la web de cada box, donde se explica que caracteristicas tiene el box, como instalarlo etc.

# VagrantFile #

El **Vagrantfile** es un archivo de Ruby utilizado para configurar **Vagrant** por proyecto. La función principal de **Vagrantfile** es describir las máquinas virtuales necesarias para un proyecto, así como la forma de configurar y aprovisionar estas máquinas.

Los scripts **Vagrantfiles** están destinados a ser comprometidos directamente bajo el control de versiones. La idea es que cuando un desarrollador sincroniza su fichero **vagrantfile**, simplemente con lanzar el comando `vagrant up` obtiene un entorno virtual totalmente aprovisionado para desarrollar ese producto.

Para montar una máquina virtual con **Vagrant** tenemos que tener obligatoriamente un archivo llamado **Vagrantfile**. La sintaxis del script **Vagrantfile** es Ruby , pero el conocimiento del lenguaje de programación Ruby no es necesario para realizar modificaciones en el **Vagrantfile**, ya que es en su mayoría sólo se realizan asignaciones simples de variables. Este fichero define:

- El **box que servirá de plantilla** de la máquina virtual.
- Las **características de la máquina virtual**.
- Conjunto de **comandos que queremos que se ejecuten al crear la máquina**. Suelen ser los pasos de instalación de aplicaciones y copias de datos desde carpetas compartidas en la máquina host a la máquina virtual.


Sigue por aquí para saber más sobre ***[Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")***.

## Referencias ##

[artículos sobre Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")

[Vagrant](https://www.vagrantup.com "vagrant")

[getting-started](https://www.vagrantup.com/intro/getting-started/index.html "getting-started")