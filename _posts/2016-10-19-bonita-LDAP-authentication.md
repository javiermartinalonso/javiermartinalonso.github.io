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
* Con el fin de tener en funcionamiento la autenticación de <em><strong>Active Directory/LDAP<em><strong>, el nombre de usuario (<em><strong>username<em><strong>) debe existir tanto en el directorio LDAP y en la base de datos Bonita BPM (la contraseña del usuario se comprueba contra el servidor LDAP, pero la información del usuario se lee desde la base de datos Bonita BPM). 
* Se recomienda utilizar el [sincronizador de LDAP](https://javiermartinalonso.github.io/bonita/2016/10/19/bonita-LDAP-Synchronizer.html "sincronizador de LDAP") para crear usuarios Bonita BPM en una base de datos Bonita BPM a partir de los usarios de un ldap.

# Visión de conjunto

Bonita BPM puede ser configurado para realizar la autenticación de usuario en un <em>servidor LDAP como Active Directory, Apache Directory Server, o OpenLDAP</em>.

Este tipo de configuración se basa en una implementación específica del servicio de autenticación del motor Bonita BPM que delega el nombre de usuario y la contraseña de verificación real a un <em>servicio JAAS</em> configurado con un módulo de inicio de sesión específico para LDAP.

# Crear un archivo de configuración JAAS

## Nombre del contexto contra el que se hace login.

La configuración de JAAS puede incluir uno o varios contextos de inicio de sesión. El contexto de inicio de sesión Bonita BPM debe ser nombrado <em><strong>BonitaAuthentication-\<TENANT_ID\> (donde \<TENANT_ID\> es el ID del cliente)</em></strong>.

## Crear o editar el archivo de configuración del servidor de aplicaciones

Nota: todos los archivos de configuración entre mayúsculas y minúsculas

### JBOSS

Editar el siguiente fichero <em><strong><JBOSS_HOME>/standalone/configuration/standalone.xml</em></strong> y modificar la entrada <em><strong>security-domains</em></strong>.
Añadir el contexto de inicio de sesión Bonita BPM utilizando la sintaxis específica de JBoss justo antes de la etiqueta <em><strong></security-domains></em></strong>. 
Tenga en cuenta que <em><strong>security-domain-name</em></strong> es en realidad el nombre de contexto de inicio de sesión JAAS (por ejemplo Bonita BPM).



        <security-domain name="BonitaAuthentication-1">
            <authentication>
                <login-module code="com.sun.security.auth.module.LdapLoginModule" flag="required">
                    <module-option name="userProvider" value="ldap://localhost:389/ou=all%20people,dc=example,dc=com"/>
                    <module-option name="userFilter" value="(&amp;(objectClass=user)(userPrincipalName={USERNAME}@myExampleDomain.com))"/>
                    <module-option name="authIdentity" value="{USERNAME}@myExampleDomain.com"/>
                    <module-option name="useSSL" value="false"/>
                    <module-option name="debug" value="true"/>
                </login-module>
            </authentication>
        </security-domain>
		
		
## Pasos de configuración

### Cambio de servicio de autenticación Bonita BPM

La instalación predeterminada Bonita BPM viene con una aplicación de servicio de autenticación basado en la base de datos del motor de BonitaBPM. 
Con el fin de activar la autenticación de <strong>Active Directory/LDAP</strong> la implementación del servicio necesita ser cambiado. 
Para ello, edite <em><strong>bonita-home/engine-server/conf/tenants/template/bonita-tenant-sp-custom.properties</strong></em>
Si edita este fichero los ajustes se aplicarán a todos los nuevos tenants. Para un tenant existente, edite el archivo de propiedades en: <em><strong>bonita-home/engine-server/conf/tenants/<tenant-id></strong></em>

Usted tendrá que realizar los cambios siguientes:

* Comentario la linea de authenticationServicel
* Añadir esta nueva línea: <em><strong>authentication.service.ref.name=jaasAuthenticationService</em></strong>


## Referencias

http://documentation.bonitasoft.com/6.x-7.2/active-directory-or-ldap-authentication-0
