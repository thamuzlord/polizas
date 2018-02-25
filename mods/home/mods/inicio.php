	<head>
	  <script>
	  function showEdit(editableObj) {
	    $(editableObj).css("background","#FFF");
	  }
	  function saveToDatabase(editableObj,column,id) {
	    $(editableObj).css("background","#FFF url(img/loaderIcon.gif) no-repeat right");
	    $.ajax({
	      url: "modulos/guia_transporte/modulos/edit_guia.php",
	      type: "POST",
	      data:'column='+column+'&editval='+editableObj.innerHTML+'&id='+id,
	      success: function(data){
	        $(editableObj).css("background","#FDFDFD");
	      }
	    });
	  }
	  </script>
	</head>
	<div class='row'>
	  <div class='col-xs-12'>
			<div class="table-responsive">
	        <table id='polizas_table' class='table table-bordered table-striped'>
	          <thead>
                <tr>
                  <th>ID</th>
                  <th>Título Minero</th>
                  <th>Código RMN</th>
                  <th>Cliente</th>
                  <th>N° Poliza</th>
                  <th>Aseguradora</th>
                  <th>Fecha Adquisición</th>
									<th>Fecha Vencimiento</th>
                  <th>Valor Asegurado</th>
                  <th>Porcentaje Prima</th>
                  <th>Prima</th>
									<th>Prima+IVA</th>
									<th>Gastos de Expedición</th>
                  <th>Tasa para Comisión</th>
                  <th>Valor Comisión</th>
                  <th>Retención</th>
									<th>Porcentaje Asesor</th>
									<th>Porcentaje CAVAL & BEGA</th>
									<th>Asesor</th>
									<th>Observaciones</th>
                </tr>
	          </thead>
	          <tbody id='table_polizas'>
	          </tbody>
            <tfoot>
              <tr>
								<th>ID</th>
								<th>Título Minero</th>
								<th>Código RMN</th>
								<th>Cliente</th>
								<th>N° Poliza</th>
								<th>Aseguradora</th>
								<th>Fecha Adquisición</th>
								<th>Fecha Vencimiento</th>
								<th>Valor Asegurado</th>
								<th>Porcentaje Prima</th>
								<th>Prima</th>
								<th>Prima+IVA</th>
								<th>Gastos de Expedición</th>
								<th>Tasa para Comisión</th>
								<th>Valor Comisión</th>
								<th>Retención</th>
								<th>Porcentaje Asesor</th>
								<th>Porcentaje CAVAL & BEGA</th>
								<th>Asesor</th>
								<th>Observaciones</th>
              </tr>
            </tfoot>
          </table>
				</div>
    </div>
  </div>
