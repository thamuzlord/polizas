<div class="row">
	<div id="register-wraper" >
		<form id="register-form" class="form-group">
				<legend>Documentación Requerida</legend>

				<!-- id -->
				<input name="idDocumentoR" id="idDocumentoR" class="form-control text-center" type="hidden">
				
				<div class="row text-right">
					<!-- nombre tecnico del documento requerido -->
					<label for="nombreDocumentoR" class="col-md-4 control-label">Nombre documento:</label>

					<div class="col-md-5">
						<input name="nombreDocumentoR" id="nombreDocumentoR" class="form-control" type="text">
					</div>
				</div>
				
				<div class="row text-right">
					<!-- nombre del archivo para la descarga -->
					<label for="nombreArchivoVisible" class="col-md-4 control-label text-right">Nombre archivo descarga:</label>
					<div class="col-md-5">
						<input name="nombreArchivoVisible" id="nombreArchivoVisible" class="form-control" type="text">
					</div>
				</div>

				<div class="row text-right">
					<!-- descripcion del documento requerido -->
					<label for="descripcionDocumentoR" class="col-md-4 control-label">Descripción documento:</label>
					<div class="col-md-5">
						<textarea name="descripcionDocumentoR" id="descripcionDocumentoR" class="form-control"></textarea>
					</div>
				</div>

				<div class="row text-right">					
					<!-- tipo de usuario aplicara documento requerido -->
					<label for="tipoUsuarioDocumentoR" class="col-md-4 control-label">Usuario:</label>
					<div class="col-md-5">
						<select name="tipoUsuarioDocumentoR" id="tipoUsuarioDocumentoR" class="form-control" type="text">
							<option value="N">Natural</option>
							<option value="J">Jurídico</option>
							<option value="A">Ambos</option>
						</select>
					</div>
				</div>

				<div class="row text-right">
					<!-- establecer a que usuario aplicara el documento -->
					<label for="estadoDocumentoR" class="col-md-4 control-label">Documeto requerido:</label>
					<div class="col-md-5">
						<select name="estadoDocumentoR" id="estadoDocumentoR" class="form-control text-center" type="text">
							<option value="S">Si</option>
							<option value="N">No</option>
						</select>
					</div>
				</div>

				<div class="row">
					<label for="" class="col-md-4 control-label"></label>
					<div class="col-md-5">
							<button type="button" id="GuardarDRequerido" class="btn btn-success" onclick="GuardarDocumentoRequerido()">Guardar</button>
							<button type="button" id="ActualizarDRequerido" class="btn btn-success" onclick="ActualizarDocumentoRequerido()" style="display: none">Guardar</button>
							<button type="button" id="CancelarDRequerido" class="btn btn-warning" onclick="CancelarDocumentoRequerido()" style="display: none">Cancelar</button>
					</div>
				</div>
		</form>
	</div>
</div>

<div id="listado_documentos"></div>


<script type="text/javascript">
	ConsultarDocumentosRequeridos();
	$(".row").css("margin","10px 0");
</script>