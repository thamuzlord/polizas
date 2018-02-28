
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `polizas`.`access` 
    AS
(SELECT
  `l`.`idLawyer`    AS `idLawyer`,
  `l`.`username`    AS `username`,
  `l`.`pass`        AS `pass`,
  `p`.`TipoUsuario` AS `TipoUsuario`
FROM (`lawyer` `l`
   JOIN `permission` `p`
     ON ((`p`.`idTipoUsuario` = `l`.`permission`))));
