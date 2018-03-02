<?php
  echo "<!doctype html>";
  echo "<html>";
//require_once('Configuracion/session.php');
//$Session=new Session();
//$Session->SessionActiva();
//Con la variable name obtengo la ruta del modulo
  @$mod=$_GET["name"];
  //$tipo=$_SESSION['tipousuario'];
//Aqui llamamos a toda la estructura antes del bloque central
  include("bloks/funciones.php");
  include("bloks/head.php");
//NAVIGATION MENU
  echo "<body>";
  include("bloks/main_menu.php");
  echo "<div class='container'>";
//Esta funcion verifica que en la carpeta modulos exista otra carpeta con nombre $mod y dentro de esta un archivo index.php
  function ver($mod)
  {
    //abrimos el archivo en lectura
    $id = @fopen("mods/".$mod."/index.php","r");
    //hacemos las comprobaciones
    if ($id) $abierto = true;
    else $abierto = false;
    //devolvemos el valor
    return $abierto;
    //cerramos el archivo
    fclose($id);
  }
//Verificamos que el modulo exista
  $abierto=ver($mod);
  if($abierto){
    //Llamamos al archivo index.php del modulo este es el archivo predeterminado
      include("mods/".$mod."/index.php");
    }else {
      echo "<p>Lo sentimos, este módulo no está disponible</p>";
    }
  echo "</div>"; //<!-- /container -->
  include("bloks/scripts.php");
  echo "</body>";
  echo "</html>";
?>
