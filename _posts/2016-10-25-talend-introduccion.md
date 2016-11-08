---
layout: post
section: "TALEND"
title:  "Talend Introducción"
date:   2016-10-25
desc: "Herramienta ETL para la migración e integración de datos"
keywords: "Talend,Talend Open Studio, Introducción, Integration"
categories: [talend]
tags: [Talend,Talend Open Studio, Introducción, Integration]
icon: fa-exchange
image: static/img/blog/talend/talend-logo.png
---

# ETL con Talend

<strong>Extract, Transform and Load («extraer, transformar y cargar», frecuentemente abreviado ETL)</strong> es el proceso que permite a las organizaciones mover datos desde múltiples fuentes, reformatearlos y limpiarlos, y cargarlos en otra base de datos, data mart, o data warehouse para analizar, o en otro sistema operacional para apoyar un proceso de negocio. Los procesos ETL también se pueden utilizar para la integración con sistemas heredados.

## ¿Qué puedo hacer con Talend?

* <strong>ETL</strong>.
* <strong>Sincronización o replicación de bases de datos</strong>.
* <strong>Migración</strong>.
* <strong>Transformación de datos</strong>.

## ¿Qué ventajas te ofrece trabajar con Talend?

* <strong>Desarrollo gráfico basado en diagramas de flujo</strong>: Esto te permite documentar a la vez que desarrollas.
* <strong>Escribir código reutilizable y fiable</strong>: Grupos de contexto, repositorio de código de rutinas, componentes personalizados y otros objetos del repositorio.
* <strong>Modularidad del trabajo</strong>.Se puede cojer una gran tarea y descomponerla en varios trabajos más pequeños que pueden ser orquestados por un maestro.
* <strong>Control de errores</strong>: Es posible, por ejemplo, referirse a un Objeto null y recibir un NullPointerException. Podemos detectar esta excepción y tratarla, en vez de terminar inmediatamente, ya que esto puede no ser el resultado deseado.
Una tarea puede llamar a un servicio web que no está disponible y recibir un 503 (Servicio no disponible). Esto no va a ser fatal para Talend, pero, de nuevo, es posible que desee tratar con esto de una manera especial y no lanzar una excepción; por ejemplo, es posible que desee volver a intentar la solicitud en un momento posterior.
* <strong>Reinicio y recuperación</strong>: Al poder manejar los errores, usted está en una posición mucho mejor para hacer frente a su tarea en caso de que reciba un error fatal: Puede su tarea simplemente reiniciarse desde el principio? ¿Es eso posible? ¿O hay que reiniciar el trabajo en un punto de fallo lógico?
* <strong>Robustez</strong>: Una vez que la arquitectura de su job está lista, los errores se pueden controlar y hay capacidad de recuperación.
* <strong>Rendimiento</strong> (por lo general significa la velocidad de ejecución) es a menudo un indicador clave de un éxito o el fracaso de una tarea. Hay muchos aspectos a la sintonización de su tarea, incluyendo: diseño de trabajo general, la gestión de memoria, I / O, compartir la carga con entradas y salidas (por ejemplo, bases de datos) y el paralelismo. También hay factores que pueden no estar bajo el control directo del desarrollador Talend, como el rendimiento de la red y la configuración de fuentes externas y ends points. Todos ellos deben ser tomados en consideración.
* <strong>Logging</strong>: Por último, es una buena práctica registrar información sobre la ejecución de su trabajo, a través del tiempo. Esto ayuda con la optimización del rendimiento y resolución de problemas.

## Talend Open Studio Data Integration

Es una herramienta open-source (licencia GPL) que permite de forma visual modelar transformaciones de datos generando código Java. Ofrece un diseñador visual (basado en Eclipse RCP) que permite definir todo el flujo de transformaciones en base a componentes predefinidos (más de 400, también se pueden crear y ampliar).

<div style="text-align: center;">
	<img src="/static/img/blog/talend/talend_job.png" alt="job" class="img-preview" style="width: 90%">
</div>

Este diseñador proporciona una vista gráfica de los procesos, con componentes arrastrables que permiten: mappings, transformaciones, etc; funciones especializadas como data filtering, data multiplexing, o ELT; y soporte para RDBMS, file formats, LDAP directories, etc.

Podéis descargar Talend Open Studio desde [aquí](https://www.talend.com/download/talend-open-studio#t4 "Talend Open Studio Data Integration").

## Referencias

<https://www.talend.com/>