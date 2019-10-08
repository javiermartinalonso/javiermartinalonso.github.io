---
layout: post
sections: [vagrant]
title:  "VagrantFile"
date:   2018-02-09
desc: "VagrantFile es un script que le indica al motor de vagrant como debe montar una máquina virtual. Los scripts Vagrantfiles están destinados a ser comprometidos directamente bajo el control de versiones. La idea es que cuando un desarrollador sincroniza su fichero vagrantfile, simplemente con lanzar el comando vagrant up obtiene un entorno virtual totalmente aprovisionado para desarrollar ese producto."
keywords: "vagrant, Vagrantfile, virtualización, maquina_virtual"
categories: [DevOps, DevOps/vagrant]
tags: [vagrant, Vagrantfile, virtualización, maquina_virtual]
icon: fab fa-vuejs
image: static/img/blog/vagrant/vagrant-logo.png
---

El **Vagrantfile** es un archivo de Ruby utilizado para configurar **Vagrant** por proyecto. La función principal de **Vagrantfile** es describir las máquinas virtuales necesarias para un proyecto, así como la forma de configurar y aprovisionar estas máquinas.

Los scripts **Vagrantfiles** están destinados a ser comprometidos directamente bajo el control de versiones. La idea es que cuando un desarrollador sincroniza su fichero **vagrantfile**, simplemente con lanzar el comando `vagrant up` obtiene un entorno virtual totalmente aprovisionado para desarrollar ese producto.
<!--more-->

# VagrantFile #

Para montar una máquina virtual con **Vagrant** tenemos que tener obligatoriamente un archivo llamado **Vagrantfile**. La sintaxis del script **Vagrantfile** es Ruby , pero el conocimiento del lenguaje de programación Ruby no es necesario para realizar modificaciones en el **Vagrantfile**, ya que es en su mayoría sólo se realizan asignaciones simples de variables. Este fichero define:

- El **box que servirá de plantilla** de la máquina virtual.
- Las **características de la máquina virtual**.
- Conjunto de **comandos que queremos que se ejecuten al crear la máquina**. Suelen ser los pasos de instalación de aplicaciones y copias de datos desde carpetas compartidas en la máquina host a la máquina virtual.

Este fichero lo creamos con el comando:

		vagrant init

Por defecto viene con un contenido bastante extenso a modo orientativo, pero casi todo está comentado. Veamos sólo el contenido no comentado:

		Vagrant.configure("2") do |config|
		  config.vm.box = "base"
		end

A continuación veamos como modificar este fichero para personalizar la imagen virtual que queremos se cree automáticamente con vagrant.

- **Sistema operativo**. En el fichero **Vagrantfile** anterior podemos ver que `"base"` es el nombre del ***box*** del que partiremos para instalar el so de la máquina virtual. Este debe existir en algunos de los ***portales de boxes*** indicados en el apartado anterior, corresponderá con el sistema operativo a instalar.

	Por ejemplo si quisiéramos instalar una maquina virtual ***ubuntu/xenial64 en virtualBox*** podríamos buscar en el [portal de Boxes](https://app.vagrantup.com/boxes/search) y llegaríamos a [esta página](https://app.vagrantup.com/ubuntu/boxes/xenial64 "ubuntu/xenial64") donde nos indicarían que cambiáramos `"base"` por `"ubuntu/xenial64"` así

		config.vm.box = "ubuntu/xenial64"

- **Redireccionamiento de puertos**. Imáginemos que tenemos una maquina virtual con un servidor que escucha en el puerto 80, pero si intentamos acceder a `http://localhost:80`, no funcionará. Para que funcione bien tenemos que hacer un redireccionamiento de puertos, es decir, que simularemos que el puerto 8080 (es el que suelo utilizar cuando desarrollo) es el 80 de la máquina virtual. Añadimos la siguiente línea:

		config.vm.network "forwarded_port", guest: 80, host: 8080

- **Red privada**. Si en lugar de acceder por `localhost`, queremos hacerlo por IP, añadimos lo siguiente:

		config.vm.network "private_network", ip: "192.168.33.10"

- **Red Publica**. Configura la máquina virtual para crear un ***adaptador puente de red*** de modo que la máquina virtual pueda ser accesible desde la red pública a la que está conectado el host.

		config.vm.network "public_network"

- **Carpetas compartidas**. Por defecto la máquina virtual que se cree, tendrá compartida la carpeta `/vagrant` con la carpeta del host donde se encuentra el fichero **Vagrantfile**. Para sincronizar otras carpetas del host con una dentro de la imagen virtual, podemos escribir una línea semejante a esta:

		config.vm.synced_folder "./backup", "/vagrant_data"
	
    La anterior línea hará que el contenido del subdirectorio de la máquina host `./backup` (siendo la raíz el directorio donde se encuentra nuestro Vagrantfile) sea accesible por la máquina virtual en la ruta `/vagrant_data`.

	> El primer parámetro es una ruta a un directorio en la máquina host. Si la ruta es relativa, es relativa a la raíz del proyecto. El segundo parámetro debe ser una ruta absoluta de dónde compartir la carpeta dentro de la máquina invitada. Esta carpeta se creará (recursivamente, si es necesario) si no existe.

- **Configurar características de la máquina virtual en virtualBox**. Por ejemplo para modificar la memoria asignada a la máquina indicando que sea de 2GB:

		config.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
		end

- **Instalar aplicaciones en la imagen virtual**. Podemos definir los comandos a ejecutarse tras la creación de la imagen para ***aprovisionar la imagen con las aplicaciones necesarias***.

	Por ejemplo si queremos ***instalar Docker en la imagen virtual*** como ya vimos en un post anterior **[Instalar Docker Ubuntu]({{ site.baseurl }}devops/devops/docker/2017/09/18/docker-Instalar-dockers-en-ubuntu.html "Instalar docker en ubuntu")** Podriamos añadir lo siguiente:

		config.vm.provision "shell", inline: <<-SHELL
			apt-get update
			apt-get install apt-transport-https ca-certificates curl software-properties-common
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
			sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
			apt-get update
			apt-get install -y docker-ce
			
			#Añada al usuario al grupo docker.
			sudo usermod -aG docker $USER	
		SHELL

	También podriamos crear un nuevo archivo de scripting con extensión `.sh`. Esto le indicará a **Vagrant** que debe hacer uso de la herramienta nativa `Shell`, y ejecutar todos los comandos agregados al archivo `.sh`  para que se ejecute junto con la provisión de la máquina. Sustituiriamos todo el bloque anterior por algo similar a esto:

		config.vm.provsion "shell", path: "bootstrap.sh"

	> El nombre del fichero no es obligatorio que sea `bootstrap.sh` puede ser el que quieras, solo debes mantener la terminarción `.sh` para que pueda ser un fichero de scripting en linux.

El fichero Vagrantfile quedaría así:

	Vagrant.configure("2") do |config|

		config.vm.box = "ubuntu/xenial64"
		
		config.vm.network "forwarded_port", guest: 80, host: 8080
		config.vm.network "private_network", ip: "192.168.33.10"
		  
		config.vm.network "public_network"

		config.vm.synced_folder "./backup", "/vagrant_data", create: true

		config.vm.provider "virtualbox" do |vb|
			vb.memory = "2048"
		end

		config.vm.provision "shell", inline: <<-SHELL
			apt-get update
			apt-get install apt-transport-https ca-certificates curl software-properties-common
			curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
			sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
			apt-get update
			apt-get install -y docker-ce
			
			#Añada al usuario al grupo docker.
			sudo usermod -aG docker $USER	
		SHELL
	end

Puedes consultar más en detalle como configurar el fichero Vagrantfile en la [documentación oficial](https://www.vagrantup.com/docs/vagrantfile/ "www.vagrantup.com/docs/vagrantfile/").

Sigue por aquí para saber más sobre ***[Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")***.

## Referencias ##

[artículos sobre Vagrant]({{ site.baseurl }}DevOps/vagrant "artículos sobre Vagrant")

[Vagrant](https://www.vagrantup.com "vagrant")

[documentación oficial vagrantfile](https://www.vagrantup.com/docs/vagrantfile/ "www.vagrantup.com/docs/vagrantfile/")