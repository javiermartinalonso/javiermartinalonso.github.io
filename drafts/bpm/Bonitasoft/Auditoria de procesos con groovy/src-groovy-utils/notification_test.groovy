import groovyx.net.http.RESTClient
import static groovyx.net.http.ContentType.*
import java.util.logging.Logger
import com.angolatelecom.provision.bonita.utils.ProvisionHome


Logger logger = Logger.getLogger("DEBUG - PRC")

def notificationApiUrl = ProvisionHome.getProperty(ProvisionHome.NOTIFICATION_API_URL);
def app_id = 'bonita'
def templateId = 'eml49'


def toList = ['domingos.paulino@angolatelecom.com']


//Obtenemos los correos de los miembros del grupo CCE-SuporteComercial
def group = apiAccessor.getIdentityAPI().getGroupByPath("/CCE/CCE-SuporteComercial");
if (group != null) {
	apiAccessor.getIdentityAPI().getUserMembershipsByGroup(group.getId(), 0, Integer.MAX_VALUE).each {

		def email = apiAccessor.getIdentityAPI().getUserWithProfessionalDetails(it.getUserId())?.getContactData()?.getEmail();

		if(email?.trim()){
			toList.push(email)
		}

	}
}
		
def ws = ProvisionAPICalls.getWorksheet(worksheetId)

	
def msgData = [
	subject : '',
	to: toList.join(', ')
	,
	values: [
		ID_FOLHA_FORMAT : ws.worksheetCodeNumber
	],
	/*
	attachments:''*/
]

def notifRest = new RESTClient(notificationApiUrl)

try { 
	def response = notifRest.post( path : 'email/'+app_id+'/'+templateId,

		body : msgData,

		requestContentType : JSON

	)

	def resultStatus = response.status

	println "[notifyEndFeasibily] status = ${resultStatus};"
} catch (all) {
	println "[notifyEndFeasibily] error sending notificatio status = ${resultStatus};"
}

