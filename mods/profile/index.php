<?php
@$mod=$_GET["mod"];
$name=$_GET["name"];
include("bloks/menu.php");
//INICIO DEL CONTENIDO
//Lo que hace esto es casi lo mismo que el modulos.php pero solo para la carpeta mods del modulo actual
function veru($mo)
{
    //abrimos el archivo en lectura
    $id = @fopen("mods/".$_GET["name"]."/mods/".$mo.".php","r");
    //hacemos las comprobaciones
    if ($id) $abierto = true;
    else $abierto = false;
    //devolvemos el valor
    return $abierto;
    //cerramos el archivo
    fclose($id);
}

$abierto=veru($mod);

if($abierto){
    include("mods/".$name."/mods/".$mod.".php");}
else{
    //Si no existe el mod cargamos por defecto el inicio.php
    include("mods/".$name."/mods/inicio.php");
}
echo"</div>";
//FIN DEL CONTENIDO
?>
