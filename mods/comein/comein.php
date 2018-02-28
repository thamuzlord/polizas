<!doctype html>
<html><head>
    <meta charset="utf-8">
    <title>Pólizas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="styles/bootstrap.css" rel="stylesheet">
    <link href="styles/login.css" rel="stylesheet">
	  <script type="text/javascript" src="libs/jquery-3.3.1/jquery-3.3.1.js"></script>
    <link href="libs/ionicons/css/ionicons.min.css" rel="stylesheet">

    <style type="text/css">
      body {
        padding-top: 30px;
      }
    </style>

	<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

  <script type="text/javascript" src="js/jquery.validate.js"></script>

	<script type="text/javascript">

		$().ready(function() {
			// validate signup form on keyup and submit
			$("#signupForm").validate({
				rules: {
					firstname: "required",
					lastname: "required",
					username: {
						required: true,
						minlength: 1
					},
					password: {
						required: true,
						minlength: 1
					},
					confirm_password: {
						required: true,
						minlength: 2,
						equalTo: "#password"
					},
					email: {
						required: true,
						email: true
					},
					topic: {
						required: "#newsletter:checked",
						minlength: 2
					},
					agree: "required"
				},
				messages: {
					firstname: "Please enter your firstname",
					lastname: "Please enter your lastname",
					username: {
						required: "Ingresa tu nombre de usuario",
						minlength: "Tu nombre de usuario debe contener al menos 1 carácter"
					},
					password: {
						required: "Ingresa tu contraseña",
						minlength: "Tu contraseña debe tener al menos 1 carácter de longitud"
					},
					confirm_password: {
						required: "Please provide a password",
						minlength: "Your password must be at least 5 characters long",
						equalTo: "Please enter the same password as above"
					},
					email: "Please enter a valid email address",
					agree: "Please accept our policy"
				}
			});
	});
		</script>
</head>
  <body>
    <div class="container">
      <div class="row">
   		<div class="col-lg-offset-4 col-lg-4  col-md-offset-4 col-md-4 col-xs-4" style="margin-top:100px">
   			<div class="block-unit" style="text-align:center; padding:8px 8px 8px 8px;">
					<form class="cmxform" id="signupForm" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="POST">
						<fieldset>
							<p>
                <div class="input-group">
                  <span class="input-group-addon"><i class="icon ion-ios-people"></i></span>
                  <input class="form-control text-center" id="username" name="username" type="text" placeholder="Usuario" autofocus>
                </div>
                <p></p>
                <div class="input-group">
                  <span class="input-group-addon"><i class="icon ion-ios-unlocked"></i></span>
                  <input class="form-control text-center" id="password" name="password" type="password" placeholder="Contraseña">
                </div>
							</p>
              <?php
    					if(!empty($errores)):?>
    						<div class="alert alert-warning" role="alert">
    							<i class="icon ion-alert"></i> <?php echo $errores;?></div>
    					<?php endif;?>
								<input class="submit btn-success btn btn-large" type="submit" value="Ingresar">
						</fieldset>
					</form>
   			</div>
   		</div>
    </div>
    </div>
    <script type="text/javascript" src="js/bootstrap.js"></script>
  </body>
</html>
