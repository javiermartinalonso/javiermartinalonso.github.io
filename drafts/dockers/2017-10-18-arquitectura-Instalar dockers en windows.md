---
layout: post
section: "ARQUITECTURA"
title:  "Instalar Docker Windows"
date:   2016-11-02
desc: "Procedimiento de instalación de Docker en Windows"
keywords: "Dockers, Windows"
categories: [arquitectura]
tags: [Dockers, Windows]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

https://docs.docker.com/docker-for-windows/install "docker-for-windows"

# Instalar Docker para Windows #


***Docker para Windows*** es una aplicación ***Docker Community Edition (CE)***. El paquete de instalación de ***Docker*** para Windows incluye todo lo que necesita para ***ejecutar Docker en un sistema Windows***. En este tema se describen las consideraciones previas a la instalación y ***cómo descargar e instalar Docker para Windows***.

Lo que incluye la instalación de Docker para Windows : La instalación proporciona Docker Engine , Docker CLI, Docker Compose , Docker Machine y Kitematic .


Docker para Windows requiere 64 bits de Windows 10 Pro y Microsoft Hyper-V. Consulte Qué saber antes de instalar para obtener una lista completa de los requisitos previos.

Puede cambiar entre versiones de Edge y Stable, pero sólo debe tener instalada una aplicación a la vez. Además, tendrá que guardar las imágenes y exportar contenedores que desee conservar antes de desinstalar la versión actual antes de instalar otra. Para obtener más información sobre esto, consulte las 






¿Ya tiene Docker para Windows? Si ya tiene Docker para Windows instalado y está listo para empezar, vaya a Comenzar con Docker para Windows para un recorrido rápido de la línea de comandos, la configuración y las herramientas.
¿Está buscando las notas de la versión? Obtenga notas de la versión para todas las versiones aquí .
Descargar Docker para Windows
Si aún no lo ha hecho, instale Docker para Windows. Puede descargar instaladores del canal Estable o Borde .

Los instaladores de Stable y Edge vienen con funciones experimentales en Docker Engine habilitadas por defecto y configurables en las preferencias de Docker Daemon para el modo experimental. Le recomendamos que deshabilite las funciones experimentales de las aplicaciones en producción.

En ambos canales, agradecemos sus comentarios para ayudarnos a medida que evolucionan las aplicaciones.

Para obtener más información sobre los canales Stable y Edge, consulte las preguntas más frecuentes .

Canal estable	Canal de borde	Instalador de Edge Legacy
Este instalador está totalmente al horno y probado. Este es el mejor canal a utilizar si desea que funcione una plataforma fiable. Estos lanzamientos siguen las versiones estables de Docker Engine. 

En este canal, puede seleccionar si desea enviar estadísticas de uso y otros datos. 

Las compilaciones estables se liberan una vez por trimestre.	Este nuevo instalador incluye soporte experimental para Windows Server 2016 como parte de la última versión de Edge de Docker para Windows y Motor. 

Utilice este canal si desea obtener características experimentales más rápido, y puede sobrellevar una cierta inestabilidad y errores. Recopilamos todos los datos de uso en las versiones de Edge de forma general. 

Las compilaciones de borde se liberan una vez al mes.	Recomendamos que todos los usuarios de Edge prueben el nuevo instalador. 

Sin embargo, si tiene problemas con la nueva experiencia de instalador, puede utilizar el instalador de Edge heredado y seguir recibiendo todas las demás características de Edge.
Obtener Docker para Windows (Estable)	Obtener Docker para Windows (Edge)	Obtener Docker para Windows (Edge) (instalador heredado)
Suma de comprobación: Estable InstallDocker.msi SHA256	Suma de comprobación: New Edge InstallDocker.exe SHA256	Suma de comprobación: Legacy Edge InstallDocker.msi SHA256
Docker para Windows requiere 64 bits de Windows 10 Pro y Microsoft Hyper-V. Consulte Qué saber antes de instalar para obtener una lista completa de los requisitos previos.

Puede cambiar entre versiones de Edge y Stable, pero sólo debe tener instalada una aplicación a la vez. Además, tendrá que guardar las imágenes y exportar contenedores que desee conservar antes de desinstalar la versión actual antes de instalar otra. Para obtener más información sobre esto, consulte las preguntas más frecuentes acerca de los canales Estable y Borde .

Qué saber antes de instalar
Si su sistema no satisface estos requisitos, puede instalar Docker Toolbox , que utiliza Oracle Virtual Box en lugar de Hyper-V.

README FIRST para usuarios de Docker Toolbox y Docker Machine : Docker para Windows requiere que Microsoft Hyper-V funcione. El instalador de Docker para Windows lo habilitará para usted, si es necesario, lo que requiere un reinicio. Después de activar Hyper-V, VirtualBox ya no funcionará, pero las imágenes VM de VirtualBox permanecerán. Las VM virtuales de VirtualBox creadas con docker-machine(incluido el default que normalmente se crea durante la instalación de Toolbox) ya no se iniciarán. Estas máquinas virtuales no se pueden utilizar lado a lado con Docker para Windows. Sin embargo, todavía se puede utilizar docker-machinepara administrar VMs remotas.
La virtualización debe estar habilitada. Normalmente, la virtualización está habilitada de forma predeterminada. (Tenga en cuenta que esto es diferente de tener Hyper-V habilitado.) Para obtener más detalles, vea La virtualización debe estar habilitada en Solución de problemas.
La versión actual de Docker para Windows se ejecuta en 64 bits Windows 10 Pro, Enterprise y Educación (actualización 1511 noviembre, Build 10586 o posterior). En el futuro soportaremos más versiones de Windows 10.
Los contenedores y las imágenes creadas con Docker para Windows se comparten entre todas las cuentas de usuario en las máquinas donde se instala. Esto se debe a que todas las cuentas de Windows utilizarán la misma VM para crear y ejecutar contenedores. En el futuro, Docker para Windows aislará mejor el contenido del usuario.
Los escenarios de virtualización anidados, como ejecutar Docker para Windows en una instancia de VMWare o Parallels, podrían funcionar, pero no tienen garantías (es decir, no se admiten oficialmente). Para obtener más información, vea Ejecución de Docker para Windows en escenarios de virtualización anidados
Lo que incluye la instalación de Docker para Windows : La instalación proporciona Docker Engine , Docker CLI, Docker Compose , Docker Machine y Kitematic .
Acerca de los contenedores de Windows y Windows Server 2016
¿Buscas información sobre el uso de contenedores de Windows?

Cambiar entre los contenedores de Windows y Linux describe el cambio de contenedores de Linux / Windows en Docker para Windows y señala al tutorial mencionado anteriormente.
Introducción a Windows Containers (Lab) proporciona un tutorial sobre cómo configurar y ejecutar contenedores de Windows en Windows 10 o Windows Server 2016. Le muestra cómo usar una aplicación MusicStore con contenedores de Windows.
Configuración - Windows Server 2016 (laboratorio) describe específicamente la configuración del entorno.
Docker Container Platform para Windows Server 2016 artículos y entradas de blog en el sitio web Docker
Instalar Docker para Windows
Haga doble clic InstallDocker.msipara ejecutar el instalador.

Si aún no has descargado el instalador ( InstallDocker.msi), puedes hacerlo aquí . Normalmente se descarga en tu Downloads folder, o puedes ejecutarlo desde la barra de descargas recientes en la parte inferior de tu navegador web.

Siga el asistente de instalación para aceptar la licencia, autorizar el instalador y continuar con la instalación.

Se le pedirá que autorice Docker.appcon su contraseña del sistema durante el proceso de instalación. Se necesita acceso privilegiado para instalar componentes de red, enlaces a las aplicaciones de Docker y administrar las máquinas virtuales de Hyper-V.

Haga clic en Finalizar en el diálogo de configuración completa para iniciar Docker.

Instalación completa>

Iniciar Docker para Windows
Cuando termina la instalación, Docker se inicia automáticamente.

La ballena en la barra de estado indica que Docker está en ejecución y accesible desde un terminal.

Si acaba de instalar la aplicación, también obtendrá un mensaje de éxito emergente con los siguientes pasos sugeridos y un enlace a esta documentación.

Información de inicio

Cuando se haya completado la inicialización, seleccione Acerca de Docker en el icono del área de notificación para verificar que dispone de la versión más reciente.

¡Felicitaciones! Estás listo y funcionando con Docker para Windows.

Dónde ir a continuación
Introducción proporciona una descripción general de Docker para Windows, ejemplos básicos de comandos de Docker, cómo obtener ayuda o comentarios y enlaces a todos los temas de la guía de Docker para Windows.

Comience con Docker le enseña cómo definir e implementar aplicaciones con Docker.

La solución de problemas describe problemas comunes, soluciones alternativas, cómo ejecutar y enviar diagnósticos y enviar problemas.

Las preguntas frecuentes proporcionan respuestas a las preguntas más frecuentes.

Notas de lanzamiento enumera actualizaciones de componentes, nuevas características y mejoras asociadas con las versiones de Stable y Edge.

Windows , beta , edge , alfa , instalar , descargar


## Referencias ##

[docker-for-windows](https://docs.docker.com/docker-for-windows/install "docker-for-windows")