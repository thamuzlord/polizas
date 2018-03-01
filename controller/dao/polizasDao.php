<?php
//include_once str_replace("/Controlador", "", $absolute_path) . '/controller/cnx/ClassPDO.php';
include_once BASEPATH . '/controller/cnx/ClassPDO.php';
class PolizasDao {

function DocumentacionCliente($cliente){
    $pdo = new ClassPDO();
    $sql = " SELECT * FROM documentacion_cliente WHERE idCliente = '$cliente' ORDER BY idDocumentacionRequerida, fechaCargaDocumento desc ";
    //error_log($sql ,0);
    return $pdo->Consulta($sql, "S", "ASSOC");
  }

  function DocumentacionRequerida($tipoPersona)
  {
  	/*sergio*/

    $pdo = new ClassPDO();
    $sql = " SELECT * FROM documentacion_requerida WHERE personaAplica IN ('A', '$tipoPersona') AND  estadoRequerida='S' ORDER BY idDocumentacionRequerida ";
    //error_log($sql ,0);
    return $pdo->Consulta($sql, "S", "ASSOC");
  }


  function ListadoClientes(){
    $pdo = new ClassPDO();
    $sql = "SELECT CONCAT(c.primerNombre, ' ', COALESCE(c.segundoNombre, ''), COALESCE(c.primerApellido,''), ' ', COALESCE(c.segundoApellido,'')) AS NombreCliente, c.*  FROM cliente c ";
    //error_log($sql ,0);
    return $pdo->Consulta($sql, "S", "ASSOC");
  }



  function ConsultarDocumentosCliente()
  {
  	$pdo = new ClassPDO();
    $sql = 	"
				SELECT * FROM `documentacion_requerida`
				WHERE estadoRequerida = 'S' AND personaAplica IN ('A', 'N')
			";
    //error_log($sql ,0);
    $pdo->Consulta($sql, "S", "ASSOC");
  }

  function RegistrarArchivoCliente( $idCliente, $idDocumento, $nombre_archivo )
  {
  	$pdo = new ClassPDO();

  	$sql = " SELECT MAX(idDocumentacionCliente)+1 Consecutivo FROM  documentacion_cliente";
  	$consecutivo = $pdo->Consulta($sql, "S", "ASSOC");
  	$consecutivo = $consecutivo[0]["Consecutivo"];
  	$user = $_SESSION['usuario'];
  	$idUser= $_SESSION['idUser'];

    $sql = " INSERT INTO documentacion_cliente
    				(
						`idDocumentacionCliente`,
						`idDocumentacionRequerida`,
						`idCliente`,
						`nombreArchivoFisico`,
						`fechaCargaDocumento`,
						`idUsuarioCargaDocumento`
					)
					VALUES ( '$consecutivo', '$idDocumento', '$idCliente', '$nombre_archivo', NOW(), '$idUser')
		   ";
    //error_log($sql ,0);
    return $pdo->Consulta($sql, "N", "ASSOC");
  }

  function tablePolicies(){
    $pdo = new ClassPDO();
    $sql = "SELECT * FROM polizas";
    return $pdo->Consulta($sql, "S", "ASSOC");
  }

  function tipoUsuario(){
    $pdo = new ClassPDO();
    $sql = "SELECT * FROM permission";
    return $pdo->Consulta($sql, "S", "ASSOC");
  }

  function regUsuario($idLawyer,$primerNombreL,$segundoNombreL,$primerApellidoL,$segundoApellidoL,$emailL,$username,$pass,$permission){
    $pdo = new ClassPDO();
    $sql = "INSERT INTO lawyer (
    	idLawyer
    	,username
    	,pass
    	,emailL
    	,primerNombreL
    	,segundoNombreL
    	,primerApellidoL
    	,segundoApellidoL
    	,celularL
    	,permission
    	) VALUES (
        '$idLawyer',
        '$username',
        '$pass',
        '$emailL',
        '$primerNombreL',
        '$segundoNombreL',
        '$primerApellidoL',
        '$segundoApellidoL',
        '',
        '$permission'
    	)";
    return $pdo->Consulta($sql, "N", "ASSOC");
  }

  function infoAbogado(){
    $pdo = new ClassPDO();
    $idUser= $_SESSION['idUser'];
    $sql = "SELECT * FROM lawyer WHERE idLawyer = '$idUser'";
    return $pdo->Consulta($sql, "S", "ASSOC");
  }

}
