---
layout: post
section: "LDAP"
title:  "LDAP Introducción"
date:   2016-10-18
desc: "LDAP Introducción"
keywords: "LDAP,Introducción"
categories: [LDAP]
tags: [ldap,Introducción]
icon: fa-sitemap
image: static/img/blog/ldap/ldap-logo.png
---

# LDAP

## ¿A que nos referimos cuando hablamos de LDAP?

LDAP son las siglas de Lightweight Directory Access Protocol (en español Protocolo Ligero/Simplificado de Acceso a Directorios) que hacen referencia a un protocolo a nivel de aplicación que permite el acceso a un servicio de directorio ordenado y distribuido para buscar diversa información en un entorno de red. 

LDAP también se considera una base de datos (aunque su sistema de almacenamiento puede ser diferente) ya que acepta consultas de manera similar a como se realizaría en una base de datos tradicional.

Un directorio es un conjunto de objetos con atributos organizados en una manera lógica y jerárquica. 
El ejemplo más común es el directorio telefónico, que consiste en una serie de nombres (personas u organizaciones) que están ordenados alfabéticamente, donde cada nombre tiene una dirección y un número de teléfono adjuntos. 
Para entenderlo mejor, es un libro o carpeta, en la cual se escriben nombres de personas, teléfonos y direcciones, y se ordena alfabéticamente.

Un árbol de directorio LDAP a veces refleja varios límites políticos, geográficos u organizacionales, dependiendo del modelo elegido. Los despliegues actuales de LDAP tienden a usar nombres de Sistema de Nombres de Dominio (DNS por sus siglas en inglés) para estructurar los niveles más altos de la jerarquía. Conforme se desciende en el directorio pueden aparecer entradas que representan personas, unidades organizacionales, impresoras, documentos, grupos de personas o cualquier cosa que representa una entrada dada en el árbol (o múltiples entradas).

Habitualmente, almacena la información de autenticación (usuario y contraseña) y es utilizado para autenticarse aunque es posible almacenar otra información (datos de contacto del usuario, ubicación de diversos recursos de la red, permisos, certificados, etc). 

<img src="https://www.edrawsoft.com/images/network/ldap_Full.png" alt="ejemplo LDAP" class="img-preview" style="height: auto;width: auto;display: block; margin: auto;">

A manera de síntesis, LDAP es un protocolo de acceso unificado a un conjunto de información sobre una red.

La versión actual es LDAPv3, y se encuentra definido en los RFCs RFC 2251 y RFC 2256 (documento base de LDAP), RFC 2829 (método de autentificación para LDAP), RFC 2830 (extensión para TLS), y RFC 3377 (especificación técnica)

## Usos

LDAP se utiliza a menudo por organizaciones como un repositorio central de información del usuario y como un servicio de autenticación. 
También se puede utilizar para almacenar la información del papel o rol que desempeñan los usuarios dentro de las aplicaciones que se usan por la organización.

Con el objetivo de tener un mayor control sobre los usuarios definidos y una política de contraseñas homogénea, lo ideal en una red es disponer de un servicio centralizado de autenticación. Imaginaros que disponemos de una red con 20 servidores y necesitásemos dar de alta un nuevo usuario, deberíamos ejecutar las pertinentes modificaciones en los 20 diferentes entornos con el riesgo de errores e inconsistencias que ésto implica. Por otra parte, desde la perspectiva del usuario nos encontramos con 20 contraseñas que no tienen porque estar sincronizadas, diferentes políticas, etc… al final es más que probable que el usuario utilice contraseñas débiles o que las anote en un postit pegado al monitor.

Por esos motivos, desde el punto de vista de la seguridad, es recomendable disponer de un servicio centralizado de autenticación. Históricamente en el mundo Unix se ha utilizado NIS (Network Information Service), pero actualmente ya se encuentra en desuso y se recomienda LDAP por tratarse de un sistema más moderno y seguro.

Entre las implementaciones de LDAP más conocidas tenemos el Directorio Activo de Windows y OpenLDAP para sistemas Linux/Unix (también puede integrarse con clientes Windows). 

## Referencias

<https://es.wikipedia.org/wiki/Protocolo_Ligero_de_Acceso_a_Directorios>

<https://www.edrawsoft.com/LDAP.php>
