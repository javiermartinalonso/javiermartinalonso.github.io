---
layout: post
section: "Git"
title:  "Ventajas de usar GIT"
date:   2017-09-13
desc: "."
keywords: "git, GitHub, BitBucket"
categories: [arquitectura]
tags: [git, GitHub, BitBucket]
icon: fa-university
image: static/img/blog/docker/docker-logo.png
---

# ¿Qué es Git? #

Un sistema distribuido de control de versiones

# ¿Qué es GitHub? #

GitHub es una plataforma de alojamiento de código para el control de versiones y la colaboración. Le permite a usted ya otros trabajar juntos en proyectos desde cualquier lugar.

Buenos días,

Pensando en la mejora de los procesos de desarrollo de SATEC, quiero proponer que se estudie la posibilidad de **usar git con gitHub** como repositorio para algún piloto o nuevos proyectos de SATEC. 

A continuación, explico algunas las razones por las que creo que esto es conveniente:

- **Espacio**:

	Tu repositorio de Subversion acumula ramas de desarrollo difuntas que ocupan espacio aunque ya no se necesitan. En git, el repositorio central sólo necesita guardar lo que realmente está terminado y funcionando. Con git no hay miedo a estar trabajando en distintas ramas a la vez, ya que el espacio que requiere es insignificante, con SVN puedes hacer lo mismo pero tardarias mucho mas en realizar copias y ocuparia bastante mas.

	El tamaño que ocupa el repositorio es menor, ya que cada vez que haces commit se crea un tag pero solo con los cambios con respecto al tag anterior.

- **Backups**:

	Se puede decir que git al ser distribuido, cada copia en una maquina es un backup completo del repositorio central.

- **Gestión de ramas y agilidad**:

	Es más fácil crear y gestionar las ramas en local, lo cual te permite estar haciendo el desarrollo de un requisito y si las prioridades cambian, guardar la rama con estas modificaciones en local y volver muy rápidamente a la rama principal para desarrollar la nueva prioridad. 
	Facilitando el poder volver e incorporar el desarrollo que dejaste parado en paralelo y haciendonos mucho más agiles a los cambios.

	En sistemas como SVN a veces volver a la versión anterior es muy dificil, Con Git es más fácil revisar el histórico de cambios viendo de golpe todos los ficheros que se cambiaron en un única subida y pudiendo ver el resumen de cambios, esto debido a su naturaleza de commits incrementales.
	Con GIT esto no sucede ya que puedes ver todos los cambios en varios ficheros a la vez, para un repositorio completo, ya que cada tag es sobre un commict completo del repositorio y no de archivos sueltos de este, con SVN para hacer lo mismo tienes que recurrir a programas de terceros como sonar, que registran los últimos cambios para mostrartelos más como lo hace GIT.

- **Asegurar la integridad del desarrollo**:

	Una de las cualidades de Git es que no puedes hacer commit a una rama sin haber integrado primero los cambios de esta en la rama que quieres subir.
	Con esto aseguras que tus cambios están incorporados y que si has probado correctamente la integración, aseguras que tu commit no rompe la calidad del proyecto.

- **Problemas con el repositorio central**.

	Ante una caída de la red, puedes seguir haciendo commits de tus cambios al repositorio local sin miedo a perdelos y pudiendo volver atrás sin problemas.
Con SVN a menos que tengas configurado el guardado de historico de las últimas horas esto no sería posible y aún así puedes perder los cambios, con Git esto no te pasará nunca.

- **Gestión del proyecto con plataforma GIthub**.

	1. **Revisión de la integración de los cambios por el responsable técnico (El pull request)**.
	
		Una ventaja en el ámbito de git es el pull request. Es un flujo de trabajo en que un desarrollador dice que ha terminado algo y pide al jefe de integrarlo en la rama de release. 
		Antes unas cuantas personas más pueden dar su acuerdo o incluso añadir nuevos commits con cambios. 
		Esta funcionalidad no es de git mismo, sino un software adicional que ofrecen servidores para proyectos en git como GitHub.

	2. **Tablero de gestión del proyecto**.
	
		Desde github, puedes tener un tablero kamban, donde analizar el backlog, las tareas en curso, pendientes, etc. 

	3. **Gestion de releases**
	
		Se puede realizar de una manera muy sencilla que luego pueden ser usadas en la integración continua con herramientas como Jenkins.
	
	4. **Gestión de Issues**
		
		También la herramienta permite abrir y reportar solicitudes de cambios y errores detectados e incluye una manera de gestionarlos y documentarlos en las releases.

- **Mercado actual:**

	Es una tecnología muy madura que lleva bastante tiempo en uso, existe desde 2005. Git lo usan los grandes como google, facebook, twitter, android y es fácil que los clientes lo empiezen a incorporar en sus infraestructuras, lo cual si no empezamos a usarlo en la empresa nos iria dejando rezagados contra otros competidores que ya estén acostumbrados a trabajar bien con este sistema.

	A nivel social, cada día está más en auge usar git, sobre todo desde plataformas web como GitHub o BitBucket. 
	Es una manera muy buena de crear infraestructuras comunity, para que personas de todo el mundo se involucren en el desarrollo de proyectos. 
	Esto quiere decir que los nuevos profesionales están aumentando su uso y reduciendo su curva de aprendizaje. 
	Lo usan para mejorar sus herramientas de trabajo, tener software propio y fiable disponible, poder publicarlo y que otros participen en su mejora. 
	Poder mostrar el conocimiento y la valía de estos profesionales, al poder mostrar directamente su trabajo. I
	Incluso muchas empresas piden la cuenta de github del candidato para estudiar su trabajo durante las campañas de selección de personal.

	Las empresas y frameworks que todos conocemos usan esta vía para sus desarrollos: Spring, BonitaSoft, Angular, Android, Google, linux ... Lo cual nos obliga como profesionales ha hacer uso de este tipo de repositorios sin ninguna duda.

Para finalizar y desde mi experiencia personal lo recomiendo encarecidamente, sobre todo con plataformas como **gitHub o BitBucket**, sobre todo por la potencia que tiene para generar entregas rápidas, generar tags y releases y la facilidad de gestión del repositorio.

Llevo mas de un año usándolo como herramienta para mejorar mi visibilidad profesional, aprender, recopilar desarrollos, herramientas y acceder a las publicaciones de los frameworks que uso y estoy encantado, es más creo que es imprescindible su uso para el trabajo del día a día.

Esto que comento a nivel personal se puede extrapolar al nivel de la empresa mostrando algún proyecto/producto que queramos montar con la filosofía comunity. De este modo podríamos contar con una comunidad que de ideas e incluso nos ayude con la codificación, pruebas, feedback de uso de un producto que luego queramos vender o dar soporte de modo privado, como hacen empresas como JBOSS o Bonitasoft. Esto mejoraría la imagen de la empresa, ayudaría a darse a conocer e introducirse como servicio en nuevas soluciones.

Saludos cordiales

## Referencias ##

https://git-scm.com/
