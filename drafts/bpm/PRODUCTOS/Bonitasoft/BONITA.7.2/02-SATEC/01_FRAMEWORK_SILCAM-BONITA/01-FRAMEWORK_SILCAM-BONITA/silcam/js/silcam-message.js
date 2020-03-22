//http://blog.reaccionestudio.com/alertify-alertas-y-notificaciones-con-jquery-en-espanol/
//http://www.brygom.com/jquery-4-alternativas-para-mostrar-mensajes-de-alerta/
//http://www.anieto2k.com/2008/12/31/jquery-alert-dialogs-reemplazo-para-alert-prompt-y-confirm/
//http://goodybag.github.io/bootstrap-notify/
function error(mensaje){
    //una notificación de error
  alertify.error(mensaje); 
  return false; 
}

function notificacion(){
    //una notificación normal
  alertify.log("Se ha producido un error guardando los datos."); 
  return false;
}
           
function ok(){
        //una notificación correcta
      alertify.success("Se han guardado los datos correctamente."); 
      return false;
}

function formateaMensajeError(mensaje)
{    	 
	var pos_ini = mensaje.indexOf(',"message":"') + 12;
	mensaje = mensaje.substring(pos_ini, mensaje.length);
	var pos_fin = mensaje.indexOf('"');
	mensaje = mensaje.substring(0, pos_fin);
        	 	
	return mensaje;
}