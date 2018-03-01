<?php
echo "
    <section class='content-header'>
      <a href='mods.php?name=".$_GET["name"]."&mod=inicio' title='Inicio' class='btn btn-sm outlinemod'><i class='ion-ios-home-outline'></i> Inicio</a>
      <a onClick='newclient()' title='Nuevo Cliente' class='btn btn-sm outlinemod'><i class='ion-person-add'></i> Nuevo Cliente</a>
      <a onClick='newclient()' title='Nueva Aseguradora' class='btn btn-sm outlinemod'><i class='ion-medkit'></i> Nueva Aseguradora</a>
      <a onClick='newclient()' title='Nuevo Mineral' class='btn btn-sm outlinemod'><i class='ion-hammer'></i> Nuevo Mineral</a>
    </section>
  ";
?>
