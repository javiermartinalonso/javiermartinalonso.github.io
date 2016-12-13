

https://www.adictosaltrabajo.com/tutoriales/flyway-como-integrar-en-maven/

generacion de datos de prueba
http://www.generatedata.com


https://www.youtube.com/watch?v=8E54DaLKEFc

http://comunidad.iebschool.com/perezmvictoria/2014/05/01/manual-de-configuracion-y-uso-flyway/

https://flywaydb.org/

https://flywaydb.org/documentation/maven/

https://flywaydb.org/documentation/maven/migrate



dentro de plugins

			<!-- Gestion de los correctivos de base de datos -->
			<plugin>
				<groupId>org.flywaydb</groupId>
				<artifactId>flyway-maven-plugin</artifactId>
				<version>4.0.3</version>
				<configuration>
					<!-- 
					<driver>org.hsqldb.jdbcDriver</driver>
					
					<url>jdbc:hsqldb:file:${project.build.directory}/db/flyway_sample;shutdown=true</url>
					<user>SA</user>
					<password>mySecretPwd</password>
					<schemas>
						<schema>schema1</schema>
						<schema>schema2</schema>
						<schema>schema3</schema>
					</schemas>
					-->
					<table>schema_history</table>
					<locations>
						<location>classpath:db/migration</location>
					</locations>
					<encoding>ISO-8859-1</encoding>
					<!-- 
					<placeholderReplacement>true</placeholderReplacement>
					<placeholders>
						<aplaceholder>value</aplaceholder>
						<otherplaceholder>value123</otherplaceholder>
					</placeholders>
					<placeholderPrefix>#[</placeholderPrefix>
					<placeholderSuffix>]</placeholderSuffix>
					-->
					<baselineVersion>2.0</baselineVersion>
					<baselineDescription>Kickoff corporate production</baselineDescription>
					<skip>false</skip>
					<!-- 
					<configFile>myConfig.properties</configFile>
					-->
				</configuration>
			</plugin>


		<profile>
			<id>local</id>
			<activation>
				<activeByDefault>true</activeByDefault>
			</activation>
			<properties>
				<!-- configuracion contra una bbdd h2 local
				<spring.profiles.active/>
				 -->
				 
				<!-- configuracion contra una bbdd oracle local-->
				<spring.profiles.active>oracle</spring.profiles.active>
				<crm.oss.endpoint.base.uri>http://localhost:9990</crm.oss.endpoint.base.uri>
				<crm.oss.endpoint.path>crm/provision</crm.oss.endpoint.path>
				
				<!-- Flyway properties -->
				<flyway.url>jdbc:oracle:thin:@localhost:1521/XE</flyway.url>
				<flyway.user>CRM_MEDIATOR_DES</flyway.user>
				<flyway.password>provision_des</flyway.password>				
			</properties>
		</profile>