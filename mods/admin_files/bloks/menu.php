<?php
echo "
    <section class='content-header'>
      <a href='mods.php?name=".$_GET["name"]."&mod=inicio' title='Inicio' class='btn btn-sm outlinemod'><i class='ion-ios-home-outline'></i> Inicio</a>
      <a href='mods.php?name=".$_GET["name"]."&mod=upload_docs' title='Subir Documentación' class='btn btn-sm outlinemod'><i class='ion-ios-cloud-upload-outline'></i> Subir Documentación</a>
      <a href='mods.php?name=".$_GET["name"]."&mod=see_docs' title='Ver Documentos' class='btn btn-sm outlinemod'><i class='ion-ios-paper-outline'></i> Ver Documentos</a>
    </section>
  ";
?>
