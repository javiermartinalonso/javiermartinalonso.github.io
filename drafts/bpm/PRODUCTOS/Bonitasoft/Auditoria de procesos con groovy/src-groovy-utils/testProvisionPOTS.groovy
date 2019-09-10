import groovy.json.JsonBuilder
@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.2' )
@Grab(group='org.apache.httpcomponents', module='httpclient', version='4.2.1' )
import groovyx.net.http.RESTClient
import groovy.json.*
import static groovyx.net.http.ContentType.*
import java.util.logging.Logger
import groovy.xml.*
import java.net.URLEncoder


def products = [
	//[productId : '30002102', productName :	'Residencial - Servicio - Voz'],
	[productId : '30002100', productName :	'Residencial - SuperNet ADSL - 4M/512 Kbps'],
	[productId : '30002099', productName :	'Residencial - SuperNet ADSL - 2M/512 Kbps'],
	[productId : '30002098', productName :	'Residencial - SuperNet ADSL - 1M/256 Kbps'],
	[productId : '30002097', productName :	'Residencial - SuperNet ADSL - 512/128 Kbps'],
	[productId : '30002096', productName :	'Residencial - SuperNet ADSL - 256/128 Kbps'],
	[productId : '30002042', productName :	'Residencial - Fale NAVEGUE - ADSL - 4 Mbps'],
	[productId : '30002041', productName :	'Residencial - Fale NAVEGUE 1 - ADSL - 2 Mbps'],
	[productId : '30002040', productName :	'Residencial - Fale NAVEGUE - ADSL - 1 Mbps'],
	[productId : '30002039', productName :	'Residencial - Fale NAVEGUE - ADSL - 512 Kbps']
]

def random = new Random()

def product = products[random.nextInt(products.size())]

println product


def mockCRMUrl = 'http://vms-cvasigsvi163.gestao.sigo.angolatelecom.ao:8280/mock-crm/' 


def restMockCRMClient 
def response
def json 


restMockCRMClient = new RESTClient(mockCRMUrl)


json = new JsonBuilder()

json {
    customerId  'INAC'
    customerName  'Instituto Nacional Da Criança'
	productId  product.productId
	productName  product.productName
    technology  'ADSL'
    serviceDescriptionAttributes  {
        'service.description'  "ADSL for the children"
        'worksheet.priority'  "HIGH"
        'worksheet.action'  "NEW"
        'contract.type'  "POSTPAID"
        'client.name'   "Instituto Nacional Da Criança"
		'client.shortName'  "INAC"
		'client.address.line1'  "Rua Ngola Mbandi"
		'client.address.suburb'   "Lunda Sul"
		'client.address.city'   "Luanda"
		'client.address.stateProviceRegion'   "Luanda"
		'contact.name'   "Macario Do Santos"
		'contact.phone_number'   "222345678"
		'contact.email'   "macarion2santos@banco.ao"
		'pservice.id'   "0e756ca1-d367-4d33-9ed6-4a1dd995a0a6"
    }
}


try {
	response = restMockCRMClient.post( path : 'sim/feasibility',
	    body : json.toPrettyString(),
	    requestContentType : JSON)

	assert response.status == 200

	println response.data
} catch (all) {
	println 'Error sending feasibility request'
}
