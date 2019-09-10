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


String id_ = request.getParameter("id");
String new_ = request.getParameter("new");
String edit_ = request.getParameter("edit");
String typeTitle_ = request.getParameter("typeTitle");
String copy_ = request.getParameter("copy");
String version_ = request.getParameter("version");
String msj_ = request.getParameter("msj");


String a = System.getProperty("ruta_properties") + "/igeo.properties"; 
InputStream in = new FileInputStream(a);
Properties p = new Properties();  
p.load(in);

   
String protocol = p.getProperty("igeo.terceros.config.server.public.protocol");
String host = p.getProperty("igeo.terceros.config.server.public.host");
String port = p.getProperty("igeo.terceros.config.server.public.port");
  
  
StringBuilder buff = new StringBuilder();
buff.append(protocol);
buff.append("://");
buff.append(host);
buff.append(":");
buff.append(port);
buff.append("/terceros/resources/dialogs/titleDM/");

if(id_ !=null && !id_.equals(""))
	buff.append("edicion"); 
else
	buff.append("listado"); 
	

buff.append("?id="+id_+"&new="+new_+"&edit="+edit_+"&typeTitle="+typeTitle_+"&copy="+copy_+"&version="+version_+"&msj="+URLEncoder.encode(msj_, "ISO-8859-1")+"");

buff.append("&ticket="  /* + URLEncoder.encode( ticketSotileza,  "UTF-8") */ );
	
response.sendRedirect(buff.toString()); 


%>
