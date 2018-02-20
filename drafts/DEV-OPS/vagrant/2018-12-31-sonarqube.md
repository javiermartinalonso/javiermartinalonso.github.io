---
layout: post
sections: []
title:  "sonarqube"
date:   2018-02-16
desc: ""
keywords: ""
categories: []
tags: []
icon: fas fa-university
image: static/img/blog/bbdd/bbdd-logo.png
---


https://testeandosoftware.com/sonarqube-instalacion-basica/

Sonar nació para ser utilizada en desarrollos Java, pero actualmente soporta más de 20 lenguajes incluyendo  Javascript, PHP, Cobol, PL, C#, … Además, puede extenderse a través de plugins, tanto para soportar más lenguajes como para soportar nuevos lenguajes.

Se integra con Maven, Ant y herramientas de integración continua como Atlassian Bamboo y Jenkins.



# Inspección continua #

- SonarQube proporciona la capacidad no solo de mostrar el estado de una aplicación, sino también de resaltar los problemas que se presentaron recientemente.

- Detecta problemas difíciles: Los problemas planteados por SonarQube se basan en códigos demostrablemente incorrectos o en códigos que probablemente no den el comportamiento deseado. Encuentra los errores más complejos navegando fácilmente a través de las rutas de acceso del código mientras se señalan los problemas encontrados en varias ubicaciones.

- Explore todas las rutas de ejecución: SonarQube se basa en varios motores de flujo de datos sensibles a la ruta y, por lo tanto, los analizadores de código exploran todas las posibles rutas de ejecución para detectar los errores más complicados. Incluso una función simple que contiene solo 10 ramas diferentes puede dar lugar a 100 diferentes rutas de ejecución posibles en el tiempo de ejecución. Comprobar manualmente que esas 100 rutas de ejecución son a prueba de errores es simplemente imposible.

- Código apestoso: El código "Smelly" hace (probablemente) lo que debería, pero será difícil de mantener. En el peor de los casos, será tan confuso que los mantenedores pueden introducir errores inadvertidamente. Los ejemplos incluyen código duplicado, código descubierto por pruebas unitarias y código demasiado complejo.

- Centralizar la calidad: Un lugar para proporcionar una visión compartida de la calidad del código para desarrolladores, líderes tecnológicos, gerentes y ejecutivos.

- Integración DevOps: SonarQube se integra con toda la cadena de herramientas de DevOps, incluidos los sistemas de compilación, los motores de CI, las tuberías de promoción ... utilizando webhooks y su RestAPI integral.

Tuberías de promoción
Utilizando webhooks, SonarQube puede integrarse como un paso de promoción en sus canalizaciones de entrega. De esta forma, puede asegurarse de que solo los artefactos que pasan el Quality Gate se lanzarán e implementarán en la producción.








https://docs.sonarqube.org/display/SONAR/Requirements





https://lasithapetthawadu.wordpress.com/2014/05/03/configure-jenkins-with-sonarqube-for-static-code-analysis-and-integration/

# Instalación y configuración de SonarQube #

https://docs.sonarqube.org/display/SONARQUBE67/Requirements

## Requisitos ##

El único requisito previo para ejecutar SonarQube es tener Java (Oracle JRE 8 o OpenJDK 8) instalado en su máquina.

Requisitos de hardware
El servidor SonarQube requiere al menos 2 GB de RAM para ejecutarse de manera eficiente y 1 GB de RAM libre para el sistema operativo.
La cantidad de espacio en disco que necesite dependerá de la cantidad de código que analice con SonarQube. Como ejemplo, SonarCloud ,   la instancia pública de SonarQube, tiene más de 30 millones de líneas de código bajo análisis con 4 años de historia. SonarCloud se está ejecutando actualmente en una   instancia de Amazon EC2 m4.large , con aproximadamente 10 Gb de espacio en disco. Maneja más de 800 proyectos que tienen aproximadamente 3 millones de problemas abiertos. SonarCloud se ejecuta en PostgreSQL 9.5 y está utilizando aproximadamente 15 Gb de espacio en disco.
SonarQube debe instalarse en discos duros que tengan un excelente rendimiento de lectura y escritura. Lo más importante es que la carpeta "data" contiene los índices de Elasticsearch sobre los cuales se realizará una gran cantidad de E / S cuando el servidor esté funcionando. Por lo tanto, un gran rendimiento de lectura y escritura del disco duro tendrá un gran impacto en el rendimiento general del servidor SonarQube.


Navegue a http://www.sonarqube.org/downloads/ para descargar la última versión de SonarQube. Una vez descargado, extrae el archivo en la ubicación deseada.


La estructura de la carpeta está organizada para contener los binarios, las configuraciones, las extensiones, los registros y el área web del tablero de instrumentos. 
Navega a la carpeta conf . La carpeta conf consta de dos archivos de configuración, wrapper.conf y sonar.properties. Wrapper.conf contiene configuraciones JVM para el servidor SonarQube, como la memoria limita las rutas JVM. 
El sonar.properties contiene la configuración del servidor de sonarQube.
Por defecto, el servidor SonarQube hace uso de una base de datos H2 incorporada. Esta configuración no se recomienda para un entorno de producción. La siguiente figura muestra el archivo de configuración de Sonar. El archivo contiene configuración para diferentes tipos de bases de datos y el tipo requerido de configuración de la base de datos podría habilitarse según sea necesario.

Archivo Sonar.properties

Una vez que se hayan realizado los cambios de configuración requeridos, para iniciar el Servidor Sonar navegue a la carpeta bin para encontrar los binarios requeridos. Esta carpeta contiene subcarpetas específicas basadas en el sistema operativo en el que desea implementar.








https://testeandosoftware.com/sonarqube-instalacion-basica/

Instalar sonar es relativamente sencillo. Sigue los siguientes pasos:

1.- Descarga y descomprime SonarQube (por ejemplo en “C:\sonarqube” o “/etc/sonarqube”)

2.- Arranca el servidor SonarQube:

# On Windows, ejecuta:
C:\sonarqube\bin\windows-x86-xx\StartSonar.bat
 
# En Linux y Mac, ejecuta:
/etc/sonarqube/bin/[OS]/sonar.sh console
3.- Descarga y descomprime SonarQube Runner (por ejemplo en “C:\sonar-runner” o “/etc/sonar-runner”)

4.- Descarga y  descomprime algunos proyectos de ejemplo (por ejemplo en “C:\sonar-examples” o “/etc/sonar-examples”

5.- Analiza un proyecto:

# En Windows:
cd C:\sonar-examples\projects\languages\java\sonar-runner\java-sonar-runner-simple
C:\sonar-runner\bin\sonar-runner.bat
 
# En Linux y Mac:
cd /etc/sonar-examples/projects/languages/java/sonar-runner/java-sonar-runner-simple
/etc/sonar-runner/bin/sonar-runner




# Java+Runtime+Environment #


Necesitamos java 8 por lo menos:

		$  java -version
		java version "1.8.0_60"
		Java(TM) SE Runtime Environment (build 1.8.0_60-b27)
		Java HotSpot(TM) 64-Bit Server VM (build 25.60-b23, mixed mode)

Cuando se instalan varias versiones de JDK o JRE, debe asegurarse de que la versión correcta esté configurada ejecutando el comando anterior como el usuario del sistema operativo que se utiliza para ejecutar el administrador de repositorios.

Es posible que necesite actualizar la configuración para especificar una ruta de instalación de JDK o JRE específica: para establecer la ruta de una ubicación Java específica, abra la `SONAR-HOME/conf/wrapper.conf` secuencia de comandos y ubique la línea `wrapper.java.command`
`. Elimine el hash y especifique la ubicación de su JDK / JRE:

		#wrapper.java.command=/path/to/my/jdk/bin/java
		
		wrapper.java.command=/opt/provision/java/jdk1.8.0_60/bin/java



https://docs.sonarqube.org/display/SONAR/Installing+the+Server

Para configurar la bbdd

- Oracle



- Crear el usuario con su tablespace:

		CREATE TABLESPACE SONAR DATAFILE 
		  '+DATA' SIZE 100M AUTOEXTEND ON NEXT 100M MAXSIZE UNLIMITED
		LOGGING
		ONLINE
		EXTENT MANAGEMENT LOCAL AUTOALLOCATE
		BLOCKSIZE 8K
		SEGMENT SPACE MANAGEMENT AUTO
		FLASHBACK ON;
		
		CREATE USER SONAR
		  IDENTIFIED BY sonar
		  DEFAULT TABLESPACE SONAR
		  TEMPORARY TABLESPACE TEMP
		  PROFILE DEFAULT
		  ACCOUNT UNLOCK;
		  -- 2 Roles for SONAR 
		  GRANT CONNECT TO SONAR;
		  GRANT RESOURCE TO SONAR;
		  ALTER USER SONAR DEFAULT ROLE ALL;
		  -- 1 System Privilege for SONAR 
		  GRANT CREATE VIEW TO SONAR;
		  -- 2 Tablespace Quotas for SONAR 
		  ALTER USER SONAR QUOTA UNLIMITED ON SONAR;


- Revisar la version de oracle instalada:

		SELECT * FROM V$VERSION;

- [Descargar el driver de oracle, para la versión anterior según se indica en la documentación](https://docs.sonarqube.org/display/SONAR/Requirements).





`SONAR-HOME/conf/sonar.properties`

#----- Oracle 11g/12c
# The Oracle JDBC driver must be copied into the directory extensions/jdbc-driver/oracle/.
# Only the thin client is supported, and only the versions 11.2.x or 12.2.x must be used. See
# https://jira.sonarsource.com/browse/SONAR-9758 for more details.
# If you need to set the schema, please refer to http://jira.sonarsource.com/browse/SONAR-5000
#sonar.jdbc.url=jdbc:oracle:thin:@localhost:1521/XE


#----- Oracle 11g/12c
# The Oracle JDBC driver must be copied into the directory extensions/jdbc-driver/oracle/.
# Only the thin client is supported, and only the versions 11.2.x or 12.2.x must be used. See
# https://jira.sonarsource.com/browse/SONAR-9758 for more details.
# If you need to set the schema, please refer to http://jira.sonarsource.com/browse/SONAR-5000
sonar.jdbc.url=jdbc:oracle:thin:@stc-ao-db.c.mad.interhost.com:1521/



 Se reasignaron todos los propietarios ("chown -R sonar: sonar /opt/sonarqube-6.6") 
3. y se reiniciaron sin problemas el servicio sonarqube y su servicio de búsqueda elástica. Me quedaba tener que ir a http://<sonarhost:port>/setupactualizar la base de datos y desde allí todo funcionó bien.




Pasamos el control de sonar al nuevo usuario.

Si está ejecutando en Linux, debe asegurarse de que:

sonarqube no debe ejecutarse bajo la cuenta de root


cambiamos el usuario y el grupo a los directorios de sonar

// Añadir un grupo
	groupadd sonar
 
	adduser sonar

	chown -R sonar:sonar /opt/provision/sonarqube-6.7.1

Se cambió  en `/opt/sonarqube-6.6/bin/linux-x86-64/sonar.sh`, línea 48 `#RUN_AS_USER=` por `RUN_AS_USER=sonar`

Nos convertimos en el nuevo usuario e iniciamos el servicio.

	su - sonar


https://docs.sonarqube.org/display/SONAR/Running+SonarQube+as+a+Service+on+Linux

Crear un enlace simbólico en `init.d` de SONAR_HOME/bin/linux-x86-64/ a /etc/init.d/sonar:

	sudo ln -s /opt/provision/sonarqube-6.7.1/bin/linux-x86-64/sonar.sh /etc/init.d/sonar

ya se puede iniciar como servicio

	service sonar start












http://sigobpm1.c.mad.interhost.com:9000/






Ejecutando SonarQube

6.- Navega por los resultados a través de la URL: http://localhost:9000 (las credenciales por defecto de System administrator son admin/admin).

Sonar Home Sonar Metrics

Una vez que tengamos instalado y funcionando la herramienta, tendremos que habituarnos a ella, y a su funcionamiento.

Por ejemplo, en relación a la complejidad ciclomática, SonarQube considera que un método tiene por defecto una complejidad de 1 (excepto los getters y setters que no se consideran para este cálculo), y suma +1 cada vez que aparece alguna de las siguientes instrucciones (if, for, while, case, catch, throw, return, &&, ||, ?), no haciendo distinción sobre las mismas. Esta es la forma en que la calcula esta herramienta, por lo que los cálculos serán diferentes de los que nos dé otra herramienta.









Proporcionar un token
provisión : fd8e21e619c0650cde368dcb025d93a1e303bc57
El token se utiliza para identificarte cuando se realiza un análisis. Si se ha visto comprometido, puede revocarlo en cualquier momento en su cuenta de usuario.











https://lasithapetthawadu.wordpress.com/2014/05/03/configure-jenkins-with-sonarqube-for-static-code-analysis-and-integration/

configurando Jenkins


Integracion con jenkins

https://plugins.jenkins.io/sonar

Luego, navegue hasta Administrar Jenkins y luego Administrar complementos. Esta sección permite instalar el complemento SonarQube para Jenkins. Desde la sección disponible, busque el complemento SonarQube.



https://lasithapetthawadu.wordpress.com/2014/05/03/configure-jenkins-with-sonarqube-for-static-code-analysis-and-integration/?blogsub=confirming#subscribe-blog


Una vez que la instalación esté completa, navegue nuevamente a Manage Jenkins y luego configure el sistema

Esto lanzaría la configuración de Jenkins. Esta sección permite configurar los compiladores, la configuración de los complementos existentes y la configuración del repositorio.

Después de instalar el complemento Sonar en la sección de configuración, habría una sección separada para la configuración del Servidor Sonar. La sección de Sonar permite configurar las URL de Sonar Server, la configuración de la base de datos para el servidor de sonar y las credenciales de usuario.


Configuración de SonarQube
La siguiente sección que debe configurarse es el Sonar Runner. Esto podría configurarse para que se descargue e instale automáticamente desde Maven central. La figura a continuación contiene la configuración de un Sonar Runner.

Configuración de Sonar Runner


https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Jenkins


Administrar Jenkins / Configurar el Sistema

Administrar Jenkins / Global Tool Configuration





he creado esta carpeta para que?? para instalar un sonnar scanner
/opt/jenkins_home/sonar/


/opt/jenkins_home/sonar/sonar-scanner-3.0.3.778-linux/conf/sonar-scanner.properties

		#Configure here general information about the environment, such as SonarQube DB details for example
		#No information about specific project should appear here
		
		#----- Default SonarQube server
		sonar.host.url=http://sigobpm1.c.mad.interhost.com:9000
		
		#----- Default source code encoding
		sonar.sourceEncoding=UTF-8
		
		sonar.projectKey=fd8e21e619c0650cde368dcb025d93a1e303bc57
		
		sonar.sources=.
		
		sonar.java.source=1.8
		
		sonar.java.binaries=.

https://www.youtube.com/watch?v=jh7utASgKj4

https://docs.sonarqube.org/display/PLUG/Handling+Java+Source+Version
https://docs.sonarqube.org/display/SCAN/Advanced+SonarQube+Scanner+Usages
https://docs.sonarqube.org/display/SONAR/Analysis+Parameters
https://jenkins.io/blog/2017/04/18/continuousdelivery-devops-sonarqube/




https://docs.sonarqube.org/display/SONAR/Troubleshooting

Verificando los registros

Si tiene problemas para iniciar su servidor por primera vez (o en cualquier momento posterior), lo primero que debe hacer es verificar los registros de su servidor. Los encontrará en  $ SONARQUBE_HOME / logs :

sonar.log  - Log para el proceso principal. Contiene información general sobre el inicio y el apagado. Obtendrás el estado general aquí, pero no los detalles. Mira los otros registros para eso.
web.log  : información sobre la conexión inicial a la base de datos, la migración y reindexación de la base de datos, y el procesamiento de solicitudes HTTP. Esto incluye la base de datos y los registros del motor de búsqueda relacionados con esas solicitudes.
ce.log  : información sobre el procesamiento de tareas en segundo plano y la base de datos y los registros del motor de búsqueda relacionados con esas tareas.
es.log - Ops información del motor de búsqueda, como el inicio de Elasticsearch, cambios de estado de salud, operaciones de nivel de clúster, nodo e índice, etc.




https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Jenkins
https://jenkins.io/doc/pipeline/steps/sonar/
https://docs.sonarqube.org/display/SONAR/Webhooks

# Webhooks
 #

Webhooks POST a las URL HTTP (S) externas que especifique después de que ocurran ciertos tipos de eventos. Por lo general, los webhook se usarían para notificar herramientas externas de los estados de Quality Gate de sus proyectos. Lo más habitual es que el procesamiento de un informe de análisis desencadene los webhooks, pero también se dispararán si la  edición de un problema  provoca un cambio en el estado de la puerta de calidad. 

https://blog.sonarsource.com/breaking-the-sonarqube-analysis-with-jenkins-pipelines/

## Referencias ##


https://docs.sonarqube.org/display/SONARQUBE67/Architecture+and+Integration

https://unpocodejava.com/2018/02/20/humorcuando-mi-codigo-no-compila-despues-de-horas-intentando-arreglarlo/