<div class="row">
	<div class="col-sm-6 col-lg-6 col-md-6">
		<div id="register-wraper">
				<form id="register-form" class="form-group">
						<legend>Información Básica</legend>
						<!-- identificacion -->
						<label for="name">Cédula</label>
						<input name="idLawyer" id="idLawyer" class="form-control text-center" type="text">
						<!-- first name -->
						<label for="name">Primer Nombre</label>
						<input name="primerNombreL" id="primerNombreL" class="form-control text-center" type="text">
							<!-- last name -->
						<label for="surname">Segundo Nombre</label>
						<input name="segundoNombreL" id="segundoNombreL" class="form-control text-center" type="text">
						<!-- username -->
						<label>Primer Apellido</label>
						<input name="primerApellidoL" id="primerApellidoL" class="form-control text-center" type="text">
						<!-- apellidos -->
						<label>Segundo Apellido</label>
						<input name="segundoApellidoL" id="segundoApellidoL" class="form-control text-center" type="text">
						<!-- email -->
						<label>E-Mail</label>
						<input name="emailL" id="emailL" class="form-control text-center" type="email">
		</div>
	</div>
	<div class="col-sm-6 col-lg-6 col-md-6">
		<div id="register-wraper">
			<div id="register-form" class="form-group">
				<legend>Acceso al Sistema</legend>
						<label>Nombre de Usuario</label>
						<input name="username" id="username" class="form-control text-center" type="text">

						<label>Contraseña</label>
						<input name="pass" id="pass" class="form-control text-center" type="password">

						<label>Tipo de Usuario</label>
						<select name="permission" id="permission" class="form-control">
						</select>
						<div class="footer">
							<br>
								<button type="button" class="btn btn-warning" onclick="resetForm('register-form')">Cancelar</button>
								<button type="button" class="btn btn-success" onclick="reg_user()">Registrar</button>
						</div>
			</div>
		</div>
	</div>
	</form>
</div>
