//FUNCION QUE ACTIVA LA PESTAÑA DEL PANEL QUE NO HA PASADO LA VALIDACION
function validarPanel(){
       //Activamos el icono de cargando
       //loading();

       var tab_id = '';                               
       var parar = false;
       
       jQuery.each($('.tab-pane'), function(i, tab){
             
             if (parar)
             {
                    parar = false;
                    return false;
             }
                                                            
             tab_id = "#" + $(tab).attr('id');
                                        
                                        
             //alert(tab_id);
                                               
             var aux = tab_id + ' .bonita_form_mandatory';
             jQuery.each($(aux), function(j, campo_obligatorio)
             {
                    var texto = $(campo_obligatorio).text();
                    
                                  //alert(texto);
                                  
                    if (texto == "Requerido")
                    {
                                  //BUSCAMOS POR HREF
                                  var cadena = "a[href='" + tab_id + "']";
                                  //alert(cadena);
                        $(cadena).tab('show');
                                  //$(cadena).trigger();            
                                  //$(cadena).click();                                        
                                  //alert("4");
                                                            
                                  //BUSCAMOS DENTRO DEL UL !!!CUIDADO CON EL ID EL QUE ESTAMOS EN CURSO
                                  //cadena = '#' + id_panel + ' li:eq(' + parseInt(i) + ') a';
                                  //alert(cadena);
                                  //$(cadena).tab('show'); // Select third tab (0-indexed)
                                  //alert("5");                                               
                                  
                                  //$('#tabs li a[href="#tab_pedido"]').tab('show');  // Select tab by name
                                  //$('#tabs a:first').tab('show'); // Select first tab
                                  //$('#tabs a:last').tab('show'); // Select last tab
                                  //$('#tabs li:eq(o) a').tab('show'); // Select third tab (0-indexed)
             
                                  parar = true;
                                  return false;
                    }
             });
       });
                           
       //Desactivamos el icono de cargando
       //setTimeout ("cancel_loading();", 100); 
}
