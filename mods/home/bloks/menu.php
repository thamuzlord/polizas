<?php
echo "
    <section class='content-header'>
      <a href='mods.php?name=".$_GET["name"]."&mod=inicio' title='Inicio' class='btn btn-sm outlinemod'><i class='ion-ios-home-outline'></i> Inicio</a>
      <a onClick='newpoliza()' title='Nueva Poliza' class='btn btn-sm outlinemod'><i class='ion-clipboard'></i> Nueva Poliza</a>
      <a onClick='newclient();tipoPersona();' title='Nuevo Cliente' class='btn btn-sm outlinemod'><i class='ion-person-add'></i> Nuevo Cliente</a>
      <a onClick='newAseguradora()' title='Nueva Aseguradora' class='btn btn-sm outlinemod'><i class='ion-medkit'></i> Nueva Aseguradora</a>
      <a onClick='newclient()' title='Nuevo Mineral' class='btn btn-sm outlinemod'><i class='ion-hammer'></i> Nuevo Mineral</a>
    </section>
  ";
?>
