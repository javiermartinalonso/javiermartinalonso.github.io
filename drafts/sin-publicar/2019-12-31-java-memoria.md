---
layout: post
sections: [JAVA]
title:  "Variables de entorno de JAVA"
date:   2016-11-06
desc: "Variables de entorno de JAVA"
keywords: "java,jdk,instalación,windows,JAVA_HOME,PATH"
categories: [java]
tags: [java,JDK,JAVA_HOME]
icon: icon-java-bold
image: static/img/blog/java/java-logo.png
---





<!--more-->


http://philip.yurchuk.com/software/optimal-jvm-settings-for-sts/
https://jesuslc.com/2012/11/03/como-dar-mas-memoria-a-eclipse/

http://tirandolineasdecodigo.blogspot.com.es/2014/05/eclipse-aumentando-su-rendimiento.html

http://java-white-box.blogspot.com.es/2012/04/configuracion-eclipseini-eclipse.html



STS.ini

		-clean
		-startup
		plugins/org.eclipse.equinox.launcher_1.3.100.v20150511-1540.jar
		--launcher.library
		plugins/org.eclipse.equinox.launcher.win32.win32.x86_64_1.1.300.v20150602-1417
		-product
		org.springsource.sts.ide
		--launcher.defaultAction
		openFile
		--launcher.XXMaxPermSize
		1024M
		-vmargs
		-Dosgi.requiredJavaVersion=1.7
		-Xms1024m
		-XX:MaxPermSize=2018m
		-Xverify:none
		-Dorg.eclipse.swt.browser.IEVersion=10001
		-Xmx2400m



## Referencias ##
