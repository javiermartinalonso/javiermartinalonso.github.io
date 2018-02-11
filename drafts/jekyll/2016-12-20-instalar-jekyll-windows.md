---
layout: post
section: "Jenkins"
title:  "Primeros Pasos con Jenkins"
date:   2016-12-30
desc: "Primeros Pasos con Jenkins"
keywords: ""
categories: [Jenkins]
tags: []
icon: icon-archlinux
image: static/img/blog/jenkins/jenkins-logo.png
---

https://jekyllrb.com/docs/windows/
Para instalar Jekyll en windows
-	Instalar un gestor de paquetes para Windows llamado chocolatey
	https://chocolatey.org/install

		abrir linea de comandos con permisos de administrador
			@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

-	Instalar Rubí través chocolatey:
choco install ruby -y

-	Vuelva a abrir un símbolo del sistema e instalar Jekyll: 
gem install jekyll