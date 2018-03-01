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
      var nombreAbogado = datosAbogado.Datos[0]['primerNombreL']+datosAbogado.Datos[0]['segundoNombreL'];
      var emailL = datosAbogado.Datos[0]['emailL'];
      $("#nombreAbogado").html(userAbogado);
      $("#emailAbogado").html(emailL);
      return true;
  } else {
      alert("Error al listar las Polizas.");
      return false;
  }
}
