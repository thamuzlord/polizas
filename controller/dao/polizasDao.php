<?php
//include_once str_replace("/Controlador", "", $absolute_path) . '/controller/cnx/ClassPDO.php';
include_once BASEPATH . '/controller/cnx/ClassPDO.php';
class PolizasDao {

  function DocumentacionCliente(){
    $pdo = new ClassPDO();
    $sql = "SELECT dr.nombreDocumento,dc.* FROM documentacion_cliente dc INNER JOIN documentacion_requerida dr";
    //error_log($sql ,0);
    return $pdo->Consulta($sql, "S", "ASSOC");
  }

}
