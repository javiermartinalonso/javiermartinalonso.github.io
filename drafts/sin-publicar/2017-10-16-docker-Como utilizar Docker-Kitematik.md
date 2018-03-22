---
layout: post
sections: [docker]
title:  "Cómo utilizar Docker con Kitematik"
date:   2017-10-16
desc: ""
keywords: "Dockers"
categories: [DevOps, DevOps/docker]
tags: [Dockers]
icon: fab fa-docker
image: static/img/blog/docker/docker-logo.png
---


https://docs.docker.com/kitematic/userguide/#next-steps


Guía del usuario de Kitematic
Solución de escritorio heredada. Kitematic es una solución heredada, incluida con Docker Toolbox . Recomendamos actualizar a Docker para Mac o Docker para Windows si su sistema cumple con los requisitos para una de esas aplicaciones.
Tiempo estimado de lectura: 7 minutos
Visión de conjunto
Kitematic es un proyecto de código abierto construido para simplificar y agilizar el uso de Docker en una PC Mac o Windows (próximamente). Kitematic automatiza el proceso de instalación y configuración de Docker y proporciona una interfaz gráfica de usuario intuitiva (GUI) para ejecutar contenedores Docker. Kitematic se integra con Docker Machine para suministrar una VirtualBox VM e instalar el Docker Engine localmente en su máquina.

Una vez instalado, el Kitematic GUI se lanza y desde la pantalla de inicio se le presentarán imágenes curadas que se pueden ejecutar al instante. Puedes buscar imágenes públicas en Docker Hub de Kitematic simplemente escribiendo en la barra de búsqueda. Puede usar la GUI para crear, ejecutar y administrar sus contenedores haciendo clic en los botones. Kitematic le permite alternar entre la CLI de Docker y la GUI. Kitematic también automatiza funciones avanzadas como la gestión de puertos y la configuración de volúmenes. Puede usar Kitematic para cambiar las variables de entorno, los registros de flujo y el terminal de un solo clic en su contenedor de Docker desde la GUI.

En primer lugar, si aún no lo ha hecho, descargue e instale Kitematic de una de las siguientes maneras:

Elija Kitematic desde el menú Docker para Mac o Docker para Windows para comenzar con la instalación de Kitematic.

Instale Docker Toolbox (en sistemas antiguos que no cumplan los requisitos de Docker para Mac o Docker para Windows ).

Descargue Kitematic directamente desde la página de lanzamientos de Kitematic .

Inicie Kitematic. (En los sistemas de escritorio, haga clic en la aplicación.)

Inicie sesión con su Docker ID
Proporcione su Docker ID y nombre de usuario y haga clic en LOG IN o haga clic en Omitir ahora para examinar Docker Hub como invitado.

Lista de contenedores
Kitematic enumera todos los contenedores en ejecución y detenidos en el lado izquierdo, debajo del enlace "Nuevo contenedor".

La lista de contenedores incluye todos los contenedores, incluso los no iniciados por Kitematic, lo que le da una rápida visión general del estado de su demonio Docker.

Puede hacer clic en cualquier contenedor para ver sus registros (la salida del proceso del contenedor principal), reiniciar, detener o ejecutar shen ese contenedor. Consulte Trabajo con un contenedor para obtener más detalles.

Creación de un nuevo contenedor
La página "Nuevo contenedor" le permite buscar y seleccionar imágenes en el Hub Docker. Cuando haya encontrado la imagen que desea ejecutar, puede hacer clic en "Crear" para extraer, crear y ejecutar el contenedor.

Nginx crea

Trabajar con un contenedor
Si selecciona un contenedor que no está en ejecución, ya sea detenido o en pausa, podrá "Reiniciar" o "Detener" el contenedor utilizando los iconos. También puede ver los registros de salida del proceso del contenedor principal completo y en la sección Configuración puede realizar cambios que se utilizarán si reinicia este contenedor.

Al seleccionar un contenedor en ejecución de la lista de la izquierda, puede ver información de estado de su contenedor, ya sea una vista previa de la salida HTML de un contenedor que tenga un servidor web, los registros del proceso del contenedor principal y cualquier volumen de contenedor que se haya Configurado.

Contenedor Redis en Kitematic

La página de resumen mostrará diferentes cosas dependiendo de los metadatos de la imagen. Si se conoce un puerto "web" conocido (ver más abajo) EXPOSED, Kitematic asume que es una página web y mostrará una vista previa del sitio en /. Si otros puertos están expuestos, mostrará una lista de esos puertos y la IP del daemon de Docker y el puerto al que están asignados. Si hay alguno VOLUMES, entonces se mostrarán. Como mínimo, la pantalla de resumen mostrará la salida del registro del proceso del contenedor principal.

Los puertos “web” detectadas actualmente son, 80, 8000, 8080, 3000, 5000, 2368, 9200, y 8983.

Visualización de registros de contenedores
Puede ver toda la salida de registro del proceso de contenedor principal haciendo clic en la imagen de vista previa de "Registros" o haciendo clic en la pestaña "Registros".

A continuación, puede desplazarse por los registros del contenedor actual en ejecución. Tenga en cuenta que si realiza cambios en la configuración del contenedor, se reiniciará el contenedor, por lo que se restablecerá esta vista de registro.

Inicio de un terminal en un contenedor
El icono "Terminal" en la parte superior del resumen del contenedor docker exec -i -t <your container> sh. Esto le permitirá realizar cambios rápidos o depurar un problema.

Nota : Su shproceso exec'ed no tendrá la misma configuración de entorno que el proceso del contenedor principal y sus hijos. Obtener los comandos de entorno de la shell: docker-machine env default.
Gestión de volúmenes
Puede elegir que todos los volúmenes de un contenedor se asignen a los directorios de su Mac haciendo clic en las carpetas de la sección "Editar archivos" de la pantalla de resumen del contenedor.

Esto le permite administrar archivos en volúmenes a través del Finder. Kitematic expone los datos de volumen de un contenedor en ~/Documents/Kitematic/<container's name>/. El acceso rápido a esta carpeta (o directorio) está disponible a través de la aplicación:

Acceso al directorio de volúmenes

Nota : Cuando "Habilitar todos los volúmenes para editar archivos en Finder", el contenedor Docker se detendrá, se eliminará y se volverá a crear con el nuevo volumes indicador.
CAMBIO DE DIRECTORIOS DE VOLÚMENES

Supongamos que tiene un servidor web Nginx que se ejecuta a través de Kitematic (utilizando la kitematic/hello-world-nginximagen en DockerHub). Sin embargo, no desea utilizar el directorio predeterminado creado para el volumen website_files. En su lugar, ya tiene el HTML, Javascript y CSS para su sitio web en ~/workspace/website.

Vaya a la pestaña "Configuración" del contenedor, y vaya a "Volúmenes". Esta pantalla le permite configurar las asignaciones individualmente.

Captura de pantalla 2015-02-28 a las 2 48 01 pm

Nota : Cuando cambie carpetas, el contenedor Docker se detendrá, se eliminará y volverá a crear con el nuevo volumes indicador.
Configuración del nombre del contenedor
De forma predeterminada, Kitematic establece el nombre del contenedor al mismo nombre que el de la imagen (o con a -<number>si hay más de uno). Para simplificar la administración, o al usar enlaces o volúmenes de contenedor, puede cambiarlo.

Nota : Al cambiar el nombre del contenedor, éste se detendrá, se eliminará y se volverá a crear con el nuevo nombre (debido a la asignación de volúmenes predeterminada).
Adición de variables de entorno
Muchas imágenes utilizan variables de entorno para permitirle personalizarlas. La pestaña "Configuración" General le permite agregar y modificar las variables de entorno utilizadas para iniciar un contenedor.

La lista de variables de entorno mostrará las que se hayan establecido en los metadatos de imagen, por ejemplo, utilizando la ENVinstrucción en el archivo Docker.

Cuando "Guardar" las variables de entorno cambiadas, el contenedor se detendrá, se eliminará y se volverá a crear.

Eliminar contenedor
En la pestaña "General" "Configuración", puede eliminar el contenedor. Al hacer clic en "Eliminar contenedor" también se detendrá el contenedor si es necesario.

También puede eliminar un contenedor haciendo clic en el Xicono de la lista de contenedores.

Kitematic le pedirá que confirme que desea eliminar.

LISTE LOS PUERTOS EXPUESTOS Y CÓMO ACCEDER A ELLOS

Para ver la lista completa de puertos expuestos, vaya a "Configuración" y luego "Puertos". Esta página enumera todos los puertos de contenedor expuestos, y la dirección IP y el puerto de red host-only que puede acceder utilizan para acceder a ese contenedor desde su sistema macOS.

Acceso a la línea de comandos de Docker
Puede interactuar con contenedores existentes en Kitematic o crear nuevos contenedores a través de la interfaz de línea de comandos (CLI) de Docker. Cualquier cambio que realice en el CLI se refleja directamente en Kitematic.

Para abrir un terminal a través de Kitematic, simplemente presione el botón de ballena en la parte inferior izquierda, como se muestra a continuación:

Botón de acceso CLI

Ejemplo: Creación de un nuevo contenedor Redis
Comience abriendo un terminal preparado para Docker-CLI haciendo clic en el botón de ballena como se describió anteriormente. Una vez que el terminal se abra, ingrese docker run -d -P redis. Esto activará y ejecutará un nuevo contenedor Redis a través de la CLI de Docker.

Ventana terminal Docker CLI

Nota : Si está creando contenedores desde la línea de comandos, utilícelos docker run -d para que Kitematic pueda volver a crear el contenedor cuando se cambie la configuración a través de la interfaz de usuario de Kitematic. Los contenedores que empiecen sin -dfallar no volverán a arrancar.
Ahora, vuelve a Kitematic. El contenedor Redis ahora debe ser visible.

Contenedor Redis en Kitematic

Próximos pasos
Para ver un ejemplo con Kitematic para ejecutar un servidor de Minecraft, eche un vistazo a la página del servidor de Minecraft .

Docker , documentación , sobre , tecnología , kitematic , gui






## Referencias ##

https://docs.docker.com/kitematic/userguide/#next-steps