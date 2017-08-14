---
layout: post
section: "ARQUITECTURA"
title:  "Configuración de entornos"
date:   2017-01-19
desc: "En el ámbito de gestión del ciclo de vida de un proyecto o producto software, solemos separar el propio código de la configuración que depende del entorno, p.ej. integraciones con sistemas externos, configuración JVM, pooles, etc.."
keywords: "Spring, Spring-Boot, arquitectura, entorno de despliegue, Propiedades del sistema, Profiles en Maven, Profiles en Spring"
categories: [arquitectura]
tags: [Spring, arquitectura, entorno_de_despliegue, Propiedades_del_sistema, Profiles_en_Maven, Profiles_en_Spring]
icon: fa-university
image: static/img/blog/arquitectura/arquitectura-logo.png
---

# ¿Por qué es necesario configurar la información para cada ambiente? #

Un requerimiento usual en el ciclo de desarrollo de sistemas empresariales es el contar con múltiples ambientes, por ejemplo ***desarrollo, pruebas de integración, pre-producción, producción***. Normalmente estos ambientes son semejantes pero no iguales.

En el ámbito de ***gestión del ciclo de vida de un proyecto o producto software***, solemos separar el propio código de la configuración que depende del entorno, p.ej. integraciones con sistemas externos, configuración JVM, pooles, etc.

<!--more-->

La configuración dependiente del entorno tiene un ciclo de vida separado aunque no independiente. Además, sobre todo en entornos empresariales grandes, la configuración es mantenida por personas distintas al equipo de desarrollo.

Adicionalmente no sólo existe una línea de cambios (***release***), sino también varias paralelas como por ejemplo la evolución a una nueva arquitectura, pruebas de concepto, migración a una nueva infraestructura o Middleware, hotfixes, etc. Por lo tanto resulta ***necesario facilitar un merge, no sólo del código fuente sino también de las configuraciones dependientes del entorno***.

El ***despliegue en diferentes entornos***, por tanto, requiere configuración. Información habitual que debe establecerse en cada entorno:

- Integración con ***repositorios de datos***: JNDI, Pooles...
- la ***información de integración con servicios externos***: urls base de los servicios rest, vistas, BPM, servicios de identificación y autentificación que consume la aplicación (incluyendo direcciones IP y puertos).
- ***Rutas al filesystem***, rutas donde guardas los logs, ficheros temporales...

Incluso en entornos no tan grandes como los empresariales a la hora de desarrollar aplicaciones simples podemos necesitas usar estos conceptos.
Como ejemplo, tomemos una arquitectura habitual con **maven** y **Spring**, que usa casos de test de pruebas unitarias. En spring, gracias a la inversión de control y la inyección de dependencias podemos crear diferentes beans que definan un origen de datos. Normalmente necesitaremos definir fragmentos de configuración de origen de datos diferentes:

- Para el ***entorno de despliegue*** (Integración, Preproducción, Producción... es decir,  todos los entornos excepto el del propio ordenador de desarrollo local) que especifica la ***ubicación de búsqueda JNDI***.

- Para el ***entorno de desarrollo local (y tests)***, que configura una ***conexión directa a una base de datos*** de desarrollo o test.

> **NOTA**: La buena práctica en entornos de despliegue es el uso de una ***fuente de datos JNDI*** en lugar de una conexión local. Incluso Tomcat y Jetty que implementan sólo una fracción del perfil web de Java EE, proporcionan esta característica ingeniosa y útil.
> ***JNDI***, ***La Interfaz de Nombrado y Directorio Java (Java Naming and Directory Interface)*** es una ***Interfaz de Programación de Aplicaciones (API)*** de Java para servicios de directorio. Permite a los clientes descubrir y buscar objetos y datos a través de un nombre. De esta manera podemos desacoplar las aplicaciones de los recursos que consumen y aprovechamos que el acceso a los servidores en los entornos de producción están securizados para definir en ellos los datasources y hacerlos accesibles a través de un identificador ***JNDI*** evitando así que las aplicaciones deban conocer exactamente los datos de conexión que tienen un impacto alto en la seguridad y el mantenimiento de la aplicación. De esta forma se puede migrar el servidor de bbdd de una maquina a otra y cambiar la información de la conexión ***JNDI*** en el servidor y la aplicación no se vería afectada.
> 
En la mayoría de las aplicaciones Java, esto se logra a través de archivos ***conf-entorno.properties*** identificando el entorno dedicado a través de una nomenclatura correcta.
 
Durante la fase de desarrollo, no hay razón para que nos obliguemos a utilizar el mismo sistema de configuración que el que tenemos instalado en producción, por ejemplo, podemos utilizar una base de datos h2 embebida en lugar de la bbdd de tipo oracle de producción, ahorrándonos así costes de licencias, complejidad de mantenimiento y ahorro de espacio en disco al no necesitar instalar nada.

## Diferentes soluciones que podemos usar ##

1. **Propiedades del sistema**
1. **Profiles en Maven**
1. **Profiles en Spring**
1. **Almacenar en base de datos las propiedades de configuración**

### 1. Propiedades del sistema ###

***Propiedades del sistema*** consisten en un ***nombre***, ***descripción***, el ***tipo*** de información (por ejemplo, entero, cadena, verdadero \| falso, y así sucesivamente), y el ***valor del sistema***. ***El uso de una propiedad del sistema en vez de un valor codificado en secuencias de comandos del lado del servidor hace que el sistema sea más fácil de mantener y le ofrece la flexibilidad para realizar cambios en el comportamiento del sistema sin necesidad de reprogramación***.

Puede utilizar las propiedades del sistema ya definidos en la ***tabla de la propiedad del sistema [sys_properties]***, o puede crear sus propias propiedades del sistema para llevar a cabo las funciones personalizadas en el sistema. Se recomienda que se utilice una convención de nomenclatura estándar para las propiedades del sistema, y crear categorías de propiedades para agrupar las propiedades del sistema relacionados.

### 2. Profiles en Maven ###

A día de hoy, es posiblemente una de las opciones más usadas.

Con el sistema de construcción Maven, el cambio entre la configuración se consigue a través de los llamados ***perfiles en tiempo de compilación***. Se podría decir que un perfil de Maven es una parte de un POM que se puede activar o no. Por ejemplo, el siguiente fragmento de maven define un ***profile*** que reemplaza el directorio de recursos estándar de Maven con uno dedicado.

	<profiles>
	    <profile>
	      <id>dev</id>
	      <activation>
	        <activebydefault>true</activebydefault>
	      </activation>
	      <build>
	        <resources>
	          <resource>
	            <directory>profile/dev</directory>
	            <includes>
	              <include>**/*</include>
	            </includes>
	          </resource>
	        </resources>
	      </build>
	    </profile>

	    <profile>
	      <id>prod</id>
	      <activation>
	        <activebydefault>false</activebydefault>
	      </activation>
	      <build>
	        <resources>
	          <resource>
	            <directory>profile/prod</directory>
	            <includes>
	              <include>**/*</include>
	            </includes>
	          </resource>
	        </resources>
	      </build>
	    </profile>
	</profiles>

La activación de uno o varios perfiles diferentes es tan fácil como usar el interruptor `-P` con sus ID´s separados por comas en la línea de comandos cuando se invoca Maven. El siguiente comando activará el perfil `prod` (siempre y cuando se encuentre en el POM):

    mvn package -Pprod

> En el fragmento anterior se ha añadido la entrada `<activebydefault>true</activebydefault>` con lo cual sino indicamos nada durante la construcción con maven, este perfil será el utilizado por defecto. Tan pronto como un único perfil se activa de forma explícita, el perfil predeterminado se desactiva.


#### Ventajas e inconvenientes del uso de los profiles en maven. ####

Las principales ventajas que yo veo a esta solución son:

- Facilita la **construcción optimizada de la aplicación para cada entorno**. La aplicación contiene las dependencias de librerías necesarias para funcionar en cada entorno y ninguna más.

- Tenemos en un **único punto de la aplicación donde se define la entrada de la configuración de cada entorno**. Esto ayuda a documentar en la propia aplicación sus dependencias por entorno.

Los principales inconvenientes que yo veo de esta solución son:

- La tendencia de ***sobre-fragmentación de los archivos de configuración***:

	Yo prefiero usar archivos de configuración de grano grueso bien especializados, con cada uno dedicado a una capa o un caso de uso. Por ejemplo, cuando defino la configuración de la conexión a bbdd, me gustaría que declare al menos el origen de datos, el administrador de transacciones y el gestor de entidades en el mismo archivo, posiblemente con los diferentes repositorios y no disgregar esta información en varios ficheros o fragmentos de configuración separados.

- Si ***la configuración de los entornos varía a menudo*** (Mundo de la nube y los microservicios):
	
	Nos obliga a cambiar los ficheros de configuracion, properties o incluso el .pom y volver a construir la aplicación para dicho entorno.

### 3. Profiles en Spring ###

A diferencia de ***los profiles de Maven***, ***los profiles en Spring*** se activan ***en tiempo de ejecución***.


[Spring Boot](https://javiermartinalonso.github.io/spring/2017/01/02/spring-boot.html "Spring Boot") le permite externalizar su configuración para que pueda trabajar con el mismo código de aplicación en diferentes entornos. Puede utilizar: ***ficheros .properties, ficheros .yaml, variables de entorno y argumentos de línea de comandos***.

Esto permite la posibilidad de crear una configuración por defecto, por  ejemplo para probar en desarrollo, y con la ayuda de anotaciones ***@Conditional*** se personalice la activación de unos beans u otros en cada entorno. 

De esta manera, por ejemplo podemos definir un bean que debe crearse en el contexto de spring en el entorno de desarrollo, que defina el datasource de conexión contra una bbdd de tipo h2 y una vez la aplicación esté en ejecución, si no existe este bean, porque no se ha activado el perfil "dev", se cree el bean que se conecte a bbdd mediante un ***Lookup en el JNDI*** del servidor presente en ese entorno. Este tipo de configuración se lleva a cabo en el siguiente fragmento:

	@Configuration
	public class MyConfiguration {

	    @Bean
	    @Profile("dev")
	    public DataSource dataSource() throws Exception {
	        org.apache.tomcat.jdbc.pool.DataSource dataSource = new org.apache.tomcat.jdbc.pool.DataSource();
	        dataSource.setDriverClassName("org.h2.Driver");
	        dataSource.setUrl("jdbc:h2:file:~/conditional");
	        dataSource.setUsername("sa");
	        return dataSource;
	    }
	 
	    @Bean
	    @ConditionalOnMissingBean(DataSource.class)
	    public DataSource fakeDataSource() {
	        JndiDataSourceLookup dataSourceLookup = new JndiDataSourceLookup();
	        return dataSourceLookup.getDataSource("java:comp/env/jdbc/conditional");
	    }
	}

#### Ventajas e inconvenientes del uso de los profiles en Spring. ####

Las principales ventajas que yo veo a esta solución son:

- Esto es muy útil en mundo de la ***nube y los microservicios***, ya que podríamos parar el microservicio y volverlo a arrancar indicando por línea de comandos el argumento que corresponde con una propiedad y cambiar su valor durante el arranque añadiendo `--arg=valor`

Ahora, este enfoque tiene algunas desventajas. 

- El problema más obvio es que el archivo final pesará más, pues contendrá librerías adicionales, las que se utilicen exclusivamente para el desarrollo y las necesarias para funcionar en cada entorno. 

	> Esto es evidente cuando uno utiliza ***[Spring Boot](https://javiermartinalonso.github.io/spring/2017/01/02/spring-boot.html "Spring Boot")*** y sin embargo deja de ser preocupante si comparamos el coste que suponen unos pocos megas en producción con respecto a las ventajas de que se pueda ejecutar directamente la aplicación en cada entorno, simplificando el despliegue por parte de los técnicos.

- El segundo inconveniente de ***los profiles en Spring*** es que junto con las bibliotecas adicionales, la configuración de los distintos entornos será empaquetada en el artefacto final.

	> Esto bien puede ser preocupante si la información de cada entorno es sensible respecto a problemas de seguridad. Si no es así, puede suponer incluso una ventaja. Supongamos que en cada entorno lo que cambia es el id del jndi del datasource en el servidor; En este caso esta práctica nos podría ayudar a documentar en el propio código las conexiones de cada entorno. Si esta configuración cambia en el servidor afecta a la construcción de la aplicación y por tanto podría obligar a cambiar la implementación del artefacto compilado cuya construcción está cerrada.

### 4. Almacenar en base de datos las propiedades de configuración ###
	
Otra posible solución es ***almacenar las propiedades de configuración en una base de datos*** y utilizar la clase ***DatabaseConfiguration de Apache Commons-Configuration*** para obtener estas propiedades y complementándola con el uso de profiles de maven, profiles de spring o variables de entorno para determinar el ambiente.

Esta solución tiene la ventaja de que las propiedades del sistema son centralizadas, no requiere re-instalación de la aplicación cuando se necesite cambiar alguna propiedad y ayuda a proteger información sensitiva.

La desventaja mas clara es que obliga a mantener una bbdd y si esta se cae o deja de dar servicio, nuestra aplicación deja de funcionar.

## Conclusiones ##

Como vemos hay varias soluciones que podemos aplicar, de manera individual o combinándolas según las necesidades de cada proyecto. No hay soluciones definitivas, cada una aporta su forma de trabajar para un problema concreto.

## Referencias ##
[maven-introduction-to-profiles](http://maven.apache.org/guides/introduction/introduction-to-profiles.html "maven-introduction-to-profiles")

[spring-introduction-to-profiles](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-profiles.html "spring-introduction-to-profiles")

[Spring-boot-features-external-config](http://docs.spring.io/autorepo/docs/spring-boot/current/reference/html/boot-features-external-config.html "Spring-boot-features-external-config")