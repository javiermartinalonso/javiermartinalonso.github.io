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
   
  
  def oldBookigId = '4393e5d0-0b97-44df-be4f-50e38201adb0'
  def bookingId = 'a864d81e-7ad8-4055-86ed-d586b6fdbe3b'

  

  def phoneNumber = '222555334'
  def caixaPort = 'Caixa-LPD002/PDC-003'

  def restClient 
  def response
  def json 

 

  restClient = new RESTClient(inventoryUrl)

  try {
    response = restClient.delete( path : "booking/${oldBookigId}",
        body : null,
        requestContentType : JSON)

    assert response.status == 200

    println 'Old booking deleted'
  } catch (all) {
    println 'Error deleting old booking'
  }
  

 

  json = new JsonBuilder()

  json {
      orientClass 'NumeroDeTelefone'
      properties { 
        comentario ''
        dataAlteracaoEstado '2017-06-12'
        estado 'LIVRE'
        nome phoneNumber
      }
  }
  
  response = restClient.post( path : "resources",
      body : json.toPrettyString(),
      requestContentType : JSON)

  assert response.status == 201

  println "Creado numero de telefono ${phoneNumber}"
  

 //TODO sacar el bookingId ...
/*
  json = new JsonBuilder()

  json { 
    name bookingId
    code 'bb'
    description 'bbb'
  }

 response = restClient.post( path : "booking",
      body : json.toPrettyString(),
      requestContentType : JSON)

  assert response.status == 201

println "Creado booking ${bookingId}"
*/

 def resourceId = phoneNumber

response = restClient.post( path : "booking/${bookingId}/resources/${resourceId}",
      body : null,
      requestContentType : JSON)

assert response.status == 200

println "Asociado recurso ${resourceId} al booking ${bookingId}"

  resourceId =  URLEncoder.encode(caixaPort)

  response = restClient.post( path : "booking/${bookingId}/resources/${resourceId}",
      body : null,
      requestContentType : JSON)

assert response.status == 200

println "Asociado recurso ${resourceId} al booking ${bookingId}"

println 'Fin con éxito'
true