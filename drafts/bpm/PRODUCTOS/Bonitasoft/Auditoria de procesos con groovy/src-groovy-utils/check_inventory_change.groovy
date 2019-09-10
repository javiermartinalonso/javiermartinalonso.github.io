import java.util.logging.Logger
@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.2' )
@Grab(group='org.apache.httpcomponents', module='httpclient', version='4.2.1' )
import groovyx.net.http.RESTClient
import groovyx.net.http.HttpResponseException
import static groovyx.net.http.ContentType.*
import groovy.json.*
import java.text.DecimalFormat
import java.text.DecimalFormatSymbols
import java.text.SimpleDateFormat

import org.codehaus.groovy.runtime.*

//TODO deberiamos pasar una lista de direcciones que puede haber una o dos...
static String compareServiceData(Object targetService) {

    def result = 'NONE'
    def sourceService = getService(targetService.idService)

    if (sourceService == null) {
        result =  'NOT_FOUND'
    } else if (targetService.idCustomer != sourceService.idCustomer ) {
        result =  'CHANGE_OWNERSHIP'
    } else  if (targetService.nameService != sourceService.nameService) {
        result = 'CHANGE_SERVICE_NAME'
    } 

    //ahora hay q comparar las direcciones del servico a ver como lo hacenmos...

    return result
    
}

static boolean compareAddressLatLong(Object address, float latitude, float longitude) {

    return address.latitude.floatValue() == latitude && address.longitude.floatValue() == longitude

}


static Object getService(String serviceId) {
     def inventoryUrl = "http://localhost:9093/"
     //def inventoryUrl = 'http://srv-bprosigossbpm.sigo.angolatelecom.ao/inventory-mediator/'
     def inventoryPath= "inventory/service/${serviceId}"
     
     println ("[getService] url="+inventoryUrl+"; path="+inventoryPath)
     
     def restClient = new RESTClient(inventoryUrl)
 
     try {
         def response = restClient.get( path : inventoryPath,
             body : null,
             requestContentType : JSON)
 
         println ("[getService] response status = " + response.status)
         
         assert response.status == 200
         response.data
     } catch (HttpResponseException e) {
          if(e.statusCode ==  404) {
             return null;
         }
     }
 }

static Object[] getServiceLocations(String serviceId) {
     def inventoryUrl = "http://localhost:9093/"
     //def inventoryUrl = 'http://srv-bprosigossbpm.sigo.angolatelecom.ao/inventory-mediator/'
     def inventoryPath= "inventory/service/${serviceId}/location"
     
     println ("[getService] url="+inventoryUrl+"; path="+inventoryPath)
     
     def restClient = new RESTClient(inventoryUrl)
 
     try {
         def response = restClient.get( path : inventoryPath,
             body : null,
             requestContentType : JSON)
 
         println ("[getService] response status = " + response.status)
         
         assert response.status == 200
         response.data
     } catch (HttpResponseException e) {
          if(e.statusCode ==  404) {
             return null;
         }
     }
 }
 
 static List inventoryUtils_listServiceProvisionResources(serviceId) {
    def inventoryUrl = "http://localhost:9093/"
    //def inventoryUrl = ProvisionHome.instance.getProperty(ProvisionHome.INVENTORY_MEDIATOR_URL)
    def inventoryPath= "inventory/service/${serviceId}/provision/resources"

    def restClient = new RESTClient(inventoryUrl)
    def response = restClient.get( path : inventoryPath,
        body : null,
        requestContentType : JSON)

    assert response.status == 200

    def inventoryResources = response.data
    
    inventoryResources
}

static Map<String, String> inventoryUtils_parseProvisionResourcesPOTS(List bookedResources){
    def attrs4ServiceDescription = [:]
    bookedResources.each{ r -> updateServiceDescriptionPOTS(r, attrs4ServiceDescription) }
    println "#######  attrs4ServiceDescription ##### =====> ${attrs4ServiceDescription}"

        
    //Completamos la inforacion con la localizacion de la caja
    /*Ahora que hemos parseado, vamos a intentar sacar información adicional de la "Caixa"*/
    def boxId = attrs4ServiceDescription.'inventory.pots.box.id'                                          
    
    if(boxId != null) {
        def location = getResourceLocation(boxId);

        //Agregamos los nuevos atributos.
        attrs4ServiceDescription.'inventory.pots.box.province' = location.province.name
        attrs4ServiceDescription.'inventory.pots.box.country' = location.country.name
        attrs4ServiceDescription.'inventory.pots.box.region' = location.region.name
        attrs4ServiceDescription.'inventory.pots.box.city' = location.town.name
        attrs4ServiceDescription.'inventory.pots.box.address' = location.address
        attrs4ServiceDescription.'inventory.pots.box.longitude' = location.longitude
        attrs4ServiceDescription.'inventory.pots.box.latitude' = location.latitude
    
    }
    
    //FIN!
    attrs4ServiceDescription
}   

static Object getResourceLocation(String idResource) {
    def inventoryUrl = "http://localhost:9093/"
    //def inventoryUrl = ProvisionHome.instance.getProperty(ProvisionHome.INVENTORY_MEDIATOR_URL)
    def inventoryPath= "inventory/resourceLocation/${idResource}"


    def restClient = new RESTClient(inventoryUrl)
    def response = restClient.get( path : inventoryPath,
        body : null,
        requestContentType : JSON)

    assert response.status == 200

    def location = response.data

    return location
}

/**Parsea el objeto "Resource" recibido y en función de su "type" añade los atributos correspondientes para el ServiceDescription*/
private static void updateServiceDescriptionPOTS(resource, attrs4ServiceDescription){

    switch(resource.resourceType){
    case 'port':
        println "Resource ### PORT!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.customerPair.id' = resource.nome
        attrs4ServiceDescription.'inventory.pots.customerPair.port' = resource.numero
        attrs4ServiceDescription.'inventory.pots.customerPair.status' = resource.estado
        break;
    case 'phoneNumber':
        println "Resource ### TELEFONO!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.phoneNumber' = resource.nome
        attrs4ServiceDescription.'service.name' = resource.nome
        break;
    case 'box':
        println "Resource ### CAJA!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.box.id' = resource.nome
        attrs4ServiceDescription.'inventory.pots.box.status' = resource.estado
        attrs4ServiceDescription.'inventory.pots.box.latitude' = resource.latitude
        attrs4ServiceDescription.'inventory.pots.box.longitude' = resource.longitude
        attrs4ServiceDescription.'inventory.pots.box.layout' = resource.posicao
        break;
    case 'networkProfilePOTS':
        println "Resource ### PerfilDeRedePOTS!!!! ==> ${resource}"
        attrs4ServiceDescription.'contract.equipment.serial' = resource.serialNumber
        attrs4ServiceDescription.'user.name' = resource.usr
        attrs4ServiceDescription.'user.password' = resource.pwdDados
        break;    
    case 'boxPrimaryPair':
        println "Resource ### CAJA-PRIM.PORT!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.box.primaryPair.port' = resource.numero
        break;
    case 'mdf':
        println "Resource ### MDF!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.mdf.id' = resource.nome
        attrs4ServiceDescription.'inventory.pots.mdf.ip' = resource.ip
        attrs4ServiceDescription.'inventory.pots.mdf.portIp' = resource.portoIp
        break;
    case 'mdfPort':
        println "Resource ### PORT MDF!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.mdf.port.id' = resource.nome
        attrs4ServiceDescription.'inventory.pots.mdf.port.number' = resource.numero
        attrs4ServiceDescription.'inventory.pots.dslam.primaryPair.port' = resource.numero
        break;
    case 'cabinet':
        println "Resource ### CABINET!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.cabinet.id' = resource.nome
        break;
    case 'cabinetPrimaryPort':
        println "Resource ### CABINET PRIM-PORT!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.cabinet.primaryPair.port' = resource.numero
        break;
    case 'cabinetSecondaryPort':
        println "Resource ### CABINET PRIM-PORT!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.cabinet.secondaryPair.port' = resource.numero
        break;
    case 'dslam':
        println "Resource ### DSLAM!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.dslam.id' = resource.nome
        break;
    case 'dslamPort':
        println "Resource ### DSLAM-PORT!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.dslam.port' = resource.nome
        break;
    case 'dslamRack':
        println "Resource ### DSLAM-RACK!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.dslam.rack.port' = resource.nome
        break;
    case 'dslamSlot':
        println "Resource ### DSLAM-SLOT!!!! ==> ${resource}"
        attrs4ServiceDescription.'inventory.pots.dslam.slot.port' = resource.nome
        break;
    }
    
}
 
 static Object inventoryUtils_checkFeasibilityStatus(technology, latitude, longitude, maxDistance, attrMap) {
    def inventoryUrl = "http://localhost:9093/"
    //def inventoryUrl = ProvisionHome.instance.getProperty(ProvisionHome.INVENTORY_MEDIATOR_URL)
    def inventoryPath= "inventory/serviceFeasibility"
    def myQuery = buildServiceFeasibilityRequest(technology, latitude, longitude, maxDistance, attrMap)
     
    println ("[checkPOTSFeasibilityStatus] url="+inventoryUrl+"; path="+inventoryPath+"; myQuery="+myQuery)
    
    
    def restClient = new RESTClient(inventoryUrl)
    def response = restClient.post( path : inventoryPath,
        body : myQuery,
        requestContentType : JSON)
    
    println ("[checkPOTSFeasibilityStatus] response status = " + response.status)

    def serviceFeasibilityResponse = response.data

    println ("[checkPOTSFeasibilityStatus] feasible? " + serviceFeasibilityResponse.feasible)
    println ("[checkPOTSFeasibilityStatus] details: " + serviceFeasibilityResponse.details)
    
    
    serviceFeasibilityResponse
}

/**Devuelve un objeto (map) "ServiceFeasibilityRequest"*/
private static Object buildServiceFeasibilityRequest(technology, latitude, longitude, maxDistance, attrMap) {
    def serviceFeasibilityRequest = [:]
    serviceFeasibilityRequest.technology=technology
    serviceFeasibilityRequest.latitude=latitude
    serviceFeasibilityRequest.longitude=longitude
    serviceFeasibilityRequest.maxDistance=maxDistance
    serviceFeasibilityRequest.phoneNumber=attrMap['service.name']
    serviceFeasibilityRequest.optionalParameters=attrMap

    serviceFeasibilityRequest
}


//Pruebas de cambios sobre el servicio
def feasibility = false
def technology = 'ADSL'
def longitude = 18.520742f
def latitude = -14.948563f
def maxDistance = 50
def clientId = 'Instituto Nacional Da Criança'
def attrMap = [:]
attrMap['user.domain'] = 'adsl.supernet.ao'
attrMap['service.id'] =  '3a13c039-0888-4bb1-85b2-e6741b063890'
attrMap['service.name'] =  '222333444'
attrMap['worksheet.action'] =  'CHANGE'
attrMap['service.bandwidth'] =  '1024'

def resorcesAttrMap = inventoryUtils_parseProvisionResourcesPOTS(inventoryUtils_listServiceProvisionResources(attrMap['service.id']))


//Le damos como hint siempre el puerto de la caixa y la caixa para intentar mantenerlos...
attrMap['inventory.pots.customerPair.id'] = resorcesAttrMap['inventory.pots.customerPair.id']
attrMap['inventory.pots.box.id'] = resorcesAttrMap['inventory.pots.box.id']

//TODO ver si hace falta para la provision saber el mdf viejo .... es lo podemos hacer metiendo siempre los datos de recursos del servicio...


def json = new JsonBuilder()

def myTargetService = json {
        'idService'      attrMap['service.id']
        'idCustomer'    clientId
        'nameService'   attrMap['service.name']

}


def result =  compareServiceData(myTargetService)

if (result == 'NONE') {

    def addr =  getServiceLocations(myTargetService.idService)


    if ( ! addr.any { it ->
    compareAddressLatLong(it, longitude, latitude)
    } ) {
        result = 'CHANGE_ADDRESS'
    } 
}

println result

//TODO la caja actual es un hint para el algoritmo de busqueda en la viabilidad...
//El hint lo metemos en optional parameters...
switch (result) {
 case 'CHANGE_OWNERSHIP':
    feasibility = true;
    break;
 case 'CHANGE_SERVICE_NAME':
    println 'Checking for free numbers in current box'
    //TODO si no hay en la caja actual entonces hay que buscar otra que este 50 mm  y si no no es viable.
    feasibility = inventoryUtils_checkFeasibilityStatus(technology, latitude, longitude, maxDistance, attrMap);
    break;
 case 'CHANGE_ADDRESS':
    println 'Check if actual box is in range'
    println 'Check for new box and phone number or try to keep the old one'
    //Se intenta mantener el numero de telf si la caixa esta en rango
    attrMap['keep.service.name'] = true
    feasibility = inventoryUtils_checkFeasibilityStatus(technology, latitude, longitude, maxDistance, attrMap);
    break;
 case 'NONE':
    println 'Assuming product change'
    feasibility = true;
    break;   
} 
 
println feasibility


// Esto seria la provision 
switch (result) {
 case 'CHANGE_OWNERSHIP':
    println 'Calling proceso cambio titular servicio (serviceId, clientId, clientName)'
    break;
 case 'CHANGE_SERVICE_NAME':
    println 'Repetir condiciones de viabilidad'
    println 'Realizar la reserva de recursos. OJO con la casuistica cuando se conservan los recursos del servicio!!! ¿Hay que hacer traspaso?'
    println 'Si la caixa y puerto son distintos a los del servicio hay que mandar OT cobre. Serán el mismo en el 99% de los casos'
    println 'Continuar con la provision normal ¿Hay que dar de baja antes? SI'
    break;
 case 'CHANGE_ADDRESS':
    println 'Realizar la reserva de recursos. OJO con la casuistica cuando se conservan los recursos del servicio!!! ¿Hay que hacer traspaso?'
    println 'Si la caixa y puerto son distintos a los del servicio hay que mandar OT cobre. Serán el mismo en el 99% de los casos'
    println 'Continuar con la provision normal ¿Hay que dar de baja antes? SI'
    //Se intenta mantener el numero de telf si la caixa esta en rango
    attrMap['keep.service.name'] = true
    feasibility = inventoryUtils_checkFeasibilityStatus(technology, latitude, longitude, maxDistance, attrMap);
    break;
 case 'NONE':
    println 'Calling proceso cambio producto ADSL - Simplemente modificar la información de la AAA para cambiar el ancho de banda'
    break;   
} 