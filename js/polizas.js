$(document).ready(function() {

});

function PeticionAjax(Datos) {
    var ResultadoPOST = false;
    var Config = Datos['ConfigAjax'];
    var _Type = Config[0];
    var _Url = Config[1];
    var _Async = eval(Config[2]);
    Datos['ConfigAjax'] = '';
    $.ajax({
        type: _Type,
        url: _Url,
        async: _Async,
        global: true,
        dataType: 'json',
        data: Datos,
        success: function(data) {
            ResultadoPOST = data;
            //AjaxFinalizarIndicadorPeticion();
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            errores(XMLHttpRequest, textStatus);
            //AjaxFinalizarIndicadorPeticion();
        },
        complete: function() {
            //hideLightbox_loader();
            //AjaxFinalizarIndicadorPeticion();
        }
    });
    return ResultadoPOST;
}

function errores(jqXHR, exception) {
    //console.log(jqXHR);
    if (jqXHR.responseText != '') {
        /*alert('Error Interno');*/
        //alert(jqXHR.responseText);
        console.log(jqXHR.responseText);
    }
    /*if (jqXHR.status === 0) {
       alert('Verifique el estado de la conexión');
     } else*/
    if (jqXHR.status == 404) {
        alert('No se ha podido conectar al destino');
    } else if (jqXHR.status == 500) {
        alert('Error interno del servicio');
    } else if (exception == 'parsererror') {
        //alert('La Peticion Falló');
    } else if (exception == 'timeout') {
        alert('Se ha superado el tiempo de espera');
    } else if (exception == 'abort') {
        alert('Petición cancelada');
    } else if (jqXHR.status == 405) {
        alert('La peticón no es correcta para dominios externos');
    }
}
