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

//def ws = getWorksheet(1)

def documentDSCE = buildWorkOrderDocument(false, "TEST", null, "Resultado dos testes realizados por empreiteiro")
def documentDSCE1 = buildWorkOrderDocument(false, "OSTIAS", null, "Resultado dos testes realizados por empreiteiro")


def json = new JsonBuilder()
    

def root = json {
    id 1
    workOrderDocuments ( [ documentDSCE, documentDSCE1])    
}

def found = root.workOrderDocuments.find{ doc -> doc.code == 'TEST'} 

println found


def Object getWorksheet(Integer worksheetId) {
    
    Logger logger = Logger.getLogger("Getting worksheet")
    
    def provisionApiUrl = "http://localhost:8080/provision-api/services/v1.0"
   
    def worksheetPath = "worksheets/${worksheetId}".toString() 
    
    logger.info("[PROVISION API CALL] url="+provisionApiUrl+"; path="+worksheetPath)
    
    def restClient = new RESTClient(provisionApiUrl)
    def response = restClient.get( path : worksheetPath,
        null,
        requestContentType : JSON)
    
    logger.info("[PROVISION API CALL] response status = " + response.status)

    assert response.status == 200
    def ws = response.data

}

def buildWorkOrderDocument(isInput, _code, _fileDescriptor, _documentDescription) {
    
    def json = new JsonBuilder()
    
    if(_fileDescriptor == null && isInput) {
        return null
    }
    
    def root = json {
        code _code
        description _documentDescription
        fileDescriptor _fileDescriptor
    }
    
    root
}