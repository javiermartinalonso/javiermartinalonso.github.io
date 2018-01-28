---
layout: post
section: "Bonita BPM"
title:  "Bonita BPM LDAP authentication"
date:   2016-10-19
desc: "Bonita BPM autenticar contra LDAP"
keywords: "Bonita BPM, organizacion, LDAP authentication"
categories: [bonita]
tags: [Bonita,BPM,LDAP] 
icon: fas fa-cogs
image: static/img/blog/bonita/bonita-logo.png
---

# Premisas #

* Esta documentación se aplica a una instalación Bonita BPM existente y en funcionamiento ([ver las instrucciones de instalación](https://javiermartinalonso.github.io/bonita/2016/10/18/bonita-bundle-JBOSS.html "bonita-bundle-JBOSS")).

* Con el fin de tener en funcionamiento la autenticación de ***Active Directory/LDAP***, el nombre de usuario (***username***) debe existir tanto en el directorio LDAP y en la base de datos Bonita BPM (la contraseña del usuario se comprueba contra el servidor LDAP, pero la información del usuario se lee desde la base de datos Bonita BPM). 

* Se recomienda utilizar el [sincronizador de LDAP](https://javiermartinalonso.github.io/bonita/2016/10/19/bonita-LDAP-Synchronizer.html "sincronizador de LDAP") para crear usuarios Bonita BPM en una base de datos Bonita BPM a partir de los usarios de un ldap.

# Visión de conjunto #

Bonita BPM puede ser configurado para realizar la autenticación de usuario en un [servidor LDAP](https://javiermartinalonso.github.io/ldap/2016/10/18/ldap-Open-LDAP.html "servidor LDAPn") como ***Active Directory, Apache Directory Server, o OpenLDAP***.

Este tipo de configuración se basa en una implementación específica del servicio de autenticación del motor Bonita BPM que delega el nombre de usuario y la contraseña de verificación real a un ***servicio JAAS*** configurado con un módulo de inicio de sesión específico para LDAP.

<!--more-->

# Crear un archivo de configuración JAAS #

## Nombre del contexto contra el que se hace login. ##

La configuración de JAAS puede incluir uno o varios contextos de inicio de sesión. El contexto de inicio de sesión Bonita BPM debe ser nombrado ***BonitaAuthentication-\<TENANT_ID\> (donde \<TENANT_ID\> es el ID del cliente)***.

## Crear o editar el archivo de configuración del servidor de aplicaciones ##

Nota: todos los archivos de configuración distinguen entre mayúsculas y minúsculas, son case sensitive

### Para el caso de JBOSS ###

Editar el siguiente fichero ***\<JBOSS_HOME\> /standalone/ configuration/ standalone.xml*** y modificar la entrada ***security-domains***.
Añadir el contexto de inicio de sesión Bonita BPM utilizando la sintaxis específica de JBoss justo antes de la etiqueta ***\</security-domains\>***. 
Tenga en cuenta que ***security-domain-name*** es en realidad el nombre de contexto de inicio de sesión JAAS (por ejemplo Bonita BPM).

	<security-domain name="BonitaAuthentication-1">
	    <authentication>
	        <login-module code="com.sun.security.auth.module.LdapLoginModule" flag="required">
	            <module-option name="userProvider" value="ldap://localhost:389/ou=all%20people,dc=example,dc=com"/>
	    <module-option name="userFilter" value="(&amp;(objectClass=user)(userPrincipalName={USERNAME}@myExampleDomain.com))"/>		    
	            <module-option name="authIdentity" value="uid={USERNAME},ou=people,dc=example,dc=com"/>
	            <module-option name="useSSL" value="false"/>
	            <module-option name="debug" value="true"/>
	        </login-module>
	    </authentication>
	</security-domain>

## ¿Qué atributos debemos inyectar en el Login-Module? ##

Es importante identificar qué atributos tenemos que establecer dentro del módulo ***login-module***. Este será al menos uno de ***authIdentity, userFilter, tryFirstPass, java.naming.security.principal o java.naming.security.credentials***. 

Lo primero que hay que tener claro es si **¿Es posible construir el nombre completo del usuario con el id con el que el usuario se identifica al iniciar la sesión?** 
Por ejemplo Si el nombre de usuario es ***john.smith***:

- y el DN del usuario es: ***CN=John Smith, CN=Users, DC=MyDomain, DC=com*** entonces **no** es posible construir el DN dinámicamente.
- y el DN del usuario es: ***uid=john.smith, ou=people, dc=example, dc=com***.
entonces **si** somos capaces de construir el DN dinámicamente.

Por lo tanto hay que identificar cuál de los siguientes casos se aplica:

* Si usted puede construir el DN de usuario inyectando directamente el id del usuario:  establecer sólo el atributo ***authIdentity***.
* Si no se puede construir el DN directamente y la búsqueda anónima en el LDAP se permite: establecer sólo el atributo ***userFilter***.
* Si no se puede construir el DN y la búsqueda anónima en el LDAP está anulada, pero los usuarios autenticados pueden buscar: ajustar los atributos ***userFilter*** y ***authIdentity***.
* Si no se puede construir el DN y la búsqueda anónima está anulada y los usuarios autenticados no pueden buscar en el LDAP: ajustar los atributos ***userFilter, authIdentity, tryFirstPass, java.naming.security.principal*** y ***java.naming.security.credentials***.

## ¿Qué valores debemos asignar a los atributos en el Login-Module? ##

* ***userProvider***: Ponga esto en ***ldap://\<ldap server address\>:\<ldap server port\>/\<DN del nodo del LDAP bajo el cual están localizados los usuarios\>***. 
 
	Por ejemplo:***ldap://localhost:389/CN=Users, DC=MyDomain, DC=com***

* ***userFilter(sólo si es necesario)***: el valor debe ser una petición de búsqueda que se encuentra a sus usuarios en el servidor LDAP. La solicitud de búsqueda puede ser, por ejemplo: ***(&(objectClass=user)(userPrincipalName={USERNAME}@mydomain.com))***. Utilice una herramienta de LDAP (como Apache Directory Studio) para validar que la solicitud devuelve el resultado esperado si se reemplaza ***{USERNAME}*** con un nombre de usuario real.

* ***authIdentity(sólo si es necesario)***: hay dos casos: 
Si se puede construir el DN de usuario, establezca el valor del atributo uid con el id del usuario en la etiqueta ***{USERNAME}***. Por ejemplo ***uid={USERNAME},ou=users,dc=example,dc=com***. 
Si se utiliza una userFilter y los usuarios pueden buscar, establezca el valor de ***{USERNAME}@mydomain.com*** para AD y el DN de usuario (igual al anterior) para otros servidores LDAP.

* ***tryFirstPass (sólo si es necesario)***: ponga esto en true.

* ***java.naming.security.principal (Sólo si es necesario)***: especifique el nombre de usuario (AD) o el usuario DN (otros servidores LDAP) de un usuario que puede realizar búsquedas en el servidor.

* ***java.naming.security.credentials (Sólo si es necesario)***: especifica la contraseña de un usuario que puede realizar búsquedas en el servidor.

## Configuración de la autenticación contra LDAP ##

### Cambio de servicio de autenticación Bonita BPM ###

La instalación predeterminada Bonita BPM viene con una aplicación de servicio de autenticación basado en la base de datos del motor de BonitaBPM. 
Con el fin de activar la autenticación de ***Active Directory/LDAP*** la implementación del servicio necesita ser cambiada. 
Para ello, edite ***bonita-home/engine-server/conf/tenants/template/bonita-tenant-sp-custom.properties.***

Si edita este fichero los ajustes se aplicarán a todos los nuevos tenants. Para un tenant existente concreto, edite el archivo de propiedades en: ___bonita-home/engine-server/conf/tenants/<tenant-id\>___

Usted tendrá que realizar los cambios siguientes:

* Comentar la linea de authenticationService
* Añadir esta nueva línea:
	
	***authentication.service.ref.name= jaasAuthenticationService***

## Referencias ##

<http://documentation.bonitasoft.com/6.x-7.2/active-directory-or-ldap-authentication-0>
