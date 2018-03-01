<?php
//include_once BASEPATH . '/controller/cnx/ClassPDO.php';
session_start();
include_once '../../../controller/cnx/ClassPDO.php';
$extensiones = array("doc", "docx", "xls", "xlsx");


if(isset($_GET["arc"]))
{
	$id = $_GET["arc"];
	$pdo = new ClassPDO();
	$sql = " 	SELECT dc.*, dr.nombreVisible
				FROM documentacion_cliente dc
				INNER JOIN documentacion_requerida dr 
					ON dr.idDocumentacionRequerida= dc.idDocumentacionRequerida
				WHERE dc.idCliente = '1' AND dc.idRow = $id 
				";
	//error_log($sql ,0);

	$datos = $pdo->Consulta($sql, "S", "ASSOC");

	/* EXTENSION DEL ARCHIVO */
	/* LIMPIAR EL NOMBRE DEL DOCUMENTO SIN CARACTERES ESPECIALES */
	$_SESSION["nombreVisible"] = $datos[0]["nombreVisible"];
	$NombreDoc = $datos[0]["nombreArchivoFisico"];
	$idRequerido =  $datos[0]["idDocumentacionRequerida"];
	$nombre_descarga3=$NombreDoc;
	$_SESSION['DocumentoDescarga'] = $nombre_descarga3;
	$file = "C:/Polizas/1/Archivos/".$idRequerido;


	if (urlencode($file)) 
	{
		$_SESSION['RutaArchivoVerNombreArchivo']=$file;
		$_SESSION['RutaArchivoVer']=$file."/".$nombre_descarga3;
		$extension = explode(".", $_SESSION['RutaArchivoVer']);
		$_SESSION["extension"] = $extension = end($extension);

		if (file_exists($_SESSION['RutaArchivoVer']))
		{
			
			if (in_array(strtolower($extension), $extensiones)) {
    			header("location:?VerDocumento");
    			exit;
			}else{
				header("location:?VerArchivo");		
				exit;
			}
		}else{
			echo "El archivo no existe";
		}	
	}
}

if(isset($_GET["VerArchivo"]))
{
	//echo $_SESSION['RutaArchivoVer']." ".$_SESSION['DocumentoDescarga']; exit;
	header("Content-Type: "); 
	header("Content-Disposition: inline; filename=\"".trim($_SESSION['DocumentoDescarga'])."\"");
	header("Content-Transfer-Encoding: binary"); 	
	print_r(readfile($_SESSION['RutaArchivoVer']));
	exit;
}


if(isset($_GET["VerDocumento"]))
{
	header('Content-Description: File Transfer');
	header('Content-Type: application/octet-stream');
	header("Content-Type: application/force-download");
	header('Content-Disposition: attachment; filename='. strtolower($_SESSION["nombreVisible"]) . "." . $_SESSION["extension"]);
	// header('Content-Transfer-Encoding: binary');
	header('Expires: 0');
	header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
	header('Pragma: public');
	header('Content-Length: ' . filesize($_SESSION['RutaArchivoVer']));
	ob_clean();
	flush();
	readfile($file);
	exit;
}


?>