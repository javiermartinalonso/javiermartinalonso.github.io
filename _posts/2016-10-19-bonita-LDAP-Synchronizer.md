---
layout: post
section: "Bonita BPM"
title:  "Bonita BPM LDAP synchronizer"
date:   2016-10-19
desc: "Bonita BPM Herramientas para la gestión de una organización"
keywords: "Bonita BPM, organizacion, LDAP synchronizer"
categories: [bonita]
tags: [Bonita BPM,LDAP synchronizer,organizacion] 
icon: fa-cogs
image: static/img/blog/bonita/bonita-logo.png
---

# Herramientas de Bonita BPM para la gestión de una organización

Bonita BPM tiene tres herramientas que puede utilizar para administrar la información de su organización:

* <strong>Bonita BPM Studio</strong>: para la creación de la definición inicial de la organización, debe ser importada a Bonita BPM Portal antes de empezar a usar el portal en modo de producción, y para la gestión de información de la organización mientras prueba un proceso en el desarrollo. Bonita BPM Studio contiene una organización ejemplo, llamado ACME. Esta organización contiene un pequeño número de usuarios, que pertenecen a diferentes grupos con roles realistas. Puede utilizar esta organización de muestra para probar un proceso que está en desarrollo. Se puede modificar la organización ACME y se puede crear otras organizaciones.

* <strong>Bonita BPM Portal</strong>: para la gestión de información de la organización de la producción dentro de Bonita BPM. Puede administrar usuarios, grupos y roles. También puede importar o exportar la información de la organización.

* <strong>Sincronizador de LDAP</strong>: (sólo está disponible con licencia en las versiones de pago) sirve para mantener la organización Bonita BPM sincronizado con el directorio LDAP externo. La sincronización es unidireccional, desde LDAP a Bonita BPM. Puede ejecutar el sincronizador de una vez para cargar la organización luego administrar dentro Bonita BPM Portal, o puede ejecutar el sincronizador en un horario y gestionar la organización externa.

<!--more-->

# Bonita Sincronyzer LDAP (Sincronizador de LDAP  de Bonita)

El sincronizador de LDAP es un servicio para la sincronización de los usuarios y grupos de directorio LDAP Bonita BPM y en una sola dirección, LDAP a Bonita BPM.
El servicio de sincronización de LDAP mantiene la información de la organización Bonita BPM sincronizado con un directorio LDAP externo, mediante la creación, actualización o eliminación de usuarios y grupos en la organización para que coincida lo más posible a los atributos de lista de usuarios definidos en LDAP. No modifica el directorio LDAP.
El sincronizador LDAP se conecta con el servidor LDAP y el motor de Bonita BPM  para leer los datos desde el servidor LDAP y modificar la organización en la base de datos del motor Bonita BPM utilizando la API. Tanto el servidor LDAP del motor y deben estar en ejecución cuando se ejecuta la herramienta de LDAP sincronizador.
El programa sincronizador funciona en backend. No hay ninguna interfaz de usuario: todos los valores de configuración se especifican en los archivos y todas las salidas se escriben en un archivo de registro de log.

El sincronizador, sincroniza los objetos LDAP que heredan de la clase <strong><em>person</em></strong> con los <strong><em>users</em></strong> en Bonita BPM. La aplicación del sincronizador no es compatible con los metadatos de usuario de bonita y no puede sincronizar las contraseñas. Tras la sincronización a los usuarios nuevos se les asigna una nueva contraseña que coincide con el identificador del usuario. Esto no es problemático en el caso de tener configurado el acceso a bonita a través del LDAP, ya que los usuarios se logarían con la pass definida en el LDAP que sería la misma para el resto de aplicaciones que validen contra ese LDAP.

## Los archivos de configuración
Hay cinco archivos de propiedades:

* <strong>bonita.properties</strong>:	define la configuración de conexión contra el motor de Bonita y especifica la cuenta del portal de Bonita BPM utilizada para la sincronización de usuario (requiere privilegios de administración del portal).

* <strong>ldap.properties</strong>:	 define la configuración de conexión LDAP y especifica la cuenta del LDAP utilizada para la navegación del usuario (requiere privilegios de administración del LDAP).

* <strong>logger.properties</strong>:	proporciona los ajustes para el registrador de logs. Los ajustes por defecto debería estar bien para la mayoría de usos.

* <strong>mapper.properties</strong>:	especifica el mapeo (binding) entre los atributos de usuario del directorio LDAP y los usuarios de Bonita BPM.

* <strong>sync.properties</strong>:	define los ajustes del proceso de sincronización.

Todos los archivos de configuración se pueden encontrar en el directorio <strong><em>[home syncronizer]/conf</em></strong>. 

## Ejecución del sincronizador

A continuación se presentan todas las acciones realizadas por la herramienta sincronizador de LDAP:

1. Lee todos los usuarios en el directorio LDAP de origen.
2. Crea todos los usuarios en el motor bonita.
3. Lee todos los grupos en el directorio LDAP de origen.
4. Crea todos los grupos en el Motor Bonita BPM.
5. Recupera todos los usuarios que pertenecen a los grupos en el directorio LDAP de origen.
6. Recupera todos los usuarios que pertenecen a los grupos en el Motor Bonita BPM.
7. Para todos los usuarios que pertenecen a los grupos del motor Bonita BPM y no son miembros en los grupos del directorio LDAP de origen, la herramienta de sincronización, elimina la membresía del usuario (usuario: rol, grupo). No borra usuarios en el motor de bonita, ya que en la filosofía de un BPM hay que mantener la información de que usuario realizó qué acciones, aunque este ya no esté activo en la organización.
8. Crea la membresía de los usuarios, grupo y rol al que pertenece.

	<p><em><strong> Nota:</strong><br>
	
	<strong> Esto último, está extraído de la documentación oficial de bonita. Pero hay que hacer alguna aclaración, pues no es del todo cierto:</strong><br>
	
	<ol>
		<li>El sincronizador LDAP de Bonita BPM no es capaz de migrar la jerarquía de grupos (grupos, subgrupos anidados). Esto es intencional: se asume que el Directorio puede cambiar, y cuando se cambia, no queremos afectar a la organización definida en el motor de Bonita (tener en cuenta el LDAP se usa para gestionar todas las aplicaciones y recursos de una empresa y no sólo la organización que deben usar nuestros procesos BPM).</li>
		<li>Lo anterior implica que tenemos que detectar cuando se da el caso de que la organización de los grupos de una empresa ha cambiado y aplicar una gestión manual desde el portal de bonita, tras la sincronización:
		<ul>
		  <li>Habría que revisar la jerarquía de grupos.</li>
		  <li>Habría que revisar la membresía de los usuarios (grupo + rol).</li>
		</ul>
		 </li>

	</ol>
</em></p>
	
La herramienta puede determinar la lista de los usuarios que pertenecen a un grupo de la organización examinado estas propiedades, dependiendo del objectClass del grupo:

<div>
	<em><strong>
		<ul>
			<li>member: group objectclass</li>
			<li>memberURL: groupOfURLs objectclass</li>
			<li>member: groupOfNames objectclass</li>
			<li>uniqueMember: groupOfUniqueNames objectclass</li>  
			<li>ds-target-group-dn: ds-virtual-static-group objectclass</li>  
		</ul>
	</strong></em>
</div>

## Configuración de la herramienta

El sincronizador LDAP es de hecho una aplicación java cliente del motor de Bonita. Se basa en la librería <strong><em>bonita-client.jar</em></strong> y por lo tanto requiere una carpeta <strong><em>Bonita-Home</em></strong>.
Hay que copiar el <strong><em>bonita-home</em></strong> en el raíz de la herramienta de sincronización, ya que es una aplicación java que debe conectarse con el motor de bonita y esta carpeta no viene incluida en la descarga de la herramienta.
Una vez copiado el <strong><em>bonita-home</em></strong>, en el archivo <strong><em>[home sincronyzer Ldap]/bonita_home/engine-client/conf/bonita-client-custom.properties</em></strong> se define la forma en la que la librería cliente se conecta al motor de Bonita BPM.
Aquí se explica más en detalle cómo realizar esta tarea:

<http://documentation.bonitasoft.com/6.x-7.2/bonita-home-876>

## Restricciones de la organización producidos por la herramienta:

- El nombre de cada grupo debe ser único, independientemente de su jerarquía. No puede haber dos grupos que se llamen igual en la jerarquía del LDAP que sincronicemos.
- Hay que usar los object domain indicados en la documentación, no nos podemos inventar uno nuevo.

La herramienta, no sincroniza los cambios en la jerarquía de grupos, pero mantiene la jerarquía antigua que configuramos a mano desde el portal.

### Cuestiones:

#### ¿Qué pasa si borro un grupo en el LDAP?
- No desaparece el grupo en la organización de bonita ni se toca sus miembros. 
- Si un usuario pertenecía antes a ese grupo y exclusivamente a ese grupo, después de sincronizar el usuario pasa a estar inactivo.
- Si en el LDAP incluimos un usuario inactivo en un grupo nuevo, se incluye, en el motor de bonita, su pertenecia en su membresia y el usuario pasa a estar activo.

#### ¿Qué pasa si borro un usuario en el LDAP?
- si borras el objeto person de ese usuario del grupo people: entonces pasa a inactivo en el motor de bonita.
- si borro su pertenencia a un grupo: No pasa nada. Debe borrarse como integrante de todos los grupos para que pase a inactivo en el motor de bonita, aunque exista su definición como objeto person en el grupo people. Para el usuario en el motor de bonita no se toca su membresia antigua. Si el usuario pertenecía antes a un grupo, después de sincronizar sigue perteneciendo a ese grupo. Pasa a estar inactivo en la organización de bonita pero toda su membresia se guarda.

#### ¿Qué pasa con los cambios en el LDAP de la pass del usuario?
- Si existe el campo usserPassword en el objeto Person y modificas su valor y luego sincronizas, entonces cambia la pass en el portal de bonita.
- Si no existe ese campo al sincronizar le asigna la pass según el valor del uid.

## Referencias

<http://documentation.bonitasoft.com/6.x-7.2/organization-management-bonita-bpm-studio><br> 
<http://documentation.bonitasoft.com/6.x-7.2/ldap-synchronizer-3><br> 
<http://documentation.bonitasoft.com/6.x-7.2/bonita-home-876><br> 
<https://vimeo.com/142633250><br> 
<https://vimeo.com/141901603><br> 
<https://vimeo.com/143372621><br> 
