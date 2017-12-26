[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/badges/stability-badges)
[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badge/)

# Ejemplo de spring boot  #



Aplicación ******, generada con el wizard ***Spring Started Project*** del [**IDE Spring Tool Suite (STS)**](https://spring.io/tools "IDE Spring Tool Suite")


## Lo que vas a construir ##

https://youtu.be/5XRotk-HQJo?list=PLS1IDMaJOmEhSDgJCwa69AbguHMwaPqiM
https://github.com/SpringOnePlatform2016/weather-app


https://speakerdeck.com/jlstrater/test-driven-docs-springone-2017
https://github.com/ratpack/example-books
https://github.com/jlstrater/spring-restdocs-public-api-example
http://jlstrater.github.io/groovy-spring-boot-restdocs-example/#greetings-list-example
https://github.com/jlstrater/groovy-spring-boot-restdocs-example/blob/master/src/test/groovy/sample/web/GreetingsControllerSpec.groovy

Documentar API RESTful con Spring REST Docs

Las 
API RESTful se están comiendo el mundo, pero con demasiada frecuencia la documentación puede causar indigestión para los desarrolladores de las API y sus usuarios. Los desarrolladores deben lidiar con la sobrecarga de anotaciones, la repetición y un entorno de escritura desagradable. Los usuarios se quedan con la documentación que es inexacta y difícil de usar. No tiene que ser de esta manera.

Esta charla presentará Spring REST Docs y su enfoque impulsado por las pruebas de la documentación RESTful API. Veremos cómo combina el poder de Asciidoctor y sus pruebas de integración para producir documentación que sea precisa y fácil de leer, mientras mantiene su código SECO y libre de sobrecarga de anotación. Veremos las características que son nuevas en Spring REST Docs, centrándonos en el soporte para documentar las API que se han implementado con WebFlux de Spring Framework 5.






























## Página de explicación de su construcción ##



## Requisitos ##

- **Alrededor de 15 minutos**
- **Un editor de texto favorito o IDE**
- **JDK 1.8 o posterior**
- **Maven 3.0+**

## Compilar y pasar los test ##

Con maven desde la carpeta raíz que contiene el .pom del módulo, ejecutamos:

    mvn clean install

## Pasos en la creación del proyecto ##

- Crear esqueleto con el wizard, seleccionando como war y añadimos la dependencia. 

	

### Ejecuntando la aplicación ###

En este punto nuestra aplicación debe funcionar. Puesto que hemos utilizado el POM de ***spring-boot-starter-parent***, tenemos un método run de ejecución que podemos usar para iniciar la aplicación. Escribe `mvn spring-boot:run` desde línea de comandos en el directorio raíz del proyecto para iniciar la aplicación:

O puedes construir el archivo JAR con `./mvnw clean package`. Entonces puedes ejecutar el archivo JAR:


## Referencias ##