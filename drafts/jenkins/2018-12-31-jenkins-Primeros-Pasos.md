---
layout: post
section: "Jenkins"
title:  "Primeros Pasos con Jenkins"
date:   2018-02-14
desc: "Primeros Pasos con Jenkins"
keywords: ""
categories: [Jenkins]
tags: []
icon: fab fa-jenkins
image: static/img/blog/jenkins/jenkins-logo.png
---

https://en.wikipedia.org/wiki/Continuous_delivery

La entrega continua ( CD ) es un enfoque de ingeniería de software en el cual los equipos producen software en ciclos cortos, lo que garantiza que el software se pueda lanzar confiablemente en cualquier momento. [1] Su objetivo es construir, probar y lanzar software más rápido y con mayor frecuencia. El enfoque ayuda a reducir el costo, el tiempo y el riesgo de realizar cambios al permitir más actualizaciones incrementales para las aplicaciones en producción. Un proceso de implementación sencillo y repetible es importante para la entrega continua.

# Relación con DevOps # 

La entrega continua y DevOps son similares en sus significados y a menudo se combinan, pero son dos conceptos diferentes. [2] DevOps tiene un alcance más amplio, [3] y se centra en el cambio cultural, específicamente la colaboración de los diversos equipos involucrados en la entrega de software (desarrolladores, operaciones, control de calidad, administración, etc.), así como la automatización de los procesos en la entrega de software. [3] La entrega continua, por otro lado, es un enfoque para automatizar el aspecto de la entrega, y se centra en reunir diferentes procesos y ejecutarlos más rápidamente y con mayor frecuencia. [4] Por lo tanto, DevOps puede ser un producto de entrega continua y el CD fluye directamente a DevOps.

# Relación con la implementación continua #

La entrega continua a veces se confunde con la implementación continua. La implementación continua significa que cada cambio se implementa automáticamente en la producción. La entrega continua significa que el equipo se asegura de que cada cambio se pueda implementar en la producción, pero puede optar por no hacerlo, generalmente por motivos comerciales. Para hacer una implementación continua, uno debe hacer una entrega continua. [5]

# Herramientas / tipos de herramientas  #

La entrega continua lleva la automatización desde el control de la fuente hasta la producción. Hay varias herramientas que ayudan a lograr todo o parte de este proceso. [10] Estas herramientas forman parte de la canalización de implementación que incluye la entrega continua. Los tipos de herramientas que ejecutan diversas partes del proceso incluyen: integración continua , automatización de lanzamiento de aplicaciones , automatización de compilación , gestión del ciclo de vida de las aplicaciones.

# Arquitecturas para la entrega continua # 

Para practicar la entrega continua de manera efectiva, las aplicaciones de software deben cumplir un conjunto de requisitos arquitectónicamente significativos (ASR) tales como la capacidad de despliegue, la capacidad de modificación y la capacidad de prueba. [12] Estos ASR requieren una alta prioridad y ya no se pueden intercambiar a la ligera.



# Estrategias para superar los desafíos de adopción #

Se han informado varias estrategias para superar los desafíos de adopción de entrega continua.

| Estrategias para superar los desafíos de la adopción de CD | Estrategia !! Descripción |
| Vender CD como analgésico | Identifique los puntos problemáticos de cada parte interesada que el CD puede resolver, y venda el CD como analgésico a ese interesado. Esta estrategia ayuda a lograr la aceptación de la amplia gama de partes interesadas que requiere una implementación de CD. |
| Equipo dedicado con miembros multidisciplinarios | Sin un equipo dedicado, puede ser difícil progresar porque a menudo se asigna a los empleados a trabajar en otros flujos de valor. Un equipo multidisciplinario no solo proporciona la amplia gama de habilidades requeridas para la implementación del CD, sino que también suaviza la comunicación con los equipos relacionados. |
| Entrega continua de entrega continua | Organice la implementación del CD de una manera que genere valor para la empresa lo antes posible, incorporando gradualmente más proyectos, en pequeños incrementos y, finalmente, implementando el CD en toda la organización. Esta estrategia ayuda a justificar la inversión requerida al hacer visibles los beneficios concretos en el camino. Los beneficios visibles, a su vez, ayudan a lograr el apoyo sostenido de la compañía y la inversión requerida para sobrevivir al largo y difícil viaje al CD. |
| Comenzando con aplicaciones fáciles pero importantes | Al seleccionar las primeras aplicaciones para migrar a un CD, elija las que sean fáciles de migrar pero que sean importantes para la empresa. Ser fácil de migrar ayuda a demostrar los beneficios del CD rápidamente, lo que puede evitar que se mate la iniciativa de implementación. Ser importante para el negocio ayuda a asegurar los recursos requeridos, demuestra un valor claro e indiscutible y aumenta la visibilidad del CD en la organización. |
| Esqueleto de la tubería Visual CD | Ofrezca a un equipo un esqueleto visual de canal de CD que tenga la vista completa de la línea de CD, pero con etapas vacías para aquellos que aún no pueden implementar. Esto ayuda a construir una mentalidad de CD y mantener el impulso para la adopción de CD. El esqueleto del pipeline es especialmente útil cuando la migración del equipo al CD requiere un gran esfuerzo y cambios de mentalidad durante un largo período de tiempo. |
| Caída experta | Asigne un experto en CD para que se una a proyectos difíciles como miembro sénior del equipo de desarrollo. Tener al experto en el equipo ayuda a construir la motivación y el impulso para pasar al CD desde el interior del equipo. También ayuda a mantener el impulso cuando la migración requiere un gran esfuerzo y un largo período de tiempo. |






# Tutorial Jenkins #

# ¿Qué es Jenkins? #

Jenkins es un servidor autónomo de código abierto que se puede usar para automatizar todo tipo de tareas relacionadas con la construcción, prueba y entrega o implementación de software.

Jenkins puede instalarse a través de paquetes de sistema nativos, Docker, o incluso ejecutarse de manera independiente en cualquier máquina con Java Runtime Environment (JRE) instalado.

Jenkins es un producto altamente extensible cuya funcionalidad puede extenderse mediante la instalación de complementos.

Hay una gran variedad de complementos disponibles para Jenkins

----------


## Requisitos previos ##

Configuración mínima recomendada:

Java 7
256 MB de memoria libre
+ 1 GB de espacio libre en disco
Configuración recomendada para el pequeño equipo:

Java 8
1 GB de memoria libre +
50 GB + espacio libre en disco

## Stand-alone or Servlet? ##

Jenkins puede funcionar stand-alone esto es independientemente en su propio proceso utilizando su propio servidor web. También puede funcionar como un servlet en un marco existente, como Tomcat. Esta sección está dirigida específicamente a stand-alone instalación y ejecución.





----------

https://jenkins.io/doc/pipeline/tour/hello-world/

# Creando su primer Pipeline  #

## ¿Qué es un Pipeline Jenkins? ##

Jenkins Pipeline (o simplemente "Pipeline") es un conjunto de complementos que permite implementar e integrar interconexiones continuas en Jenkins.

Una cartera de entrega continua es una expresión automática de su proceso para obtener software desde el control de la versión hasta sus usuarios y clientes.

Jenkins Pipeline proporciona un conjunto extensible de herramientas para modelar tuberías de entrega simples a complejas "como código". La definición de Jenkins Pipeline normalmente se escribe en un archivo de texto (llamado a Jenkinsfile) que a su vez se registra en el repositorio de control de origen de un proyecto. 




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

La sección **agent** especifica dónde se ejecutará el **Pipeline**, o un `stage` específico, en el entorno de Jenkins dependiendo de dónde se ubica la sección `agent`. La sección debe definirse en el nivel superior dentro del bloque pipeline, pero el uso a nivel de escenario es opcional.


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

Cuando se creó Jenkins Pipeline, Groovy fue seleccionada como la base. Jenkins ha sido enviado por mucho tiempo con un motor Groovy incorporado para proporcionar capacidades avanzadas de scripting para administradores y usuarios por igual. Además, los implementadores de Jenkins Pipeline descubrieron que Groovy era una base sólida sobre la cual construir lo que ahora se conoce como el DSL "Scripted Pipeline". [ 2 ] .

Como es un entorno de programación con todas las funciones, Scripted Pipeline ofrece una tremenda cantidad de flexibilidad y extensibilidad para los usuarios de Jenkins. La curva de aprendizaje de Groovy no suele ser deseable para todos los miembros de un equipo determinado, por lo que Declarative Pipeline se creó para ofrecer una sintaxis más simple y con más opiniones para la creación de Jenkins Pipeline.

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

- Todos los pasos contenidos dentro del bloque son puestos en cola para su ejecución por Jenkins. Tan pronto como un **ejecutor** esté disponible, los pasos comenzarán a ejecutarse.

- Se asigna un **workspace (espacio de trabajo)** que contendrá los archivos desprotegidos del control de origen, así como cualquier archivo de trabajo adicional para Pipeline.


> **Ejecutor**
> Un espacio para la ejecución del trabajo definido por un **Pipeline** o Proyecto en un Nodo . Un nodo puede tener cero o más ejecutores configurados, lo que corresponde a la cantidad de proyectos simultáneos o **Pipelines** que se pueden ejecutar en ese nodo.
> 
> **workspace Espacio de trabajo**
> Un directorio desechable en el sistema de archivos de un Nodo donde el trabajo puede ser realizado por un Pipeline o Proyecto . Los espacios de trabajo generalmente se dejan en su lugar después de que se complete una ejecución de build (compilación) o Pipeline, a menos que se hayan implementado políticas de limpieza específicas del espacio de trabajo en Jenkins Master .

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



Este enfoque para definir variables de entorno desde dentro Jenkinsfile puede ser muy útil para instruir scripts, como a Makefile, para configurar la compilación o las pruebas de manera diferente para ejecutarlas dentro de Jenkins.

Otro uso común para las variables de entorno es establecer o anular las credenciales "ficticias" en los scripts de compilación o prueba. Debido a que ( obviamente ) es una mala idea colocar las credenciales directamente en una Jenkinsfile, Jenkins Pipeline permite a los usuarios acceder de forma rápida y segura a las credenciales predefinidas Jenkinsfilesin necesidad de conocer sus valores.

# Credenciales en el Medio Ambiente #

Consulte [Manejo de credenciales](https://jenkins.io/doc/book/pipeline/jenkinsfile/#handling-credentials) en el [Manual del usuario](https://jenkins.io/doc/book/) para obtener más información.







----------

https://jenkins.io/doc/pipeline/tour/tests-and-artifacts/







# Pruebas de grabación y artefactos # 

Si bien las pruebas son una parte crítica de una buena canalización continua de entregas, la mayoría de las personas no quiere examinar miles de líneas de resultados de la consola para encontrar información sobre las pruebas fallidas. Para hacerlo más fácil, Jenkins puede registrar y agregar resultados de prueba siempre y cuando el corredor de prueba pueda dar salida a los archivos de resultados de prueba. Jenkins generalmente viene incluido con el junitpaso, pero si su corredor de prueba no puede generar informes XML de estilo JUnit, existen complementos adicionales que procesan prácticamente cualquier formato de informe de prueba ampliamente utilizado.

Para recopilar nuestros resultados de prueba y artefactos, utilizaremos la postsección.

Esto siempre tomará los resultados de la prueba y permitirá a Jenkins rastrearlos, calcular tendencias e informar sobre ellos. Una tubería que tiene pruebas fallidas se marcará como "INESTABLE", indicada por amarillo en la interfaz de usuario web. Eso es distinto del estado "FAILED", denotado por rojo.

Cuando hay fallas en las pruebas, a menudo es útil tomar artefactos construidos de Jenkins para su análisis e investigación local. Esto es práctico gracias al soporte integrado de Jenkins para almacenar "artefactos", archivos generados durante la ejecución de Pipeline.

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

Las pruebas de grabación y los artefactos en Jenkins son útiles para hacer emerger rápida y fácilmente información a varios miembros del equipo. En la siguiente sección, hablaremos sobre cómo decirles a los miembros del equipo lo que ha estado sucediendo en nuestro Pipeline.



----------

https://jenkins.io/doc/pipeline/tour/post/






----------
https://jenkins.io/doc/tutorials/build-a-java-app-with-maven/



Requisitos previos
Para este tutorial, necesitarás:

Una máquina macOS, Linux o Windows con:

256 MB de RAM, aunque se recomienda más de 512 MB.

10 GB de espacio en disco para Jenkins y sus imágenes y contenedores Docker.

El siguiente software instalado:

Docker : lea más sobre la instalación de Docker en la sección Instalación Docker de la página Instalación de Jenkins . 
Nota: Si usa Linux, este tutorial supone que no está ejecutando comandos Docker como usuario raíz, sino que tiene una única cuenta de usuario que también tiene acceso a las otras herramientas utilizadas en este tutorial.

Git y opcionalmente GitHub Desktop .

Ejecutar Jenkins en Docker
En este tutorial, ejecutará Jenkins como un contenedor Docker de la jenkinsci/blueoceanimagen Docker.

Para ejecutar Jenkins en Docker, siga las instrucciones relevantes a continuación para macOS y Linux o Windows .

Puede leer más sobre los conceptos de imagen y contenedor de Docker en Docker y descargar y ejecutar Jenkins en las secciones Docker de la página Instalación de Jenkins .

En macOS y Linux
Abre una ventana de terminal.

Ejecute la jenkinsci/blueoceanimagen como contenedor en Docker con el siguiente docker run comando (teniendo en cuenta que este comando descarga automáticamente la imagen si no se ha hecho):

docker run \
  --rm \
  -u root \
  -p 8080:8080 \
  -v jenkins-data:/var/jenkins_home \ 
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$HOME":/home \ 
  jenkinsci/blueocean






Blue Ocean es una nueva interfaz de usuario (UI) y experiencia de usuario (UX) para Jenkins. Está diseñada para hacer que la UI de Jenkins sea más eficiente (reduce el desorden y aumenta la claridad). En palabras simples: Blue Ocean es una nueva interfaz de usuario para Jenkins. una vista interactiva para Jenkins Pipeline (y trabajos) Cómo obtener Blue Ocean 

Asegúrese de tener Jenkins 2.7 o superior y siga los pasos: 
Paso 1 Instalar Blue Ocean Plugin 
Paso 2 Cambiar a Blue Ocean View 

Referencias: Blue Ocean Wiki



## Referencias ##

[https://jenkins.io](https://jenkins.io "https://jenkins.io")

[https://jenkins.io/doc/book/getting-started/installing/](https://jenkins.io/doc/book/getting-started/installing/ "https://jenkins.io/doc/book/getting-started/installing/")

[manual de usuario Jenkins](https://jenkins.io/doc/book/)