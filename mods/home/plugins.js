$(document).ready(function() {
  tablePolicies();
  tipoPersona();
});

function newclient(){
  cli ="";
	cli += `
    <div class="row">
      <div class="col-lg-12">
        <label for="email" class="text-center">Tipo de Cliente:</label>
        <select name="tipoPersona" id="tipoPersona" onChange="formTipoCliente()" class="form-control text-center" style="max-width:40%">
        </select>
      </div>
        <div class="form-group" id="formCliente">
          <div class="col-lg-6">
            <div id="tipoDoc">
            </div>
            <label for="email">Primer Nombre:</label>
            <input type="text" class="form-control" id="primerNombre" placeholder="Primer Nombre" name="primerNombre">
            <label for="email">Segundo Nombre:</label>
            <input type="text" class="form-control" id="segundoNombre" placeholder="Segundo Nombre" name="segundoNombre">
            <label for="email">Primer Apellido:</label>
            <input type="text" class="form-control" id="primerApellido" placeholder="Primer Apellido" name="primerApellido">
            <label for="email">Segundo Apellido:</label>
            <input type="text" class="form-control" id="segundoApellido" placeholder="Segundo Apellido" name="segundoApellido">
          </div>
        <div class="col-lg-6">
          <label for="email">Teléfono:</label>
          <input type="text" class="form-control" id="telefono" placeholder="Teléfono" name="telefono">
          <label for="email">Dirección:</label>
          <input type="text" class="form-control" id="direccion" placeholder="Dirección" name="direccion">
          <label for="email">Email:</label>
          <input type="text" class="form-control" id="email" placeholder="Email" name="email">
          <br>
          <button class="btn btn-warning" onClick="$('#modalGeneral').modal('hide');">Cancelar</button>
          <button class="btn btn-success" onClick="guardarCliente()">Guardar</button>
        </div>
      </div>
  </div>
`
	$('#modalGeneral').modal('show');
	$("#modalContenido").html(cli);
    $("#formCliente").hide();
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
        swal("Error al listar las Polizas.");
        return false;
    }
}

function formTipoCliente(){
    var tipoPersona = $("#tipoPersona").val();
    var campoCliente = '';
    if (tipoPersona == 1) {
        campoCliente += '<label for="email">Cédula:</label>';
        campoCliente += '<input type="text" class="form-control" id="cedula" placeholder="Cédula" name="cedula">';
        $("#formCliente").show();
    }
    if (tipoPersona == 2) {
        campoCliente += '<label for="email">NIT:</label>';
        campoCliente += '<input type="text" class="form-control" id="NIT" placeholder="NIT" name="NIT">';
        $("#formCliente").show();
    }
    if (tipoPersona == '') {
        $("#formCliente").hide();
        campoCliente = '';
    }
    $("#tipoDoc").html(campoCliente);
}

function tipoPersona() {
    var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=tipoPersona', 'false'];
    var datosRespuesta = PeticionAjax(datos);
    if (datosRespuesta != false && datosRespuesta != '')
    {
        datosTipoUsuario = datosRespuesta.Datos;
        var tipoUser = '<option value="">Seleccione un tipo de Persona</option>';
        $.each(datosTipoUsuario, function (x, item){
          tipoUser += '<option value="'+item.idTipoPersona+'">'+item.tipoPersona+'</option>';
        })
        $("#tipoPersona").html(tipoUser);
        return true;
    } else {
        swal("Error al listar los tipos de usuario.");
        return false;
    }
}

function guardarCliente(){
    var guardarCliente = new Object();
    var tipoPersona = $("#tipoPersona").val();
    if (tipoPersona == 1) {
        guardarCliente["idCliente"] = $("#cedula").val();
    }
    if (tipoPersona == 2) {
        guardarCliente["idCliente"] = $("#NIT").val();
    }
    guardarCliente["primerNombre"] = $("#primerNombre").val();
    guardarCliente["segundoNombre"] = $("#segundoNombre").val();
    guardarCliente["primerApellido"] = $("#primerApellido").val();
    guardarCliente["segundoApellido"] = $("#segundoApellido").val();
    guardarCliente["email"] = $("#email").val();
    guardarCliente["telefono"] = $("#telefono").val();
    guardarCliente["direccion"] = $("#direccion").val();
    guardarCliente["tipoPersona"] = tipoPersona;
    guardarCliente["ConfigAjax"] = ['POST', 'enrout.php?cmd=guardarCliente', 'false'];
    var datosRespuesta = PeticionAjax(guardarCliente);
    if (datosRespuesta != false && datosRespuesta != '')
    {
        swal("Registrado Exitosamente", "Cliente registrado", "success");
        $('#modalGeneral').modal('hide');
        return true;
    } else {
        swal("Error", "No se pudo registrar el usuario", "warning");
        return false;
    }
}

function newAseguradora(){
  cli ="";
    cli += `
    <div class="row">
        <div class="form-group">
          <div class="col-lg-6">
            <div id="tipoDoc">
            </div>
            <legend>Información Compañia</legend>
            <label for="email">Nombre de la compañia:</label>
            <input type="text" class="form-control" id="nombreAseguradora" placeholder="Nombre de la compañia" name="nombreAseguradora">
            <label for="email">NIT:</label>
            <input type="text" class="form-control" id="nitAseguradora" placeholder="NIT" name="nitAseguradora">
          </div>
        <div class="col-lg-6">
          <legend>Información Contacto</legend>
          <label for="email">Nombre Contacto:</label>
          <input type="text" class="form-control" id="contactoAseguradora" placeholder="Nombre Contacto" name="contactoAseguradora">
          <label for="email">Teléfono:</label>
          <input type="text" class="form-control" id="telefonoContactoAseguradora" placeholder="Teléfono" name="telefonoContactoAseguradora">
          <label for="email">Email:</label>
          <input type="text" class="form-control" id="correoContactoAseguradora" placeholder="Email" name="correoContactoAseguradora">
          <br>
          <button class="btn btn-warning" onClick="$('#modalGeneral').modal('hide');">Cancelar</button>
          <button class="btn btn-success" onClick="guardarAseguradora()">Guardar</button>
        </div>
      </div>
  </div>
`
    $('#modalGeneral').modal('show');
    $("#modalContenido").html(cli);
}

function guardarAseguradora(){
    var guardarAseguradora = new Object();
    guardarAseguradora["nombreAseguradora"] = $("#nombreAseguradora").val();
    guardarAseguradora["idAseguradora"] = $("#nitAseguradora").val();
    guardarAseguradora["contactoAseguradora"] = $("#contactoAseguradora").val();
    guardarAseguradora["telefonoContactoAseguradora"] = $("#telefonoContactoAseguradora").val();
    guardarAseguradora["correoContactoAseguradora"] = $("#correoContactoAseguradora").val();
    guardarAseguradora["ConfigAjax"] = ['POST', 'enrout.php?cmd=guardarAseguradora', 'false'];
    var datosRespuesta = PeticionAjax(guardarAseguradora);
    if (datosRespuesta != false && datosRespuesta != '')
    {
        swal("Registro Exitoso", " Aseguradora registrada", "success");
        $('#modalGeneral').modal('hide');
        return true;
    } else {
        swal("Error", "No se pudo registrar la aseguradora", "warning");
        return false;
    }
}
