function DocumentacionCliente() {
    var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=DocumentacionCliente', 'false'];
    var datosRespuesta = PeticionAjax(datos);

    if (datosRespuesta != false && datosRespuesta != '') {
        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
        var datosCliente = datosRespuesta.Datos;
        console.log(datosCliente);
        return true;

    } else {
        alert("Error al listar los usuarios.");
        return false;
    }
}