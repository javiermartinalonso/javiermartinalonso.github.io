---
layout: post
section: "Spring"
title:  "Spring profiles"
date:   2017-03-20
desc: "En este post explicamos cómo funcionan los Spring profiles y como configurarlos para distintos entornos de desarrollo."
keywords: "Spring, Spring-Boot, Spring Tool Suite, STS, starters, configuracion por defecto, buenas prácticas"
categories: [Spring]
tags: [Spring, Spring-Boot, Spring Tool Suite, STS, starters, configuracion por defecto, buenas prácticas]
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---

http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html

# Archivos de propiedades específicos para cada perfil #

Además de en el fichero de propiedades `application.properties`, los archivos de propiedades específicas de cada profile también se pueden definir utilizando la convención de nomenclatura `application-{profile}.properties`. 

El **entorno de ejecución** (**Environment**) de **spring** tiene un conjunto de perfiles predeterminados (por defecto [**default**]) que se utilizan si no se establecen perfiles activos (es decir, si no hay ningún perfil activado explícitamente se carga por defecto `application-default.properties`).

Los archivos de propiedades específicos de perfil se localizan en la misma ruta que el de fichero de propiedades por defecto, y sobrescriben las propiedas de otros properties que no son específicos, independientemente de donde se localicen, dentro o fuera de su paquete jar.

Si se especifican varios perfiles, se aplica la estrategia del último que llega gana. Así durante la carga del contexto de spring, los perfiles especificados por la propiedad 
`spring.profiles.active` se añaden después los configurados a través de la `SpringApplicationAPI` y por lo tanto tienen prioridad.

> **Nota**: Si ha especificado algún fichero properties en `spring.config.location`, no se considerarán otros ficheros properties específicos. Utilice directorios en `spring.config.location` si también desea utilizar los ficheros properties específicos por profile.

## Los marcadores de posición (**Placeholders**) en las propiedades. ##

Los valores de un fichero application.properties se pueden parametrizar de modo que una propiedad puede referirse a el valor de otra propiedad definida previamente (por ejemplo, de las propiedades del sistema).

    app.name=MyApp
    app.description=${app.name} is a Spring Boot application

## Configuración de properties Type-safe (de tipo seguro). ##

El uso de la anotación `@Value("${property}")` para inyectar propiedades de configuración en un bean a veces puede ser engorroso, especialmente si se está trabajando con múltiples propiedades o los datos tienen naturaleza jerárquica. Spring-boot proporciona un método alternativo de utilización de properties que permite usa beans fuertemente tipados para gobernar y validar la configuración de su aplicación.


    package com.example;
    
    import java.net.InetAddress;
    import java.util.ArrayList;
    import java.util.Collections;
    import java.util.List;
    
    import org.springframework.boot.context.properties.ConfigurationProperties;
    
    @ConfigurationProperties("foo")
    public class FooProperties {
    
        private boolean enabled;
    
        private InetAddress remoteAddress;
    
        private final Security security = new Security();
    
        public boolean isEnabled() { ... }
    
        public void setEnabled(boolean enabled) { ... }
    
        public InetAddress getRemoteAddress() { ... }
    
        public void setRemoteAddress(InetAddress remoteAddress) { ... }
    
        public Security getSecurity() { ... }
    
        public static class Security {
        
        private String username;
    
        private String password;
    
        private List<String> roles = new ArrayList<>(Collections.singleton("USER"));
    
        public String getUsername() { ... }
    
        public void setUsername(String username) { ... }
    
        public String getPassword() { ... }
    
        public void setPassword(String password) { ... }
    
        public List<String> getRoles() { ... }
    
        public void setRoles(List<String> roles) { ... }
    
        }
    }

El POJO anterior define las siguientes propiedades:

- ***foo.enabled***, false De forma predeterminada
- ***foo.remote-address***, Con un tipo que puede ser convertido a String
- ***foo.security.username***, Con un anidado "security", cuyo nombre está determinado por el nombre de la propiedad. En particular, el tipo de retorno no se utiliza en absoluto allí y podría haber sido SecurityProperties
- ***foo.security.password***
- ***foo.security.roles***, Con una colección de String


> Nota: getters y setters son generalmente obligatorios, ya que la unión es a través de descriptores de propiedad estándar de Java Beans.
> Hay casos en que un setter puede omitirse:
> 
> - ***Maps***, siempre y cuando se inicializan, necesitan un getter pero no necesariamente un setter ya que pueden ser mutados por el ***binding*** (mapeo).
> 
> - ***Colecciones y matrices*** se puede acceder ya sea a través de un índice o usando un único valor de propertie separados por comas. En el último caso, un setter es obligatorio. Recomendamos añadir siempre un setter para tales tipos. Si inicializa una colección, asegúrese de que no es inmutable (como en el ejemplo anterior).
> 
> - Si necesitas que POJOs anidados se inicialicen (como el atributo Security en el ejemplo anterior), no se requiere un setter. Si desea que el mapeo se cree al vuelo al crear la instancia, usa el contructor por defecto, pero necesitaras un setter.

También es necesario enumerar las clases de propiedades para registrarse en la @EnableConfigurationPropertiesanotación:

	@Configuration 
	@EnableConfigurationProperties (FooProperties.class)
	 pública  clase MyConfiguration {
	}

[Nota]
Cuando @ConfigurationPropertiesfrijol se ha registrado de esa manera, el grano tendrá un nombre convencional: <prefix>-<fqn>, donde <prefix>es el prefijo clave de entorno especificada en la @ConfigurationPropertiesanotación y <fqn>el nombre completo del grano. Si la anotación no proporciona ningún prefijo, se utiliza sólo el nombre completo del grano.
El nombre de frijol en el ejemplo anterior será foo-com.example.FooProperties.
Incluso si la configuración anterior creará un grano regular para FooProperties, se recomienda que @ConfigurationPropertiessólo se ocupan del medio ambiente y, en particular, no se inyecta otros granos a partir del contexto. Habiendo dicho esto, la @EnableConfigurationPropertiesanotación se también se aplica automáticamente a su proyecto para que cualquier existente Bean anotado con @ConfigurationPropertiesse configura a partir de la Environment. Se podría atajo MyConfigurationencima de asegurarse FooPropertieses un ya un grano:

	@Component 
	@ConfigurationProperties (Prefix = "foo")
	 pública  de clase FooProperties { // ... ver más arriba 
	}







http://docs.spring.io/spring-boot/docs/current/maven-plugin/examples/run-profiles.html

## MIX configuracion de profiles Maven-Spring-boot ##

The active profiles to use for a particular application can be specified using the profiles argument. The following configuration enables the foo and bar profiles:

	<project>
	  ...
	  <build>
	    ...
	    <plugins>
	      ...
	      <plugin>
	        <groupId>org.springframework.boot</groupId>
	        <artifactId>spring-boot-maven-plugin</artifactId>
	        <version>1.4.3.RELEASE</version>
	        <configuration>
	          <profiles>
	            <profile>foo</profile>
	            <profile>bar</profile>
	          </profiles>
	        </configuration>
	        ...
	      </plugin>
	      ...
	    </plugins>
	    ...
	  </build>
	  ...
	</project>

The profiles to enable can be specified on the command line as well, make sure to separate them with a comma, that is:

    mvn spring-boot:run -Drun.profiles=foo,bar

http://stackoverflow.com/questions/25420745/how-to-set-spring-active-profiles-with-maven-profiles





## Ficheros fuente: ##



## Referencias ##

[Spring-boot-features-external-config](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html "Spring-boot-features-external-config")