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

	  case "ListadoClientes":
        $this->ListadoClientes();
        break;
	  case "ListadoDocumentos":
        $this->ListadoDocumentos();
        break;

      case "ConsultarDocumentosCliente":
        $this->ConsultarDocumentosCliente();
        break;

      case "GuardarArchivo":
        $this->GuardarArchivo();
        break;

    case "tipoUsuario":
      $this->tipoUsuario();
      break;

    case "regUsuario":
      $this->regUsuario();
      break;

    case "infoAbogado":
      $this->infoAbogado();
      break;

    case "tipoPersona":
      $this->tipoPersona();
      break;
      
      /*DOCUMENTOS REQUERIDOS*/
      case "ListaDocumentosRequeridos":
        $this->ListaDocumentosRequeridos();
        break;

      case "RegistrarDocumentoRequerido":
        $this->RegistrarDocumentoRequerido();
        break;

      case "modificarDocumentoRequerido":
        $this->modificarDocumentoRequerido();
        break;
    }
  }
  public function DocumentacionCliente()
  {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";

    $Cliente = $_POST["Cliente"];
    $TipoCliente = $_POST["TipoCliente"];

    if( $TipoCliente==1){ $tipo = "N"; }else{ $tipo = "J"; }

    /*CONSULTAR LOS DOCUMENTOS REQUERIDOS*/
    $DocumentacionRequerida = $this->PolizasDao->DocumentacionRequerida($tipo);
    $DocumentacionCliente = $this->PolizasDao->DocumentacionCliente($Cliente);

    /*RETORNAR DATOS*/
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["DctosRequeridos"] = $DocumentacionRequerida;
    $return["DctosCliente"] = $DocumentacionCliente;
    echo json_encode($return);
  }

    public function ListadoDocumentos() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    $Cliente = $_POST["Cliente"];


    $Datos = $this->PolizasDao->ListadoDocumentos($Cliente);
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function ListadoClientes() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->ListadoClientes();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }
    public function ConsultarDocumentosCliente() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->ConsultarDocumentosCliente();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function GuardarArchivo()
  {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";

    /* VALIDAR SI EXISTE LA CARPETA DE ALMACENAMIENTO DEL PROVEDOR EXISTE */
    $fecha = $this->FormateoFecha();
    $idCliente = $_POST["Cliente"];
    $idDocumento  = $_POST['NombreArchivo'];

    /* SE EXTRAE LA EXTENSION Y SE ASIGNA EL NOMBRE DEL DOCUMENTO */
    $nombre_archivo=$_POST["NombreArchivo"]."_".$fecha.$_POST["Extension"];
    $nombre_carpeta = "C:/Polizas/".$idCliente."/Archivos/".$idDocumento."/";

    if (!file_exists($nombre_carpeta)) {
        /* SE CREA CARPETA CON PERMISOS DE ESCRITURA */
        mkdir($nombre_carpeta, 0777, true);
    }

    $this->PolizasDao->RegistrarArchivoCliente( $idCliente, $idDocumento, $nombre_archivo );

    if ($nombre_archivo != "")
    {
        $destino_formato = $nombre_carpeta."/".$nombre_archivo;
        if (copy( $_FILES["Archivo"]['tmp_name'],$destino_formato)) {$status = "1";}
    }

    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    //$return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function FormateoFecha()
  {
      $fecha = getdate();

      $anio = $fecha["year"];
      $mes = $fecha["mon"];
      $dia = $fecha["mday"];

      $hora = $fecha["hours"];
      $min = $fecha["minutes"];
      $seg = $fecha["seconds"];

      $hoy = $anio;
      $hoy .= $this->ContarCaracteres($mes);
      $hoy .= $this->ContarCaracteres($dia);
      $hoy .= $this->ContarCaracteres($hora);
      $hoy .= $this->ContarCaracteres($min);
      $hoy .= $this->ContarCaracteres($seg);

      return $hoy;
  }

  public function ContarCaracteres($dato)
  {
      if(strlen($dato)==1){
        $dato = "0".$dato;
      }

      return $dato;
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

  public function tipoUsuario() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->tipoUsuario();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function regUsuario() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    $idLawyer = $_POST["idLawyer"];
    $primerNombreL = $_POST["primerNombreL"];
    $segundoNombreL = $_POST["segundoNombreL"];
    $primerApellidoL = $_POST["primerApellidoL"];
    $segundoApellidoL = $_POST["segundoApellidoL"];
    $emailL = $_POST["emailL"];
    $username = $_POST["username"];
    $pass = $_POST["pass"];
    $permission = $_POST["permission"];
    $Datos = $this->PolizasDao->regUsuario($idLawyer,$primerNombreL,$segundoNombreL,$primerApellidoL,$segundoApellidoL,$emailL,$username,$pass,$permission);
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function infoAbogado() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->infoAbogado();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function tipoPersona() {
    /*LAS VARIABLES ERROR Y MENSAJE SE ESTABLECEN PARA EL CONTROL DE ERRORES*/
    $error = "N";
    $mensaje = "";
    //$variable = $_POST["variable"];
    $Datos = $this->PolizasDao->tipoPersona();
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
 }

  /*DOCUMENTOS REQUERIDOS*/
  public function ListaDocumentosRequeridos()
  {
    $error = "N";
    $mensaje = "";   
    $Datos = $this->PolizasDao->ListaDocumentosRequeridos();    
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function RegistrarDocumentoRequerido()
  {
    $error = "N";
    $mensaje = "";   
    $Datos = $this->PolizasDao->RegistrarDocumentoRequerido();    
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

  public function modificarDocumentoRequerido()
  {
    $error = "N";
    $mensaje = "";   
    $Datos = $this->PolizasDao->modificarDocumentoRequerido();    
    $return["Error"] = $error;
    $return["Mensaje"] = $mensaje;
    $return["Datos"] = $Datos;
    echo json_encode($return);
  }

}
