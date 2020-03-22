//NECESIDADES DE SILCAM PARA PODER LLAMAR AL API REST DE BONITA
//http://community.bonitasoft.com/answers/cors-preflight-issues-firefox-and-chrome
//http://community.bonitasoft.com/answers/cors-ajax-bonita-rest-ap-and-tomcat7
//http://www.lm-tech.it/Blog/post/2013/05/08/How-to-consume-a-RESTful-service-using-jQuery.aspx


//OBTIENE A TRAVES DEL MOTOR DE BONITA POR UNA PETICION REST EL TIPO DE DATO DE LA VARIABLE	
function tipoVariable (url_motor_bonita, id_proceso, id_variable){

	var tipo = "java.lang.String";
	//http://localhost:8080/bonita/API/bpm/caseVariable?p=0&c=10&f=case_id%3d2005
	//http://localhost:8083/bonita/API/bpm/caseVariable/18/provincia_tit
	var url = url_motor_bonita + "/API/bpm/caseVariable/" + id_proceso + "/"+ id_variable;

	var errores = "";
	
	$.getJSON(url, function(data) {
			tipo = data.type;	
	})
	.done(function(json) {
		//alert( "También sirve para saber que funcionó" );
		//return tipo;
	})
	.fail(function(jqXHR, status, errorThrown) {
        var mensaje = formateaMensajeError(jqXHR.responseText);
        errores = errores + '<br>' + "Error al intentar guardar: '" + mensaje + "'" ;
        error(errores);
        cancel_loading();
	});
	
	return tipo; 
}




//La url debe ser la misma con la que se llama al portal, no nos vale localhost en los servidores
function SaveData(url_motor_bonita, id_proceso, nombre_variable, valor_variable, tipo_campo) {

	var errores = "";

	//http://documentation.bonitasoft.com/web-rest-api-examples#set_variables
	//{id: id_proceso +"/nombre",name:"nombre",type:"java.lang.String",value:"nuevo nombre"} 
	
	//CONVERSION A STRING NECESARIA
	valor_variable = ""+valor_variable;
	nombre_variable= ""+nombre_variable;
	id = id_proceso + '/nombre';
	tipo_campo = tipo_campo;
	
     var variable = {
         'id': id,
         'name': nombre_variable,
         'type': tipo_campo,
         'value': valor_variable
     };

     
    // var str_url = "http://ih-vm-stccatastro.c.mad.interhost.com:8090/bonita/API/bpm/caseVariable/" + id_proceso + "/" + nombre_variable;
    // var str_url = "http://localhost:8090/bonita/API/bpm/caseVariable/" + id_proceso + "/" + nombre_variable;
     var str_url = url_motor_bonita+ "/API/bpm/caseVariable/" + id_proceso + "/" + nombre_variable;
       
     
     //http://www.bennadel.com/blog/2327-cross-origin-resource-sharing-cors-ajax-requests-between-jquery-and-node-js.htm
     //http://stackoverflow.com/questions/6114436/access-control-allow-origin-error-sending-a-jquery-post-to-google-apis
     //http://api.jquery.com/jquery.ajax/
	 //http://coenraets.org/blog/2011/12/restful-services-with-jquery-and-java-using-jax-rs-and-jersey/
	            
     //http://coenraets.org/blog/2011/12/restful-services-with-jquery-and-java-using-jax-rs-and-jersey/
     //http://www.topwcftutorials.net/2014/02/post-json-to-wcf-restful-service.html
     
     
     errores = peticion_rest_modificar(str_url, variable, "PUT") ;

     return errores;
 }	


// hace una peticion rest de tipo POST/ PUT depende lo que indiques
function peticion_rest_modificar(str_url, variable, tipo_llamada) {

	var errores = "";
	
     $.ajax({
         type: tipo_llamada,
         url: str_url,
         data: JSON.stringify(variable),
         crossDomain: true,
        // dataType: 'json', //Provoca errores al devolver los datos
         contentType: "application/json; charset=utf-8",
         processData: true,
         async: false,
         success: function (data, status, jqXHR) {
            //alert("success… data '" + data + "' status '" + status + "' jqXHR '" + jqXHR + "'");

         },
         error: function(jqXHR, status, errorThrown){
        	 var mensaje = formateaMensajeError(jqXHR.responseText);
        	 errores = errores + '<br>' + "Error al intentar guardar: '" + mensaje + "'" ;
        	 cancel_loading();
         }
     });
     
     
     return errores;
}

 
 //CONFIGURAMOS LAS LLAMADAS REST PARA QUE MUESTREN UN DIV DE LOADING CUANDO SE ESTÉ EJECUTANDO UNA LLAMADA REST
 //SI NO QUEREMEOS QUE SE MUESTRE deberemos establecer la opción global a false--> global : false
 jQuery.ajaxSetup({
    beforeSend: function() {
		loading();
	},
	complete: function(){
		setTimeout ("cancel_loading();", 100);
		//cancel_loading();
	},
	success: function() {}
});    


//Esta función recibe como parámetro una lista con las variables 
//del formulario que queremos actualizar.
//debe coincidir el nombre del campo con el nombre de la variable.
//No es atómica, actualiza las variables de una en una, 
//de modo que puede actualizar el resto de variables aunque una falle.

//La url debe ser la misma con la que se llama al portal, no nos vale localhost en los servidores
function saveListData(url_motor_bonita, id_tarea, lista_variables, lista_hiddens) {
	//Activamos el icono de cargando
	//loading();
	
	var errores = "";
	var lista_json_variables = "";
	 
	
	var i = 0;
	num_elementos = lista_variables.length;

	//recorro la lista de variables
	for(i=0;i<( num_elementos -1);i++){
	
		//monto la cadena de variables
		//{"variables": [{"name": "requerente", "value": "Pepe"},{"name": "representante", "value": "Javi"},{"name": "area_ha", "value": 23}]}
		lista_json_variables = lista_json_variables + '{"name": "' + lista_variables[i] + '", "value": "' + valorCampo(lista_hiddens[i]) + '"},';
	}
	
	if (num_elementos > 0)
	{
		//monto la ultima variable
		lista_json_variables = lista_json_variables + '{"name": "' + lista_variables[i] + '", "value": "' + valorCampo(lista_hiddens[i]) + '"}';	
	}
	console.log('Lista')
	
     var variable = { 
		 "variables": "["+lista_json_variables+"]"
     };
     
    // var str_url = "http://localhost:8090/bonita/API/bpm/task/500002"
     var str_url = url_motor_bonita+ "/API/bpm/task/" + id_tarea;

     errores = peticion_rest_modificar(str_url, variable, "PUT") ;
        
	//REVISAR EL CONTROL DE ERRORES AL GUARDAR LOS DATOS
	if (errores != "") {
		var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
       	 error(mensaje);
       	errores = "";
	} 
	else { 
        ok();
	}
	
	//Desactivamos el icono de cargando
	//cancel_loading();
	//setTimeout ("cancel_loading();", 100); 	
 }	
 

 function saveVariablesOnBonita(url_motor_bonita, id_tarea, lista_variables, lista_hiddens){
 	var errores = "";
	var lista_json_variables = "";
	 
	console.log('variables list '+lista_variables);
	var i = 0;
	num_elementos = lista_variables.length;

	//recorro la lista de variables
	for(i=0;i<( num_elementos -1);i++){
	
		console.log('value of '+lista_variables[i]+' '+getValueOf(lista_hiddens[i]));
		
		lista_json_variables = lista_json_variables + '{"name": "' + lista_variables[i] + '", "value": "' + getValueOf(lista_hiddens[i]) + '"},';
	}
	
	if (num_elementos > 0)
	{
		//monto la ultima variable
		lista_json_variables = lista_json_variables + '{"name": "' + lista_variables[i] + '", "value": "' + getValueOf(lista_hiddens[i]) + '"}';	
	}
	console.log('Lista')
	
     var variable = { 
		 "variables": "["+lista_json_variables+"]"
     };
     
    // var str_url = "http://localhost:8090/bonita/API/bpm/task/500002"
     var str_url = url_motor_bonita+ "/API/bpm/task/" + id_tarea;

     errores = peticion_rest_modificar(str_url, variable, "PUT") ;
        
	//REVISAR EL CONTROL DE ERRORES AL GUARDAR LOS DATOS
	if (errores != "") {
		var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
       	 error(mensaje);
       	errores = "";
	} 
	else { 
        ok();
	}
 }
  
//Esta función recibe como parámetro el id del div que contiene todos los campos 
//del formulario que queremos actualizar.
//debe coincidir el nombre del campo con el nombre de la variable.
//No es atómica, actualiza las variables de una en una, 
//de modo que puede actualizar el resto de variables aunque una falle.
 
 // Guarda los campos de la pestaña en el motor de bonita
function guardarPanel(url_motor_bonita, id_proceso, panel)
{


	//Activamos el icono de cargando
	//loading();
	
	//Control de errores				
	var errores = "";
				
	//Selecciono todos los campos de la pestaña, incluso los ocultos
	$(panel).find('.bonita_form_entry').each(function(idx, campo) {
    		
	    //información necesaria del campo
	   	id_campo = $(campo).attr("id");
	    var valor_campo = "";
		var tipo_campo = 'java.lang.String';
				
		//Marcamos las peticiones ajax como sincronas
		$.ajaxSetup({
			async: false
		});
   		
		tipo_campo = tipoVariable (url_motor_bonita, id_proceso, id_campo);

		valor_campo = valorCampo(id_campo);
				
		//http://localhost:8080/bonita/API/bpm/caseVariable/3/variableText
		errores = errores + SaveData(url_motor_bonita, id_proceso, id_campo, valor_campo, tipo_campo);
		
		// Volvemos a dejar las llamadas AJAX asíncronas
		$.ajaxSetup({
			async: true
		});
		
	});
	
	//Desactivamos el icono de cargando
	//cancel_loading();
	//setTimeout ("cancel_loading();", 100); 
	
	//REVISAR EL CONTROL DE ERRORES AL GUARDAR LOS DATOS
	if (errores != "") {
		var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
       	 error(mensaje);
       	errores = "";
	} 
	else { 
        ok();
	}
}

//Esta función recibe como parámetros la lista de variables que queremos actualizar.
//debe coincidir el nombre del campo con el nombre de la variable.
//No es atómica, actualiza las variables de una en una, 
//de modo que puede actualizar el resto de variables aunque una falle.	
//Actualiza la lista de variables de bonita, con el contenido de la lista de campos del formulario
function actualizaVariables(url_motor_bonita, id_proceso, id_campos)
{
    //Activamos el icono de cargando
	//loading();

	//Control de errores				
	var errores = "";
					
	for(i=0;i<id_campos.length;i++){
		
		//información necesaria del campo
		id_campo = id_campos[i];
		var valor_campo = "";// = $('#'+id_campos[i]).find('.bonita_form_field').val();
		var tipo_campo = 'java.lang.String';
					
		//Marcamos las peticiones ajax como sincronas
		$.ajaxSetup({
			async: false
		});
			
		tipo_campo = tipoVariable (url_motor_bonita, id_proceso, id_campo);

		valor_campo = valorCampo(id_campos[i]);
		
		//http://localhost:8080/bonita/API/bpm/caseVariable/3/variableText
		errores = errores + SaveData(url_motor_bonita, id_proceso, id_campo, valor_campo, tipo_campo);
		
		// Volvemos a dejar las llamadas AJAX asíncronas
		$.ajaxSetup({
			async: true
		});
	}

	//REVISAR EL CONTROL DE ERRORES AL GUARDAR LOS DATOS
	if (errores != "") {
		var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
       	 error(mensaje);
       	errores = "";
	} 
	else { 
        ok();
	}
	
	
	//Desactivamos el icono de cargando
	//cancel_loading();
	//setTimeout ("cancel_loading();", 100); 
};


//Esta función recibe como parámetros la lista de variables que queremos actualizar
// y la lista de campos del formulario que contiene el valor correspondiente 
//a cada variable de la lista anterior. 
//De este modo podemos realizar el mapeo independientemente del nombre 
//de cada campo del formulario.
//No es atómica, actualiza las variables de una en una, 
//de modo que puede actualizar el resto de variables aunque una falle.

//Actualiza la lista de variables de bonita, con el contenido de la lista de campos del formulario
function actualizaVariablesIndicandoCampos(url_motor_bonita, id_proceso, lista_variables, lista_campos)
{
    //Activamos el icono de cargando
	//loading();

	//Control de errores				
	var errores = "";
					
	for(i=0;i<lista_campos.length;i++){
		
		//información necesaria del campo
		id_variable = lista_variables[i];
		id_campo = lista_campos[i];
		var valor_campo = "";
		var tipo_campo = 'java.lang.String';
					
		//Marcamos las peticiones ajax como sincronas
		$.ajaxSetup({
			async: false
		});
			
		tipo_campo = tipoVariable (url_motor_bonita, id_proceso, id_variable);
	
		valor_campo = valorCampo(id_campo);
		
		errores = errores + SaveData(url_motor_bonita, id_proceso, id_variable, valor_campo, tipo_campo);
		
		// Volvemos a dejar las llamadas AJAX asíncronas
		$.ajaxSetup({
			async: true
		});
	}


	//REVISAR EL CONTROL DE ERRORES AL GUARDAR LOS DATOS
	if (errores != "") {
		var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
       	 error(mensaje);
       	errores = "";
	} 
	else { 
        ok();
	}
	
	
	//Desactivamos el icono de cargando
	//cancel_loading();
	//setTimeout ("cancel_loading();", 100); 
};	
 		
function SaveDataBonita(nombre_variable, valor_variable, tipo_campo) {

	var errores = "";
	
	//CONVERSION A STRING NECESARIA
	var id_proceso = $(".pid").val();
	var url_motor_bonita = $(".motor_bonita").val();
	valor_variable = ""+valor_variable;
	nombre_variable= ""+nombre_variable;
	var id = id_proceso+"/"+nombre_variable;
	tipo_campo = tipo_campo;
	
     var variable = {
         'id': id,
         'name': nombre_variable,
         'type': tipo_campo,
         'value': valor_variable
     };

     
     var str_url = url_motor_bonita + "/API/bpm/caseVariable/" + id_proceso + "/" + nombre_variable;
     
     
     errores = peticion_rest_modificar(str_url, variable, "PUT") ;

     return errores;
 }	
 
 
 
 
 
 function saveVariablesOnBonitaTransmision(url_motor_bonita, id_tarea, lista_variables, lista_hiddens){
 	var errores = "";
	var json = " ";
	 
	for(var i=0;i<lista_variables.length;i++){
		var campo = lista_variables[i];
		var valor = $("#"+lista_hiddens[i]).find('.bonita_form_field').val();
		console.log('value of '+campo+' '+valor);
		
		if( campo.indexOf("*") != -1){//arrays 
			if(valor.trim() == ""){
				json = json + '{"name": "' + campo.replace("*", "") + '", "value": []},';
			}else{
				var aux = ('"' + valor.trim().replace(/,/g, "\",\"") + '"').replace(/"null"/g, "\"\"").replace(/"",/g, "").replace(/,""/g, "");
				json = json + '{"name": "' + campo.replace("*", "") + '", "value": [' + aux + ']},';
			}
		}else if( campo.indexOf("(int)") != -1){//enteros
			json = json + '{"name": "' + campo.replace("(int)", "") + '", "value": ' + valor + '},';
			
		}else if( campo.indexOf("(dec)") != -1){//doubles
			json = json + '{"name": "' + campo.replace("(dec)", "") + '", "value": ' + valor + '},';
			
		}else{//resto
			json = json + '{"name": "' + campo + '", "value": "' + valor + '"},';
		}
	}
	json = json.substring(0, json.length - 1);
	console.log('Lista: ' + json)
	
     var variable = { 
		 "variables": "["+json+"]"
     };
     
     var str_url = url_motor_bonita+ "/API/bpm/task/" + id_tarea;
     errores = peticion_rest_modificar(str_url, variable, "PUT") ;

	if (errores != "") {
		var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
       	 error(mensaje);
       	errores = "";
	}
 }


//actualiza variables de bonita sin pasar de tarea
//tiene en cuenta el tipo de las variables
//en el array de los nombres de las variables (el parámetro lista_variables), se añade al final su tipo (int) para entero, (dec) para decimal, (json) para json y * para listas

function consolidarDatosDeBonita(url_motor_bonita, id_tarea, lista_variables, lista_hiddens){
     var errores = "";
    var json = " ";
     
    for(var i=0;i<lista_variables.length;i++){
        var campo = lista_variables[i];
        var valor = $("#"+lista_hiddens[i]).find('.bonita_form_field').val();
        console.log('value of '+campo+' '+valor);
        
        if( campo.indexOf("*") != -1){//arrays 
            if(valor.trim() == ""){
                json = json + '{"name": "' + campo.replace("*", "") + '", "value": []},';
            }else{
                json = json + '{"name": "' + campo.replace("*", "") + '", "value": ["' + valor.trim().replace(/,/g, "\",\"") + '"]},';
            }
        }else if( campo.indexOf("(int)") != -1){//enteros
            json = json + '{"name": "' + campo.replace("(int)", "") + '", "value": ' + valor + '},';
            
        }else if( campo.indexOf("(json)") != -1){//json
            json = json + '{"name": "' + campo.replace("(json)", "") + '", "value": "' + valor.replace(/"/g, "") + '"},';    
            
        }else if( campo.indexOf("(dec)") != -1){//doubles
            json = json + '{"name": "' + campo.replace("(dec)", "") + '", "value": ' + valor + '},';
            
        }else{//resto
            json = json + '{"name": "' + campo + '", "value": "' + valor + '"},';
        }
    }
    json = json.substring(0, json.length - 1);
    console.log('Lista: ' + json)
    
     var variable = { 
         "variables": "["+json+"]"
     };
     
     var str_url = url_motor_bonita+ "/API/bpm/task/" + id_tarea;
     errores = peticion_rest_modificar(str_url, variable, "PUT") ;

    if (errores != "") {
        var mensaje = "Se han producido errores al guardar los datos:<br>" + errores;
            error(mensaje);
           errores = "";
    }
 }