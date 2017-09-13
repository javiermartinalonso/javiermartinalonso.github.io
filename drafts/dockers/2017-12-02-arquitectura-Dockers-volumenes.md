---
layout: post
section: "ARQUITECTURA"
title:  "Introducción a Dockers"
date:   2016-10-04
desc: "Docker es una herramienta open-source que nos permite realizar una ‘virtualización ligera’, con la que poder empaquetar entornos y aplicaciones que posteriormente podremos desplegar en cualquier sistema que disponga de esta tecnología. Docker le permite obtener su código probado y desplegado en producción lo más rápido posible"
keywords: "Dockers, virtualización, portabilidad, contenedor, maquina_virtual, integración_continua, DevOps"
categories: [arquitectura]
tags: [Dockers, virtualización, portabilidad,contenedor, maquina_virtual, integración_continua, DevOps]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

https://docs.docker.com/engine/admin/volumes/#good-use-cases-for-tmpfs-mounts

https://docs.docker.com/engine/admin/volumes/volumes/#create-a-volume-using-a-volume-driver

https://juliomunoz.wordpress.com/2015/01/20/introduccion-a-docker/

# Volumenes #

Los volúmenes suponen el modo en el que Docker permite persistir los datos de tu aplicación. Los aloja fuera del propio contenedor, en el propio sistema de archivos del host donde está corriendo Docker, de tal manera que se puede cambiar, apagar o borrar el contenedor sin que afecte a los datos. Para ello hay que definir qué parte del contenedor se dedica a la aplicación y qué parte a los datos.

Los volúmenes son específicos de cada contenedor, es decir, que puedes crear n contenedores a partir de una misma imagen y definir volúmenes diferentes para cada uno de ellos:

docker-3

 

Por último indicar que los volúmenes también pueden usarse para compartir información entre contenedores (mas información en la documentación sobre volúmenes Docker).


Links

Cuando un contenedor Docker arranca se le asigna una IP privada para que otros contenedores puedan comunicarse con él mediante dicha IP. Con esto podemos ver que los contenedores conforman una red local privada.

Para poder realizar la comunicación entre los contenedores Docker permite referencer otro contenedor cuando se crea uno nuevo mediante un alias (especificado por tí). De esta manera ambos contenedores quedan enlazados (linked). Para este enlazado Docker nos pedirá, además, indicar qué puertos se usarán para la comunicación, ya que sino no pondrá disponible ningún puerto.

De esta manera si mi contenedor de base de datos está corriendo, puedo crear mi contenedor donde alojaré mi servidor web y referenciar el de base de datos dando, por ejemplo, el alias myddbb. De esta manera puedo usar el hostname myddbb para comunicarme con el contenedor de base de datos siempre que quiera.

## Referencias ##

[https://www.docker.com/](https://www.docker.com/ "https://www.docker.com/")

[https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc](https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc "https://github.com/docker/labs/blob/master/developer-tools/java/chapters/ch02-basic-concepts.adoc")