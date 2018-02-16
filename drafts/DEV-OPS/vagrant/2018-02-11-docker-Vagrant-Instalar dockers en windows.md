---
layout: post
sections: [docker]
title:  "Crear un entorno de desarrollo Docker con vagrant"
date:   2018-02-11
desc: "Procedimiento de instalación de Docker en una máquina virtual Ubuntu gestionando su creación con vagrant."
keywords: "Dockers,vagrant"
categories: [DevOps, DevOps/docker]
tags: [Dockers,vagrant]
icon: fab fa-docker
image: static/img/blog/docker/docker-logo.png
---

[https://www.vagrantup.com/docs/docker/](https://www.vagrantup.com/docs/docker/ "https://www.vagrantup.com/docs/docker/")
https://blog.scottlowe.org/2015/02/10/using-docker-with-vagrant/
http://activelamp.com/blog/devops/docker-with-vagrant/

Si tengo una máquina Windows o MacOs y quiero usar **Docker**, como **Docker** solo se ejecuta sobre **Linux**, tengo como alternativas:

– Utilizar ***[Boot2Docker]({{ site.baseurl }}devops/devops/docker/2017/09/25/docker-Instalar-dockers-toolbox-en-windows.html "Instalar dockers toolbox en windows")***.

– Montar una ***[máquina virtual Linux y ejecutar Docker]({{ site.baseurl }}devops/devops/docker/2017/09/18/docker-Instalar-dockers-en-ubuntu.html "Instalar dockers toolbox en ubuntu")***.

– Utilizar **Vagrant** para montar una máquina virtual Linux y sobre ella ejecutar los contenedores de Docker.

Las dos primeras opciones ya las hemos estudiado en post anteriores, así que ahora nos centraremos en la última opción usando vagrant.

<!--more-->

# Máquina utilizada para el tutorial #

- Sistema operativo: ***Wndows 8.1 Pro x64***. 

- Procesador: **64bits**.

- Memoria: **16GB**.

# Requisitos del sistema operativo #

Es necesario tener una herramienta de virtualización instalada en nuestro caso usaremos: ***VirtualBox 5.2.6.*** y tener ***[Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")*** instalado.

Para ***instalar Docker CE***, ***necesita la versión de 64 bits de una de estas versiones de Ubuntu***:

- Zesty 17.04
- Yakkety 16.10
- Xenial 16.04 (LTS)
- trusty 14.04 (LTS)

El sistema operativo virtual elegido será Xenial 16.04 (LTS) es decir un Ubuntu Server 16.04 de 64 bits. Es una versión de soporte a largo plazo

# Video explicativo #

<div class="delimitador-multimedia">
    <div class="contenido-multimedia">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/JwqkjKkEIDw" frameborder="0" allowfullscreen></iframe>
    </div>
</div>

La última versión de **Vagrant** se envía con un ***[proveedor Docker incorporado](https://www.vagrantup.com/docs/provisioning/docker.html "Docker Provisioner")***, para que pueda administrar los contenedores Docker a través del Vagrantfile. 

El ***aprovisionador de Vagrant Docker*** puede:
- Instalar automáticamente **Docker**.
- Extraer contenedores de **Docker**.
- Configurar ciertos contenedores para que se ejecuten al arrancar.

El **aprovisionador de Docker** es ideal para las organizaciones que usan **Docker** como medio para distribuir cosas como sus aplicaciones o servicios. O bien, si está comenzando con **Docker**, **el aprovisionador de Docker** le ofrece la manera más fácil de comenzar a utilizar **Docker**, ya que ***el proveedor automatiza la instalación de Docker por usted***.

Para instalar docker en el box indicado, basta con incluir la siguiente línea en el archivo **Vagrantfile**:

		config.vm.provision "docker"

Esto asegura que **Docker** esté instalado en el host cuando se ejecuta `vagrant up`.

Su **Vagrantfile** debe verse algo así (con todos los comentarios eliminados):

		Vagrant.configure(2) do |config|
		  config.vm.box = "ubuntu/xenial64"
		  config.vm.hostname = "docker-host"
		  config.vm.provision "docker"
		end

Veamos otro ejemplo, aquí se explica cómo configurar **Docker** para ejecutar un contenedor con el directorio compartido de **Vagrant** montado dentro de él:

		Vagrant.configure("2") do |config|
			config.vm.provision "docker" do |d|
				d.run "ubuntu/xenial64",
				cmd: "bash -l",
				args: "-v '/vagrant:/var/www'"
			end
		end

> Nota: Este post no pretende recorrer los fundamentos de **Vagrant**, para obtener más información sobre cómo configurar **Vagrantfile**, consulte [post anteriores]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant").

# Conclusión #

Como puede ver, no tiene que usar ***Boot2Docker*** o ***Kitematic*** para ejecutar **Docker** localmente en sistemas windows o MacOs. 

Aconsejaría que ***si sólo quieres descubrir cómo funciona Docker***, entonces deberías usar uno de estos paquetes. Pensando a más largo plazo, su ***host Docker local debe ser administrado de la misma manera en que se administran los host Docker de producción***. El uso de **Vagrant**, en lugar de **Boot2Docker** o **Kitematic**, me permite administrar mi host **Docker** local de forma similar a cómo administraría los hosts **Docker** de producción con herramientas como Chef, Puppet o Ansible.

## Referencias ##

[artículos sobre Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")

[proveedor Docker incorporado](https://www.vagrantup.com/docs/provisioning/docker.html "Docker Provisioner")