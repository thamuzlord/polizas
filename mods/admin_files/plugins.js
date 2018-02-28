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
			
			var paso = 0;
			$.each($DctosCliente, function(item2, dc)
			{	
				if(dc.idDocumentacionRequerida==dr.idDocumentacionRequerida)
				{
					paso++;
					nombrearc = dc.nombreArchivoFisico;
					arc += '<div style="margin-left:30px">'+ConsultarImagenIcon( nombrearc )+'&nbsp;'+nombrearc+'</div>';
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
		
		var combo = '<option value="">Seleccionar cliente.....</option>';
		$.each(datosCliente, function (x, y){
			combo += '<option value="'+y.idRow+'" data-tipo="'+y.tipoPersona+'">'+y.NombreCliente+'</option>'
		})

		$("#cbo_cliente").html(combo);
	}
}


/****************************************************/

function VistaAddArchivo()
{
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
		alert("Debe seleccionar un documento");
		return false;
	}    
    
}

function GuardarDocumento()
{ 
	var datos = new FormData();
	
	datos.append("accion",'GuardarDocumento');
	
	var ExtensionesValidas = new Array(".jpg",".png",".pdf",".doc",".docx",".xls",".xlsx");

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
		        alert("Error al listar los usuarios.");
		        return false;
		    }



			return false;
		}else{
			alert("No se puede subir archivos de más de 5 MB")	;
			return false;
		}
	}
	else
	{
		if($("#archivo").val()==""){
			alert('Debe seleccionar un archivo')
			return false			
		}else{
			alert("La extensión "+ExtensionArchivo+" no es válida \n\n Puede subir archivos en PDF ó Imagenes con formato PNG o JPG y documentos")
			return false;
		}
	}
}

function ConsultarImagenIcon(dat)
{
	extensionArch = dat.substring(dat.lastIndexOf('.'));

	if(extensionArch==".jpg" || extensionArch==".png"){
		img = '<i class="icon ion-android-image"></i>';
	}else{
		img = '<i class="icon ion-android-list"></i>';
	}
	return img;
}