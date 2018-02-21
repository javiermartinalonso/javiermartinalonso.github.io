---
layout: post
section: "Jenkins"
title:  "Primeros Pasos con Jenkins"
date:   2018-02-14
desc: "Primeros Pasos con Jenkins"
keywords: "jenkins, "
categories: [Jenkins]
tags: [Integración_Continua, DevOps, jenkins, Blue Ocean]
icon: fab fa-jenkins
image: static/img/blog/jenkins/jenkins-logo.png
---


# Tutorial Jenkins #

# ¿Qué es Jenkins? #

***Jenkins*** es un servidor autónomo de código abierto que se puede usar para automatizar todo tipo de tareas relacionadas con la [integración continua]({{ site.baseurl }}devops/2018/02/25/devops-integracion-continua.html) de software.

***Jenkins*** puede instalarse a través de paquetes de sistema nativos, Docker, o incluso ejecutarse de manera independiente en cualquier máquina con [Java Runtime Environment (JRE)]({{site.baseurl}}/java/2016/11/06/java-Instalacion-JDK.html) instalado.

***Jenkins*** es un producto altamente extensible cuya funcionalidad puede extenderse mediante la instalación de complementos.

Hay una gran variedad de complementos disponibles para ***Jenkins***

----------
https://jenkins.io/doc/book/installing/#installing-docker

# Instalando Jenkins  #

Los procedimientos en esta página son para nuevas instalaciones de ***Jenkins*** en una máquina única / local.
Nota: Aunque esta página se centra en las instalaciones locales de ***Jenkins***, este contenido también se puede usar para ayudar a configurar ***Jenkins*** en entornos de producción.


***Jenkins*** normalmente se ejecuta como una aplicación independiente en su propio proceso con el servidor de aplicaciones / contenedor de servlets Java integrado ( Jetty ).

***Jenkins*** también se puede ejecutar como un servlet en diferentes contenedores de servlets de Java como Apache Tomcat o GlassFish . Sin embargo, las instrucciones para configurar este tipo de instalaciones están fuera del alcance de esta página.



## Requisitos previos ##

- Java 8
- 1 GB de memoria libre +
- 50 GB + espacio libre en disco

## Stand-alone or Servlet? ##

***Jenkins*** puede funcionar *stand-alone*, es decir, que se puede ejecutar sin necesidad de un procedimiento de instalación, basta con desplegarlo en su propio servidor web y ejecutarlo con su propio servicio. También puede funcionar en un contenedor de servlet existente, como Tomcat. Esta sección está dirigida específicamente a una instalación y ejecución *stand-alone*.



# Docker #

***Docker*** es una plataforma para ejecutar aplicaciones en un entorno aislado llamado ***contenedor Docker***. Las aplicaciones como ***Jenkins*** se pueden descargar como ***imágenes de solo lectura (imágenes Docker)***, cada una de las cuales se ejecuta en ***Docker*** como contenedor. Un ***contenedor Docker*** es en efecto una "instancia en ejecución" de una ***imagen Docker***. Desde esta perspectiva, una imagen se almacena permanentemente más o menos (es decir, en la medida en que se publican las actualizaciones de imágenes), mientras que los contenedores se almacenan temporalmente. 




Lea más acerca de estos conceptos en la sección Primeros pasos de la documentación de ***Docker*** , Orientación y configuración .




La filosofía de trabajo de contenedores de la plataforma ***Docker*** significa que una ***imagen Docker***, para cualquier aplicación dada como ***Jenkins***, se puede ejecutar en cualquier sistema operativo compatible (macOS, Linux y Windows) o servicio en la nube (AWS y Azure) que también ejecute ***Docker***.




# Lanzar Jenkins en un contenedor Docker #

La imagen recomendada de ***Docker*** para usar es la imagen [jenkinsci/blueocean](https://hub.docker.com/r/jenkinsci/blueocean/) (del repositorio de [Docker Hub](https://hub.docker.com/)). Esta imagen contiene la [versión actual de Soporte a Largo Plazo (LTS) de Jenkins](https://jenkins.io/download/)  (que está lista para producción) incluida con todos los complementos y características de ***Blue Ocean***. Esto significa que no necesita instalar el plugin ***Blue Ocean*** por separado.

		docker run \
		  -u root \
		  --rm \
		  -d \
		  -p 8080:8080 \
		  -p 50000:50000 \
		  -v jenkins-data:/var/jenkins_home \
		  -v /var/run/docker.sock:/var/run/docker.sock \
		  jenkinsci/blueocean

- `-u` indicamos el usuario con el que se ejecutaran los servicios dentro del contenedor.

- `-rm`	(Opcional) Elimina automáticamente el contenedor ***Docker*** cuando se apaga. Esto mantiene las cosas ordenadas si necesita abandonar ***Jenkins***.

- `-d` ( Opcional ) Ejecuta el contenedor ***jenkinsci/blueocean*** en segundo plano y muestra la ID del contenedor. Si no especifica esta opción, el log de la ejecución del contenedor se muestra en la ventana del terminal.

- `-p` Mapea o publica, el puerto interno del contenedor al puerto 8080 en la máquina host. El primer número representa el puerto en el host, mientras que el último representa el puerto del contenedor. El segundo mapeo de puertos al puerto 50000 en la máquina host, sólo es necesario si ha configurado uno o más agentes ***Jenkins*** en otras máquinas, que a su vez interactúan con el contenedor ***jenkinsci/blueocean*** (actuando como el servidor "maestro" de ***Jenkins***, o simplemente como *"Jenkins master"*) en el puerto por defecto 50000.

- `-v` ( Opcional pero muy recomendado ) Mapeo del directorio `/var/jenkins_home` en el contenedor al volumen Docker con el nombre `jenkins-data`. Si este volumen no existe, este comando `docker run` creará automáticamente el volumen por usted. Esta opción es necesaria si desea que su estado de ***Jenkins*** persista cada vez que reinicie ***Jenkins***. Si no especifica esta opción, entonces ***Jenkins*** se restablecerá efectivamente a una nueva instancia después de cada reinicio.

> Notas: El volumen  `jenkins-data` también se puede crear de forma independiente con el comando `docker volume create`:
> 
> 		docker volume create jenkins-data
> 
> En lugar de mapear el directorio `/var/jenkins_home` a un volumen ***Docker***, también podría asignar este directorio a uno en el sistema de archivos local de su máquina. Por ejemplo, al especificar la opción `- v $HOME/jenkins:/var/jenkins_home` sincroniza el directorio `/var/jenkins_home` del contenedor con el subdirectorio `jenkins` dentro del directorio `$HOME` en su máquina local, que típicamente sería `/Users/<your-username>/jenkins` o `/home/<your-username>/jenkins`.

- `-v /var/run/docker.sock:/var/run/docker.sock` ( Opcional ) Sirve para que el contenedor se comunique con el `daemon Docker`, que es necesario si el ***jenkins*** necesita crear instancias de otros contenedores ***Docker*** en la sección `agent { docker { ... } }` de pipelines declarativos.

- `jenkinsci/blueocean` identifica la imagen de ***Docker*** en sí. Si esta imagen aún no se ha descargado, este comando `docker run` descargará automáticamente la imagen por usted. Además, si se publicaron actualizaciones de esta imagen desde la última vez que ejecutó este comando, ejecutar nuevamente este comando descargará automáticamente las actualizaciones de imágenes publicadas por usted.

> Nota: Esta imagen Docker también se puede descargar (o actualizar) de forma independiente con el comando `docker pull`:
> 
> 		docker pull jenkinsci/blueocean



# Accediendo al terminal / símbolo del sistema contenedor Jenkins / Blue Ocean Docker #

Si tiene alguna experiencia con ***Docker*** y desea o necesita acceder al ***contenedor jenkinsci/blueocean*** a través de un terminal / símbolo del sistema puede hacerlo usando el comando `docker exec` con la opcion `-it` para entrar en modo iterativo en una terminal añadiendo al final el comando `bash`, para acceder directamente a la terminal del contenedor. Para ello necesita que el contenedor este identificado para acceder al contenedor en ejecución. 

> Puede agregar una opción como `--name jenkins-blueocean` en el comando de arranque del contenedor (comando `docker run` [explicado en el apartado anterior](#lanzar-jenkins-en-un-contenedor-docker)), que le daría al contenedor `jenkinsci/blueocean` el nombre "jenkins-blueocean" o bien con el comando `docker ps` podría obtener el id del contenedor o el nombre asignado por el ***daemon docker***. 

Esto significa que puede acceder al contenedor (a través de una ventana de solicitud de terminal /  símbolo del sistema separada) con un comando `docker exec` como:

		docker exec -it <docker-container-name> bash

# Accediendo al registro de log de la consola de Jenkins a través de Docker logs#

Existe la posibilidad de que necesite acceder al registro de la consola de ***Jenkins***, por ejemplo, al desbloquear ***Jenkins*** como parte del asistente de instalación posterior a la instalación .

Puede acceder desde desde el terminal como se indica en el apartado anterior o bien directamente ejecutando el comando:

		docker logs <docker-container-name>

> Tu `<docker-container-name>` puedes obtenerlo usando el comando `docker ps`. Si especificó la opción `--name jenkins-blueocean` en el comando `docker run` [explicado anteriormente](#lanzar-jenkins-en-un-contenedor-docker).

# Accediendo al directorio `jenkins_home` #

Existe la posibilidad de que necesite acceder al directorio `jenkins_home`, por ejemplo, para verificar los detalles de una compilación de ***Jenkins*** en el subdirectorio `workspace` .

Puedes acceder a través de la shell del contenedor o bien a través del directorio del host sincronizado con un volumen dentro del contenedor como se explicó en los apartados anteriores.

# Instalacion del Archivo WAR como stand-alone#

La versión de archivo de la aplicación web (WAR de ***Jenkins***) se puede instalar en cualquier sistema operativo o plataforma que admita Java, se recomienda la version 8 de java.

- Descargue el [último archivo WAR estable de Jenkins](http://mirrors.jenkins.io/war-stable/latest/jenkins.war) a un directorio apropiado en su máquina .

- Abra una ventana de terminal / símbolo del sistema en el directorio de descarga y ejecuta el comando `java -jar jenkins.war`.

- Busque en el navegador`http://localhost:8080` y espere hasta que aparezca la página Desbloquear Jenkins .


> Notas:
> 
> A diferencia de la opción [antes explicada de descargar y ejecutar Jenkins con Blue Ocean en Docker](#lanzar-jenkins-en-un-contenedor-docker), este proceso no instala automáticamente las características de ***Blue Ocean***, que tendrían que instalarse por separado a través de la página` Administrar Jenkins Administrar complementos en Jenkins`. 
> 
> Puede cambiar el puerto especificando la opción `--httpPort` cuando ejecuta el comando anterior. Por ejemplo, para hacer que ***Jenkins*** sea accesible a través del puerto `9090`, ejecute ***Jenkins*** usando el comando:
> 
> 		java -jar jenkins.war --httpPort=9090


# Instalación en un contenedor de servlets #

Simplemente copie el archivo war en el directorio de deploy de aplicaciones war. Puede acceder al servidor como habitualmente acceder al resto de aplicaciones desplegadas en su servidor con una ruta similar a esta `dominio-servidor:puerto/jenkins` por ejemplo `localhost:8080/jenkins`.


https://wiki.jenkins.io/display/JENKINS/Administering+Jenkins

## Configurar la ruta del directorio `jenkins_home` ##

***Jenkins*** necesita algo de espacio en disco para realizar compilaciones y guardar archivos. Puedes verificar esta ubicación desde la pantalla de configuración de Jenkins. **De forma predeterminada, esto se establece en `~/.jenkins`, y esta ubicación se almacenará inicialmente en la ubicación del perfil de usuario que arrancó el servidor. Así por ejemplo si el usuario que arranca el servidor se llama `javi` entonces la ruta en un sistema Unix será `/home/javi/.jenkins`.**. 

> Esta ruta se puede comprobar en el tablero de instrumentos de ***Jenkins***, haz clic en `Administrar Jenkins / Configurar sistema`.
> 
> 
> Poner imagen


En un entorno adecuado, debe cambiar esta ubicación a una ubicación adecuada para almacenar todas las construcciones y archivos relevantes. Una vez puede hacer esto de las siguientes maneras:

1. Opción 1 Usando enlace simbólico (Sólo es válido para un sistema Unix)

		# movemos el directorio al nuevo emplazamiento
		mv .jenkins /data/jenkins_home
		
		# creamos un enlace simbólico para que la ruta anterior apunte al nuevo emplazamiento 
		ln -s /data/jenkins_home .jenkins
		
		#cambiamos los permisos al nuevo enlace simbolico
		chown javi:grupo .jenkins

2. Opción 2 Modificando la variable de entorno "JENKINS_HOME" (Es válido tanto para Unix como para windows)

	- Movemos el directorio al nuevo emplazamiento.
	
	- Establecer la variable de entorno "JENKINS_HOME", cualquiera de estas tres opciones es válida (basta con realizar una):
	
		1. Establezca la variable de entorno "JENKINS_HOME" en el nuevo directorio de inicio antes de iniciar el contenedor de servlets.
			Por ejemplo en unix: `export JENKINS_HOME =/data/jenkins_home`

		2. Establezca la propiedad del sistema "JENKINS_HOME" en el contenedor de servlets.
		
		3. Establezca la entrada de entorno JNDI "JENKINS_HOME" en el nuevo directorio.

Compruebe en el tablero de instrumentos de ***Jenkins*** que la ruta ha cambiado, haz clic en `Administrar Jenkins / Configurar sistema`.

En el directorio de inicio, ahora verá el nuevo directorio que se ha configurado.

Poner imagen













# Asistente de configuración posterior a la instalación #

Después de descargar, instalar y ejecutar ***Jenkins*** utilizando uno de los procedimientos anteriores, comienza el asistente de instalación posterior a la instalación.

Este asistente de instalación le muestra algunos pasos rápidos y únicos para desbloquear ***Jenkins***, personalizarlo con complementos y crear el primer usuario administrador a través del cual puede seguir accediendo a ***Jenkins***.

# Desbloqueo de Jenkins #

Cuando accede por primera vez a una nueva instancia de ***Jenkins*** en `http://localhost:8080` (o el puerto que configuró para ***Jenkins*** cuando lo instaló), se le solicita que la desbloquee usando una contraseña generada automáticamente.

imagen


Consulta el registro de log de la consola de ***Jenkins*** y copie la contraseña alfanumérica generada automáticamente (entre los 2 conjuntos de asteriscos) y haga clic en Continuar. 

imagen


> Notas:
> 
> Si ejecutó ***Jenkins*** en ***Docker*** en segundo plano, puede acceder al registro de log de la consola de ***Jenkins*** desde la carpeta sincronizada en el host.
> 
> El registro de log de la consola de ***Jenkins*** indica la ubicación (en el directorio `jenkins_home`) donde también se puede obtener esta contraseña. Esta contraseña debe ingresarse en el asistente de configuración en las nuevas instalaciones de ***Jenkins*** antes de que pueda acceder a la interfaz de usuario principal de ***Jenkins***. Esta contraseña también sirve como la contraseña predeterminada de la cuenta de administrador (con nombre de usuario "admin") si se salta el siguiente paso de creación de usuario en el asistente de configuración.

# Personalizando Jenkins con complementos #

Después de desbloquear a ***Jenkins***, aparece la página Personalizar ***Jenkins***. Aquí puede instalar cualquier cantidad de complementos útiles como parte de su configuración inicial.

Haga clic en una de las dos opciones que se muestran:

Instale los complementos sugeridos : para instalar el conjunto recomendado de complementos, que se basan en los casos de uso más comunes.

Seleccione los complementos para instalar : para elegir el conjunto de complementos que se instalará inicialmente. Cuando accede por primera vez a la página de selección de complementos, los complementos sugeridos se seleccionan de forma predeterminada.

Si no está seguro de qué complementos necesita, elija Instalar complementos sugeridos . Puede instalar (o eliminar) complementos adicionales de ***Jenkins*** en un momento posterior a través de la página Administrar Jenkins > Administrar complementos en ***Jenkins***.
El asistente de instalación muestra la progresión de la configuración de ***Jenkins*** y la instalación del conjunto de plugins de ***Jenkins*** elegido. Este proceso puede tardar unos minutos.

# Creando el primer usuario administrador #

Finalmente, después de personalizar ***Jenkins*** con complementos , ***Jenkins*** le pide que cree su primer usuario administrador.

1. Cuando aparezca la página Crear primer usuario de administrador, especifique los detalles para su usuario administrador en los campos respectivos y haga clic en Guardar y finalizar .

2. Cuando la página de ***Jenkins*** está lista , haga clic en Comenzar a usar ***Jenkins*** . 

	> Notas:
	> 
	> ¡Esta página puede indicar que ***Jenkins*** está casi listo! en su lugar, y si es así, haz clic en Reiniciar .
	> 
	> Si la página no se actualiza automáticamente después de un minuto, use su navegador web para actualizar la página manualmente.
	
3. Si es necesario, inicie sesión en ***Jenkins*** con las credenciales del usuario que acaba de crear y ¡ya está listo para comenzar a usar ***Jenkins***!
 
> A partir de este momento, solo se puede acceder a la interfaz de usuario de ***Jenkins*** proporcionando credenciales válidas de nombre de usuario y contraseña.
----------

https://jenkins.io/doc/pipeline/tour/hello-world/

# Creando su primer Pipeline  #

## ¿Qué es un Pipeline Jenkins? ##

Jenkins Pipeline (o simplemente "Pipeline") es un conjunto de complementos que permite implementar e integrar interconexiones continuas en ***Jenkins***.

Una cartera de entrega continua es una expresión automática de su proceso para obtener software desde el control de la versión hasta sus usuarios y clientes.

Jenkins Pipeline proporciona un conjunto extensible de herramientas para modelar tuberías de entrega simples a complejas "como código". La definición de Jenkins Pipeline normalmente se escribe en un archivo de texto (llamado a **Jenkinsfile**) que a su vez se registra en el repositorio de control de origen de un proyecto. 




----------

https://jenkins.io/doc/book/pipeline/syntax/

# Pipeline declarativa #

Declarative Pipeline es una adición relativamente reciente a Jenkins Pipeline que presenta una sintaxis más simplificada y obstinada sobre los subsistemas de Pipeline.

Todas las tuberías declarativas válidas deben estar dentro de un bloque pipeline, por ejemplo:

		pipeline {
		    /* insert Declarative Pipeline here */
		}

Los enunciados y expresiones básicos que son válidos en Canal Declarativo siguen las mismas reglas que la sintaxis de Groovy con las siguientes excepciones:

- El nivel superior de la tubería debe ser un bloque , específicamente:pipeline { }

- No hay puntos y comas como separadores de enunciados. Cada declaración debe estar en su propia línea

- Los bloques solo deben constar de Secciones , Directivas , Pasos o declaraciones de asignación.

- Una declaración de referencia de propiedad se trata como invocación de método sin argumento. Entonces, por ejemplo, la entrada se trata como entrada ()

Las secciones en el Canal Declarativo típicamente contienen una o más Directivas o Pasos .

**agente**

La sección **agent** especifica dónde se ejecutará el **Pipeline**, o un `stage` específico, en el entorno de ***Jenkins*** dependiendo de dónde se ubica la sección `agent`. La sección debe definirse en el nivel superior dentro del bloque pipeline, pero el uso a nivel de escenario es opcional.


Stage-level agent section

		Jenkinsfile (Declarative Pipeline)
		pipeline {
		    agent none 
		    stages {
		        stage('Example Build') {
		            agent { docker 'maven:3-alpine' } 
		            steps {
		                echo 'Hello, Maven'
		                sh 'mvn --version'
		            }
		        }
		        stage('Example Test') {
		            agent { docker 'openjdk:8-jre' } 
		            steps {
		                echo 'Hello, JDK'
		                sh 'java -version'
		            }
		        }
		    }
		}


1. La definición `agent none` en el nivel superior de **Pipeline** garantiza que un Ejecutor no se asignará innecesariamente. El uso agent none también fuerza que cada sección `stage` contenga su propia sección `agent`.

2. Ejecute los pasos en esta etapa en un contenedor recién creado usando esta imagen.

3. Ejecute los pasos en esta etapa en un contenedor recién creado utilizando una imagen diferente de la etapa anterior.
 

# Stages #

Contiene una secuencia de una o más directivas `stage` de etapa , la sección `stages` es donde se ubicará la mayor parte del "trabajo" descrito por un Pipeline. Como mínimo, se recomienda que `stages` contenga al menos una directiva `stage` para cada parte discreta del proceso de entrega continua, como **Build, Test y Deploy**.


Ejemplo

		Jenkinsfile (canal declarativo)
		pipeline {
		    agent any
		    stages { 
		        stage('Example') {
		            steps {
		                echo 'Hello World'
		            }
		        }
		    }
		}


# Post #

Cuando Pipeline haya terminado de ejecutarse, es posible que deba ejecutar pasos de limpieza o realizar algunas acciones en función del resultado de Pipeline. Estas acciones se pueden realizar en la sección `post`.

La sección `post` define uno o más pasos adicionales que se ejecutan cuando se completa una ejecución de Pipeline o Stage (dependiendo de la ubicación de la sección `post` dentro de Pipeline). `post` puede soportar uno de los siguientes post-condición bloques: **always, changed, failure, success, unstable, y aborted**. Estos bloques de condiciones permiten la ejecución de pasos dentro de la postsección dependiendo del estado de finalización de la tubería o etapa.

Condiciones

- **always**: Ejecute los pasos en la postsección independientemente del estado de finalización de la ejecución de Pipeline o Stage.

- **changed**: Solo ejecute los pasos postsi la ejecución actual de Pipeline o Stage tiene un estado de finalización diferente de su ejecución anterior.
 
- **failure**: Solo ejecute los pasos postsi la ejecución actual de Pipeline o stage tiene un estado "fallido", típicamente denotado por rojo en la interfaz de usuario web.
 
- **success**: Solo ejecute los pasos postsi la ejecución actual de Pipeline o stage tiene un estado de "éxito", generalmente indicado con un color azul o verde en la interfaz de usuario web.
 
- **unstable**: Solo ejecute los pasos postsi la ejecución actual de Pipeline o Stage tiene un estado "inestable", generalmente causado por fallas de prueba, violaciones de código, etc. Esto generalmente se denota con amarillo en la interfaz de usuario web.
 
- **aborted**: Solo ejecute los pasos postsi la ejecución actual de Pipeline o Stage tiene un estado "abortado", generalmente debido a que el Pipeline se anuló manualmente. Esto generalmente se denota por gris en la interfaz de usuario web.

Ejemplo

		Jenkinsfile (canal declarativo)
		pipeline {
		    agent any
			stages {
				stage('Build') {
				    steps {
				        echo 'Building'
				    }
				}
				stage('Test') {
				    steps {
				        echo 'Testing'
				    }
				}
				stage('Deploy') {
				    steps {
				        echo 'Deploying'
				    }
				}
			}
		    post {
		        always {
		            echo 'This will always run'
		        }
		        success {
		            echo 'This will run only if successful'
		        }
		        failure {
		            echo 'This will run only if failed'
		        }
		        unstable {
		            echo 'This will run only if the run was marked as unstable'
		        }
		        changed {
		            echo 'This will run only if the state of the Pipeline has changed'
		            echo 'For example, if the Pipeline was previously failing but is now successful'
		        }
		    }
		}




## Email ##

		post {
		    failure {
		        mail to: 'team@example.com',
		             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
		             body: "Something is wrong with ${env.BUILD_URL}"
		    }
		}

## Slack ##

		post {
		    success {
		        slackSend channel: '#ops-room',
		                  color: 'good',
		                  message: "The pipeline ${currentBuild.fullDisplayName} completed successfully."
		    }
		}



# Scripted Pipeline #

Scripted Pipeline, como Declarative Pipeline , se construye sobre el subsistema Pipeline subyacente. A diferencia de Declarative, Scripted Pipeline es efectivamente un DSL de propósito general [ 2 ] construido con Groovy . La mayoría de la funcionalidad proporcionada por el lenguaje Groovy está disponible para los usuarios de Scripted Pipeline, lo que significa que puede ser una herramienta muy expresiva y flexible con la que se pueden crear interconexiones continuas.

## Control de flujo ##

Scripted Pipeline se ejecuta en serie desde arriba Jenkinsfile hacia abajo, como la mayoría de los scripts tradicionales en Groovy u otros idiomas. Proporcionar control de flujo, por lo tanto, se basa en expresiones de Groovy, como las if/elsecondicionales, por ejemplo:


		node {
		    stage('Example') {
		        if (env.BRANCH_NAME == 'master') {
		            echo 'I only execute on the master branch'
		        } else {
		            echo 'I execute elsewhere'
		        }
		    }
		}

Otra forma de administrar el control de flujo de Scripted Pipeline es con el soporte de manejo de excepciones de Groovy. Cuando los Pasos fallan por la razón que sea, lanzan una excepción. Los comportamientos de manipulación en caso de error deben hacer uso de los try/catch/finallybloques en Groovy, por ejemplo:


		node {
		    stage('Example') {
		        try {
		            sh 'exit 1'
		        }
		        catch (exc) {
		            echo 'Something failed, I should sound the klaxons!'
		            throw
		        }
		    }
		}


# Comparación de sintaxis #

Cuando se creó Jenkins Pipeline, Groovy fue seleccionada como la base. ***Jenkins*** ha sido enviado por mucho tiempo con un motor Groovy incorporado para proporcionar capacidades avanzadas de scripting para administradores y usuarios por igual. Además, los implementadores de Jenkins Pipeline descubrieron que Groovy era una base sólida sobre la cual construir lo que ahora se conoce como el DSL "Scripted Pipeline". [ 2 ] .

Como es un entorno de programación con todas las funciones, Scripted Pipeline ofrece una tremenda cantidad de flexibilidad y extensibilidad para los usuarios de ***Jenkins***. La curva de aprendizaje de Groovy no suele ser deseable para todos los miembros de un equipo determinado, por lo que Declarative Pipeline se creó para ofrecer una sintaxis más simple y con más opiniones para la creación de Jenkins Pipeline.

Los dos son fundamentalmente el mismo subsistema Pipeline debajo. Ambas son implementaciones duraderas de "Pipeline as code". Ambos pueden usar pasos integrados en Pipeline o proporcionados por complementos. Ambos pueden utilizar bibliotecas compartidas

Sin embargo, donde difieren es en sintaxis y flexibilidad. Límites declarativos de lo que está disponible para el usuario con una estructura más estricta y predefinida, por lo que es una opción ideal para tuberías de entrega continua más simples. Scripted proporciona muy pocos límites, en la medida en que los únicos límites en la estructura y la sintaxis tienden a ser definidos por Groovy, en lugar de los sistemas específicos de Pipeline, lo que lo convierte en una opción ideal para usuarios avanzados y aquellos con requisitos más complejos. Como su nombre lo indica, Declarative Pipeline fomenta un modelo de programación declarativa. [ 3 ] Mientras que los Scripted Pipelines siguen un modelo de programación más imperativo ..

----------

https://jenkins.io/doc/pipeline/tour/running-multiple-steps/

# Ejecutando múltiples pasos #






----------

https://jenkins.io/doc/pipeline/tour/agents/
# Definición de entornos de ejecución # 

En la sección anterior, puede haber notado la directiva `agent` en cada uno de los ejemplos. La directiva `agent` le dice a **Jenkins** dónde y cómo ejecutar el **Pipeline**, o subconjunto del mismo. Como era de esperar, **agentes** se requiere para todos los Pipelines.

Debajo del capó, hay algunas cosas que `agent` hace que suceda:

- Todos los pasos contenidos dentro del bloque son puestos en cola para su ejecución por ***Jenkins***. Tan pronto como un **ejecutor** esté disponible, los pasos comenzarán a ejecutarse.

- Se asigna un **workspace (espacio de trabajo)** que contendrá los archivos desprotegidos del control de origen, así como cualquier archivo de trabajo adicional para Pipeline.


> **Ejecutor**
> Un espacio para la ejecución del trabajo definido por un **Pipeline** o Proyecto en un Nodo . Un nodo puede tener cero o más ejecutores configurados, lo que corresponde a la cantidad de proyectos simultáneos o **Pipelines** que se pueden ejecutar en ese nodo.
> 
> **workspace Espacio de trabajo**
> Un directorio desechable en el sistema de archivos de un Nodo donde el trabajo puede ser realizado por un Pipeline o Proyecto . Los espacios de trabajo generalmente se dejan en su lugar después de que se complete una ejecución de build (compilación) o Pipeline, a menos que se hayan implementado políticas de limpieza específicas del espacio de trabajo en ***Jenkins*** Master .

Pipeline está diseñado para usar fácilmente imágenes y contenedores Docker para ejecutar dentro. Esto permite que Pipeline defina el entorno y las herramientas requeridas sin tener que configurar varias herramientas del sistema y dependencias de los agentes manualmente. Este enfoque le permite utilizar prácticamente cualquier herramienta que pueda empaquetarse en un contenedor Docker



		Jenkinsfile (Declarative Pipeline)
		pipeline {
		    agent {
		        docker { image 'node:7-alpine' }
		    }
		    stages {
		        stage('Test') {
		            steps {
		                sh 'node --version'
		            }
		        }
		    }
		}

Mezclar y combinar diferentes contenedores u otros agentes permite una gran flexibilidad al ejecutar un Pipeline.



----------

https://jenkins.io/doc/pipeline/tour/environment/






# Usando variables de entorno # 

Las variables de entorno pueden establecerse globalmente, como en el siguiente ejemplo o por etapa. Como cabría esperar, establecer variables de entorno por etapa significa que solo se aplicarán a la etapa en la que están definidas.

		Jenkinsfile (canal declarativo)
		pipeline {
		    agent any
		
		    environment {
		        DISABLE_AUTH = 'true'
		        DB_ENGINE    = 'sqlite'
		    }
		
		    stages {
		        stage('Build') {
		            steps {
		                sh 'printenv'
		            }
		        }
		    }
		}



Este enfoque para definir variables de entorno desde dentro Jenkinsfile puede ser muy útil para instruir scripts, como a Makefile, para configurar la compilación o las pruebas de manera diferente para ejecutarlas dentro de ***Jenkins***.

Otro uso común para las variables de entorno es establecer o anular las credenciales "ficticias" en los scripts de compilación o prueba. Debido a que ( obviamente ) es una mala idea colocar las credenciales directamente en una Jenkinsfile, Jenkins Pipeline permite a los usuarios acceder de forma rápida y segura a las credenciales predefinidas Jenkinsfilesin necesidad de conocer sus valores.

# Credenciales en el Medio Ambiente #

Consulte [Manejo de credenciales](https://jenkins.io/doc/book/pipeline/jenkinsfile/#handling-credentials) en el [Manual del usuario](https://jenkins.io/doc/book/) para obtener más información.







----------

https://jenkins.io/doc/pipeline/tour/tests-and-artifacts/







# Pruebas de grabación y artefactos # 

Si bien las pruebas son una parte crítica de una buena canalización continua de entregas, la mayoría de las personas no quiere examinar miles de líneas de resultados de la consola para encontrar información sobre las pruebas fallidas. Para hacerlo más fácil, ***Jenkins*** puede registrar y agregar resultados de prueba siempre y cuando el corredor de prueba pueda dar salida a los archivos de resultados de prueba. ***Jenkins*** generalmente viene incluido con el junitpaso, pero si su corredor de prueba no puede generar informes XML de estilo JUnit, existen complementos adicionales que procesan prácticamente cualquier formato de informe de prueba ampliamente utilizado.

Para recopilar nuestros resultados de prueba y artefactos, utilizaremos la postsección.

Esto siempre tomará los resultados de la prueba y permitirá a ***Jenkins*** rastrearlos, calcular tendencias e informar sobre ellos. Una tubería que tiene pruebas fallidas se marcará como "INESTABLE", indicada por amarillo en la interfaz de usuario web. Eso es distinto del estado "FAILED", denotado por rojo.

Cuando hay fallas en las pruebas, a menudo es útil tomar artefactos construidos de ***Jenkins*** para su análisis e investigación local. Esto es práctico gracias al soporte integrado de ***Jenkins*** para almacenar "artefactos", archivos generados durante la ejecución de Pipeline.

Esto se hace fácilmente con el archiveArtifactspaso y una expresión de archivo globbing, como se demuestra en el siguiente ejemplo:
		
		Jenkinsfile (canal declarativo)
		pipeline {
		    agent any
		    stages {
		        stage('Build') {
		            steps {
		                sh './gradlew build'
		            }
		        }
		        stage('Test') {
		            steps {
		                sh './gradlew check'
		            }
		        }
		    }
		
		    post {
		        always {
		            archiveArtifacts artifacts: 'build/libs/**/*.jar', fingerprint: true
		            junit 'build/reports/**/*.xml'
		        }
		    }
		}

Si se especifica más de un parámetro en el paso archiveArtifacts, el nombre de cada parámetro debe especificarse explícitamente en el código del paso, es decir, para artifacts la ruta y el nombre del archivo del artefacto, y para fingerprint elegir esta opción. Si solo necesita especificar la ruta y los nombres de archivo de los artefactos, puede omitir el nombre del parámetro artifacts, por ejemplo
archiveArtifacts 'build/libs/**/*.jar'

Las pruebas de grabación y los artefactos en ***Jenkins*** son útiles para hacer emerger rápida y fácilmente información a varios miembros del equipo. En la siguiente sección, hablaremos sobre cómo decirles a los miembros del equipo lo que ha estado sucediendo en nuestro Pipeline.



----------

https://jenkins.io/doc/pipeline/tour/post/






----------
https://jenkins.io/doc/tutorials/build-a-java-app-with-maven/



Requisitos previos
Para este tutorial, necesitarás:

Una máquina macOS, Linux o Windows con:

256 MB de RAM, aunque se recomienda más de 512 MB.

10 GB de espacio en disco para ***Jenkins*** y sus imágenes y contenedores Docker.

El siguiente software instalado:

Docker : lea más sobre la instalación de Docker en la sección Instalación Docker de la página Instalación de ***Jenkins*** . 
Nota: Si usa Linux, este tutorial supone que no está ejecutando comandos Docker como usuario raíz, sino que tiene una única cuenta de usuario que también tiene acceso a las otras herramientas utilizadas en este tutorial.

Git y opcionalmente GitHub Desktop .

Ejecutar Jenkins en Docker
En este tutorial, ejecutará ***Jenkins*** como un contenedor Docker de la jenkinsci/blueoceanimagen Docker.

Para ejecutar Jenkins en Docker, siga las instrucciones relevantes a continuación para macOS y Linux o Windows .

Puede leer más sobre los conceptos de imagen y contenedor de Docker en Docker y descargar y ejecutar ***Jenkins*** en las secciones Docker de la página Instalación de Jenkins .

En macOS y Linux
Abre una ventana de terminal.

Ejecute la ***jenkinsci/blueocean*** imagen como contenedor en Docker con el siguiente docker run comando (teniendo en cuenta que este comando descarga automáticamente la imagen si no se ha hecho):

docker run \
  --rm \
  -u root \
  -p 8080:8080 \
  -v jenkins-data:/var/jenkins_home \ 
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \ 
  jenkinsci/blueocean








https://wiki.jenkins.io/display/JENKINS/Blue+Ocean+Plugin


Blue Ocean Plugin
Saltar al final de los metadatos
Creado por Michael Neale , última modificación hecha por Vivek Pandey hace menos de un minuto Ir al inicio de los metadatos
Vea Blue Ocean en el sitio del complemento para obtener más información.

¿Qué es Blue Ocean?
 
Blue Ocean es un nuevo proyecto que replantea la experiencia del usuario de ***Jenkins***. Diseñado desde cero para ***Jenkins*** Pipeline y compatible con trabajos de Freestyle, Blue Ocean reduce el desorden y aumenta la claridad para cada miembro de su equipo a través de las siguientes características clave:

Visualizaciones sofisticadas de líneas  de CD , lo que permite una comprensión rápida e intuitiva del estado del canal de software.
Editor de  canalización que hace que la automatización de las canalizaciones de CD sea accesible guiando al usuario a través de un proceso intuitivo y visual para crear una canalización.
Personalización  de la interfaz de usuario de ***Jenkins*** para satisfacer las necesidades basadas en roles de cada miembro del equipo DevOps.
Determine la precisión  cuando se necesita intervención y / o surgen problemas. La interfaz de usuario de Blue Ocean muestra en qué punto se necesita atención, lo que facilita el manejo de excepciones y aumenta la productividad.
La integración nativa para las solicitudes de extracción y extracción  permite la máxima productividad del desarrollador cuando se colabora en el código con otros en GitHub y Bitbucket.
Tenga en cuenta que  el plugin Blue Ocean  es el único que necesita instalar desde Jenkins UpdateCenter. 
  
[Aprende más](https://jenkins.io/projects/blueocean/) 

https://jenkins.io/doc/book/blueocean/getting-started/


## Referencias ##

[https://en.wikipedia.org/wiki/Continuous_delivery](https://en.wikipedia.org/wiki/Continuous_delivery)


[https://jenkins.io](https://jenkins.io "https://jenkins.io")

[https://jenkins.io/doc/book/getting-started/installing/](https://jenkins.io/doc/book/getting-started/installing/ "https://jenkins.io/doc/book/getting-started/installing/")

[manual de usuario Jenkins](https://jenkins.io/doc/book/)











https://jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/


		environment {
		        CI = 'true'
		    }



		stage('Deliver for development') {
			when {
			    branch 'development'
			}
			steps {
			    sh './jenkins/scripts/deliver-for-development.sh'
			    input message: 'Finished using the web site? (Click "Proceed" to continue)'
			    sh './jenkins/scripts/kill.sh'
			}
			}
			stage('Deploy for production') {
			when {
			    branch 'production'
			}
			steps {
			    sh './jenkins/scripts/deploy-for-production.sh'
			    input message: 'Finished using the web site? (Click "Proceed" to continue)'
			    sh './jenkins/scripts/kill.sh'
			}
		}


	Estas whendirectivas (junto con sus condiciones branch) determinan si se debe ejecutar stages(que contiene estas directivas when). Si branc hel valor de una condición (es decir, el patrón) coincide con el nombre de la rama desde la que ***Jenkins*** está ejecutando la construcción, entonces se ejecutará la stage que contiene esto when y la branch construcción.