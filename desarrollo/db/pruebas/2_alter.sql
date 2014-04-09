ALTER TABLE mzt_ref_grupo ADD rfg_cortpost VARCHAR(30) AFTER mzt_cliprod_cpr_id;

ALTER TABLE mzt_trazabilidad ADD tra_prueba2 VARCHAR(45)  default NULL AFTER tra_pruebarealizo;
ALTER TABLE mzt_trazabilidad ADD tra_prueba2result VARCHAR(45)  default NULL AFTER tra_prueba2;
ALTER TABLE mzt_trazabilidad ADD tra_pruebarealizo2 VARCHAR(45)  default NULL AFTER tra_prueba2result;

PARA GUARDAR EL ID DEL MARCO, EN EL PROCESO GRABADO POR ESTO SE AGREGA ESTE CAMPO
ALTER TABLE mzt_trazabilidad ADD mzt_marco_mrc_id int  default NULL AFTER mzt_referencias_ref_id;

se agrega registro en la tabla defectos
INSERT INTO `mzt_defectos` VALUES (33, '2014-01-13 16:23:33', '33', 'Ninguno', 'No posee ningún defecto.');

PARA GUARDAR EL estado de empaque, cant de paquetes y uni x paquetes, y sabeer si desea Terminar proceso de empaque para esta orden
ALTER TABLE mzt_trazabilidad ADD tra_proc_estado varchar(20) default NULL AFTER tra_curado_volt;
ALTER TABLE mzt_trazabilidad ADD tra_cant_paquetes int default NULL AFTER tra_proc_estado;
ALTER TABLE mzt_trazabilidad ADD tra_uni_xpaquetes int default NULL AFTER tra_cant_paquetes;


se agrega el proceso de Despacho salida ala bd
INSERT INTO `mzt_proceso` VALUES (14, '2014-01-21 12:07:56', 'Despacho salida', 'Lore Ipsum');

se agrega este campo para guaradar el id de la ubicacion de la referencia ingresada en Almacen Entrada
ALTER TABLE mzt_trazabilidad ADD mzt_ubicacion_ubi_id int default NULL AFTER mzt_marco_mrc_id;


25-02-2014 A la tabla mzt_producto_has_mzt_defectos se le elimino la PRIMARY KEY ASI ESTABA ANTES
CREATE TABLE IF NOT EXISTS `mzt_producto_has_mzt_defectos` (
  `mzt_producto_pdc_id` int(11) NOT NULL,
  `mzt_defectos_def_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`mzt_producto_pdc_id`,`mzt_defectos_def_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ASI QUEDÓ LA TABLA mzt_producto_has_mzt_defectos
CREATE TABLE IF NOT EXISTS `mzt_producto_has_mzt_defectos` (
  `mzt_producto_pdc_id` int(11) NOT NULL,
  `mzt_defectos_def_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



26-02-2014 se agrega campo para guardar el resultado de Total Tamaño por tira
ALTER TABLE  mzt_orden ADD ord_tam_totalxtira int default NULL AFTER ord_maculas;


se agrega este campo para almacenar los tamaños totales producidos 
ALTER TABLE  mzt_orden ADD ord_tam_totalproducido int default NULL AFTER ord_tam_totalxtira;

