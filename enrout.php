<?php
session_start();
$absolute_path = str_replace('\\', '/', dirname(__FILE__));
define('BASEPATH', $absolute_path);
if (!defined('BASEPATH')) {
    $contenido = "error404.html";
    exit('No direct script access allowed');
} else {
    include_once 'controller/controllers/controllerPolizas.php';
    $a = new PolizasController();
    if (isset($_REQUEST["cmd"])) {
        $cmd = $_REQUEST["cmd"];
    } else {
        $cmd = "Index";
    }
    $a->Index($cmd);
}