$.TipoUsuario = "";

function DocumentacionCliente()
{
	var cliente = $("#cbo_cliente").val();

	if(cliente=="" || cliente==null){
		$("#arbolDocumentos").html('');
		return false;
	}

	$.TipoUsuario = $("#cbo_cliente option:selected").data("tipo");

    var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=DocumentacionCliente', 'false'];
    datos["TipoCliente"] = $.TipoUsuario;
    datos["Cliente"] = cliente;

    var datosRespuesta = PeticionAjax(datos);

    if (datosRespuesta != false && datosRespuesta != '') {
        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
        $.Documentacion = datosRespuesta.DctosRequeridos;
       	$DctosCliente = datosRespuesta.DctosCliente;

       	/*CARGAR ARBOL*/
       	CargarArbolArchivos();
        return true;

    } else {
        alert("Error al listar los usuarios.");
        return false;
    }
}

function CargarArbolArchivos()
{
	var arc = "";

	if( $.Documentacion!="" )
	{
		arc += '<div style="font-size:20px;">LISTA DE ARCHIVOS</div>';
		arc += '<div style="margin-left:35px">';

		$.each($.Documentacion, function(item, dr){
			arc += '<div class="size16"><i class="icon ion-social-buffer"></i><strong>&nbsp;'+dr.nombreDocumento+'</strong></div>';
			nombre= dr.nombreVisible;

			var paso = 0;
			$.each($DctosCliente, function(item2, dc)
			{
				if(dc.idDocumentacionRequerida==dr.idDocumentacionRequerida)
				{
					paso++;
					nombrearc = GenerarNombreDoc(dr.nombreVisible,dc.nombreArchivoFisico);

					arc += '<a style="font-size:13px;color:#0000CC" href="mods/admin_files/mods/upload_docs.php?arc='+dc.idRow+'" target="_blank"><div style="margin-left:30px">'+ConsultarImagenIcon( nombrearc )+'&nbsp;'+nombrearc+'</div></a>';
				}
			});

			if(paso==0){
				arc += '<div style="margin-left:30px"><i class="icon ion-social-buffer-outline"></i>&nbsp;Sin documentos</div>';
			}
		});
		arc += '</div>';
	}

	$("#arbolDocumentos").html(arc);
}
function GenerarNombreDoc(nombre1, nombre2)
{
	/*GENERAR NOMBRE ARCHIVO*/
	var archi = nombre1.toLowerCase();
	array = nombre2.split("_");
	extension = nombre2.substring(nombre2.lastIndexOf('.'));;
	nArchivo =  archi+"_"+array[1].substring(0,8)+extension;

	return nArchivo;
}

function ConsultarClientes() {
	//var datosCliente=[];
    var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=ListadoClientes', 'false'];
    var datosRespuesta = PeticionAjax(datos);

    if (datosRespuesta != false && datosRespuesta != '')
    {
        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
        datosCliente = datosRespuesta.Datos;
        ListadoClientes();
        return true;

    } else {
        alert("Error al listar los usuarios.");
        return false;
    }
}


function ListadoClientes()
{
	if(datosCliente!=""){

		var combo = '<option value="">Seleccionar un cliente</option>';
		$.each(datosCliente, function (x, y){
			combo += '<option value="'+y.idRow+'" data-tipo="'+y.tipoPersona+'">'+y.NombreCliente+'</option>'
		})

		$("#cbo_cliente").html(combo);
	}
}


/****************************************************/

function VistaAddArchivo()
{
	cliente = $("#cbo_cliente").val();

	if(cliente=="" || cliente==null){
		$('#modalGeneral').modal('show');
		$("#modalContenido").html("Debe seleccionar un cliente");
		return false;
	}

	uls ="";

	uls += `<div style="margin:25px 10px">
				<strong>Seleccione el documento que desea enviar:</label>
			</div>

			<div class="row" style="margin:20px 10px">
				<div class="col-sm-10">
					<label for="documento" class="col-sm-4" >Documento:</label>
					<div class="col-sm-8">
						<select id="cbo_documentos" name="cbo_documentos" class="form-control"></select>
					</div>
				</div>
			</div>

			<div class="row" style="margin:20px 10px">
				<div class="col-sm-9">
					<label for="documento" class="col-sm-4" >&nbsp;</label>
					<div class="col-sm-8">
						<div class="col-sm-6">
							<span id="botonExaminar" class="btn btn-primary" title="Adjuntar" data-toggle="tooltip" data-original-title="Examinar">Adjuntar</span>
							<input id="archivo" name="archivos[]" type="file" style="outline: none; height:19px; width:32px; opacity: 0;margin-left:-14px;margin-top:-18px;cursor: pointer;" onchange="ActivarEnvio(event,this)">
						</div>
						<div class="col-sm-6">
							<span id="botonEnviar"></span>
						</div>
					</div>
				</div>
			</div>
			`

	$('#modalGeneral').modal('show');

	cbo = "";
	if($.Documentacion != ""){
		$.each($.Documentacion, function(index, x) {
			cbo += '<option value="'+x.idDocumentacionRequerida+'">'+x.nombreDocumento+'</option>';
		});
	}

	$("#modalContenido").html(uls);
	$("#cbo_documentos").html(cbo);

	$( "#botonExaminar" ).click(function() {
		$('input[type=file]').click()
	});
}

function ActivarEnvio(event, element)
{
    //CAPTURAMOS EL ID DEL INPUT FILE SELECCIONADO
    var id_elemento = $(element).prop("id");
    var id_item = $("#cbo_documentos").val();

    var html="";

	$('#botonEnviar').show();

	if(id_item!=""){
		var cm = "'";
	    //MOSTRAMOS EL MENSAJE (Cargando...) DE LA FILA
	    //CREAMOS EL BOTON UPLOAD, EL CUAL SUBIRA EL ARCHIVO
	    html += '<button style="width:85px" id="btn-up" onclick="GuardarDocumento()" class="btn btn-primary btn-file btn-file">Enviar</button>';

	    $('#botonEnviar').html(html);

	}else{
		swal("Debe seleccionar un documento");
		return false;
	}

}

function GuardarDocumento()
{
	var datos = new FormData();

	datos.append("accion",'GuardarDocumento');

	var ExtensionesValidas = new Array(".jpg",".jpg",".png",".pdf",".doc",".docx",".xls",".xlsx",".xlsxs");

	/*OBTENER EL NOMBRE DEL ARCHIVO*/
	var Archivo = document.getElementById("archivo").files[0];
	var NombreArchivoEnvio = Archivo.name;
	var ExtensionArchivo = NombreArchivoEnvio.toLowerCase();
	ExtensionArchivo = ExtensionArchivo.substring(ExtensionArchivo.lastIndexOf('.'));


	if (ExtensionesValidas.indexOf(ExtensionArchivo) >= 0)
	{
		/*IMAGEN */
		var tamaño_archivo=(Archivo.size)/(1024*1024);

		if(tamaño_archivo<5)
		{
			/*****************IMAGEN********************/
			datos.append("Archivo", Archivo);
			datos.append("NombreArchivo",$("#cbo_documentos").val());
			datos.append("Extension",ExtensionArchivo);
			datos.append("Cliente",$("#cbo_cliente").val());
			/*********************************************/

		    var datosRespuesta = PeticionAjaxArchivo(datos);

		    $('#modalGeneral').modal('hide');
		    DocumentacionCliente();
			return false


		    if (datosRespuesta != false && datosRespuesta != '') {
		        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
		        DocumentosCliente = datosRespuesta.Datos;
		        ListadoClientes();
		        return true;

		    } else {
		        alert("Error al listar los documentos.");
		        return false;
		    }
			return false;
		}else{
			swal("No se puede subir archivos de más de 5 MB");
			return false;
		}
	}
	else
	{
		if($("#archivo").val()==""){
			swal("Debe seleccionar un archivo");
			return false
		}else{
			/*alert("La extensión "+ExtensionArchivo+" no es válida \n\n Puede subir archivos en PDF ó Imagenes con formato PNG o JPG y documentos")*/
			swal("La extensión "+ExtensionArchivo+" no es válida", "Puede subir archivos con extensión: .jpg, .jpg, .png, .pdf, .doc, .docx, .xls, .xlsx, .xlsxs", "warning");
			return false;
		}
	}
}

function ConsultarImagenIcon(dat)
{
	extensionArch = dat.substring(dat.lastIndexOf('.'));

	if(extensionArch==".jpg" || extensionArch==".png" || extensionArch==".jpeg"){
		img = '<i class="icon ion-android-image"></i>';
	}else{
		img = '<i class="icon ion-android-list"></i>';
	}
	return img;
}


/************************************************************/
/*****************DOCUMENTOS REQUERIDOS**********************/
/************************************************************/

function GuardarDocumentoRequerido()
{
	if( $("#nombreDocumentoR").val() ==""){
		alert("Ingresar nombre del documento requerido.")
		$("#nombreDocumentoR").focus();
		return false;
	}
	
	if( $("#nombreArchivoVisible").val() ==""){
		alert("Ingresar nombre del documento para la descarga.")
		$("#nombreArchivoVisible").focus();
		return false;
	}

	var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=RegistrarDocumentoRequerido', 'false'];
    datos["nombreDocumento"] =  $("#nombreDocumentoR").val();
    datos["nombreVisible"] = $("#nombreArchivoVisible").val();
    datos["descripcionDocumento"] = $("#descripcionDocumentoR").val();
    datos["tipoUsuario"] = $("#tipoUsuarioDocumentoR").val();
    datos["estadoDocumento"] = $("#estadoDocumentoR").val();
    

    var datosRespuesta = PeticionAjax(datos);

    if (datosRespuesta != false && datosRespuesta != '') {
        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
        //$.Documentacion = datosRespuesta.DctosRequeridos;
       	//$DctosCliente = datosRespuesta.DctosCliente;

		alert("Documento registrado");+
		ConsultarDocumentosRequeridos();
       	/*CARGAR ARBOL*/
       	//CargarArbolArchivos();
        return true;

    } else {
        alert("Error al listar los usuarios.");
        return false;
    }
}

function ConsultarDocumentosRequeridos()
{
	var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=ListaDocumentosRequeridos', 'false'];
    var datosRespuesta = PeticionAjax(datos);

    if (datosRespuesta != false && datosRespuesta != '')
    {
        
        DocumentosRequeridos = datosRespuesta.Datos;
        ListadoDocumentosRequeridos();
        return true;

    } else {
        alert("Error al listar los usuarios.");
        return false;
    }
}

function ListadoDocumentosRequeridos() {

	table ="";

	table += `
			<div class="container" style="">
  				<h2>Listado documentos requeridos</h2>
				<table class="table table-condensed" style="background:#FFF">
					<thead style="">
						<tr>
							<th>Documento</th>
							<th>Nombre descarga</th>
							<th>Descripción</label>
							<th>Tipo usuario</th>
							<th>Requerido</th>
							<th>Acción</th>
						</tr>
					</thead>
					<tbody>
					`;

	$.each(DocumentosRequeridos, function(index, i)
	{
		tUser = ""
		requerido = "Si"

		switch(i.personaAplica) {
		    case "A":
		        tUser ="Ambos"
		        break;
		    case "N":
		        tUser = "Natural"
		        break;
		    case "J":
		        tUser = "Jurídico"
		        break;
		}

		if(i.estadoRequerida=="N"){ requerido="No"}
		var descripcion = i.descripcionDocumento
		if(descripcion==null){ descripcion=""; }

		table += `	<tr>

						<td>${i.nombreDocumento}</td>
						<td>${i.nombreVisible}</td>
						<td>${descripcion}</td>
						<td>${tUser}</td>
						<td>${requerido}</td>
						<td><button onclick="ModificarRequerido(${index})" class="btn btn-danger">Modificar</button></td>
					</tr>
					
			   `;
	});


	table += `	</tbody>
				</table>
			</div>
				`;

	$("#listado_documentos").html(table);
	$("thead th").css("color","#FFF")
}

function ModificarRequerido(dat)
{
	$Seleccion = DocumentosRequeridos[dat];

	$("#nombreDocumentoR").val($Seleccion.nombreDocumento);
	$("#nombreArchivoVisible").val($Seleccion.nombreDocumento);
	$("#descripcionDocumentoR").html($Seleccion.descripcionDocumento);
	$("#tipoUsuarioDocumentoR").val($Seleccion.personaAplica);
	$("#estadoDocumentoR").val($Seleccion.estadoRequerida);
	$("#idDocumentoR").val($Seleccion.idDocumentacionRequerida);

	$("#GuardarDRequerido").hide();
	$("#ActualizarDRequerido").show();
	$("#CancelarDRequerido").show();

	$("html, body").animate({ scrollTop: 0 }, 600);
	return false;
}

function CancelarDocumentoRequerido()
{
	$("#nombreDocumentoR").val('');
	$("#nombreArchivoVisible").val('');
	$("#descripcionDocumentoR").html('');
	$("#tipoUsuarioDocumentoR").val('');
	$("#estadoDocumentoR").val('');
	$("#idDocumentoR").val('');

	$("#GuardarDRequerido").show();
	$("#ActualizarDRequerido").hide();
	$("#CancelarDRequerido").hide();
	return false;
}

function ActualizarDocumentoRequerido()
{
	if( $("#nombreDocumentoR").val() ==""){
		alert("Ingresar nombre del documento requerido.")
		$("#nombreDocumentoR").focus();
		return false;
	}
	
	if( $("#nombreArchivoVisible").val() ==""){
		alert("Ingresar nombre del documento para la descarga.")
		$("#nombreArchivoVisible").focus();
		return false;
	}

	var datos = new Object();
    datos["ConfigAjax"] = ['POST', 'enrout.php?cmd=modificarDocumentoRequerido', 'false'];
    datos["nombreDocumento"] =  $("#nombreDocumentoR").val();
    datos["nombreVisible"] = $("#nombreArchivoVisible").val();
    datos["descripcionDocumento"] = $("#descripcionDocumentoR").val();
    datos["tipoUsuario"] = $("#tipoUsuarioDocumentoR").val();
    datos["estadoDocumento"] = $("#estadoDocumentoR").val();
    datos["idDocumento"] = $("#idDocumentoR").val();
    

    var datosRespuesta = PeticionAjax(datos);

    if (datosRespuesta != false && datosRespuesta != '') {
        //RECIBIMOS ARRAY CON LOS USUARIOS DE LA BASE DE DATOS
        //$.Documentacion = datosRespuesta.DctosRequeridos;
       	//$DctosCliente = datosRespuesta.DctosCliente;
		alert("Documento actualizado correctamente");
		location.reload();
       	/*CARGAR ARBOL*/
       	//CargarArbolArchivos();
        return true;

    } else {
        alert("Error al listar los usuarios.");
        return false;
    }
}