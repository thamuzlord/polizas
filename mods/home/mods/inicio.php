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
	          <tbody>
							<tr>
								<td  >1</td>
								<td  >123456</td>
								<td  >999999</td>
								<td  >Juan</td>
								<td  >1</td>
								<td  >Seguros</td>
								<td  >12/02/2017</td>
								<td  >12/02/2018</td>
								<td  >13.000.000</td>
								<td  >30</td>
								<td  >40000</td>
								<td  >60000</td>
								<td  >8000</td>
								<td  >30</td>
								<td  >60000</td>
								<td  >30</td>
								<td  >30</td>
								<td  >70</td>
								<td  >Pedro</td>
								<td  ></td>
							</tr>
							<tr>
								<td  >1</td>
								<td  >123456</td>
								<td  >999999</td>
								<td  >Diego</td>
								<td  >1</td>
								<td  >Seguros</td>
								<td  >12/02/2017</td>
								<td  >12/02/2018</td>
								<td  >13.000.000</td>
								<td  >30</td>
								<td  >40000</td>
								<td  >60000</td>
								<td  >8000</td>
								<td  >30</td>
								<td  >60000</td>
								<td  >30</td>
								<td  >30</td>
								<td  >70</td>
								<td  >Pedro</td>
								<td  ></td>
							</tr>
							<tr>
								<td  >1</td>
								<td  >123456</td>
								<td  >999999</td>
								<td  >Mateo</td>
								<td  >1</td>
								<td  >Seguros</td>
								<td  >12/02/2017</td>
								<td  >12/02/2018</td>
								<td  >13.000.000</td>
								<td  >30</td>
								<td  >40000</td>
								<td  >60000</td>
								<td  >8000</td>
								<td  >30</td>
								<td  >60000</td>
								<td  >30</td>
								<td  >30</td>
								<td  >70</td>
								<td  >Pedro</td>
								<td  ></td>
							</tr>
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
