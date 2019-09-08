<%@page contentType="text/html" pageEncoding="UTF-8" 
		import="java.net.*, 
				java.io.*,
				java.util.*,
				es.satec.sotileza.commons.authorization.*"%>

<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.commons.lang3.StringEscapeUtils"%>
<%@page import="org.bonitasoft.console.common.server.jsp.JSPUtils"%>

<%
JSPUtils JSP = new JSPUtils(request, session);
String user = JSP.getSessionOrCookie("username", "");

CredencialesUsuario credencialesSotileza= new CredencialesUsuario(user,"pass");
String ticketSotileza=GeneradorTickets.getInstance().construirTicket(credencialesSotileza);


String typeResource = request.getParameter("type");
String appName = request.getParameter("appName");

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
buff.append(typeResource);  
buff.append("?model=simple&dialog=listado&display=FULL&returnCopy=false&redirect_uri=");
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
buff.append("&ticket=" + URLEncoder.encode( ticketSotileza,  "UTF-8") );
	

/*
//Quitado porque ahora no se va a devolver una url. Se usar� postMessage
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
