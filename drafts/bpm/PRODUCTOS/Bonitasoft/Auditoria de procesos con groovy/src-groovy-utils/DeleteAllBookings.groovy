import groovy.json.JsonBuilder
@Grab(group='org.codehaus.groovy.modules.http-builder', module='http-builder', version='0.7.2' )
@Grab(group='org.apache.httpcomponents', module='httpclient', version='4.2.1' )
import groovyx.net.http.RESTClient
import groovy.json.*
import static groovyx.net.http.ContentType.*
import java.util.logging.Logger
import groovy.xml.*

def inventoryUrl = "http://localhost:9093/"
def inventoryPath= "inventory/booking"

println ("[deleteService] url="+inventoryUrl+"; path="+inventoryPath)

def restClient = new RESTClient(inventoryUrl)

def response

while(true) 
{
    response = restClient.get( path : inventoryPath,
    body : null,
    requestContentType : JSON)

    if (response.data == null || response.data.size == 0) {
        break;
    }

    println ("[listBookings] response status = " + response.status)

    assert response.status == 200

    response.data.each { booking ->
        deleteBooking(booking.name)
    }
} 



static boolean deleteBooking(String bookingId) {
    //def inventoryUrl = "http://localhost:9093/"
    def inventoryUrl = "http://localhost:9093/"
    def inventoryPath= "inventory/booking/${bookingId}"
    
    println ("[deleteService] url="+inventoryUrl+"; path="+inventoryPath)
    
    def restClient = new RESTClient(inventoryUrl)
    def response = restClient.delete( path : inventoryPath,
        body : null,
        requestContentType : JSON)

    println ("[deleteBooking] response status = " + response.status)
    
    assert response.status == 200

    true
}