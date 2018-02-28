$(document).ready(function(){
  startFunctions();
});

function startFunctions(){
  tipoUsuario();
}

function tipoUsuario() {
	//var datosCliente=[];
    var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=tipoUsuario', 'false'];
    var datosRespuesta = PeticionAjax(datos);
    if (datosRespuesta != false && datosRespuesta != '')
    {
        datosTipoUsuario = datosRespuesta.Datos;
        var tipoUser = '<option value="">Seleccione un tipo de usuario.....</option>';
        $.each(datosTipoUsuario, function (x, item){
          tipoUser += '<option value="'+item.idTipoUsuario+'">'+item.TipoUsuario+'</option>';
        })
        $("#permission").html(tipoUser);
        return true;

    } else {
        alert("Error al listar los tipos de usuario.");
        return false;
    }
}

function reg_user(){
   var dataString = $('register-form').serialize() // returns a string
  $('register-form').serializeArray() // returns an array
}
