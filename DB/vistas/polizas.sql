
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `polizas`.`polizas` 
    AS
(SELECT
  `p`.`idPoliza`                AS `idpoliza`,
  `m`.`nombreMineral`           AS `nombreMineral`,
  `p`.`precioMineral`           AS `precioMineral`,
  `p`.`tituloMinero`            AS `tituloMinero`,
  `etm`.`etapaTituloMinero`     AS `etapaTituloMinero`,
  `etm`.`porcentajeLiquidacion` AS `porcentajeLiquidacion`,
  `p`.`codigoRMN`               AS `codigoRMN`,
  `c`.`idCliente`               AS `idCliente`,
  `c`.`idRepresentanteLegal`    AS `idRepresentanteLegal`,
  `c`.`NIT`                     AS `NIT`,
  COALESCE(`c`.`primerNombre`,'') AS `primerNombre`,
  COALESCE(`c`.`segundoNombre`,'') AS `segundoNombre`,
  COALESCE(`c`.`primerApellido`,'') AS `primerApellido`,
  COALESCE(`c`.`segundoApellido`,'') AS `segundoApellido`,
  `tp`.`tipoPersona`            AS `tipoPersona`,
  `c`.`telefono`                AS `telefono`,
  `c`.`direccion`               AS `direccion`,
  `c`.`email`                   AS `email`,
  COALESCE(`c`.`primerApellidoRepresentante`,'') AS `primerApellidoRepresentante`,
  COALESCE(`c`.`segundoApellidoRepresentante`,'') AS `segundoApellidoRepresentante`,
  COALESCE(`c`.`primerNombreRepresentante`,'') AS `primerNombreRepresentante`,
  COALESCE(`c`.`segundoNombreRepresentante`,'') AS `segundoNombreRepresentante`,
  `p`.`numeroPoliza`            AS `numeroPoliza`,
  `a`.`nombreAseguradora`       AS `nombreAseguradora`,
  `p`.`fechaAdquisicion`        AS `fechaAdquisicion`,
  `p`.`fechaVencimiento`        AS `fechaVencimiento`,
  `p`.`valorAsegurado`          AS `valorAsegurado`,
  `p`.`porcentajePrima`         AS `porcentajePrima`,
  `p`.`prima`                   AS `prima`,
  `p`.`tasaParaComision`        AS `tasaParaComision`,
  `p`.`valorComision`           AS `valorComision`,
  `p`.`porcentajeRetencion`     AS `porcentajeRetencion`,
  `p`.`totalRetencion`          AS `totalRetencion`,
  `p`.`porcentajeAsesor`        AS `porcentajeAsesor`,
  `p`.`totalAsesor`             AS `totalAsesor`,
  `p`.`porcentajeEmpresa`       AS `porcentajeEmpresa`,
  `p`.`totalEmpresa`            AS `totalEmpresa`,
  `p`.`gastosExpedicion`        AS `gastosExpedicion`,
  COALESCE(`p`.`observaciones`,'') AS `observaciones`,
  COALESCE(`l`.`primerApellidoL`,'') AS `primerApellidoL`,
  COALESCE(`l`.`segundoApellidoL`,'') AS `segundoApellidoL`,
  COALESCE(`l`.`primerNombreL`,'') AS `primerNombreL`,
  COALESCE(`l`.`segundoNombreL`,'') AS `segundoNombreL`,
  `p`.`renovacion`              AS `renovacion`,
  `p`.`fechaRenovacion`         AS `fechaRenovacion`
FROM ((((((`poliza` `p`
        JOIN `mineral` `m`
          ON ((`p`.`idMineral` = `m`.`idMineral`)))
       JOIN `etapa_titulo_minero` `etm`
         ON ((`p`.`etapaTituloMinero` = `etm`.`idEtapaTituloMinero`)))
      JOIN `cliente` `c`
        ON ((`p`.`idCliente` = `c`.`idRow`)))
     JOIN `aseguradora` `a`
       ON ((`p`.`idAseguradora` = `a`.`idAseguradora`)))
    JOIN `lawyer` `l`
      ON ((`p`.`idLawyer` = `l`.`idLawyer`)))
   JOIN `tipopersona` `tp`
     ON ((`tp`.`idTipoPersona` = `c`.`tipoPersona`))));
