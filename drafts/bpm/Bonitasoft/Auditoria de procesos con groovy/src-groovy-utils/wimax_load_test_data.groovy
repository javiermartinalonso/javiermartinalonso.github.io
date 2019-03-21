import groovy.json.JsonBuilder
@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.2' )
@Grab(group='org.apache.httpcomponents', module='httpclient', version='4.2.1' )
import groovyx.net.http.RESTClient
import groovy.json.*
import static groovyx.net.http.ContentType.*
import java.util.logging.Logger
import groovy.xml.*
import java.net.URLEncoder


// def serviceId 


   //def inventoryUrl = 'http://vms-cvasigsvi163.pre.sigo.angolatelecom.ao:8280/inventory-mediator' 

   def inventoryUrl = 'http://213.134.61.37:8080/AT-Inventory_DESA/services/v1.0/'
                      
   //'http://172.31.170.81:8080/AT-Inventory/services/v1.0/' 
  

   //Crear los recursos y las relaciones para testear la provision de WiMAX
   def startSerialNumber = 11110000
   def startPhoneNumber = 422110000
   def amount = 100

   restClient = new RESTClient(inventoryUrl)

   for (i=0; i < amount; i++) {

      def phoneNumber = startPhoneNumber + i + 1

      def json = new JsonBuilder()

      json {
          orientClass 'NumeroDeTelefone'
          properties { 
            comentario ''
            dataAlteracaoEstado '2017-06-12'
            estado 'LIVRE'
            nome "${phoneNumber}"
          }
      }

      println "el json es ${json}"
      
      response = restClient.post( path : "resources",
          body : json.toPrettyString(),
          requestContentType : JSON)

      assert response.status == 201

      println "Creado numero de telefono ${phoneNumber}"


      def nomePerfilRede =  "${phoneNumber}_perfilDeRedeWiMax"
      def nomePerfilRedeSerial = startSerialNumber + i + 1

      json = new JsonBuilder()

      json {
          orientClass 'PerfilDeRedeWiMax'
          properties { 
            comentario ''
            nome nomePerfilRede
            serialNumber "${nomePerfilRedeSerial}"
            usr "${phoneNumber}"
            pwdDados 'wimax'
            pwdVoz 'wimax'
          }
      }
      
      response = restClient.post( path : "resources",
          body : json.toPrettyString(),
          requestContentType : JSON)

      assert response.status == 201

      println "Creado perfil de rede ${nomePerfilRede}"

      json = new JsonBuilder()

      json {
          orientClass 'NumeroDeTelefoneRelacionadoComPerfilDeRedeWiMax'
          destiny nomePerfilRede
          source "${phoneNumber}"
      }

      println "el json es ${json}"

      response = restClient.post( path : "relations",
          body : json.toPrettyString(),
          requestContentType : JSON)

      assert response.status == 201

      println "Creada relacion ${nomePerfilRede} con ${phoneNumber}"

    }

  
  