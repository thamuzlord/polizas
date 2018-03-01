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
    var regUser = new Object();
    regUser["idLawyer"] = $("#idLawyer").val();
    regUser["primerNombreL"] = $("#primerNombreL").val();
    regUser["segundoNombreL"] = $("#segundoNombreL").val();
    regUser["primerApellidoL"] = $("#primerApellidoL").val();
    regUser["segundoApellidoL"] = $("#segundoApellidoL").val();
    regUser["emailL"] = $("#emailL").val();
    regUser["username"] = $("#username").val();
    regUser["pass"] = $("#pass").val();
    regUser["permission"] = $("#permission").val();
    regUser["ConfigAjax"] = ['POST', 'enrout.php?cmd=regUsuario', 'false'];
    var datosRespuesta = PeticionAjax(regUser);
    if (datosRespuesta != false && datosRespuesta != '')
    {
        swal("Registrado Exitosamente", "Usuario registrado", "success");
        resetForm('register-form');
        return true;
    } else {
        swal("Error", "No se pudo registrar el usuario", "warning");
        return false;
    }
}
