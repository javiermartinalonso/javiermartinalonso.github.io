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

   def inventoryUrl = 'http://213.134.61.37:8080/AT-Inventory/services/v1.0/'
   //'http://172.31.170.81:8080/AT-Inventory/services/v1.0/' 


  def restClient 
  def response
  def json 

 
  restClient = new RESTClient(inventoryUrl)
 

  json = new JsonBuilder()

  json {
      idService 
      nameService
      idCustomer
      nameCustomer

  }
  
  response = restClient.post( path : "services",
      body : json.toPrettyString(),
      requestContentType : JSON)

  assert response.status == 201

  println "Creado numero de telefono ${phoneNumber}"


  //crear las localizaciones post a /locations/{pais}/{provincia}/{region}/{poblacion}
  	// address
  	// name
  	// code
  	// latitude
  	// longitude

  //add location es un post a /services/{idServicio}/location/{locationCode} sin body...