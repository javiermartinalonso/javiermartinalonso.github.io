//Obtiene el valor del campo
function valorCampo(id_campo) {
	var valor_campo = "";
	

	//Si es un checkbox
	if ($('#'+ id_campo + ' input[type="checkbox"]').length)
	{
		valor_campo = $('#'+ id_campo + ' input[type="checkbox"]').is(':checked');
	}
	//Si es un select
	else if ($('#'+ id_campo + ' Select').length)
		{
			valor_campo = $('#'+ id_campo + ' Select').val();
		}
		//Si es un inputText
		else if ($('#'+ id_campo + ' input[type="text"]').length)
			{
				valor_campo = $('#'+ id_campo + ' input[type="text"]').val();
			}
			//Si es un campo oculto
			else if ($('#'+ id_campo + ' input[type="hidden"]').length)
				{
					valor_campo = $('#'+ id_campo + ' input[type="hidden"]').val();
				}
				else{
					console.log("Field: "+id_campo+" has no correct type");
					alert("tipo de campo no contemplado");
				}
			
		
	return valor_campo;
 }
	
	 

// Obtiene la lista de los campos de la pestaña pasada como parametro
function listaCamposPanel(panel)
{
	//lista vacia
	var lista_campos = [];
	
	//Selecciono todos los campos de la pestaña, incluso los ocultos
	$(panel).find('.bonita_form_entry').each(function(idx, campo) {
		lista_campos[lista_campos.length] = $(campo).attr('id');
	});
	
	return lista_campos;
}



function formateaMensajeError(mensaje)
{    	 
	var pos_ini = mensaje.indexOf(',"message":"') + 12;
	mensaje = mensaje.substring(pos_ini, mensaje.length);
	var pos_fin = mensaje.indexOf('"');
	mensaje = mensaje.substring(0, pos_fin);
        	 	
	return mensaje;
}

/**
* Registra un evento para mostrar el aspa que borra el campo en caso de que se haya elegido un elemento en 
* la aplicacion terceros
**/
function showDeleteButton(element){
	var name = element.attr('id');	
	var input =  element.find('.bonita_form_field');	
	$(input).unbind();	
	$(input).bind("change",function(event){		
		var botonBorrar = $("#"+name+"BotonBorrar")
		
		if($(input).val().length>0 && $(botonBorrar).hasClass('invisible')){
			$(botonBorrar).toggleClass('invisible');
		}
	});	
}

function getValueOf(idElement){
	return $("#"+idElement).find('.bonita_form_field').val();
}