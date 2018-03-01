$(document).ready(function() {
  tablePolicies();
});

function newclient(){
  $('#modalGeneral').modal('show');
}

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
    var datosPolizas = PeticionAjax(datos);
    if (datosPolizas != false && datosPolizas != '') {
        var tablaPolizas = datosPolizas.Datos;
        Tabla = "";
        $.each(tablaPolizas, function(x, item) {
            idpoliza = item.idpoliza;
            tituloMinero = item.tituloMinero;
            codigoRMN = item.codigoRMN;
            cliente = item.primerNombre+'&nbsp'+item.segundoNombre+'&nbsp'+item.primerApellido+'&nbsp'+item.segundoApellido;
            numeroPoliza = item.numeroPoliza;
            nombreAseguradora = item.nombreAseguradora;
            fechaAdquisicion = item.fechaAdquisicion;
            fechaVencimiento = item.fechaVencimiento;
            valorAsegurado = item.valorAsegurado;
            porcentajePrima = item.porcentajePrima;
            prima = item.prima;
            primaIva = item.prima * item.porcentajePrima;
            gastosExpedicion = item.gastosExpedicion;
            tasaParaComision = item.tasaParaComision;
            valorComision = item.valorComision;
            totalRetencion = item.totalRetencion;
            porcentajeAsesor = item.porcentajeAsesor;
            porcentajeEmpresa = item.porcentajeEmpresa;
            asesor = item.primerNombre+'&nbsp'+item.segundoNombre+'&nbsp'+item.primerApellido+'&nbsp'+item.segundoApellido;
            observaciones = item.observaciones;
            Tabla += '<tr>';
            Tabla += '   <td><strong>' + idpoliza + '</strong></td>';
            Tabla += '   <td><strong>' + tituloMinero + '</strong></td>';
            Tabla += '   <td><strong>' + codigoRMN + '</strong></td>';
            Tabla += '   <td><strong>' + cliente + '</strong></td>';
            Tabla += '   <td contenteditable="true" onBlur="saveToDatabase(this,"numeroPoliza",'+numeroPoliza+')" onClick="showEdit(this);" style="border: 1px solid #ececec;"><strong>' + numeroPoliza + '</strong></td>';
            Tabla += '   <td><strong>' + nombreAseguradora + '</strong></td>';
            Tabla += '   <td><strong>' + fechaAdquisicion + '</strong></td>';
            Tabla += '   <td><strong>' + fechaVencimiento + '</strong></td>';
            Tabla += '   <td><strong>' + valorAsegurado + '</strong></td>';
            Tabla += '   <td><strong>' + porcentajePrima + '</strong></td>';
            Tabla += '   <td><strong>' + prima + '</strong></td>';
            Tabla += '   <td><strong>' + primaIva + '</strong></td>';
            Tabla += '   <td><strong>' + gastosExpedicion + '</strong></td>';
            Tabla += '   <td><strong>' + tasaParaComision + '</strong></td>';
            Tabla += '   <td><strong>' + valorComision + '</strong></td>';
            Tabla += '   <td><strong>' + totalRetencion + '</strong></td>';
            Tabla += '   <td><strong>' + porcentajeAsesor + '</strong></td>';
            Tabla += '   <td><strong>' + porcentajeEmpresa + '</strong></td>';
            Tabla += '   <td><strong>' + asesor + '</strong></td>';
            Tabla += '   <td><strong>' + observaciones + '</strong></td>';
            Tabla += '</tr>'
        });
        $("#table_polizas").html(Tabla)
        return true;
    } else {
        alert("Error al listar las Polizas.");
        return false;
    }
}
