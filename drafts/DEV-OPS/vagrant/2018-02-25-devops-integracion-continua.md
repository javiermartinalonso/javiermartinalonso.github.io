---
layout: post
section: "DEVOPS"
title:  "Integración Continua (Continuous delivery)"
date:   2018-02-19
desc: "Con este articulo profundizamos en los conceptos básicos que hay detrás de la Integración Continua (Continuous delivery)"
keywords: "Integración_Continua, DevOps, pipeline"
categories: [DevOps]
tags: [Integración_Continua, DevOps, pipeline]
icon: fas fa-tachometer-alt
image: static/img/blog/devops/devops-logo.png
---

Este artículo es una adaptación libre de un [artículo en inglés de la wikipedia sobre integración continua](https://en.wikipedia.org/wiki/Continuous_delivery).

# Integración Continua (Continuous delivery) #

***La integración continua (IC en español y CD en inglés) es un enfoque de ingeniería de software en el cual los equipos producen software en ciclos cortos, lo que garantiza que el software se pueda lanzar confiablemente en cualquier momento***. Su objetivo es construir, probar y lanzar software más rápido y con mayor frecuencia. El enfoque ayuda a reducir el costo, el tiempo y el riesgo de realizar cambios al permitir más actualizaciones incrementales para las aplicaciones en producción. Un proceso de implementación sencillo y repetible es importante para la entrega continua.

# Relación con DevOps # 

La **integración continua** y **DevOps** son similares en sus significados y a menudo se combinan, pero son dos conceptos diferentes:

- **DevOps** tiene un alcance más amplio, y se centra en el cambio cultural, específicamente la colaboración de los diversos equipos involucrados en la entrega de software (desarrolladores, operaciones, control de calidad, administración, etc.), así como la automatización de los procesos en la entrega de software. 

- **La integración continua**, por otro lado, es un enfoque para automatizar el aspecto de la entrega, y se centra en reunir diferentes procesos y ejecutarlos más rápidamente y con mayor frecuencia. 

Por lo tanto, ***DevOps*** puede ser un producto de ***integración continua*** y la ***integración continua*** fluye directamente a ***DevOps***.

# Relación con la implementación continua #

La ***integración continua*** a veces se confunde con la ***implementación continua***. 

- **La integración continua significa que cada cambio se integra automáticamente en la producción**. 

- **La implementación continua significa que el equipo se asegura de que cada cambio se pueda integrar en un entorno de producción**, pero puede optar por no hacerlo, generalmente por motivos comerciales. 

Para hacer una ***integración continua***, uno debe hacer una ***implementación continua***.

<div style="text-align: center;margin: 1em;">
	<img src="{{ site.baseurl }}static/img/blog/devops/Continuous_Delivery_process_diagram.svg.png" alt="Diagrama Proceso entrega continua" class="img-thumbnail" style="width: 100%"/>
</div>

La ***integración continua*** trata la noción común de un **pipeline** de implementación como un conjunto de validaciones a través del cual un software debe pasar en su camino de lanzamiento . El código se modifica y se guarda en un ***SCM***, cada vez que se confirma una cambio en el repositorio de control, si es necesario se compila y se pasan los test unitarios, luego se empaqueta en un servidor y se prueba mediante varias técnicas diferentes (que pueden incluir pruebas manuales) antes de que se pueda marcar como liberable.

>***Gestión de Configuración de Software (Software Configuration Management, SCM)*** es una especialización de la gestión de configuración a todas las actividades en el sector del desarrollo de software.
>
> ***SCM*** trata y controla:
> 
> - La elaboración de código fuente por varios desarrolladores simultáneamente.
> - El seguimiento del estado de las fases del desarrollo de software (versiones) y sus cambios (control de versiones).
> - La conducción de la integración de las partes del software en un solo producto de software.

> ***Pipeline de la implementación (Deployment pipeline)***
> 
> La entrega continua se habilita a través de la ***"canalización de implementación"***, **pipeline** a partir de ahora, . El objetivo de un pipeline tiene tres componentes: ***visibilidad, retroalimentación e implementación continua***.
> 
> - ***Visibilidad*** : todos los aspectos del sistema de entrega, incluida la construcción, implementación, prueba y lanzamiento, son visibles para todos los miembros del equipo para promover la colaboración.
> 
> - ***Retroalimentación*** : los miembros del equipo se enteran de los problemas lo antes posible cuando ocurren para que puedan solucionarlos lo más rápido posible.
> 
> - ***Implementación continua*** : a través de un proceso totalmente automático, puede implementar y liberar cualquier versión del software en cualquier entorno.

> ***Herramientas / tipos de herramientas***
> 
> **La entrega continua lleva la automatización desde el repositorio de control del código fuente hasta el entorno de producción**. Hay varias herramientas que ayudan a lograr todo o parte de este proceso. Estas herramientas forman parte del **pipeline** que incluye la **integración continua**. 
> 
> Los tipos de herramientas que ejecutan diversas partes del proceso incluyen: ***integración continua, automatización de lanzamiento de aplicaciones o generación de releases, automatización de compilación y construcción, gestión del ciclo de vida de las aplicaciones***.

# Estrategias para superar los desafíos de adopción de la ***integración continua*** #

| ***Estrategia*** | ***Descripción*** |
| :----------: | :----------: |
| Vender ***integración continua*** como analgésico | Identifique los puntos problemáticos de cada parte interesada que la ***integración continua*** puede resolver, y venda la ***integración continua*** como analgésico a ese interesado. Esta estrategia ayuda a lograr la aceptación de la amplia gama de partes interesadas que requiere una implementación de la ***integración continua***. |
| Equipo dedicado con miembros multidisciplinar | Sin un equipo dedicado, puede ser difícil progresar porque a menudo se asigna a los empleados a trabajar en otros flujos de valor. Un equipo multidisciplinar no solo proporciona la amplia gama de habilidades requeridas para la implementación de la ***integración continua***, sino que también suaviza la comunicación con los equipos relacionados. |
| ***Entrega continua*** de ***entrega continua*** | Organice la implementación de la ***integración continua*** de una manera que genere valor para la empresa lo antes posible, incorporando gradualmente más proyectos, en pequeños incrementos y, finalmente, implementando la ***integración continua*** en toda la organización. Esta estrategia ayuda a justificar la inversión requerida al hacer visibles los beneficios concretos en el camino. Los beneficios visibles, a su vez, ayudan a lograr el apoyo sostenido de la compañía y la inversión requerida para sobrevivir al largo y difícil viaje a la ***integración continua***. |
| Comenzando con aplicaciones fáciles pero importantes | Al seleccionar las primeras aplicaciones para migrar a la ***integración continua***, elija las que sean fáciles de migrar pero que sean importantes para la empresa. Ser fácil de migrar ayuda a demostrar los beneficios de la ***integración continua*** rápidamente, lo que puede evitar que se mate la iniciativa de implementación. Ser importante para el negocio ayuda a asegurar los recursos requeridos, demuestra un valor claro e indiscutible y aumenta la visibilidad de la ***integración continua*** en la organización. |
| Esqueleto del ***pipeline Visual*** de ***integración continua*** | Ofrezca a un equipo un ***esqueleto visual del pipeline*** de la ***integración continua*** que tenga la vista completa de la línea de la ***integración continua***, pero con etapas vacías para aquellos que aún no pueden implementar. Esto ayuda a construir una mentalidad de la ***integración continua*** y mantener el impulso para la adopción de la ***integración continua***. El esqueleto del ***pipeline*** es especialmente útil cuando la migración del equipo de la ***integración continua*** requiere un gran esfuerzo y cambios de mentalidad durante un largo período de tiempo. |
| Caída experta | Asigne un experto en la ***integración continua*** para que se una a proyectos difíciles como miembro senior del equipo de desarrollo. Tener al experto en el equipo ayuda a construir la motivación y el impulso para pasar a la ***integración continua*** desde el interior del equipo. También ayuda a mantener el impulso cuando la migración requiere un gran esfuerzo y un largo período de tiempo. |

## Referencias ##

[https://en.wikipedia.org/wiki/Continuous_delivery](https://en.wikipedia.org/wiki/Continuous_delivery)