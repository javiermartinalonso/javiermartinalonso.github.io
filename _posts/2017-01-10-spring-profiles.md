---
layout: post
section: "Spring"
title:  Spring profiles"
date:   2017-03-03
desc: "En este post explicamos cómo funcionan los Spring profiles y como configurarlos para distintos entornos de desarrollo."
keywords: "Spring, Spring-Boot, Spring Tool Suite"
categories: [Spring]
tags: [Spring, Spring-Boot, Spring Tool Suite, STS, configuracion por defecto, buenas prácticas]
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---

https://dzone.com/articles/spring-profiles-or-maven

La implementación en diferentes entornos requiere configuración,  por ejemplo,  el URL (s) de base de datos se debe establecer en cada entorno dedicado. En la mayoría - si no todas las aplicaciones Java, esto se logra a través de un archivo .properties, cargado a través del nombre apropiado  Properties de clase. Durante el desarrollo, no hay razón para no utilizar el mismo sistema de configuración,  por ejemplo,  para utilizar una base de datos h2 incrustado en lugar de la producción de uno.

Por desgracia, las aplicaciones Java EE generalmente caen fuera de este uso, ya que la buena práctica en entornos desplegados ( es decir,  todos los entornos de guardar el ordenador de desarrollo local) es el uso de una fuente de datos JNDI en lugar de una conexión local. Incluso Tomcat y embarcadero - que implementan sólo una fracción del perfil web de Java EE, proporcionan esta característica ingeniosa y útil.


Con el sistema de construcción Maven, el cambio entre la configuración se consigue a través de los llamados perfiles ***en tiempo de compilación***. Aproximadamente, un perfil de Maven es una parte de un POM que se puede activar (o no). Por ejemplo, el siguiente perfil fragmento reemplaza directorio de recursos estándar de Maven con uno dedicado.


Ven perfiles de primavera. A diferencia de los perfiles de Maven, perfiles de primavera se activan ***en tiempo de ejecución***. No estoy seguro de si esto es una buena o una mala cosa, pero la aplicación hace posible que las configuraciones por defecto de bienes, con la ayuda de  @Conditional anotaciones (ver mi anterior  artículo  para más detalles). De esta manera, el grano de la envoltura-alrededor de las veinticuatro conexión se crea cuando el  dev se activa el perfil, y cuando no es así, el grano de búsqueda JNDI. Este tipo de configuración se lleva a cabo en el siguiente fragmento:

Ahora, este enfoque tiene algunas desventajas. El problema más obvio es que el archivo final contendrá bibliotecas adicionales, los que son utilice exclusivamente para el desarrollo. Esto es evidente cuando uno utiliza la primavera de arranque. Uno de tales biblioteca adicional es la base de datos h2, un archivo jar 1,7 Mb ferina. Hay dos principales argumentos contrarios a esta:

En primer lugar, si usted está preocupado acerca de un par de Mb adicional, entonces su problema principal no es, probablemente, en el lado del software, pero en el lado de administración de discos. Tal vez una capa virtual como VMWare o Xen podría ayudar?
Entonces, si la necesidad de ser, todavía se puede configurar el sistema de construcción para agilizar el artefacto producido.
El segundo inconveniente de los perfiles de primavera es que junto con las bibliotecas adicionales, la configuración de desarrollo será empaquetado en el artefacto final, así. Para ser honesta, cuando me encontré con este enfoque, este fue un no-go. Entonces, como de costumbre, pensé más y más sobre él, y llegó a la siguiente conclusión: no hay nada de malo en ello. Embalaje de la configuración de desarrollo no tiene consecuencia alguna, si está ajustado a través de XML o JavaConfig. Piense en esto: una vez que se ha creado un archivo, se considera sellado, incluso cuando el servidor de aplicaciones explota con fines de implementación. Se considera muy mala práctica de hacer algo en el archivo explotado en todos los casos. Entonces, ¿cuál sería la razón para no empaquetar la configuración de desarrollo a lo largo? La única razón que puedo pensar es: ser  limpia , desde un punto de vista teórico. Yo siendo un pragmático, creo que las ventajas del uso de perfiles de primavera es mucho mayor que este inconveniente.


http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html

# Archivos de propiedades específicos para cada perfil #

Además de en el fichero de propiedades `application.properties`, los archivos de propiedades específicas de cada profile también se pueden definir utilizando la convención de nomenclatura `application-{profile}.properties`. 

El **entorno de ejecución** (**Environment**) de **spring** tiene un conjunto de perfiles predeterminados (por defecto [**default**]) que se utilizan si no se establecen perfiles activos (es decir, si no hay ningún perfil activado explícitamente se carga por defecto `application-default.properties`).

Loa archivos de propiedades específicos de perfil se localizan en la misma ruta que el de fichero de propiedades por defecto, y sobrescriben las propiedas de otros properties que no son específicos, independientemente de donde se localicen, dentro o fuera de su paquete jar.

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


## Ficheros fuente: ##



## Referencias ##

[https://projects.spring.io/spring-boot/](https://projects.spring.io/spring-boot/ "https://projects.spring.io/spring-boot/")

[spring-boot-reference.pdf](http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf "spring-boot-reference.pdf")

[manual de buenas prácticas](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-structuring-your-code "manual de buenas prácticas")

[anular la configuración por defecto](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-auto-configuration "anular la configuración por defecto")

[lista completa de starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-starter "lista completa de starters")

[ejemplos spring-boot](https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples "ejemplos spring-boot")