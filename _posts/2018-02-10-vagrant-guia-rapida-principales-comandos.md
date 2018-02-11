---
layout: post
sections: [vagrant]
title:  "Guía Rápida de trabajo y principales comandos"
date:   2018-02-10
desc: "Vamos a crear una máquina virtual con vagrant y repasar los principales comandos de la herramienta."
keywords: "vagrant, virtualización, maquina_virtual"
categories: [DevOps, DevOps/vagrant]
tags: [vagrant, virtualización, maquina_virtual]
icon: fab fa-vuejs
image: static/img/blog/vagrant/vagrant-logo.png
---

Veamos como se trabaja con vagrant y repasemos sus principales comandos.

Partimos de una carpeta vacía donde queramos trabajar por ejemplo `C:/vagrant/vagrantLab` y aquí desde la línea de comandos seguimos estos pasos:
<!--more-->

- **Obtener el Vagrantfile**: tenemos varias opciones para obtener el ***Vagrantfile***: 


	1. Podemos tener ya un fichero ***Vagrantfile*** que nos hayan compartido nuestro equipo de desarrollo  Lo copiamos directamente en la carpeta anterior.

	2. Podemos generar un nuevo fichero ***Vagrantfile vacío***.

			$ vagrant init

		Y luego modificar el fichero, según hemos indicado en el [anterior post]({{ site.baseurl }}vagrant/2018/02/10/vagrant-vagrantfile.html "vagrant vagrantfile") para personalizar la máquina virtual a crear.

	3. También podemos **obtener un Vagrantfile apuntando al box concreto que hemos buscado antes**, simplemente tienes que poner el nombre o la URL al final.

		$ vagrant init ubuntu/xenial64


- **listar las cajas descargadas en el equipo**:

		$ vagrant box list

- **Arranca una máquina virtual**. En el directorio tiene que haber un archivo Vagrantfile:

		$ vagrant up

- **Para entrar por SSH a la máquina**: Vagrant usa automáticamente sus claves ssh y las copia en la máquina virtual, es por eso que no es necesario autenticarse con usuario y contraseña, ni es necesario conocer la ip.

		$ vagrant ssh

	> Para salir de la sesión se podría salir con `exit`.

- **Poner la máquina en estado de suspensión**. Guarda el estado de la máquina virtual y temporalmente cierra la máquina virtual.

		$ vagrant suspend

- **Levantar un máquina pausada**. Si hemos suspendido la máquina pero queremos volver a restaurarla en el punto donde la dejamos, ejecutamos el siguiente comando:

		$ vagrant resume

- **Apagar la máquina**:

		$ vagrant halt

- **Consultar el estado de la máquina (apagada, ejecutándose o en modo suspensión)**:

		$ vagrant status

- **Reprovisionar la maquina**. Volver a ejecutar tu script de arranque (si lo has actualizado) sin tener que crear la máquina virtual desde cero. Por ejemplo porque le has cambiado la cantidad de memoria asignada.

		$vagrant provision

- **Resetear la máquina virtual a su estado inicial** y vuelve a lanzar el script de arranque.

		$ vagrant reload

- **Destruir la máquina**. Borra la máquina y el disco virtual creado, aunque conserva el box de inicio.:

		$ vagrant destroy

> ***¡Atención! Este comando no apaga la máquina, sino que la elimina y borra todos los datos.***

La guía completa de comandos de Vagrant la puedes encontrar [aquí](https://www.vagrantup.com/docs/cli/ "Comandos Vagrant")

Sigue por aquí para saber más sobre ***[Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")***.

## Referencias ##

[artículos sobre Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")

[Vagrant](https://www.vagrantup.com "vagrant")

[Comandos Vagrant](https://www.vagrantup.com/docs/cli/ "Comandos Vagrant")