//FUNCION JQUERY PARA CARGAR UN COMPONENTE SELECT
//URL ES LA URL DEL SERVICIO REST QUE TIENE LA INFORMACION A CARGAR EN EL SELECT
//SELECT ES EL ID DEL CAMPO DE BONITA DE TIPO SELECT

//De momento comentar esto, para que sea más genérico, y pasarle la posicion de value y el nombre
//function cargarSelect (url, select){
//	$.getJSON(url, function(data) {
//		$.each( data, function(identificador , value) {
//			$(select).append('<option value="' + value.clave + '">' + value.nombre + '</option>'); 
//		});				 
//	})
//	.done(function() {
//		//alert( "También sirve para saber que funcionó" );
//		
//	})
//	.fail(function() {
//		//alert( "Ha ocurrido un error" );
//		error("No se han podido obtener los datos");
//	});
//}

//añadir dos parámetros que son el índice de value del select, y el índice del nombre dentro del json
function cargarSelect (url, select, valor, nombre){
	$.getJSON(url, function(data) {
		$.each( data, function(identificador, value) {
			$(select).append('<option value="' + value[valor] + '">' + value[nombre] + '</option>'); 
		});				 
	})
	.done(function() {
		//alert( "También sirve para saber que funcionó" );
		
	})
	.fail(function() {
		//alert( "Ha ocurrido un error" );
		error("No se han podido obtener los datos");
	});
}

//	function cargarSelect (url, select, valor, nombre){
//		var xhr = new XMLHttpRequest();
//		xhr.open("GET", url, true);
//		xhr.withCredentials = true
//		xhr.onreadystatechange = function() {
//		  if (xhr.readyState == 4) {
//		    var resp = JSON.parse(xhr.responseText);
//			    $.each( resp, function(identificador, value) {
//					$(select).append('<option value="' + value[valor] + '">' + value[nombre] + '</option>'); 
//				});	
//		  }
//		}
//		xhr.send();	
//	}


//FUNCION JQUERY PARA CONTROLAR EL PANEL Y SUS PESTAÑAS
/*
$('#tabs a').click(function (e) {
	e.preventDefault();
	$(this).tab('show');
});
*/

//FUNCION QUE MUESTRA EL DIV DE RETROALIMENTACION DE CARGANDO
function loading(){
	var alto=$(window).height();
	
	//le damos el alto, le ponemos centrado y encima del resto
    $("#loading").css({"height":alto+"px","top":"0px", "z-index":"1"}); 

    //esta sera la capa que esta dento de la capa que muestra un gif 
    $("#loading-content").css({"margin-top":(alto/2)-30+"px"}); 

	$("#loading").css("display", "");
}


//FUNCION QUE OCULTA EL DIV DE RETROALIMENTACION DE CARGANDO
function cancel_loading(){
	$("#loading").css("display", "none");
}



