---
layout: post
section: "Spring"
title:  "Hola mundo!!! con Spring-Boot"
date:   2017-01-09
desc: "En este post explicamos cómo funciona Spring-boot a través de la creación de un hola mundo!!!."
keywords: "Spring, Spring-Boot, Spring Tool Suite, STS, starters, configuracion por defecto, buenas prácticas"
categories: [spring]
tags: [Spring, Spring-Boot, SpringToolSuite, STS, starters]
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---


https://dzone.com/articles/spring-boot-the-right-boot-for-you-1?edition=268896&utm_source=Daily%20Digest&utm_medium=email&utm_campaign=dd%202017-02-06

Vamos a romper un poco las cosas. ¿De qué se tratan estas anotaciones?

@SpringBootApplication Es una anotación de conveniencia que agrega todo lo siguiente:

@Configuration Etiqueta la clase como una fuente de definiciones de bean para el contexto de la aplicación.
@EnableAutoConfiguration Le dice a Spring Boot que empiece a agregar beans basándose en la configuración de classpath, otros beans y varios ajustes de propiedad.
@EnableWebMvc Normalmente agregaría para una aplicación de Spring MVC, pero Spring Boot la agrega automáticamente cuando ve  spring-webmvc en el classpath. Esto marca la aplicación como una aplicación web y activa los comportamientos clave, como la configuración de un  DispatcherServlet.
@ComponentScan Le dice a Spring que busque otros componentes, configuraciones y servicios en el paquete Hello, lo que le permite encontrar los controladores.
Wow, siempre me ha gustado la calidad incorporado en la búsqueda de un nuevo hogar! Pero, ¿qué está sucediendo realmente detrás de estos nuevos artículos brillantes?

El  main() método llama al método Spring Boot  SpringApplication.run() para iniciar.

¿Mencionamos (o notaste) que no tenías que jugar con XML? ¡Qué bono! No más  web.xml tonterías de archivo. No más pregunto si pongo la etiqueta correcta en el archivo y preguntarme cuál es el problema con el párrafo de mensaje de error ilegible que le dice casi nada más. Esto es 100% Java puro. No se necesita ninguna configuración o fontanería. Lo han hecho por ti. ¡Qué bueno de ellos!

Una vez que esté configurado y listo para comenzar a editar, echemos un rápido vistazo al  Application.java archivo. Aquí encontrarás una main clase ejecutable  . Tiene una anotación de  @SpringBootApplication. Esta es la anotación clave que hace de esta aplicación una aplicación de arranque.

	package hello;
	import java.util.Arrays;
	import org.springframework.boot.CommandLineRunner;
	import org.springframework.boot.SpringApplication;
	import org.springframework.boot.autoconfigure.SpringBootApplication;
	import org.springframework.context.ApplicationContext;
	import org.springframework.context.annotation.Bean;
	@SpringBootApplication
	public class Application {
	    public static void main(String[] args) {
	        SpringApplication.run(Application.class, args);
	    }
	    @Bean
	    public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
	        return args -> {
	            System.out.println("Let's inspect the beans provided by Spring Boot:");
	            String[] beanNames = ctx.getBeanDefinitionNames();
	            Arrays.sort(beanNames);
	            for (String beanName : beanNames) {
	                System.out.println(beanName);
	            }
	        };
	    }
	}

Ahora para ejecutarlo! Si está utilizando el conjunto STS (y lo ha construido correctamente), lo verá en el Boot Dashboard. Para todos los demás, haga clic derecho en el IDE y Ejecutar como => Aplicación Java, o diríjase a su herramienta de línea de comandos favorita. Utilice los comandos siguientes.

Maven
Mvn package && java -jar target / gs-spring-boot-0.1.0.jar


Gradle
./gradlew build && java -jar build / libs / gs-spring-boot-0.1.0.jar


¡Lo hiciste! Usted ató su primer par de botas de resorte.

La salida mostrará el arranque normal de primavera del servidor incrustado y luego se realizará un bucle sobre todos los beans y los escribirá para usted.



Botas en la pantalla
Para hacer la venta o simplemente para obtener sus ojos en el premio, este ejemplo lanza en un  CommandLineRunner método marcado como un  @Bean y esto se ejecuta en el inicio. Recupera todos los beans creados por tu aplicación o se agregaron automáticamente gracias a Spring Boot. Los clasifica y los imprime. Puede poner otra información de inicio o hacer algún otro poco de trabajo si lo desea.

## Referencias ##

[https://projects.spring.io/spring-boot/](https://projects.spring.io/spring-boot/ "https://projects.spring.io/spring-boot/")

[spring-boot-reference.pdf](http://docs.spring.io/spring-boot/docs/2.0.0.BUILD-SNAPSHOT/reference/pdf/spring-boot-reference.pdf "spring-boot-reference.pdf")

[manual de buenas prácticas](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-structuring-your-code "manual de buenas prácticas")

[anular la configuración por defecto](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-auto-configuration "anular la configuración por defecto")

[lista completa de starters](http://docs.spring.io/spring-boot/docs/current-SNAPSHOT/reference/htmlsingle/#using-boot-starter "lista completa de starters")

[ejemplos spring-boot](https://github.com/SpringSource/spring-boot/tree/master/spring-boot-samples "ejemplos spring-boot")