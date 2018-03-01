<style>
.botonAddAdjunto{
  width:60px;
  height:60px;
  border-radius:100%;
  background:#1F2A39;
  /*right:0;
  bottom:0;*/
  position:absolute;
  margin-right:16px;
  margin-bottom:16px;
  margin-top:-15px;
  border:none;
  outline:none;
  color:#FFF;
  font-size:40px;
  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);
  transition:.3s;
}

.botonAddAdjunto:hover{
  width:70px;
  height:70px;
  font-size:50px !important;;
}

.rotate {
  display: inline-block;
  transform: rotate(45deg);
}

.modal .fechar-modal {
    border-radius: 50px;
    background-color: #FFFFFF !important;
    color: #4F4F4F!important;
    padding-left: 5px;
    padding-right: 5px;
    border: none;
    font-weight: bold;
}
.fixed{
	position: fixed;
}
.size16{
	font-size:16px;
	margin-top:15px;
}
</style>

<div class="fixed">

	<div class="row">
		<h1>Módulo de administración de archivos</h1>
	</div>

	<div class="row" style="height: 70px; width: 150%; margin-top:30px;">
		<label for="cbo_cliente" class="col-sm-1 label-control" style="padding:5px">Cliente:</label>
		<div class="col-sm-6">
			<select  id="cbo_cliente" name="cbo_cliente" class="form-control" onchange="DocumentacionCliente()"></select>
		</div>
		<div class="col-sm-4">
			<button class="botonAddAdjunto" onclick="VistaAddArchivo()">
	  			<i class="icon ion-paperclip rotate" title="Adjuntar archivo"></i>
			</button>
		</div>
	</div>

</div>

<div id="arbolDocumentos" style="margin:200px 100px 20px; height: 450px; overflow: auto;" ></div>

<div class="modal fade" id="modalGeneral" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static">
	<div class="modal-dialog" role="document">
	<div class="modal-content" style="">
	  <div class="modal-header text-right">
		<button type="button" class="fechar-modal" data-dismiss="modal" aria-label="Close" title="Cerrar"><span aria-hidden="true">X</span></button>
	  </div>
	  <div class="modal-body" id="modalContenido">

	  </div>
	</div>
	</div>
</div>
