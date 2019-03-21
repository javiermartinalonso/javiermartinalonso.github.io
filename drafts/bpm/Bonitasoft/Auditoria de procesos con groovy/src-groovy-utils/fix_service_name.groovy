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




def provisionApiUrl = 'http://srv-bprosigossbpm.sigo.angolatelecom.ao/provision-api/services/v1.0/'
//'http://sigobpm-des.c.mad.interhost.com:8280/provision-api/services/v1.0/'


def provisionApi = new RESTClient( provisionApiUrl )


def worksheetIds = []
/*[
1868450,
1868453,
1868455,
1868515,
1868538,
1868366,
1868412,
1868423,
1868436,
1868440,
1868731,
1868733,
1868737,
1868739,
1868744,
1868747,
1868761,
1868786,
1868792,
1868793,
1868797,
1868799,
1868804,
1868805,
1868806,
1868818,
1868819,
1868590,
1868611,
1868627,
1868630,
1868634,
1868685,
1868688,
1868707,
1868708,
1868201,
1868142,
1868336,
1868325,
1868328,
1868331,
1868236,
1868265,
1868232,
1868111,
1868131,
1868133,
1868134,
1868136,
1868074,
1868078,
1868102,
1868103,
1900587,
1900588,
1900589,
1900592,
1900594,
1900596,
1900597,
1900598,
1868912,
1868913,
1868915,
1868926,
1868928,
1868931,
1868894,
1868896,
1868898,
1868906,
1868907,
1900624
] 
*/
worksheetIds.each {

	def worksheetId = it

	println "[generate_assinatura_cliente] Generating 'AssinaturaCliente.PDF' for worksheet: " + worksheetId
	def postResponse = provisionApi.post( path : 'worksheets/' + worksheetId + '/implementationDetails'
									, body : [ ]
									, requestContentType : JSON );


	println postResponse.data.worksheetCodeNumber
}