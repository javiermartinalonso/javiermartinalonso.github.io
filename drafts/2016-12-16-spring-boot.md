---
layout: post
section: "Spring"
title:  "Spring-Boot"
date:   2016-12-16
desc: "Spring-boot establece un estándar en el diseño de aplicaciones basadas en spring de modo que estén listas para ponerse en funcionamiento tan pronto como sea posible, además ayuda durante la fase de desarrollo e incluso con la integración en producción."
keywords: "Spring, Spring-Boot, Spring Tool Suite, STS"
categories: [Spring]
tags: [Spring, Spring-Boot, Spring Tool Suite, STS]
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---

**[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** establece un estándar en el diseño de aplicaciones basadas en **[spring](https://spring.io/projects "spring")** de modo que estén **listas para ponerse en funcionamiento tan pronto como sea posible**, además ayuda durante la fase de desarrollo e incluso con la integración en producción.

Se posiciona en la capa superior del framework de spring. Sigue el patrón **Convención sobre Configuración (Convention-Over-Configuration)** permitiendo al desarrollador enfocarse en el desarrollo de la aplicación, y eliminando la necesidad de estar preocupado con todos los demás aspectos de su ciclo de vida, incluyendo el despliegue y la gestión. 


> **Convención sobre Configuración (Convention-Over-Configuration)** , también conocido como **CoC** es un paradigma de programación de software que busca minimizar el número de decisiones que un desarrollador necesita hacer, ganando así en simplicidad pero no perdiendo flexibilidad por ello.

## Objetivos de Spring Boot ##

Los objetivos de Spring Boot son:

- Proveer una ***forma muy sencilla de arrancar desarrollos Spring***.

- Ofrecer funcionalidad ***out-of-the-box (listo para usarse)*** pero permitir incorporar las peculiaridades del proyecto.

- Proporcionar una serie de características no funcionales comunes a los proyectos (por ejemplo: ***servidores embebidos, seguridad, métricas y monitorización de servicios, auditorias, configuración externalizada***).

- ***No necesitar generación código ni configuración XML***.

##Hola mundo!!! con spring-boot ##

## Requisitos previos ##

Spring Boot 2.0.0.BUILD-SNAPSHOT requiere Java 7 y Spring Framework 5.0.0.BUILD-SNAPSHOT 

Si nunca has utilizado **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** debes saber que hay muchas maneras de empezar, por ejemplo: el [asistente web de spring ***SPRING INITIALIZR***](http://start.spring.io/ "asistente web de spring ***SPRING INITIALIZR***")

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/spring/spring-initializr.png" class="img-thumbnail" alt="wizard web spring initializr started project."/>
</div>

<!-- more -->

, o bien si usted está utilizando el [**IDE Spring Tool Suite (STS)**](https://spring.io/tools "IDE Spring Tool Suite"). Este último tiene un wizard integrado que invoca ese mismo servicio web.

Otra opción oficial es [Spring Boot CLI](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#getting-started-installing-the-cli "Spring Boot CLI"), es una herramienta de línea de comandos que se puede utilizar si desea crear prototipos rápidamente con **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**.

En este caso yo he usado el wizard del [**Spring Tool Suite (STS)**](https://spring.io/tools "IDE Spring Tool Suite") que lleva incorporado.

Desde el menu: ***File/new/Spring Started Project:***

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/spring/spring-new-started-project.png" class="img-thumbnail" alt="wizard spring new started project."/>
</div>

configuramos la información del proyecto y finalizamos.

Se nos tiene que haber creado un proyecto en el area de trabajo con la siguiente estructura:

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/spring/estructura-proyecto-spring.png" class="img-thumbnail" alt="estructura proyecto spring"/>
</div>

El wizard nos ha generado el scafolding o estructura de nuestro proyecto. Podemos ver un par de clases que aparecerán en todas las aplicaciones de **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**:

- **Application.java**: Esta clase proporciona el arranque de spring, ***permitiendo acceder a las opciones de la línea de comandos en su arranque***.
    
	    package es.jmartin.spring.boot;
	    
	    import org.springframework.boot.SpringApplication;
	    import org.springframework.boot.autoconfigure.SpringBootApplication;
	    
	    @SpringBootApplication
	    public class Application {
	    
	    	public static void main(String[] args) {
	    		SpringApplication.run(Application.class, args);
	    	}
	    }
   
	**[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** para arrancar utiliza un método `public static void main` como punto de entrada que pone en marcha un servidor web incorporado para usted. 

> Nota: Si necesitaramos ralizar una configuración más compleja del arranque de spring. sería en esta clase donde realizaríamos estos cambios.
> 
> **BUSCAR ALGUN EJEMPLO COMPLEJO!!!!!!!!!!!!!!!!!!!**


- **ServletInitializer.java**: En este caso como se trata de una aplicación web, necesita que se inicialice el contendeor de servlets de **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")**.

	    package es.jmartin.spring.boot;
	    
	    import org.springframework.boot.builder.SpringApplicationBuilder;
	    import org.springframework.boot.web.support.SpringBootServletInitializer;
	    
	    public class ServletInitializer extends SpringBootServletInitializer {
	    
	    	@Override
	    	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    		return application.sources(Application.class);
	    	}
	    
	    }

A los efectos de demostración durante el post, vamos a añadir en un controlador REST Spring MVC. Aquí está la versión revisada de Application.javala página de códigos completa con un controlador Spring MVC descanso que responde con "Hola, mundo ", cuando una solicitud para /hello/World que se haga:
Implementamos el controlador rest!!!!!!!!!!!!!!!!!!!!!!!!!

## Despliegue del servidor Web incorporado ##

**[Spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** proporciona un sistema de gestión de dependencias, mediante la definición de un módulo padre ***spring-boot-starter-parent***. El constructor de maven hereda la información acerca de las versiones de las dependencia a usar del pom padre, así no tienes que preocuparte de estar alineado con las versiones de las dependencias de spring o de terceros.

> **Nota**: Como se puede comprobar en el pom generado, las declaraciones de dependencias ***no incluyen la etiqueta versión***.

    <parent>
    	<groupId>org.springframework.boot</groupId>
    	<artifactId>spring-boot-starter-parent</artifactId>
    	<version>2.0.0.BUILD-SNAPSHOT</version>
    	<relativePath/> <!-- lookup parent from repository -->
    </parent>

El tipo de construcción del proyecto con maven dependerá del tipo de la dependencia **Spring Boot starter** registrada en el pom. Así para nuestro caso, ***una aplicación web***:

     <dependency> 
       <groupId>org.springframework.boot</groupId>
       <artifactId>spring-boot-starter-web</artifactId>
     </dependency>

> Los ***[starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-starter "starters")*** son un conjunto de descriptores de dependencias convenientes que se pueden incluir en su aplicación. Se obtiene una ventanilla única para el módulo de spring y la tecnología relacionada que se necesita, sin tener que buscar a través de códigos de ejemplo y copiar pegar cargas de descriptores de dependencia. Por ejemplo, si desea comenzar a utilizar spring con JPA para un acceso CRUD a base de datos, basta con incluir la dependencia ***spring-boot-starter-data-jpa*** en el proyecto.

Cómo el pom que se ha generado en el proyecto ya viene configurado con todas las dependencias necesarias, como un servidor web embebido para ejecutarse, sólo tenemos que construir el proyecto con maven `mvn clean install` y esté generará un .war que se puede ejecutar directamente sin ningún problema: ninguna herramienta de construcción requerida, sin instalación y sin necesidad de configuración del servidor web, etc.

Para ejecutar una aplicación de **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** usando Maven, simplemente ejecutamos por línea de comandos:

    mvn spring:run

Cuando se ejecuta la aplicación, **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** detecta que dispone de un controlador Spring MVC y pone en marcha de una instancia de Apache Tomcat 7 incorporado, de forma predeterminada. Por tanto ya podemos probar la ejecución de la aplicación y acceder a la respuesta del endpoint REST mediante la apertura de su navegador en la ruta `http://localhost:8080`.

La configuración del servidor, como el puerto en el que queremos que arranque se puede configurar mediante la especificación de propiedades, ya sea a través de la línea de comandos, usando: `--D argumentos` o por medio de un archivo de propiedades ***application.properties*** localizado en el CLASSPATH (en este caso al generarse el scafolding se ha creado vacío en ***src/main/resources***) y que se consultará automáticamente durante el arranque del servidor. Por lo tanto, para cambiar el puerto en el que Tomcat escucha, es posible especificar `--Dserver.port=8081`, para que el servidor escuche en el puerto 8081. Si se especifica `server.port=0`, se encontrará automáticamente un puerto no utilizado para escuchar en su lugar.

Por defecto, **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** utiliza Tomcat 7. Si desea utilizar Tomcat 8, sólo hay que anular la configuración de la propiedad por defecto de Maven `tomcat.version`.

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

Si desea cambiar a Jetty 9 o alguna versión de las dependencias de su proyecto. Asegúrese de que tiene configurada la propiedad `.version` correspondiente en su módulo de construcción Maven.

    <properties>
        <java.version>1.7</java.version>
        <jetty.version>9.1.0.v20131115</jetty.version>
        <servlet-api.version>3.1.0</servlet-api.version>
    </properties>


## Conclusión ##

Primavera de arranque tiene como objetivo estar ***"listos para usar" (en inglés "Out of the box")***, de manera predeterminada. Esto significa que se configuran por defecto muchos elementos necesarios para la ejecución de una aplicación java.

Hemos visto que **[spring-boot](https://projects.spring.io/spring-boot/ "spring-boot")** proporciona un montón de formas para anular la configuración por defecto, ya sea, indicando las propiedades al arrancar, modificando el fichero ***application.properties*** o la clase de arranque de la aplicación ***Application.java***.

Para entender un poco mejor todo lo que nos ofrece Spring Boot os recomiendo echarle un ojo a sus ejemplos en [https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples](https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples "https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples") algunos son impresionantemente sencillos!!!

## Referencias ##

[https://projects.spring.io/spring-boot/](https://projects.spring.io/spring-boot/ "https://projects.spring.io/spring-boot/")

[http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf](http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf "http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf")

[lista completa de starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-starter "starters")

[https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples](https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples "https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples")