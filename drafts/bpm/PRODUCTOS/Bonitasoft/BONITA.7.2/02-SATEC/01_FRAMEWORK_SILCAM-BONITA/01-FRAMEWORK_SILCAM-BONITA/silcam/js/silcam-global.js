//SE EJECUTA UNA VEZ SE HAN CARGADO TODOS OS COMPONENTES DE LA PAGINA
$(window).load(function(){  

	//RESETEO EL IFRAME DE BONITA
	
	
	//ADAPTAMOS LA PANTALLA DE LICENCIAMIENTO A UN TAMAÑO COHERENTE CON EL NUEVO CONTENIDO
	var footerpusher = $('#footerpusher');
	alert(footerpusher.length);
	alert(footerpusher.offset().top);
	//CALCULO EL ALTO DE LA PAGINA	
	var altura = footerpusher.offset().top;
	
	jQuery('#iframe_bonita_new', parent.document).height(altura);
}); 

//ADAPTAMOS LA PANTALLA DE LICENCIAMIENTO A UN TAMAÑO COHERENTE CON EL NUEVO CONTENIDO
function redimensionar(){
	alert("redimensionar");
};

//Función para agregar a los botones de volver
function volver(){
parent.parent.window.postMessage('removetheiframe','*');
parent.window.postMessage('removetheiframe','*');
}
