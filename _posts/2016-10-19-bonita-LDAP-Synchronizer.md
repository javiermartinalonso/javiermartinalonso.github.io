---
layout: post
title:  "Bonita BPM LDAP synchronizer"
date:   2016-10-16
desc: "Bonita BPM Herramientas para la gestión de una organización"
keywords: "Bonita BPM, organizacion, LDAP synchronizer"
categories: [bonita]
tags: [Bonita BPM,LDAP synchronizer,organizacion] 
icon: fa-code
---

# Herramientas de Bonita BPM para la gestión de una organización

Bonita BPM tiene tres herramientas que puede utilizar para administrar la información de su organización:

* <strong>Bonita BPM Studio</strong>: para la creación de la definición inicial de la organización, debe ser importada a Bonita BPM Portal antes de empezar a usar el portal en modo de producción, y para la gestión de información de la organización mientras prueba un proceso en el desarrollo. Bonita BPM Studio contiene una organización ejemplo, llamado ACME. Esta organización contiene un pequeño número de usuarios, que pertenecen a diferentes grupos con roles realistas. Puede utilizar esta organización de muestra para probar un proceso que está en desarrollo. Se puede modificar la organización ACME y se puede crear otras organizaciones.

* <strong>Bonita BPM Portal</strong>: para la gestión de información de la organización de la producción dentro de Bonita BPM. Puede administrar usuarios, grupos y roles. También puede importar o exportar la información de la organización.

* <strong>Sincronizador de LDAP</strong>: (sólo está disponible con licencia en las versiones de pago) sirve para mantener la organización Bonita BPM sincronizado con el directorio LDAP externo. La sincronización es unidireccional, desde LDAP a Bonita BPM. Puede ejecutar el sincronizador de una vez para cargar la organización luego administrar dentro Bonita BPM Portal, o puede ejecutar el sincronizador en un horario y gestionar la organización externa.


# Bonita Sincronyzer LDAP (Sincronizador de LDAP  de Bonita)

El sincronizador de LDAP es un servicio para la sincronización de los usuarios y grupos de directorio LDAP Bonita BPM y en una sola dirección, LDAP a Bonita BPM.
El servicio de sincronización de LDAP mantiene la información de la organización Bonita BPM sincronizado con un directorio LDAP externo, mediante la creación, actualización o eliminación de usuarios y grupos en la organización para que coincida lo más posible a los atributos de lista de usuarios definidos en LDAP. No modifica el directorio LDAP.
El sincronizador LDAP se conecta con el servidor LDAP y el motor de Bonita BPM  para leer los datos desde el servidor LDAP y modificar la organización en la base de datos del motor Bonita BPM utilizando la API. Tanto el servidor LDAP del motor y deben estar en ejecución cuando se ejecuta la herramienta de LDAP sincronizador.
El programa sincronizador funciona en backend. No hay ninguna interfaz de usuario: todos los valores de configuración se especifican en los archivos y todas las salidas se escriben en un archivo de registro de log.

El sincronizador, sincroniza los objetos LDAP que heredan de la clase <em>person</em> con los <em>users</em> en Bonita BPM. La aplicación del sincronizador no es compatible con los metadatos de usuario de bonita y no puede sincronizar las contraseñas. Tras la sincronización a los usuarios nuevos se les asigna una nueva contraseña que coincide con el identificador del usuario. Esto no es problemático en el caso de tener configurado el acceso a bonita a través del LDAP, ya que los usuarios se logarian con la pass definida en el LDAP que sería la misma para el resto de aplicaciones que validen contra ese LDAP.

## Los archivos de configuración
Hay cinco archivos de propiedades:

* <strong>bonita.properties</strong>:	define la configuración de conexión contra el motor de Bonita y especifica la cuenta del portal de Bonita BPM utilizada para la sincronización de usuario (requiere privilegios de administración del portal).

* <strong>ldap.properties</strong>:	 define la configuración de conexión LDAP y especifica la cuenta del LDAP utilizada para la navegación del usuario (requiere privilegios de administración del LDAP).

* <strong>logger.properties</strong>:	proporciona los ajustes para el registrador de logs. Los ajustes por defecto debería estar bien para la mayoría de usos.

* <strong>mapper.properties</strong>:	especifica el mapeo (binding) entre los atributos de usuario del directorio LDAP y los usuarios de Bonita BPM.

* <strong>sync.properties</strong>:	define los ajustes del proceso de sincronización.

Todos los archivos de configuración se pueden encontrar en el directorio <em>[home syncronizer]/conf</em>. 

## Ejecución del sincronizador

A continuación se presentan todas las acciones realizadas por la herramienta sincronizador de LDAP:

1. Lee todos los usuarios en el directorio LDAP de origen.
2. Crea todos los usuarios en el motor bonita.
3. Lee todos los grupos en el directorio LDAP de origen.
4. Crea todos los grupos en el Motor Bonita BPM.
5. Recupera todos los usuarios que pertenecen a los grupos en el directorio LDAP de origen.
6. Recupera todos los usuarios que pertenecen a los grupos en el Motor Bonita BPM.
7. Para todos los usuarios que pertenecen a los grupos del motor Bonita BPM y no son miembros en los grupos del directorio LDAP de origen, la herramienta de sincronización, elimina la membresia del usuario (usuario: rol, grupo). No borra usuarios en el motor de bonita, ya que en la filosofia de un BPM hay que mantener la información de que usuario realizó que acciones, aunque este ya no esté activo en la organización.
8. Crea la membresia de los usuarios, grupo y rol al que pertenece.

	
	<p><strong> Nota: </strong><br> 
	Esto último, está estraido de la documentación oficial de bonita. Pero hay que hacer alguna aclaración, pues no es del todo cierto:<br>
	
	<strong>El sincronizador LDAP de Bonita BPM no es capaz de migrar la jerarquía de grupos (grupos, subgrupos anidados). Esto es intencional: se asume que el Directorio puede cambiar, y cuando se cambia, no queremos afectar a la organización definida en el motor de Bonita (tener en cuenta el LDAP se usa para gestionar todas las aplicaciones y recursos de una empresa y no sólo la organización que deben usar nuestros procesos BPM).</strong><br>
		
	<strong>Lo anterior implica que tenemos que detectar cuando se da el caso de que la organizacion de los grupos de una empresa ha cambiado y aplicar una gestión manual desde el portal de bonita, tras la sincronización:
<br>			Habría que revisar la jerarquia de grupos.
<br>			Habría que revisar la membresia de los usuarios (grupo + rol).
</strong></p>
	
La herramienta se puede determinar la lista de los usuarios que pertenecen a un grupo de la organización examinado estas propiedades, dependiendo de objectClass del grupo:

* <em>member: group objectclass
* memberURL: groupOfURLs objectclass
* member: groupOfNames objectclass
* uniqueMember: groupOfUniqueNames objectclass
* ds-target-group-dn: ds-virtual-static-group objectclass</em>

## Configuracion de la herramienta

El sincronizador LDAP es de hecho una aplicación java cliente del motor de Bonita. Se basa en la librería bonita-client.jar y por lo tanto requiere una carpeta Bonita-Home.
Hay que copiar el bonita-home en el raiz de la herramienta de sincronizacion, ya que es una aplicacion java que debe conectarse con el motor de bonita.
En el archivo [home sincronyzer Ldap]/bonita_home/engine-client/conf/bonita-client-custom.properties se define la forma en la que la libreria cliente se conecta al motor de Bonita BPM.
Aqui se explica más en detalle como realizar esta tarea:
<http://documentation.bonitasoft.com/6.x-7.2/bonita-home-876>


## Referencias

http://documentation.bonitasoft.com/6.x-7.2/organization-management-bonita-bpm-studio
http://documentation.bonitasoft.com/6.x-7.2/ldap-synchronizer-3
http://documentation.bonitasoft.com/6.x-7.2/bonita-home-876
https://vimeo.com/142633250
https://vimeo.com/141901603
https://vimeo.com/143372621
