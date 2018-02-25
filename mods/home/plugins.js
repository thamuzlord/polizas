$(document).ready(function() {
  tablePolicies();
});

$(function () {
  $("#polizas_table").DataTable({
    "paging": true,
    "lengthChange": true,
    "searching": true,
    "info": true,
    "autoWidth": true,
    "scrollX": true,
    "lengthMenu": [[5, 25, 50, -1], [5, 25, 50, "Todos"]],
    "order": [[ 2, "desc" ],[ 3, "desc" ]],
    "language": {
    "url": "js/Spanish.json"
    }
  });
});

function tablePolicies() {
    var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=tablePolicies', 'false'];
    var datosRespuesta = PeticionAjax(datos);
    if (datosRespuesta != false && datosRespuesta != '') {
        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
        var datosCliente = datosRespuesta.Datos;
        console.log(datosCliente);
        return true;
    } else {
        alert("Error al listar las Polizas.");
        return false;
    }
}
