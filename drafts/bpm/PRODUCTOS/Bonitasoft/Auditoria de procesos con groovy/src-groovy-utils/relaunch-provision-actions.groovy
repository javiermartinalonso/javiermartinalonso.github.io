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

   def inventoryUrl = 'http://srv-bprosigossbpm.sigo.angolatelecom.ao/crm-mediator/'
   

  
 
  restClient = new RESTClient(inventoryUrl)

  def actions = [
3113598,
3113688,
3113802,
3113803,
3113815,
3113829,
3113830,
3113832,
3145896

/*
3113301,
3113364,
3113369,
3113376,
3113380,
3113381,
3113383,
3113384,
3113385,
3113386,
3113387,
3113390,
3113407,
3113410,
3113411,
3113412,
3113413,
3113416,
3113417,
3113422,
3113423,
3113424,
3113425,
3113426,
3113427,
3113428,
3113429,
3113430,
3113431,
3113432,
3113434,
3113435,
3113436,
3113437,
3113438,
3113439,
3113442,
3113444,
3113445,
3113446,
3113447,
3113448,
3113450,
3113451,
3113452,
3113453,
3113455,
3113456,
3113457,
3113459,
3113460,
3113462,
3113464,
3113466,
3113467,
3113468,
3113472,
3113473,
3113475,
3113477,
3113478,
3113511,
3113516,
3113517,
3113522,
3113585,
3113587,
3113588,
3113590,
3113591,
3113592,
3113593,
3113594,
3113595,
3113597,
3113599,
3113600,
3113601,
3113602,
3113603,
3113605,
3113606,
3113607,
3113647,
3113649,
3113650,
3113651,
3113652,
3113654,
3113655,
3113656,
3113657,
3113658,
3113659,
3113660,
3113661,
3113662,
3113663,
3113664,
3113675,
3113676,
3113677,
3113699,
3113713*/
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