<%@page contentType="text/html" pageEncoding="UTF-8" 
		import="java.net.*, 
				java.io.*,
				java.util.*"%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.bonitasoft.engine.session.APISession"%>



<%
//JSPUtils JSP = new JSPUtils(request, session);
//String user = JSP.getSessionOrCookie("username", "");

APISession ses= (APISession)request.getSession().getAttribute("apiSession");

String user = ses.getUserName();
//


String typeResource = request.getParameter("type");
String appName = request.getParameter("appName");
String opcion = request.getParameter("opcion");
if(opcion==null)
	opcion="";

String id = request.getParameter("id");
String copyId = request.getParameter("copyId");
String resourceDetail = request.getParameter("resourceDetail");




/*
URI uri = new URI("file:///" +System.getProperty("ruta_properties") + "/igeo.properties");
File f = new File(uri);
out.println(f.getAbsolutePath());
out.println(f.exists());
*/

String a = System.getProperty("ruta_properties") + "/igeo.properties"; 
InputStream in = new FileInputStream(a);
Properties p = new Properties();  
p.load(in);

/*
Enumeration eProps = p.propertyNames();
while (eProps.hasMoreElements()) { 
    String key = (String) eProps.nextElement(); 
    String value = p.getProperty(key); 
    out.println(key + " => " + value + "<br/>"); 
}
*/

   
String protocol = p.getProperty("igeo."+appName+".config.server.public.protocol");
String host = p.getProperty("igeo."+appName+".config.server.public.host");
String port = p.getProperty("igeo."+appName+".config.server.public.port");
  
StringBuilder buff = new StringBuilder();
buff.append(protocol);
buff.append("://");
buff.append(host);
buff.append(":");
buff.append(port);
buff.append("/");
buff.append(appName);  
buff.append("/");
 

if( (opcion.equals("detail") || opcion.equals("full")) && id!=null && !id.equals("") && copyId!=null && !copyId.equals("")&& !resourceDetail.equals("")){
	buff.append("resources/dialogs/"+resourceDetail+"/edicion"); 
	buff.append("?opcion=detail&model=simple&method=showProc&id="+id+"&copyId="+copyId);
}else{
	String cabeceraMultiple = "";
	if(typeResource.equals("personasAmbiguas")){
		typeResource = "personas";
		cabeceraMultiple = "ok";
		
	}else if(typeResource.equals("personasAmbiguasJur")){
		typeResource = "personasJuridicas";
		cabeceraMultiple = "ok";
	}
	
	buff.append(typeResource); 
	if(opcion.equals("full"))
		opcion = "create";
	buff.append("?opcion="+opcion+"&cabeceraMultiple="+cabeceraMultiple+"&model=simple&dialog=listado&display=FULL&returnCopy=false&redirect_uri=");

	buff.append(protocol);
	buff.append("://");
	buff.append(host);
	buff.append(":");
	buff.append(port);
	buff.append("/");
	buff.append(appName);
	buff.append("/");
	buff.append("dialogs");
	buff.append("/");
	buff.append(typeResource);
	buff.append("/");
	buff.append("postMessage");
	buff.append("/");
}
buff.append("&ticket=" /*+ URLEncoder.encode( ticketSotileza,  "UTF-8")*/ );
//buff.append("&ticket=" + user );
	

/*
//Quitado porque ahora no se va a devolver una url. Se usarï¿½ postMessage
String typeResourceDest = request.getParameter("typeDest");
protocol = p.getProperty("igeo."+typeResourceDest+".config.server.public.protocol");
host = p.getProperty("igeo."+typeResourceDest+".config.server.public.host");
port = p.getProperty("igeo."+typeResourceDest+".config.server.public.port");
buff.append(protocol);
buff.append("://");
buff.append(host);
buff.append(":");
buff.append(port);
buff.append("/");
buff.append(typeResourceDest);  
buff.append("/");
buff.append("/expedientes/new");  
*/

//'http: / /ih-vm-stccatastro.c.mad.interhost.com:8080/terceros/'+tipo+'?dialog=listado&display=FULL&returnCopy=false&redirect_uri=
//http: / /ih-vm-stccatastro.c.mad.interhost.com:8080/catastro-web/expedientes/new
//response.setStatus(200);
response.sendRedirect(buff.toString()); 


%>
