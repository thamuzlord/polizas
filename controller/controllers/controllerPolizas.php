<?php
include_once BASEPATH . '/controller/dao/polizasDao.php';
class PolizasController {
  private $PolizasDao;
  /*AL CREAR EL OBJETO DEL MANEJADOR SE CREA EL OBJETO DAO*/
  function __construct() {
    $this->PolizasDao = new PolizasDao();
  }
  /*ESTA FUNCION ES LA ENCARGADA DE DECIDIR QUE ACCION O FUNCION SE DEBE EJECUTAR*/
  function Index($cmd) {
    switch ($cmd) {
      case "DocumentacionCliente":
      $this->DocumentacionCliente();
      break;

      case "tablePolicies":
      $this->tablePolicies();
      break;
    }
  }
  public function DocumentacionCliente() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->DocumentacionCliente();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function tablePolicies() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->tablePolicies();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

}
