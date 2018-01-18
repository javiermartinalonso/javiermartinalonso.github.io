---
layout: post
section: "BPMN"
title:  "BPMN arquitectura servicios"
date:   2018-12-31
desc: "procesos de negocio (BPM) y realización de Workflows."
keywords: "BPMN"
categories: [bonita]
tags: [BPMN]
icon: fas fa-cogs
image: static/img/blog/
---

#  Introducción #

https://docs.microsoft.com/es-es/biztalk/core/understanding-the-service-oriented-solution

Tres versiones de la solución
Hay tres versiones de la solución:

La versión de código auxiliar reemplaza todos los sistemas de servidor con código auxiliar. Este código auxiliar simula los sistemas de servidor. Esta versión proporciona un modo rápido de implementar y ejecutar la solución en un solo equipo.

La versión de adaptador utiliza adaptadores de BizTalk para conectarse a sistemas de servidor. Esta versión es como se podría pensar en principio implementar la solución. Sin embargo, el envío de mensajes a los sistemas de servidor usando adaptadores supone una latencia importante a la hora de obtener de nuevo las solicitudes. Si bien los adaptadores por sí solos podrían ofrecer una latencia muy baja, la arquitectura distribuida de BizTalk Server requiere que los adaptadores se comuniquen con las instancias de host de la orquestación mediante el cuadro de mensajes. Esto produce acciones de ida y vuelta a la base de datos y afecta a los tiempos de latencia.

La versión en línea reemplaza los adaptadores por código en línea que se comunica directamente con los sistemas de servidor. La versión en línea de la solución tiene la latencia más baja y el mayor rendimiento.

La guía de implementación proporciona instrucciones para crear e implementar todas las versiones de la solución, y también proporciona en cada versión una forma de simular la conexión a través de HIS con el sistema de transacciones pendientes. Para obtener información acerca de cómo crear e implementar la solución, vea implementar la solución orientada a servicios.


## Referencias ##
