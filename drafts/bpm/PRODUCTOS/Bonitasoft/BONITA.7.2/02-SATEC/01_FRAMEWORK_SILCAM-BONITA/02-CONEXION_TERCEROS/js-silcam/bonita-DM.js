var nombresCamposForm;
var nombresCamposTerceros;
var hiddenId;
//var divFormulario = "table.bonita_table_container";  // usado en bonita por defecto
var divFormulario = "div.bonita_div_container";  //usado en ih




//i.    Instancia = null (identifica el registro concreto de un derecho, esto es, id_instance)
//ii.   Nuevo = true (indica que el derecho puede ser creado de cero o no)
//iii.  Modifica = true (indica que se da la opción de modificar los datos antes de la incorporación al proceso)
//iv.   Tipo_derecho = valor (indica el tipo de derecho que se quiere incorporar al proceso)
//v.    Genera_copia = true (indica si se debe generar una copia que será la que se incorpore al expediente)
//vi.   Genera_version = false (indica si se debe generar una versión que será la que se incorpore al expediente)
//vii.  Denominacion_copia = Datos de solicitud (denominación de la copia para mostrar a nivel informativo al usuario)
function llamadaTercerosIframe(new_, edit_, typeTitle_, copy_, version_, denomination_, nombresCamposForm_, nombresCamposTerceros_, id_){
	nombresCamposForm = nombresCamposForm_;
	nombresCamposTerceros = nombresCamposTerceros_;
	hiddenId = id_;
		
	jQuery(divFormulario).hide();
	jQuery('#static_application').append('<iframe id="dialog_iframe" width="98%" style="border:0px;"/>');
		
	var id = jQuery('#' + id_ ).find('.bonita_form_field').val();
		
	jQuery('#dialog_iframe').attr('src', '/bonita/pages-silcam/controller-DM.jsp?id='+id+'&new='+new_+'&edit='+edit_+'&typeTitle='+typeTitle_+'&copy='+copy_+'&version='+version_+'&msj='+denomination_+'');
	

	jQuery('#dialog_iframe').load(function() {
		jQuery('#dialog_iframe', document).height( 1200 );
		jQuery('#app-layout', document).css({ "overflow-x": "hidden" });
	});

	var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
	var eventer = window[eventMethod];
	var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";

	eventer(messageEvent, returnCallback, false);
}



function returnCallback(e) {
	//nos cargamos el evento para que no se ejecute más veces
	var eventMethod = window.removeEventListener ? "removeEventListener" : "detachEvent";
	var eventer = window[eventMethod];
	var messageEvent = eventMethod == "detachEvent" ? "onmessage" : "message";

	eventer(messageEvent, returnCallback, false);
	
	
	var dato = e.data.split("/rest/");
	var dato2 = dato[1].split("/");
	
	
	//console.log( "dato de hijo: " + e.data);
	jQuery.getJSON(e.data , function(data) {
		var tam = nombresCamposForm.length;
		for (var i=0; i<tam; i++) {		
			var valor = "";
			if( nombresCamposTerceros[i].indexOf("->") != -1){
				valor = asignArrayData(data, nombresCamposTerceros[i]);
				
			}else if( nombresCamposTerceros[i].indexOf("+") != -1){
				valor = asignMultipleData(data, nombresCamposTerceros[i]);
				
			}else{
				valor = asignSimpleData(data, nombresCamposTerceros[i]);
			}
			jQuery('#' + nombresCamposForm[i] ).find('.bonita_form_field').val( valor );
		}
		jQuery('#' + hiddenId ).find('.bonita_form_field').val( asignSimpleData(data, "instanceId") );
	})
	.done(function() {
		//jQuery('#' + hiddenType ).find('.bonita_form_field').val( dato2[0] );

	})
	.fail(function() {


	});
	
    
    //jQuery('table.bonita_table_container').show();
	jQuery(divFormulario).show();
    jQuery("#dialog_iframe").remove();
    
}




function asignSimpleData( data, campo){
	var valor = eval ( "data."+ campo ) ;
	if (typeof(valor) === "undefined") 
		valor = "";
	
	return valor;
}




function asignMultipleData( data, campo){
	var campos = campo.split("+");
	var result = "";

	jQuery.each( campos, function( ind, value ) {
		var valor = eval ( "data."+ value ) ;
		if (typeof(valor) === "undefined") 
			valor = "";
		
		result  +=  valor + " "  ;
	});
	while (result && result.length && result.charAt(result.length - 1) == ' ') {
		result = result.substring(0, result.length - 1);
	}
	
	return result;
}




function asignArrayData( data, campo){
	var campos = campo.split("->");
	
	var valor = eval ( "data."+ campos[0] ) ;
	if (typeof(valor) === "undefined") {
		return "";
		
	}else{
		var result = "";
		jQuery.each( valor, function( ind, value ) {

			if( campos[1].indexOf("+") != -1){
				result += asignMultipleData(value, campos[1]) + ",";
			}else{
				result += asignSimpleData(value, campos[1]) + ",";
			}
			
		});
		while (result && result.length && result.charAt(result.length - 1) == ',') {
			result = result.substring(0, result.length - 1);
		}
		return result;		
	}
}







