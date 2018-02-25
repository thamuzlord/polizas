<?php
session_start();
if(isset($_SESSION['usuario'])){
  header('location:mods.php?name=home');}
else{
  header('location:sessionstart.php');}
?>
