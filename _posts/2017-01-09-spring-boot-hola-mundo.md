---
layout: post
sections: [Spring]
title:  "Hola mundo!!! con Spring-Boot"
date:   2017-01-09
desc: "En este post explicamos cómo funciona Spring-boot a través de la creación de un hola mundo!!!."
keywords: "Spring, Spring-Boot, Spring Tool Suite, STS, starters, configuracion por defecto, buenas prácticas"
categories: [spring]
tags: [Spring, Spring-Boot, SpringToolSuite, STS]
icon: fas fa-leaf
image: static/img/blog/spring/spring-logo.png
---

A efectos de demostración y para explicar como funciona **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**, durante el post, vamos a implementar un controlador REST con [Spring MVC](https://spring.io/guides/gs/rest-service/ "REST Spring MVC") que responda el típico ***"hola mundo!!!!"***.

## Requisitos previos ##

Vamos a usar ***Spring Boot 2.0.0.BUILD-SNAPSHOT*** que requiere ***Java 7*** y ***Spring Framework 5.0.0.BUILD-SNAPSHOT***.

## Creación del proyecto ##

Si nunca has utilizado **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** debes saber que hay muchas maneras de empezar, por ejemplo: el [asistente web de spring ***SPRING INITIALIZR***](http://start.spring.io/ "asistente web de spring ***SPRING INITIALIZR***")

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/spring/spring-initializr.png" class="img-thumbnail" alt="wizard web spring initializr started project."/>
</div>

<!--more-->

, o bien si usted está utilizando el [**IDE Spring Tool Suite (STS)**](https://spring.io/tools "IDE Spring Tool Suite"). Este último tiene un wizard integrado que invoca ese mismo servicio web.

Otra opción oficial es [Spring Boot CLI](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#getting-started-installing-the-cli "Spring Boot CLI"), es una herramienta de línea de comandos que se puede utilizar si desea crear prototipos rápidamente con **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**.

En este caso yo he usado el wizard del [**Spring Tool Suite (STS)**](https://spring.io/tools "IDE Spring Tool Suite") que lleva incorporado.

Desde el menu: ***File/new/Spring Started Project:***

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/spring/spring-new-started-project.png" class="img-thumbnail" alt="wizard spring new started project."/>
</div>

configuramos la información del proyecto y finalizamos.

> Le recomendamos que siga las convenciones de nomenclatura de paquetes recomendadas por Java y utilice un nombre de dominio inverso (por ejemplo, com.example.project).

Se nos tiene que haber creado un proyecto en el area de trabajo con la siguiente estructura:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/spring/estructura-proyecto-spring.png" class="img-thumbnail" alt="estructura proyecto spring"/>
</div>

> Este wizard sigue [el manual de buenas prácticas](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-structuring-your-code "manual de buenas prácticas") de [spring](https://spring.io/projects "spring") para proyectos de este tipo. 

## Analizando el scafoldindg ##

El wizard nos ha generado el scafolding o estructura de nuestro proyecto. Podemos ver un par de clases que aparecerán en todas las aplicaciones de **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**:

- **Application.java**: Esta clase proporciona el arranque de [spring](https://spring.io/projects "spring"), ***permitiendo acceder a las opciones de la línea de comandos en su arranque***.
    
	    package es.jmartin.spring.boot;
	    
	    import org.springframework.boot.SpringApplication;
	    import org.springframework.boot.autoconfigure.SpringBootApplication;
	    
	    @SpringBootApplication
	    public class Application {
	    
	    	public static void main(String[] args) {
	    		SpringApplication.run(Application.class, args);
	    	}
	    }
   
	> La anotación **@SpringBootApplication** es equivalente a usar el siguiente conjunto de anotaciones: **@Configuration, @EnableAutoConfiguration y @ComponentScan** con sus atributos por defecto.

	**[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** para arrancar utiliza un método `public static void main` como punto de entrada. Esto es sólo un método estándar que sigue la convención de Java para un punto de entrada de la aplicación. Se delega entonces en el método ***run*** de la clase **SpringApplication** que pone en marcha nuestra aplicación usando [spring](https://spring.io/projects "spring") y a continuación arranca un servidor web incorporado para usted. 

	> ***Nota***: Si necesitaramos realizar una configuración más compleja del arranque de [spring](https://spring.io/projects "spring"). sería en esta clase donde realizaríamos estos cambios. Aqui puedes ver un [ejemplo más complejo con configuración para gestionar la seguridad](https://github.com/spring-projects/spring-boot/blob/master/spring-boot-samples/spring-boot-sample-web-method-security/src/main/java/sample/security/method/SampleMethodSecurityApplication.java "ejemplo más complejo con configuración para gestionar la seguridad")

- **ServletInitializer.java**: En este caso como se trata de una aplicación web, necesita que se inicialice el contenedor de servlets de **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**.

	    package es.jmartin.spring.boot;
	    
	    import org.springframework.boot.builder.SpringApplicationBuilder;
	    import org.springframework.boot.web.support.SpringBootServletInitializer;
	    
	    public class ServletInitializer extends SpringBootServletInitializer {
	    
	    	@Override
	    	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    		return application.sources(Application.class);
	    	}
	    
	    }

**[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** proporciona un sistema de gestión de dependencias, mediante la definición de un módulo pom padre ***spring-boot-starter-parent***. El constructor de maven hereda la información acerca de las versiones de las dependencia a usar del pom padre, así no tienes que preocuparte de estar alineado con las versiones de las dependencias de [spring](https://spring.io/projects "spring") o de terceros.

    <parent>
    	<groupId>org.springframework.boot</groupId>
    	<artifactId>spring-boot-starter-parent</artifactId>
    	<version>2.0.0.BUILD-SNAPSHOT</version>
    	<relativePath/> <!-- lookup parent from repository -->
    </parent>

> **Nota**: Sólo es necesario especificar el número de versión de **[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** en esta dependencia. Como se puede comprobar en el pom generado, el resto de las declaraciones de dependencias ***no incluyen la etiqueta versión***.

El tipo de construcción del proyecto con maven dependerá del tipo de la dependencia **Spring Boot starter** registrada en el pom. Así para nuestro caso, ***una aplicación web***:

     <dependency> 
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-web</artifactId>
     </dependency>

> Los ***[starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-starter "starters")*** son un conjunto de descriptores de ***dependencias convenientes (versiones compatibles, ya probadas)*** que se pueden incluir en su aplicación. Se obtiene una ventanilla única para el módulo de [spring](https://spring.io/projects "spring") y la tecnología relacionada que se necesita, sin tener que buscar a través de códigos de ejemplo y copiar/pegar cargas de descriptores de dependencia. Por ejemplo, si desea comenzar a utilizar [spring](https://spring.io/projects "spring") con JPA para un acceso CRUD a base de datos, basta con incluir la dependencia ***spring-boot-starter-data-jpa*** en el proyecto. 
> 
> La integración de maven en algunos IDEs te permiten buscar los starters por nombre, por ejemplo con STS, puede simplemente pulsar `ctrl-space` en el editor de POM y el tipo ***“spring-boot-starter"*** para obtener una lista completa.
> 
> **También puedes [generar tus propios starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#boot-features-custom-starter "generar tus propios starters") con las versiones de módulos de terceros que necesites.**

Cómo el pom que se ha generado en el proyecto ya viene configurado con todas las dependencias necesarias, como un servidor web embebido para ejecutarse, sólo tenemos que construir el proyecto con maven `mvn clean install` y esté generará un .war que se puede ejecutar directamente sin ningún problema: ninguna herramienta de construcción requerida, sin instalación y sin necesidad de configuración del servidor web, etc.

## Desarrollo del End Point Rest  ##

Creamos un ***controlador rest*** ***es.jmartin.spring.boot.controller/HelloController.java*** que defina un ***end point rest*** en la ruta ***/*** del servidor:

    package es.jmartin.spring.boot.controller;
    
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RestController;
    
    @RestController
    public class HelloController 
    {
        @RequestMapping("/")
        String hellow() 
        {
            return "Hello World!";
        }
    }

## Despliegue del servidor Web incorporado ##

Para ejecutar una aplicación de **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** usando Maven, simplemente ejecutamos por línea de comandos:

    $ mvn spring-boot:run

esto generará una salida por consola similar a esto:

      .   ____  ___ _ _
     /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
    ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
     \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
      '  |____| .__|_| |_|_| |_\__, | / / / /
     =========|_|==============|___/=/_/_/_/
     :: Spring Boot ::  (v2.0.0.BUILD-SNAPSHOT)
    ....... . . .
    ....... . . . (log output here)
    ....... . . .
    ........ Started Example in 2.222 seconds (JVM running for 6.514)

> ***Nota***: Puedes [customizar el banner por defecto de carga de spring](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#boot-features-banner "customizar el banner por defecto de carga de spring") y usar por ejemplo esta [herramienta web para generar un banner personalizado de spring-boot](http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20 "herramienta web para generar un banner personalizado de spring-boot").

Cuando se ejecuta la aplicación, **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** detecta que dispone de un controlador Spring MVC y pone en marcha de una instancia de Apache Tomcat 7 incorporado, de forma predeterminada. Por tanto ya podemos probar la ejecución de la aplicación y acceder a la respuesta del endpoint REST mediante la apertura de su navegador en la ruta `http://localhost:8080`.

Si abres un navegador web en la ruta `localhost:8080` deberías poder ver la siguiente salida en el navegador:

    Hello World!

Para salir correctamente de la aplicación presione `ctrl-c`.
## Modificando la configuración por defecto ##

La configuración del servidor, como el puerto en el que queremos que arranque se puede configurar mediante la especificación de propiedades, ya sea a través de la línea de comandos, usando: `--D argumentos` o por medio de un archivo de propiedades ***application.properties*** localizado en el CLASSPATH (en este caso al generarse el scafolding se ha creado vacío en ***src/main/resources***) y que se consultará automáticamente durante el arranque del servidor. Por lo tanto, para cambiar el puerto en el que Tomcat escucha, es posible especificar `--Dserver.port=8081`, para que el servidor escuche en el puerto 8081. Si se especifica `server.port=0`, se encontrará automáticamente un puerto no utilizado para escuchar en su lugar.

Por defecto, **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** utiliza Tomcat 7. Si desea utilizar Tomcat 8 por ejemplo, sólo hay que anular la configuración de la propiedad por defecto de Maven `tomcat.version`.

    <properties>
      <tomcat.version>8.0.3</tomcat.version>
    </properties>

Por supuesto, algunos de ustedes puede que quiera usar el contenedor de servlets Jetty embebido. Simplemente puede excluir el motor de arranque  del módulo de Tomcat y luego importar el módulo de arranque del servidor Jetty:

    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <exclusions>
                <exclusion>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-tomcat</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-jetty</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>

Aquí puede ver la [lista de servidores embebidos y versiones](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#_servlet_containers "lista de servidores embebidos y versiones") que se pueden usar con spring-boot.
 
Si desea cambiar a Jetty 9 o alguna versión de las dependencias de su proyecto. Asegúrese de que tiene configurada la propiedad `.version` correspondiente en su módulo de construcción Maven.

    <properties>
        <java.version>1.7</java.version>
        <jetty.version>9.1.0.v20131115</jetty.version>
        <servlet-api.version>3.1.0</servlet-api.version>
    </properties>

## Creando un jar ejecutable ##

Vamos a terminar nuestro ejemplo mediante la creación de un archivo ejecutable jar completamente autónomo que podríamos ejecutar en producción. Estos jars ejecutables (a veces llamados ***"fat jars"***) son archivos que contienen sus clases compiladas junto con todas las dependencias que necesita el código del jar para funcionar.

> **NOTA**: Java no proporciona ninguna manera estándar para cargar archivos jar anidados (es decir, archivos JAR que a su vez están contenidos dentro de un jar). Esto puede ser problemático si usted está buscando distribuir una aplicación autónoma.
> 
> Para resolver este problema, muchos desarrolladores utilizan jars ***“uber”***. Un jar ***“uber”*** simple empaqueta todas las clases, de todos los jars, en un solo archivo jar. El problema con este enfoque es que se hace difícil ver qué librerías se está utilizando en realidad en su aplicación. También puede ser problemático si el mismo nombre de archivo se utiliza (pero con un contenido diferente) en múltiples jars.
> 
> **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** [toma un enfoque diferente](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#executable-jar "anidamiento de dependencias en spring boot") y le permite anidar directamente todos los jars.

Para crear un ***jar ejecutable*** tenemos que añadir el plugin ***spring-boot-maven-plugin*** en nuestro **pom.xml**. Inserte las siguientes líneas justo debajo de la sección de dependencias:

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>

Guarda tu **pom.xml** y ejecuta `mvn package` desde la línea de comandos:

    $ mvn package
    
    [INFO] Scanning for projects...
    [INFO]
    [INFO] ------------------------------------------------------------------------
    [INFO] Building myproject 0.0.1-SNAPSHOT
    [INFO] ------------------------------------------------------------------------
    [INFO] .... ..
    [INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ myproject ---
    [INFO] Building jar: /Users/developer/example/spring-boot-example/target/myproject-0.0.1-SNAPSHOT.jar
    [INFO]
    [INFO] --- spring-boot-maven-plugin:2.0.0.BUILD-SNAPSHOT:repackage (default) @ myproject ---
    [INFO] ------------------------------------------------------------------------
    [INFO] BUILD SUCCESS
    [INFO] ------------------------------------------------------------------------

Si nos fijamos en el ***directorio target*** se debe haber creado ***myproject-0.0.1-SNAPSHOT.jar***.

También debe ver un archivo mucho más pequeño llamado **myproject-0.0.1-SNAPSHOT.jar.original** en el directorio target. Este es el archivo jar original que Maven ha creado antes de ser empaquetado de nuevo con **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**.

Para ejecutar esta aplicación, utilice el comando `java -jar`:

    $ java -jar target/myproject-0.0.1-SNAPSHOT.jar
    
      .   ____  ___ _ _
     /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
    ( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
     \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
      '  |____| .__|_| |_|_| |_\__, | / / / /
     =========|_|==============|___/=/_/_/_/
     :: Spring Boot ::  (v2.0.0.BUILD-SNAPSHOT)
    ....... . . .
    ....... . . . (log output here)
    ....... . . .
    ........ Started Example in 2.536 seconds (JVM running for 2.864)

Como antes, para salir correctamente de la aplicación presione `ctrl-c`.

## Conclusión ##

**[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** tiene como objetivo estar ***"listos para usar" (en inglés "Out of the box")***, de manera predeterminada. Esto significa que se configuran por defecto muchos elementos necesarios para la ejecución de una aplicación java.

Hemos visto que **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** proporciona un montón de formas para [anular la configuración por defecto](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-auto-configuration "anular la configuración por defecto"), ya sea, indicando las propiedades al arrancar, modificando el fichero ***application.properties*** o la clase de arranque de la aplicación ***Application.java***.

Para entender un poco mejor todo lo que nos ofrece Spring Boot os recomiendo echarle un ojo a sus ejemplos en [https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples](https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples "https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples") algunos son impresionantemente sencillos!!!

## Ficheros fuente: ##

[ver fuente del ejemplo](https://github.com/javiermartinalonso/SPRING/tree/master/spring-boot "ver fuente del ejemplo")

## Referencias ##

[https://projects.spring.io/spring-boot/](https://projects.spring.io/spring-boot/ "https://projects.spring.io/spring-boot/")

[spring-boot-reference.pdf](http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf "spring-boot-reference.pdf")

[manual de buenas prácticas](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-structuring-your-code "manual de buenas prácticas")

[anular la configuración por defecto](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-auto-configuration "anular la configuración por defecto")

[lista completa de starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-starter "lista completa de starters")

[ejemplos spring-boot](https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples "ejemplos spring-boot")