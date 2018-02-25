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
  UNIQUE KEY `idFila_UNIQUE` (`idRow`),
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
  CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuarioCargaDocumento` FOREIGN KEY (`idUsuarioCargaDocumento`) REFERENCES `lawyer` (`idLawyer`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `documentacion_cliente` */

insert  into `documentacion_cliente`(`idRow`,`idDocumentacionCliente`,`idDocumentacionRequerida`,`idCliente`,`nombreArchivoFisico`,`fechaCargaDocumento`,`idUsuarioCargaDocumento`) values 
(1,1,1,43559647,'slip_22/02/2018 10:31','0000-00-00 00:00:00',1);

/*Table structure for table `documentacion_requerida` */

DROP TABLE IF EXISTS `documentacion_requerida`;

CREATE TABLE `documentacion_requerida` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idDocumentacionRequerida` int(11) NOT NULL,
  `nombreDocumento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcionDocumento` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `personaAplica` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estadoRequerida` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idDocumentacionRequerida_UNIQUE` (`idDocumentacionRequerida`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `documentacion_requerida` */

insert  into `documentacion_requerida`(`idRow`,`idDocumentacionRequerida`,`nombreDocumento`,`descripcionDocumento`,`personaAplica`,`estadoRequerida`) values 
(1,1,'SLIP',NULL,'A','S'),
(2,2,'Contrato de concesión minera',NULL,'A','S'),
(3,3,'Certificado RMN / Cesión',NULL,'A','S'),
(4,4,'Regalías / Canon',NULL,'A','S'),
(5,5,'FBM',NULL,'A','S'),
(6,6,'Última póliza',NULL,'A','S'),
(7,7,'Última visita de fiscalización',NULL,'A','S'),
(8,8,'Cédula',NULL,'A','S'),
(9,9,'Declaración de renta',NULL,'N','S'),
(10,10,'Certificado de ingresos por contador',NULL,'N','S'),
(11,11,'Tarjeta profesional del contador',NULL,'N','S'),
(12,12,'Extractos bancarios','Extractos bancarios del último semestre','N','S'),
(13,13,'Certificado de existencia ',NULL,'J','S'),
(14,14,'Cédula representante',NULL,'J','S'),
(15,15,'Estados financieros',NULL,'J','S'),
(16,16,'P&G',NULL,'J','S'),
(17,17,'RUT','Registro Unico Tributario','J','S');

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
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerNombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoNombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primerApellido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundoApellido` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `celular` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `permission` int(11) NOT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idLawyer_UNIQUE` (`idLawyer`),
  UNIQUE KEY `idRow_UNIQUE` (`idRow`),
  KEY `tipo_usuario_idx` (`permission`),
  CONSTRAINT `fk_permission` FOREIGN KEY (`permission`) REFERENCES `permission` (`idTipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `lawyer` */

insert  into `lawyer`(`idRow`,`idLawyer`,`username`,`pass`,`email`,`primerNombre`,`segundoNombre`,`primerApellido`,`segundoApellido`,`celular`,`create_time`,`permission`) values 
(1,1,'carlos','123','carlos@gmail.com','Carlos','Andrés','Vasco','Bastidas','3193892764',NULL,3),
(2,2,'sergio','123','sergio@gmail.com','Sergio',NULL,NULL,NULL,NULL,NULL,3),
(3,3,'iza','123','iza@gmail.com','Elizabeth',NULL,NULL,NULL,NULL,NULL,2),
(4,4,'perla','123','perla@gmail.com','Perla',NULL,NULL,NULL,NULL,NULL,1);

/*Table structure for table `mineral` */

DROP TABLE IF EXISTS `mineral`;

CREATE TABLE `mineral` (
  `idRow` int(11) NOT NULL AUTO_INCREMENT,
  `idMineral` int(11) NOT NULL,
  `nombreMineral` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipoMineral` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precioMineral` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idRow`),
  UNIQUE KEY `idFila_UNIQUE` (`idRow`),
  UNIQUE KEY `idMineral_UNIQUE` (`idMineral`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `mineral` */

insert  into `mineral`(`idRow`,`idMineral`,`nombreMineral`,`tipoMineral`,`precioMineral`) values 
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
(1,1,'View'),
(2,2,'Modify'),
(3,3,'All');

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
  KEY `idCliente` (`idCliente`),
  KEY `idAseguradora` (`idAseguradora`),
  KEY `idMineral` (`idMineral`),
  CONSTRAINT `etapaTituloMinero` FOREIGN KEY (`etapaTituloMinero`) REFERENCES `etapa_titulo_minero` (`idEtapaTituloMinero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idAseguradora` FOREIGN KEY (`idAseguradora`) REFERENCES `aseguradora` (`idAseguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idLawyer` FOREIGN KEY (`idLawyer`) REFERENCES `lawyer` (`idLawyer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idMineral` FOREIGN KEY (`idMineral`) REFERENCES `mineral` (`idMineral`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*Data for the table `poliza` */

insert  into `poliza`(`idRow`,`idPoliza`,`idMineral`,`precioMineral`,`tituloMinero`,`etapaTituloMinero`,`codigoRMN`,`idCliente`,`numeroPoliza`,`idAseguradora`,`fechaAdquisicion`,`fechaVencimiento`,`valorAsegurado`,`porcentajePrima`,`prima`,`tasaParaComision`,`valorComision`,`porcentajeRetencion`,`totalRetencion`,`porcentajeAsesor`,`totalAsesor`,`porcentajeEmpresa`,`totalEmpresa`,`observaciones`,`idLawyer`,`renovacion`,`fechaRenovacion`) values 
(1,1,1,NULL,'001-002',1,'CAV-0001',43559647,'256987',1,'01/01/2018','12/12/2018','30000000','5','1500000','30','450000','0.11','49500','30','120150','70','280350',NULL,1,NULL,NULL);

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

/*View structure for view access */

/*!50001 DROP TABLE IF EXISTS `access` */;
/*!50001 DROP VIEW IF EXISTS `access` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `access` AS (select `l`.`idLawyer` AS `idLawyer`,`l`.`username` AS `username`,`l`.`pass` AS `pass`,`p`.`TipoUsuario` AS `TipoUsuario` from (`lawyer` `l` join `permission` `p` on((`p`.`idTipoUsuario` = `l`.`permission`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
