---
layout: post
section: "maven"
title:  "maven tips"
date:   2018-02-15
desc: ""
keywords: ""
categories: []
tags: []
icon: fa-leaf
image: static/img/blog/spring/spring-logo.png
---

https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html


http://www.notodocodigo.com/blog/tutorial-maven/


https://www.adictosaltrabajo.com/tutoriales/maven/
http://www.notodocodigo.com/maven/principales-comandos/
http://www.chuidiang.org/java/herramientas/maven.php
https://www.ibm.com/developerworks/ssa/library/j-5things16/index.html
http://maven.apache.org/plugins-archives/maven-surefire-plugin-2.12.4/examples/skipping-test.html




http://tirandolineasdecodigo.blogspot.com.es/2011/07/comandos-de-maven.html

Comandos de maven
Hoy vamos a explicar un poco más maven, en esta entrada vamos a explicar los comandos mas utilizado de maven para gestionar nuestro proyectos java.

mvn validate : nos valida nuestro proyecto
mvn clean :  elimina la carpeta target de nuesto proyecto
mvn compile : compila nuestra codigo fuente java
mvn test : nos ejecuta los test de nuestro proyecto
mvn site :  nos genera la documentacion de nuestro proyecto pmd, javadoc, etc.. 
mvn package :  nos genera jar o war de nuestro proyecto
mvn install :  nos instala nuestro proyecto en nuestro repositorio local
mvn deploy :  nos instala nuestro proyecto en un repositorio remoto

Estos son lo comandos más utilizados.













Saltar las pruebas en la construccion.

  	<properties>
  		<java.version>1.8</java.version>
  		
  		<project.build.skipTest>true</project.build.skipTest>
  		
    </properties>

includes y excludes en la construccion

https://maven.apache.org/plugins/maven-resources-plugin/examples/include-exclude.html


## Referencias ##


http://www.notodocodigo.com/maven/







https://maven.apache.org/settings.html





http://maven.apache.org/plugins/maven-deploy-plugin/usage.html

mvn deploy:deploy-file -Durl=file://C:\m2-repo \
                       -DrepositoryId=some.id \
                       -Dfile=your-artifact-1.0.jar \
                       [-DpomFile=your-pom.xml] \
                       [-DgroupId=org.some.group] \
                       [-DartifactId=your-artifact] \
                       [-Dversion=1.0] \
                       [-Dpackaging=jar] \
                       [-Dclassifier=test] \
                       [-DgeneratePom=true] \
                       [-DgeneratePom.description="My Project Description"] \
                       [-DrepositoryLayout=legacy] \
                       [-DuniqueVersion=false]
					   
mvn deploy:deploy-file 
-Durl=http://sigobpm1.c.mad.interhost.com:8081/repository/3rd_Party/content 
-DrepositoryId=nexus-provision 
-DgroupId=com.bonitasoft.engine -DartifactId=bonita-client-sp -Dversion=7.2.2 -Dpackaging=jar 
-Dfile=C:\99-BORRAR\terceros\bonita-client-sp-7.2.2.jar

mvn deploy:deploy-file 
-Durl=http://sigobpm1.c.mad.interhost.com:8081/repository/3rd_Party/content 
-DrepositoryId=nexus-provision 
-DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar 
-Dfile=C:\99-BORRAR\terceros\oracle\ojdbc6-11.2.0.jar

mvn deploy:deploy-file -Durl=http://sigobpm1.c.mad.interhost.com:8081/repository/3rd_Party/content -DrepositoryId=nexus-provision -DgroupId=com.oracle -DartifactId=ojdbc6 -Dversion=11.2.0 -Dpackaging=jar -Dfile=C:\99-BORRAR\terceros\oracle\ojdbc6-11.2.0.jar


*************************************************************************+
settings.xml					   
					   
					   
<servers>
   <server>
	  <id>nexus-integration</id>
	  <username>jenkins</username>
	  <password>jenkins</password>
   </server>
</servers> 


	<build>
		<plugins>
		  <plugin>
			 <groupId>org.sonatype.plugins</groupId>
			 <artifactId>nexus-staging-maven-plugin</artifactId>
			 <version>1.5.1</version>
			 <executions>
				<execution>
				   <id>default-deploy</id>
				   <phase>deploy</phase>
				   <goals>
					  <goal>deploy</goal>
				   </goals>
				</execution>
			 </executions>
			 <configuration>
				<serverId>nexus-provision</serverId>
				<nexusUrl>http://sigobpm1.c.mad.interhost.com:8081</nexusUrl>
				<skipStaging>true</skipStaging>
			 </configuration>
		  </plugin>
		</plugins>  
	</build>        	
	
	

https://pajarokillo.wordpress.com/2016/12/02/creando-informes-de-cobertura-de-codigo-con-jacoco-maven-plugin/