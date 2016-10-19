---
layout: post
title:  "Bonita BPM LDAP authentication"
date:   2016-10-19
desc: "Bonita BPM autenticar contra LDAP"
keywords: "Bonita BPM, organizacion, LDAP authentication"
categories: [bonita]
tags: [Bonita BPM,LDAP authentication,organizacion] 
icon: fa-code
---

# Premisas

* Esta documentación se aplica a una instalación Bonita BPM existente y en funcionamiento (ver las instrucciones de instalación ).
* Con el fin de tener en funcionamiento la autenticación de <em><strong>Active Directory/LDAP</strong></em>, el nombre de usuario (<em><strong>username</strong></em>) debe existir tanto en el directorio LDAP y en la base de datos Bonita BPM (la contraseña del usuario se comprueba contra el servidor LDAP, pero la información del usuario se lee desde la base de datos Bonita BPM). 
* Se recomienda utilizar el [sincronizador de LDAP](https://javiermartinalonso.github.io/bonita/2016/10/19/bonita-LDAP-Synchronizer.html "sincronizador de LDAP") para crear usuarios Bonita BPM en una base de datos Bonita BPM a partir de los usarios de un ldap.

# Visión de conjunto

Bonita BPM puede ser configurado para realizar la autenticación de usuario en un <em>servidor LDAP como Active Directory, Apache Directory Server, o OpenLDAP</em>.

Este tipo de configuración se basa en una implementación específica del servicio de autenticación del motor Bonita BPM que delega el nombre de usuario y la contraseña de verificación real a un <em>servicio JAAS</em> configurado con un módulo de inicio de sesión específico para LDAP.

# Crear un archivo de configuración JAAS

## Nombre del contexto contra el que se hace login.

La configuración de JAAS puede incluir uno o varios contextos de inicio de sesión. El contexto de inicio de sesión Bonita BPM debe ser nombrado <em><strong>BonitaAuthentication\-\<TENANT_ID\> (donde \<TENANT_ID\> es el ID del cliente)</strong></em>.

## Crear o editar el archivo de configuración del servidor de aplicaciones

Nota: todos los archivos de configuración distinguen entre mayúsculas y minúsculas, son case sensitive

### Para el caso de JBOSS

Editar el siguiente fichero <em><strong>\<JBOSS_HOME\>/standalone/configuration/standalone.xml</strong></em> y modificar la entrada <em><strong>security\-domains</strong></em>.
Añadir el contexto de inicio de sesión Bonita BPM utilizando la sintaxis específica de JBoss justo antes de la etiqueta <em><strong>\</security-domains\></strong></em>. 
Tenga en cuenta que <em><strong>security\-domain\-name</strong></em> es en realidad el nombre de contexto de inicio de sesión JAAS (por ejemplo Bonita BPM).



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
		

## ¿Qué atributos debemos inyectar en el Login\-Module?

Es importante identificar qué atributos tenemos que establecer dentro del módulo <strong><em>login\-module</em></strong>. Este será al menos uno de <em><strong>authIdentity, userFilter, tryFirstPass, java.naming.security.principal o java.naming.security.credentials</strong></em>. 

Hay que identificar cuál de los siguientes casos se aplica:

* Si usted puede construir el DN de usuario inyectando directamente el nombre de usuario => establecer sólo el atributo <em><strong>authIdentity</strong></em>.
* Si no se puede construir el DN de búsqueda y anónima se permite => establecer sólo el atributo <em><strong>userFilter</strong></em>.
* Si no se puede construir el DN y la búsqueda anónima está anulada y los usuarios autenticados pueden buscar => ajustar los atributos <em><strong>userFilter</strong></em> y <em><strong>authIdentity</strong></em>.
* Si no se puede construir el DN y la búsqueda anónima está anulada y los usuarios autenticados no pueden buscar =>  ajustar los atributos <em><strong>userFilter, authIdentity, tryFirstPass, java.naming.security.principal</strong></em> y <em><strong>java.naming.security.credentials</strong></em>.

## ¿Qué valores debemos asignar a los atributos en el Login\-Module?

* <em><strong>userProvider</strong></em>: Ponga esto en <em>ldap://\<ldap server address>:\<ldap server port\>/\<DN  of the LDAP entry under which all users are located\></em>. Por ejemplo:<em>ldap://localhost:389/CN=Users,DC=MyDomain,DC=com</em>

* <em><strong>userFilter(sólo si es necesario)</strong></em>: el valor debe ser una petición de búsqueda que se encuentra a sus usuarios en el servidor LDAP. La solicitud de búsqueda puede ser, por ejemplo: <em>(&(objectClass=user)(userPrincipalName={USERNAME}@mydomain.com))</em>. Utilice una herramienta de LDAP (como Apache Directory Studio) para validar que la solicitud devuelve el resultado esperado si se reemplaza <em><strong>{usuario}</strong></em> con un nombre de usuario real.

* <em><strong>authIdentity(sólo si es necesario)</strong></em>: hay dos casos: 
Si se puede construir el DN de usuario, establezca el valor del atributo con el usuario y el DN de <em><strong>{USERNAME}</strong></em> la etiqueta. Por ejemplo <em><strong>uid={USERNAME},ou=users,dc=example,dc=com</strong></em>. 
Si se utiliza una userFilter y los usuarios pueden buscar, establezca el valor de <em><strong>{USERNAME}@mydomain.com</strong></em> para AD y el DN de usuario (igual al anterior) para otros servidores LDAP.

* <em><strong>tryFirstPass (sólo si es necesario)</strong></em>: ponga esto en true.

* <em><strong>java.naming.security.principal (Sólo si es necesario)</strong></em>: especifique el nombre de usuario (AD) o el usuario DN (otros servidores LDAP) de un usuario que puede realizar búsquedas en el servidor.

* <em><strong>java.naming.security.credentials (Sólo si es necesario)</strong></em>: especifica la contraseña de un usuario que puede realizar búsquedas en el servidor.

## Pasos de configuración

### Cambio de servicio de autenticación Bonita BPM

La instalación predeterminada Bonita BPM viene con una aplicación de servicio de autenticación basado en la base de datos del motor de BonitaBPM. 
Con el fin de activar la autenticación de <strong>Active Directory/LDAP</strong> la implementación del servicio necesita ser cambiado. 
Para ello, edite <em><strong>bonita-home/engine-server/conf/tenants/template/bonita-tenant-sp-custom.properties</strong></em>
Si edita este fichero los ajustes se aplicarán a todos los nuevos tenants. Para un tenant existente, edite el archivo de propiedades en: <em><strong>bonita-home/engine-server/conf/tenants/\<tenant-id\></strong></em>

Usted tendrá que realizar los cambios siguientes:

* Comentar la linea de authenticationService
* Añadir esta nueva línea: <em><strong>authentication.service.ref.name=jaasAuthenticationService</strong></em>


## Referencias

<http://documentation.bonitasoft.com/6.x-7.2/active-directory-or-ldap-authentication-0>
