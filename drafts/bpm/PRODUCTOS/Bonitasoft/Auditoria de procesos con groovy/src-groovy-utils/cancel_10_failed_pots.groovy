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


   //def inventoryUrl = 'http://vms-cvasigsvi163.pre.sigo.angolatelecom.ao:8280/crm-mediator/' 

   def inventoryUrl = 'http://srv-bprosigossbpm.sigo.angolatelecom.ao/bonita/'
   

  
 
  restClient = new RESTClient(inventoryUrl)

  def processInstanceId = [
19669,
19483,
19432,
19427,
19261,
19237,
14334,
14328,
20387,
19216,
19850,
19847,
19844,
19841,
19838,
19474,
19418,
19408,
19396,
19393,
19384,
19381,
19955,
19518,
19514,
19507,
19378,
19375,
19372,
19666,
19663,
19660,
19657,
19615,
19612,
19336,
19333,
19856,
19853,
19835,
19644,
19641,
19638,
19527,
19621,
19369,
19366,
19347,
19344,
19339,
17134,
17131,
17128,
19807,
19654,
19650,
19647,
19464,
19461,
19457,
19454,
19441,
19438,
19435,
19421,
19390,
19387,
19249,
19245,
19363,
19914,
19911,
19908,
19630,
19254,
19832,
19829,
19635,
19627,
19624,
19618,
19489,
19471,
19468,
19445,
19415,
19360,
20492,
20507,
17121,
17124,
19269,
19264,
19325,
19814,
19811,
19859,
19823,
19820,
19209,
22103,
20391,
19480,
19477,
19451,
19424,
19412,
19405,
19402,
19399,
19486,
19448,
20495,
19330,
19272,
19257,
19242
  ]
 
 actions.each {

  def actionId = it


  response = restClient.get( path : "admin/provisionAction/execute/${actionId}",
      body : null,
      requestContentType : JSON)

  assert response.status == 200

  println "Exito lanzando la baja de ${actionId}"

  sleep(5000)

}
  //crear las localizaciones post a /locations/{pais}/{provincia}/{region}/{poblacion}
  	// address
  	// name
  	// code
  	// latitude
  	// longitude

  //add location es un post a /services/{idServicio}/location/{locationCode} sin body...