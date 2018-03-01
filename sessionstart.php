<?php
session_start();
session_cache_limiter('private_no_expire');
if(isset($_SESSION['usuario'])){
  header('location:mods/comein/comein.php');}
  $errores='';
  if($_SERVER['REQUEST_METHOD']=='POST'){
  	$username=filter_var(strtolower($_POST['username']),FILTER_SANITIZE_STRING);
  	$password=$_POST['password'];
  try{
    $conexion=new PDO('mysql:host=localhost;dbname=polizas','root','');}
  catch(PDOException $e){
  	echo "Error:".$e->getMessage();}
  $statement=$conexion->prepare('SELECT * FROM access WHERE username=:username AND pass=:password');
  $statement->execute(array(':username'=>$username,':password'=>$password));
  $resultado=$statement->fetch();
  //error_log(print_r($resultado,1),0);
  if($resultado!==false){
  	$_SESSION['usuario']=$username;
	  $_SESSION['idUser']=$resultado['idLawyer'];
  	header('location:mods.php?name=home');}
else{
	$errores.='Usuario o Contraseña Incorrectos</p>';}}
  require 'mods/comein/comein.php';
?>
