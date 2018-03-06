/*
SQLyog Professional v12.4.1 (64 bit)
MySQL - 10.1.28-MariaDB : Database - polizas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`polizas` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;

USE `polizas`;

/*Table structure for table `alerta_vencimiento` */

DROP TABLE IF EXISTS `alerta_vencimiento`;

CREATE TABLE `alerta_vencimiento` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idAlerta` int(11) NOT NULL,
  `idPolizaAlerta` int(11) NOT NULL,
  `fechaAlerta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `emailNotificacion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idFila_UNIQUE` (`idRow`),
  UNIQUE KEY `idAlerta_UNIQUE` (`idAlerta`),
  KEY `idPolizaAlerta_idx` (`idPolizaAlerta`),
  CONSTRAINT `idPolizaAlerta` FOREIGN KEY (`idPolizaAlerta`) REFERENCES `poliza` (`idPoliza`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `alerta_vencimiento` */

/*Table structure for table `aseguradora` */

DROP TABLE IF EXISTS `aseguradora`;

CREATE TABLE `aseguradora` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idAseguradora` int(11) NOT NULL,
  `nombreAseguradora` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nitAseguradora` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefonoAseguradora` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contactoAseguradora` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefonoContactoAseguradora` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correoContactoAseguradora` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `IdAseguradora_UNIQUE` (`idAseguradora`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `aseguradora` */

insert  into `aseguradora`(`idRow`,`idAseguradora`,`nombreAseguradora`,`nitAseguradora`,`telefonoAseguradora`,`contactoAseguradora`,`telefonoContactoAseguradora`,`correoContactoAseguradora`) values 
(1,1,'Previsora','5000000','2556699','Julian','8459678','julian@live.com');

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `primerNombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoNombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerApellido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoApellido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NIT` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerNombreRepresentante` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoNombreRepresentante` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerApellidoRepresentante` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoApellidoRepresentante` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idRepresentanteLegal` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoPersona` int(11) NOT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idCliente_UNIQUE` (`idCliente`),
  KEY `fk_tipoPersona_idx` (`tipoPersona`),
  CONSTRAINT `fk_tipoPersona` FOREIGN KEY (`tipoPersona`) REFERENCES `tipopersona` (`idTipoPersona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `cliente` */

insert  into `cliente`(`idRow`,`idCliente`,`primerNombre`,`segundoNombre`,`primerApellido`,`segundoApellido`,`telefono`,`direccion`,`email`,`NIT`,`primerNombreRepresentante`,`segundoNombreRepresentante`,`primerApellidoRepresentante`,`segundoApellidoRepresentante`,`idRepresentanteLegal`,`tipoPersona`) values 
(1,43559647,'Juan',NULL,'Velasquez','Berrio','2569874','Calle 53 #53-95','juan@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1);

/*Table structure for table `documentacion_cliente` */

DROP TABLE IF EXISTS `documentacion_cliente`;

CREATE TABLE `documentacion_cliente` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idDocumentacionCliente` int(11) NOT NULL,
  `idDocumentacionRequerida` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `nombreArchivoFisico` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaCargaDocumento` datetime DEFAULT NULL,
  `idUsuarioCargaDocumento` int(11) NOT NULL,
  PRIMARY KEY (`idRow`),
  KEY `fk_DocumentacionRequerida_idx` (`idDocumentacionRequerida`),
  KEY `fk_idCliente_idx` (`idCliente`),
  KEY `fk_idUsuarioCargaDocumento_idx` (`idUsuarioCargaDocumento`),
  CONSTRAINT `fk_DocumentacionRequerida` FOREIGN KEY (`idDocumentacionRequerida`) REFERENCES `documentacion_requerida` (`idDocumentacionRequerida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idRow`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuarioCargaDocumento` FOREIGN KEY (`idUsuarioCargaDocumento`) REFERENCES `lawyer` (`idLawyer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `documentacion_cliente` */

insert  into `documentacion_cliente`(`idRow`,`idDocumentacionCliente`,`idDocumentacionRequerida`,`idCliente`,`nombreArchivoFisico`,`fechaCargaDocumento`,`idUsuarioCargaDocumento`) values 
(6,0,1,1,'1_20180301045409.jpeg','2018-02-28 22:54:09',1),
(7,1,4,1,'4_20180301050436.pdf','2018-02-28 23:04:36',1),
(8,2,3,1,'3_20180301050531.jpeg','2018-02-28 23:05:31',1),
(9,3,2,1,'2_20180301050621.jpeg','2018-02-28 23:06:21',1),
(10,4,8,1,'8_20180301051018.pdf','2018-02-28 23:10:18',1),
(11,5,5,1,'5_20180301061957.pdf','2018-03-01 00:19:57',2);

/*Table structure for table `documentacion_requerida` */

DROP TABLE IF EXISTS `documentacion_requerida`;

CREATE TABLE `documentacion_requerida` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idDocumentacionRequerida` int(11) NOT NULL,
  `nombreDocumento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombreVisible` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcionDocumento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `personaAplica` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estadoRequerida` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idDocumentacionRequerida_UNIQUE` (`idDocumentacionRequerida`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `documentacion_requerida` */

insert  into `documentacion_requerida`(`idRow`,`idDocumentacionRequerida`,`nombreDocumento`,`nombreVisible`,`descripcionDocumento`,`personaAplica`,`estadoRequerida`) values 
(1,1,'SLIP','SLIP',NULL,'A','S'),
(2,2,'Contrato de concesión minera','CONCESION_MINERA',NULL,'A','S'),
(3,3,'Certificado RMN / Cesión','RMN',NULL,'A','S'),
(4,4,'Regalías / Canon','CANON',NULL,'A','S'),
(5,5,'FBM','FBM',NULL,'A','S'),
(6,6,'Última póliza','POLIZA',NULL,'A','S'),
(7,7,'Última visita de fiscalización','FISCALIZACION',NULL,'A','S'),
(8,8,'Cédula','CEDULA',NULL,'A','S'),
(9,9,'Declaración de renta','RENTA',NULL,'N','S'),
(10,10,'Certificado de ingresos por contador','CERT_INGRESOS',NULL,'N','S'),
(11,11,'Tarjeta profesional del contador','TP_CONTADOR',NULL,'N','S'),
(12,12,'Extractos bancarios','EXT_BANCO','Extractos bancarios del último semestre','N','S'),
(13,13,'Certificado de existencia ','EXISTENCIA',NULL,'J','S'),
(14,14,'Cédula representante','CED_REP',NULL,'J','S'),
(15,15,'Estados financieros','ESTADOS',NULL,'J','S'),
(16,16,'P&G','PG',NULL,'J','S'),
(17,17,'RUT','RUT','Registro Unico Tributario','J','S'),
(18,18,'OTRO OTRO','OTRO OTRA','HOLAAA','A','N');

/*Table structure for table `etapa_titulo_minero` */

DROP TABLE IF EXISTS `etapa_titulo_minero`;

CREATE TABLE `etapa_titulo_minero` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idEtapaTituloMinero` int(11) NOT NULL,
  `etapaTituloMinero` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentajeLiquidacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idEtapaTituloMinero_UNIQUE` (`idEtapaTituloMinero`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `etapa_titulo_minero` */

insert  into `etapa_titulo_minero`(`idRow`,`idEtapaTituloMinero`,`etapaTituloMinero`,`porcentajeLiquidacion`) values 
(1,1,'Exploración','5'),
(2,2,'Construcción y montaje','5'),
(3,3,'Explotación','10');

/*Table structure for table `lawyer` */

DROP TABLE IF EXISTS `lawyer`;

CREATE TABLE `lawyer` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idLawyer` int(11) NOT NULL,
  `username` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(32) COLLATE utf8_spanish_ci NOT NULL,
  `emailL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerNombreL` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoNombreL` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerApellidoL` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoApellidoL` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celularL` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idLawyer_UNIQUE` (`idLawyer`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`),
  KEY `tipo_usuario_idx` (`permission`),
  CONSTRAINT `fk_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `lawyer` */

insert  into `lawyer`(`idRow`,`idLawyer`,`username`,`pass`,`emailL`,`primerNombreL`,`segundoNombreL`,`primerApellidoL`,`segundoApellidoL`,`celularL`,`create_time`,`permission`) values 
(1,1,'carlos','123','carlos@gmail.com','Carlos','Andrés','Vasco','Bastidas','3193892764','2018-02-28 21:28:29',3),
(2,2,'sergio','123','sergio@gmail.com','Sergio',NULL,NULL,NULL,NULL,'2018-02-28 21:28:29',3),
(3,3,'iza','123','iza@gmail.com','Elizabeth',NULL,NULL,NULL,NULL,'2018-02-28 21:28:29',2),
(4,4,'perla','123','perla@gmail.com','Perla',NULL,NULL,NULL,NULL,'2018-02-28 21:28:29',1),
(5,9875465,'juan','123','juan','Juan','Pedro','Arango','','','2018-02-28 21:28:29',3),
(6,32569874,'maria','123','','Maria','','','','','2018-02-28 21:31:47',3),
(7,654789,'luis','564789','luis','Luis','Fernando','Arango','Zapata','','2018-02-28 21:33:14',1),
(8,654321,'hdh','dtr','','kjh','kjh','kjh','','','2018-02-28 21:42:44',3),
(9,3659841,'ana','56974','','Ana','Maria','jh','','','2018-02-28 22:37:00',1);

/*Table structure for table `mineral` */

DROP TABLE IF EXISTS `mineral`;

CREATE TABLE `mineral` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idMineral` int(11) NOT NULL,
  `nombreMineral` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoMineral` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precioMineralM` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idFila_UNIQUE` (`idRow`),
  UNIQUE KEY `idMineral_UNIQUE` (`idMineral`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `mineral` */

insert  into `mineral`(`idRow`,`idMineral`,`nombreMineral`,`tipoMineral`,`precioMineralM`) values 
(1,1,'Oro','Metálico','98265.65'),
(2,2,'Plata','Metálico','1262.39'),
(3,3,'Platino','Metálico','73103.90'),
(4,4,'Níquel',NULL,NULL),
(5,5,'Carbón',NULL,NULL),
(6,6,'Cobre',NULL,NULL);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoUsuario` int(11) NOT NULL,
  `TipoUsuario` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idTipoUsuario_UNIQUE` (`idTipoUsuario`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `permission` */

insert  into `permission`(`idRow`,`idTipoUsuario`,`TipoUsuario`) values 
(1,1,'Ver'),
(2,2,'Modificar'),
(3,3,'Todos');

/*Table structure for table `poliza` */

DROP TABLE IF EXISTS `poliza`;

CREATE TABLE `poliza` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idPoliza` int(11) NOT NULL,
  `idMineral` int(11) NOT NULL,
  `precioMineral` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tituloMinero` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `etapaTituloMinero` int(11) NOT NULL,
  `codigoRMN` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `numeroPoliza` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idAseguradora` int(11) NOT NULL,
  `gastosExpedicion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaAdquisicion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaVencimiento` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valorAsegurado` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentajePrima` varchar(255) COLLATE utf8_spanish_ci DEFAULT '5',
  `prima` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tasaParaComision` varchar(255) COLLATE utf8_spanish_ci DEFAULT '30',
  `valorComision` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentajeRetencion` varchar(255) COLLATE utf8_spanish_ci DEFAULT '0.11',
  `totalRetencion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentajeAsesor` varchar(255) COLLATE utf8_spanish_ci DEFAULT '30',
  `totalAsesor` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `porcentajeEmpresa` varchar(255) COLLATE utf8_spanish_ci DEFAULT '70',
  `totalEmpresa` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idLawyer` int(11) NOT NULL,
  `renovacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaRenovacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idPoliza_UNIQUE` (`idPoliza`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`),
  KEY `idLawyer_idx` (`idLawyer`),
  KEY `etapaTituloMinero_idx` (`etapaTituloMinero`),
  KEY `idCliente_idx` (`idCliente`),
  KEY `idAseguradora` (`idAseguradora`),
  KEY `idMineral` (`idMineral`),
  CONSTRAINT `etapaTituloMinero` FOREIGN KEY (`etapaTituloMinero`) REFERENCES `etapa_titulo_minero` (`idEtapaTituloMinero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idAseguradora` FOREIGN KEY (`idAseguradora`) REFERENCES `aseguradora` (`idAseguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idRow`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idLawyer` FOREIGN KEY (`idLawyer`) REFERENCES `lawyer` (`idLawyer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idMineral` FOREIGN KEY (`idMineral`) REFERENCES `mineral` (`idMineral`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `poliza` */

insert  into `poliza`(`idRow`,`idPoliza`,`idMineral`,`precioMineral`,`tituloMinero`,`etapaTituloMinero`,`codigoRMN`,`idCliente`,`numeroPoliza`,`idAseguradora`,`gastosExpedicion`,`fechaAdquisicion`,`fechaVencimiento`,`valorAsegurado`,`porcentajePrima`,`prima`,`tasaParaComision`,`valorComision`,`porcentajeRetencion`,`totalRetencion`,`porcentajeAsesor`,`totalAsesor`,`porcentajeEmpresa`,`totalEmpresa`,`observaciones`,`idLawyer`,`renovacion`,`fechaRenovacion`) values 
(1,1,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(2,2,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(3,3,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(4,4,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(5,5,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(6,6,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(7,7,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL),
(8,8,1,NULL,'001-002',1,'CAV-0001',1,'256987',1,NULL,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL);

/*Table structure for table `tipopersona` */

DROP TABLE IF EXISTS `tipopersona`;

CREATE TABLE `tipopersona` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoPersona` int(11) NOT NULL,
  `tipoPersona` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idTipoPersona_UNIQUE` (`idTipoPersona`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `tipopersona` */

insert  into `tipopersona`(`idRow`,`idTipoPersona`,`tipoPersona`) values 
(1,1,'Natural'),
(2,2,'Jurídico');

/*Table structure for table `access` */

DROP TABLE IF EXISTS `access`;

/*!50001 DROP VIEW IF EXISTS `access` */;
/*!50001 DROP TABLE IF EXISTS `access` */;

/*!50001 CREATE TABLE  `access`(
 `idLawyer` int(11) ,
 `username` varchar(16) ,
 `pass` varchar(32) ,
 `TipoUsuario` varchar(45) 
)*/;

/*Table structure for table `polizas` */

DROP TABLE IF EXISTS `polizas`;

/*!50001 DROP VIEW IF EXISTS `polizas` */;
/*!50001 DROP TABLE IF EXISTS `polizas` */;

/*!50001 CREATE TABLE  `polizas`(
 `idpoliza` int(11) ,
 `nombreMineral` varchar(255) ,
 `precioMineral` varchar(255) ,
 `tituloMinero` varchar(255) ,
 `etapaTituloMinero` varchar(45) ,
 `porcentajeLiquidacion` varchar(45) ,
 `codigoRMN` varchar(255) ,
 `idCliente` int(11) ,
 `idRepresentanteLegal` varchar(255) ,
 `NIT` varchar(255) ,
 `primerNombre` varchar(45) ,
 `segundoNombre` varchar(45) ,
 `primerApellido` varchar(45) ,
 `segundoApellido` varchar(45) ,
 `tipoPersona` varchar(45) ,
 `telefono` varchar(255) ,
 `direccion` varchar(255) ,
 `email` varchar(255) ,
 `primerApellidoRepresentante` varchar(255) ,
 `segundoApellidoRepresentante` varchar(255) ,
 `primerNombreRepresentante` varchar(255) ,
 `segundoNombreRepresentante` varchar(255) ,
 `numeroPoliza` varchar(255) ,
 `nombreAseguradora` varchar(255) ,
 `fechaAdquisicion` varchar(45) ,
 `fechaVencimiento` varchar(45) ,
 `valorAsegurado` varchar(255) ,
 `porcentajePrima` varchar(255) ,
 `prima` varchar(255) ,
 `tasaParaComision` varchar(255) ,
 `valorComision` varchar(255) ,
 `porcentajeRetencion` varchar(255) ,
 `totalRetencion` varchar(255) ,
 `porcentajeAsesor` varchar(255) ,
 `totalAsesor` varchar(255) ,
 `porcentajeEmpresa` varchar(255) ,
 `totalEmpresa` varchar(255) ,
 `gastosExpedicion` varchar(255) ,
 `observaciones` varchar(255) ,
 `primerApellidoL` varchar(45) ,
 `segundoApellidoL` varchar(45) ,
 `primerNombreL` varchar(45) ,
 `segundoNombreL` varchar(45) ,
 `renovacion` varchar(45) ,
 `fechaRenovacion` varchar(45) 
)*/;

/*View structure for view access */

/*!50001 DROP TABLE IF EXISTS `access` */;
/*!50001 DROP VIEW IF EXISTS `access` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `access` AS (select `l`.`idLawyer` AS `idLawyer`,`l`.`username` AS `username`,`l`.`pass` AS `pass`,`p`.`TipoUsuario` AS `TipoUsuario` from (`lawyer` `l` join `permission` `p` on((`p`.`idTipoUsuario` = `l`.`permission`)))) */;

/*View structure for view polizas */

/*!50001 DROP TABLE IF EXISTS `polizas` */;
/*!50001 DROP VIEW IF EXISTS `polizas` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `polizas` AS (select `p`.`idPoliza` AS `idpoliza`,`m`.`nombreMineral` AS `nombreMineral`,`p`.`precioMineral` AS `precioMineral`,`p`.`tituloMinero` AS `tituloMinero`,`etm`.`etapaTituloMinero` AS `etapaTituloMinero`,`etm`.`porcentajeLiquidacion` AS `porcentajeLiquidacion`,`p`.`codigoRMN` AS `codigoRMN`,`c`.`idCliente` AS `idCliente`,`c`.`idRepresentanteLegal` AS `idRepresentanteLegal`,`c`.`NIT` AS `NIT`,coalesce(`c`.`primerNombre`,'') AS `primerNombre`,coalesce(`c`.`segundoNombre`,'') AS `segundoNombre`,coalesce(`c`.`primerApellido`,'') AS `primerApellido`,coalesce(`c`.`segundoApellido`,'') AS `segundoApellido`,`tp`.`tipoPersona` AS `tipoPersona`,`c`.`telefono` AS `telefono`,`c`.`direccion` AS `direccion`,`c`.`email` AS `email`,coalesce(`c`.`primerApellidoRepresentante`,'') AS `primerApellidoRepresentante`,coalesce(`c`.`segundoApellidoRepresentante`,'') AS `segundoApellidoRepresentante`,coalesce(`c`.`primerNombreRepresentante`,'') AS `primerNombreRepresentante`,coalesce(`c`.`segundoNombreRepresentante`,'') AS `segundoNombreRepresentante`,`p`.`numeroPoliza` AS `numeroPoliza`,`a`.`nombreAseguradora` AS `nombreAseguradora`,`p`.`fechaAdquisicion` AS `fechaAdquisicion`,`p`.`fechaVencimiento` AS `fechaVencimiento`,`p`.`valorAsegurado` AS `valorAsegurado`,`p`.`porcentajePrima` AS `porcentajePrima`,`p`.`prima` AS `prima`,`p`.`tasaParaComision` AS `tasaParaComision`,`p`.`valorComision` AS `valorComision`,`p`.`porcentajeRetencion` AS `porcentajeRetencion`,`p`.`totalRetencion` AS `totalRetencion`,`p`.`porcentajeAsesor` AS `porcentajeAsesor`,`p`.`totalAsesor` AS `totalAsesor`,`p`.`porcentajeEmpresa` AS `porcentajeEmpresa`,`p`.`totalEmpresa` AS `totalEmpresa`,`p`.`gastosExpedicion` AS `gastosExpedicion`,coalesce(`p`.`observaciones`,'') AS `observaciones`,coalesce(`l`.`primerApellidoL`,'') AS `primerApellidoL`,coalesce(`l`.`segundoApellidoL`,'') AS `segundoApellidoL`,coalesce(`l`.`primerNombreL`,'') AS `primerNombreL`,coalesce(`l`.`segundoNombreL`,'') AS `segundoNombreL`,`p`.`renovacion` AS `renovacion`,`p`.`fechaRenovacion` AS `fechaRenovacion` from ((((((`poliza` `p` join `mineral` `m` on((`p`.`idMineral` = `m`.`idMineral`))) join `etapa_titulo_minero` `etm` on((`p`.`etapaTituloMinero` = `etm`.`idEtapaTituloMinero`))) join `cliente` `c` on((`p`.`idCliente` = `c`.`idRow`))) join `aseguradora` `a` on((`p`.`idAseguradora` = `a`.`idAseguradora`))) join `lawyer` `l` on((`p`.`idLawyer` = `l`.`idLawyer`))) join `tipopersona` `tp` on((`tp`.`idTipoPersona` = `c`.`tipoPersona`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
