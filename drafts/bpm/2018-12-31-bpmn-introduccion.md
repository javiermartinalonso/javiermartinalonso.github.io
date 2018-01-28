---
layout: post
section: "BPMN"
title:  "BPMN Introducción"
date:   2018-12-31
desc: "procesos de negocio (BPM) y realización de Workflows."
keywords: "BPMN"
categories: [bonita]
tags: [BPMN]
icon: fas fa-cogs
image: static/img/blog/
---


http://www.heflo.com/the-bpm-cookbook-online-guide/



#  Introducción #

En la actualidad el concepto de arquitectura empresarial (AE) no es extraño en ninguna empresa, ya que cada una de éstas trabaja conjuntamente los procesos de negocio y la infraestructura de las tecnologías de información (TI), debido a que poseen una dependencia mutua y a que se requieren para suplir las necesidades de la operación del negocio.
Una AE logra que la organización responda rápida, efectiva y positivamente a las oportunidades y retos que se presentan día a día por cambios en los mercados, la consolidación industrial y los avances tecnológicos (Blevins, 2006) y (Sessions, 2006).
Las AE guían la construcción o adquisición de las TI desde la gestión de los procesos del negocio (BPM – Business Process Managment). Según Jacobson, Booch y Rumbaugh, un proceso define quién está haciendo qué, cuándo lo hace, y cómo alcanzar un determinado objetivo (Jacobson, Booch, & Rumbaugh, 2000).
En toda organización en donde se involucra el manejo de procesos y en donde se aplica de una forma aceptable la gestión de éstos, se observa que se consigue la satisfacción del cliente ya que se tiene en cuenta el punto de vista de éste (Agudelo Tobón & Escobar Bolivar, 2007).
Hoy en día las empresas se enfrentan a diversos problemas relacionados con los procesos de negocio. En donde se observa ausencia de participación de los responsables del negocio sólo por el hecho de que estos no entienden el funcionamiento del sistema. Es allí donde surgen las herramientas de software BPMN que facilitan el entendimiento de los procesos de negocio en una organización por parte de diferentes usuarios involucrados en el proceso de software como el cliente y los desarrolladores.
Cuando se habla de herramientas de apoyo de BPM, se habla principalmente de BPMN (Business Process Modeling Notation), enfocándose a la administración de los procesos. Basado en White, el BPMN se ha creado para proporcionar una notación que sea entendida por todos los usuarios del negocio, desde los analistas del negocio, que crean los borradores iniciales de los procesos, hasta los desarrolladores técnicos responsables de poner en
práctica la tecnología que plasmará esos procesos, y finalmente al agente comercial que manejará y supervisará dichos procesos. Así, BPMN crea un puente estandarizado para el abismo entre el diseño de proceso comercial y los procesos de implementación en sistemas de software (White, 2006).
El BPMN enfocado al modelamiento proporcionará a las empresas la capacidad de comprensión de sus procesos de negocio internos en una notación gráfica y dará a las organizaciones la capacidad de comunicar estos procedimientos de manera estándar. Por otra parte, la notación gráfica facilitará la comprensión de las colaboraciones de rendimiento y las transacciones comerciales entre las organizaciones. Esto asegurará que las empresas podrán entenderse a sí mismas además de entender a los participantes y permitirá que las organizaciones se puedan adaptar a las nuevas circunstancias comerciales internas y a los negocios rápidamente (http://www.bpmn.org/, 2012).
Con el tiempo la OMG (Object Managment Group) encargada de trabajar con BPMN se ha visto en la necesidad de modificar el significado de sus siglas. A principios de mayo de 2004, BPMI (Business Process Management Initiative) crea la versión 1.0 de BPMN, en donde se hacía alusión al BPMN como modelamiento. De (Owen & Raj, 2003) su objetivo principal era el de proporcionar una notación que fuese fácilmente comprensible por todos los usuarios de negocios. Otro objetivo igualmente importante era el de asegurar que los lenguajes basados en XML diseñados para la ejecución de los procesos de negocio, pudieran ser expresados visualmente con una notación común. En 2007, la sigla BPMN cambia de Business Process Modeling Notation a Business Process Model and Notation, ahora siendo la versión BPMN 2.0. La adopción de esta especificación mejora la capacidad de los analistas de negocio para desarrollar, comunicar y entender los modelos de procesos de negocio. Por otro lado, la especificación mejora la comunicación entre los modeladores, incluso entre modeladores de negocio y software, permitiendo la selección flexible de herramientas y entornos de ejecución, además de promover el desarrollo de herramientas más especializadas para el análisis y diseño de procesos (Group, 2007).
El objetivo principal de este trabajo es efectuar un comparativo de diferentes herramientas para el modelado de procesos de negocio. Esto con el fin de examinar diferentes características de usabilidad y su correspondiente adopción para las organizaciones. Para lograr esto, se tomaron como referencia siete herramientas de carácter libre o fácil acceso.
El presente artículo está organizado de la siguiente manera: en primer lugar se efectuará una contextualización de las herramientas de apoyo a la gestión de procesos de negocio. Se continuará con la presentación de las características de evaluación de las herramientas BPMN que se compararon según algunos criterios como lo son: el proceso de instalación, el tipo de licencia, la usabilidad de la herramienta y la versión BPMN ue soporta. Luego se continuará con el análisis de las herramientas BPMN, y finalmente se presentará las conclusiones y el trabajo futuro.









Existen múltiples acepciones para definir lo que es un proceso de negocio, la forma más directa de definirlo es como una secuencia de tareas que se realizan en cierto orden por seres humanos o sistemas para lograr un objetivo de negocio [4]. Se puede dividir esta definición en tres partes para adentrarnos un poco más en ella [1]:

- Secuencia de tareas: Las tareas son las actividades que lleva a cabo la empresa con el fin de lograr su objetivo. La palabra ‘secuencia’ es la que implica que estas tareas estén ordenadas de una manera
coherente; cuando acaba una, empieza la siguiente y así hasta llegar al objetivo de negocio.

- En cierto orden por humanos o sistemas: Como todos los procesos, ya sean de negocio o estén orientados a cualquier otro ámbito, pueden ser realizados por las personas de una organización o por los sistemas informáticos o máquinas de las que se disponga. Los sistemas informáticos tienden a ser mucho
más rápidos y eficaces que las personas, realizando las tareas de forma inmediata [3].

- Para lograr un objetivo de negocio: la empresa realiza las actividades con el fin de lograr el objetivo, en este caso de negocio, que se ha propuesto. Lo complicado en algunas ocasiones es saber qué objetivo es el importante, el que da valor añadido a la empresa

 A la hora de ver un proceso de negocio, tenemos que definir ciertas características que poseen [2]:

1. Son medibles y están orientados a conseguir el máximo rendimiento.
2. Las actividades que se realicen deben añadir valor a las entradas del proceso.
3. Interaccionan tras alguna acción o circunstancia definida.
4. Entregan resultados a los ‘stakeholders’ del proceso, es decir, los participantes del proceso.
5. Tienen resultados específicos.

En definitiva, los procesos de negocio podrían ser contemplados como un formulario con sus entradas, salidas, recursos, número de tareas y meta específica para hacer posible el funcionamiento de un negocio alcanzando los
objetivos propuestos por la táctica de negocio de la empresa.

# ¿Que es BPMN? #

BPM es una colaboración entre personas de negocio y personal de Tecnologías de Información para fomentar procesos  de  negocio  efectivos,  ágiles  y transparentes (Garimella, Lees, & Wi- lliams, 2008).

Una herramienta de BPM está en capacidad de soportar las actividades básicas de la gestión que pueden ser  resumidas en: definir una estrategia para conducir el desempeño, traducir la estrategia en objetivos, indicadores y metas, acompañar el progreso en relación a las metas, analizar los motivos en caso de metas no alcanzadas y seleccionar e imple- mentar acciones correctivas (Nextge- neration, s.f.).


La  tecnología BPM (Business Process Management o Gestión de Procesos de Negocio) reúne varias herramientas, métodos y técnicas de gestión con el fin de supervisar y controlar el desarrollo, el progreso y la finalización de los procesos, así como medir la efectividad de los recursos aplicados a la gestión de dichos procesos.

Pero la tecnología BPM va más allá de una sencilla gestión de procesos, ya que esta potente herramienta, cuando se implementa, puede convertir a la insatisfacción de los resultados obtenidos en mejoras efectivas en una organización.

El diferencial de la tecnología BPM es la innovación a través de herramientas y tecnologías que permiten, no sólo gestionar un proceso de negocios por medio de sus componentes, (tareas, personas, máquinas y software) sino que también permite extraer precisamente los costos, el tiempo y el consumo de recursos inherentes a cada uno de estos componentes.

BPM debe entenderse como un enfoque amplio, que se refiere no sólo a la aplicación de las tecnologías, sino también, y fundamentalmente, a la aplicación de métodos y técnicas para el diseño, implementación, control y mejora continua de los procesos, que aportan muchos beneficios como por ejemplo, una mayor fiabilidad, reducción de costes y aumento de la capacidad de respuesta a las cambiantes necesidades de los clientes.



# Algunos de los beneficios que la tecnología BPM traerá a su negocio #

- Transparencia en todas las etapas del proceso.
- Un mayor control administrativo.
- Aumento de productividad.
- Reducción de costos.
- Automatización de procesos y generación de evidencias.
-  Automatización de los procesos a través de las funciones de negocio: ganando en interoperabilidad de los sistemas subyacentes, gracias al aprovisionamiento de interfaces estándar que logran la deseada automatización de procesos.
-  Aumento de velocidad en la automatización de nuevos procesos: la implementación de los nuevos procesos se agiliza cuando el diseño SOA permite exponer las capacidades de negocio como servicios.
-  Adaptación de los procesos a las necesidades de negocio: garantizando un impacto mínimo en el resto de procesos y partiendo de un análisis de viabilidad de los cambios propuestos, todo ello en condiciones de alta velocidad.
-  Minimización de errores y ahorro de costes: exportando e implementando los procesos de negocio que más robustos y menos propensos a errores.
-  Alineación de las inversiones de TI con las necesidades del negocio: priorizando el dar solución a los servicios de construcción necesarios para los procesos clave del negocio, para ganar en alineación y rendimiento.
-  Consecución de una mayor visibilidad del negocio: que además se logra en tiempo real.
-  Rapidez en la adopción de los servicios basados ​​en la nube: la infraestructura SOA adecuada permite que  tanto los servicios internos como los externos se utilicen de la misma manera a nivel de procesos.
-  Entrega de los procesos de negocio a través de dispositivos móviles: la movilidad es una realidad al tiempo que se garantiza la preservación de la integridad de los sistemas internos y el cumplimiento de los requisitos de calidad de servicio.

## Referencias ##
