var nombresCamposForm;
var nombresCamposTerceros;
var hiddenType;

function llamadaTercerosIframe(appName, resource, nombresCamposForm_, nombresCamposTerceros_, hiddenType_){
	nombresCamposForm = nombresCamposForm_;
	nombresCamposTerceros = nombresCamposTerceros_;
	hiddenType = hiddenType_;
	
	jQuery('div.bonita_div_container').hide();
	jQuery('#static_application').append('<iframe id="dialog_iframe" width="98%" style="border:0px;"/>');
	
	jQuery('#dialog_iframe').attr('src', '/bonita/pages-silcam/controller.jsp?appName='+appName+'&type='+resource);
	//jQuery('#pruebaiframe').attr('src', 'http://ih-vm-stccatastro.c.mad.interhost.com:8080/terceros/'+tipo+'?dialog=listado&display=FULL&returnCopy=false&redirect_uri=http://ih-vm-stccatastro.c.mad.interhost.com:8080/catastro-web/expedientes/new');


	jQuery('#dialog_iframe').load(function() {
		jQuery('#dialog_iframe', document).height( 700 );
		jQuery('#app-layout', document).css({ "overflow-x": "hidden" });
		//jQuery('#dialog_iframe', document).css({ "border": "0px" });
		
		//var altura2 = jQuery('iframe.redimensionate', parent.document).height();
		//jQuery('iframe.redimensionate', parent.document).height(altura+altura2);
	});
	
	
	/*var eventDeleteMethod = window.removeEventListener ? "removeEventListener" : "detachEvent";
	var eventerDelete = window[eventDeleteMethod];

	eventerDelete(eventMethod, eventer, false);
	*/
	
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
	if(jQuery('#' + hiddenType ))
		jQuery('#' + hiddenType ).find('.bonita_form_field').val( dato2[0] );
	
	
	
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
		
		//var altura = jQuery('body', document).height();
		//console.log("altura document: " + altura);
		//jQuery('iframe.redimensionate', parent.document).height(altura);
	})
	.done(function() {
			
	})
	.fail(function() {
			
	});
	
    
    //jQuery('table.bonita_table_container').show();
	jQuery('div.bonita_div_container').show();
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







