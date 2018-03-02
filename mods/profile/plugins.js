$(document).ready(function() {
  infoAbogado();
});

function infoAbogado(){
  var datos = new Object();
  datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=infoAbogado', 'false'];
  var datosAbogado = PeticionAjax(datos);
  if (datosAbogado != false && datosAbogado != '') {
      var userAbogado = datosAbogado.Datos[0]['username'];
      var emailL = datosAbogado.Datos[0]['emailL'];
      var nombreAbogado = datosAbogado.Datos[0]['primerNombreL'];
      var segundoNombreAbogado = datosAbogado.Datos[0]['segundoNombreL'];
      var primerApellidoL = datosAbogado.Datos[0]['primerApellidoL'];
      var segundoApellidoL = datosAbogado.Datos[0]['segundoApellidoL'];
      var emailL = datosAbogado.Datos[0]['emailL'];
      var create_time = datosAbogado.Datos[0]['create_time'];
      var username = datosAbogado.Datos[0]['username'];
      var celularAbogado = datosAbogado.Datos[0]['celularL'];
      $("#nombreAbogado").html(nombreAbogado+' '+segundoNombreAbogado+' '+primerApellidoL+' '+segundoApellidoL);
      $("#emailAbogado").html(emailL);
      $("#fechaRegistro").html(create_time);
      $("#nombreUsuarioAbogado").html(username);
      $("#celularAbogado").html(celularAbogado);
      return true;
  } else {
      swal("Error al cargar la información del usuario");
      return false;
  }
}
