<?php
//Verifica si un archivo existe
function existe($ruta){
   $id = @fopen($ruta,"r");
   if ($id) $abierto = true;
   else $abierto = false;
   return $abierto;
   fclose($id);
}

//Error = IMPRIME UN ERROR
function error(){
  echo'<center><p>Hubo un error al procesar tu solicitud, por favor intentalo de nuevo más tarde.</p></center>';
}

?>
