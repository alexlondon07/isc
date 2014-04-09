-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Aug 26, 2013 at 06:52 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `mzpro_db`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_archivos`
-- 

CREATE TABLE `mzt_archivos` (
  `arc_id` int(11) NOT NULL auto_increment,
  `mzt_referencias_ref_id` int(11) default NULL,
  `mzt_ref_grupo_rfg_id` int(11) default NULL,
  `mzt_usuario_usr_id` int(11) NOT NULL,
  `arc_dtcreate` datetime NOT NULL,
  `arc_nombre` varchar(100) default NULL,
  `arc_tipo` varchar(45) default NULL,
  `arc_contenido` mediumblob,
  `arc_encoding` varchar(45) default NULL,
  `arc_tamanio` int(11) default NULL,
  PRIMARY KEY  (`arc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_cliente`
-- 

CREATE TABLE `mzt_cliente` (
  `cli_id` int(11) NOT NULL auto_increment,
  `cli_dtcreate` datetime NOT NULL,
  `cli_nombre` varchar(100) default NULL,
  `cli_nit` varchar(45) default NULL,
  `cli_email` varchar(100) default NULL,
  `cli_telefono` varchar(45) default NULL,
  `cli_pais` varchar(45) default NULL,
  `cli_departamento` varchar(45) default NULL,
  `cli_ciudad` varchar(45) default NULL,
  `cli_direccion` varchar(100) default NULL,
  PRIMARY KEY  (`cli_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_cliprod`
-- 

CREATE TABLE `mzt_cliprod` (
  `cpr_id` int(11) NOT NULL auto_increment,
  `mzt_cliente_cli_id` int(11) NOT NULL,
  `cpr_dtcreate` datetime NOT NULL,
  `cpr_nombre` varchar(45) default NULL,
  `cpr_codigo` varchar(45) default NULL,
  PRIMARY KEY  (`cpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_defectos`
-- 

CREATE TABLE `mzt_defectos` (
  `def_id` int(11) NOT NULL auto_increment,
  `def_dtcreate` datetime NOT NULL,
  `def_codigo` varchar(10) default NULL,
  `def_nombre` varchar(45) NOT NULL,
  `def_descripcion` varchar(250) default NULL,
  PRIMARY KEY  (`def_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_excedentes`
-- 

CREATE TABLE `mzt_excedentes` (
  `exd_id` int(11) NOT NULL auto_increment,
  `mzt_insumos_ins_id` int(11) NOT NULL,
  `mzt_trazabilidad_tra_id` int(11) NOT NULL,
  `exd_dtcreate` datetime NOT NULL,
  `exd_codigo` varchar(45) default NULL,
  `exd_fechareporte` date default NULL,
  `exd_ancho` varchar(45) default NULL,
  `exd_largo` varchar(45) default NULL,
  `exd_cantidad` varchar(45) default NULL,
  `exd_num_lote` varchar(45) default NULL,
  PRIMARY KEY  (`exd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_insumos`
-- 

CREATE TABLE `mzt_insumos` (
  `ins_id` int(11) NOT NULL auto_increment,
  `mzt_proveedor_pro_id` int(11) NOT NULL,
  `mzt_ubicacion_ubi_id` int(11) default NULL,
  `ins_dtcreate` datetime NOT NULL,
  `ins_tipo` varchar(45) default NULL,
  `ins_estado` varchar(45) default NULL,
  `ins_nombre` varchar(100) default NULL,
  `ins_codigo` varchar(45) default NULL,
  `ins_marca` varchar(45) default NULL,
  `ins_lote` varchar(45) default NULL,
  `ins_cantidad` varchar(45) default NULL,
  `ins_unidad` varchar(45) default NULL,
  `ins_serial` varchar(45) default NULL,
  `ins_fecharecepcion` date default NULL,
  `ins_fechavencimiento` date default NULL,
  `ins_numtroquel` varchar(45) default NULL,
  `ins_numpretroquel` varchar(45) default NULL,
  `ins_ancho` varchar(45) default NULL,
  `ins_largo` varchar(45) default NULL,
  `ins_area2` varchar(45) default NULL,
  `ins_precio` varchar(20) default NULL,
  PRIMARY KEY  (`ins_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_insumos_has_mzt_tintamezcla`
-- 

CREATE TABLE `mzt_insumos_has_mzt_tintamezcla` (
  `mzt_insumos_ins_id` int(11) NOT NULL,
  `mzt_tintamezcla_tmz_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `porcentaje` varchar(45) default NULL,
  `cantidad` varchar(45) default NULL,
  `unidad` varchar(45) default NULL,
  `tipoproceso` varchar(45) default NULL,
  `orden` int(2) default NULL,
  PRIMARY KEY  (`mzt_insumos_ins_id`,`mzt_tintamezcla_tmz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_maqeventos`
-- 

CREATE TABLE `mzt_maqeventos` (
  `mqe_id` int(11) NOT NULL auto_increment,
  `mzt_maquina_maq_id` int(11) NOT NULL,
  `mqe_dtcreate` datetime NOT NULL,
  `mqe_tipo` varchar(45) default NULL,
  `mqe_descripcion` varchar(250) default NULL,
  PRIMARY KEY  (`mqe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_maquina`
-- 

CREATE TABLE `mzt_maquina` (
  `maq_id` int(11) NOT NULL auto_increment,
  `mzt_proveedor_pro_id` int(11) default NULL,
  `mzt_ubicacion_ubi_id` int(11) default NULL,
  `maq_dtcreate` datetime NOT NULL,
  `maq_nombre` varchar(45) default NULL,
  `maq_codigo` varchar(45) default NULL,
  `maq_tipo` varchar(45) default NULL,
  `maq_marca` varchar(45) default NULL,
  `maq_modelo` varchar(45) default NULL,
  `maq_serial` varchar(45) default NULL,
  `maq_fechainiciogarantia` date default NULL,
  `maq_fechafingarantia` date default NULL,
  `maq_descirpcion` varchar(250) default NULL,
  PRIMARY KEY  (`maq_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_marco`
-- 

CREATE TABLE `mzt_marco` (
  `mrc_id` int(11) NOT NULL auto_increment,
  `mrc_dtcreate` datetime default NULL,
  `mrc_codigo` varchar(45) default NULL,
  `mrc_nombre` varchar(45) default NULL,
  `mrc_descripcion` varchar(250) default NULL,
  PRIMARY KEY  (`mrc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_orden`
-- 

CREATE TABLE `mzt_orden` (
  `ord_id` int(11) NOT NULL auto_increment,
  `mzt_pedido_ped_id` int(11) NOT NULL,
  `mzt_usuario_usr_id` int(11) NOT NULL,
  `ord_dtcreate` datetime NOT NULL,
  `ord_prioridad` varchar(45) default NULL,
  `ord_ruta` varchar(45) default NULL,
  `ord_consecutivo` varchar(45) default NULL,
  `ord_producto` varchar(45) default NULL,
  `ord_estado` varchar(20) default NULL,
  `ord_prc_actual` varchar(45) default NULL,
  `ord_tiracantidad` int(11) NOT NULL,
  `ord_cantidad_programada` int(11) NOT NULL,
  `ord_maculas` int(11) NOT NULL,
  PRIMARY KEY  (`ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_orden_proceso`
-- 

CREATE TABLE `mzt_orden_proceso` (
  `orp_id` int(11) NOT NULL auto_increment,
  `mzt_orden_ord_id` int(11) NOT NULL,
  `mzt_producto_pdc_id` int(11) NOT NULL,
  `mzt_proceso_prc_id` int(11) default NULL,
  `orp_dtcreate` datetime NOT NULL,
  `orp_prioridad` int(11) default NULL,
  `orp_estado_prc` varchar(45) default NULL,
  PRIMARY KEY  (`orp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_orden_proceso_has_mzt_insumos`
-- 

CREATE TABLE `mzt_orden_proceso_has_mzt_insumos` (
  `mzt_orden_proceso_orp_id` int(11) NOT NULL,
  `mzt_insumos_ins_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  PRIMARY KEY  (`mzt_orden_proceso_orp_id`,`mzt_insumos_ins_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_orden_proceso_has_mzt_maquina`
-- 

CREATE TABLE `mzt_orden_proceso_has_mzt_maquina` (
  `mzt_orden_proceso_orp_id` int(11) NOT NULL,
  `mzt_maquina_maq_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  PRIMARY KEY  (`mzt_orden_proceso_orp_id`,`mzt_maquina_maq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_orden_proceso_has_tintamezcla`
-- 

CREATE TABLE `mzt_orden_proceso_has_tintamezcla` (
  `mzt_tintamezcla_tmz_id` int(11) NOT NULL,
  `mzt_orden_proceso_orp_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  PRIMARY KEY  (`mzt_tintamezcla_tmz_id`,`mzt_orden_proceso_orp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_paros`
-- 

CREATE TABLE `mzt_paros` (
  `prs_id` int(11) NOT NULL auto_increment,
  `mzt_trazabilidad_tra_id` int(11) NOT NULL,
  `mzt_problemas_prb_id` int(11) NOT NULL,
  `prs_dtcreate` datetime NOT NULL,
  `prs_descripcion` varchar(250) default NULL,
  PRIMARY KEY  (`prs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_pedido`
-- 

CREATE TABLE `mzt_pedido` (
  `ped_id` int(11) NOT NULL auto_increment,
  `mzt_cliente_cli_id` int(11) NOT NULL,
  `mzt_usuario_usr_id` int(11) NOT NULL,
  `ped_dtcreate` datetime NOT NULL,
  `ped_codigo` varchar(45) default NULL,
  `ped_fechaentrega` datetime default NULL,
  `ped_descripcion` varchar(255) default NULL,
  `ped_estado` varchar(20) default NULL,
  PRIMARY KEY  (`ped_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_pedido_has_mzt_referencias`
-- 

CREATE TABLE `mzt_pedido_has_mzt_referencias` (
  `mzt_pedido_ped_id` int(11) NOT NULL,
  `mzt_referencias_ref_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `cantidad` int(11) default NULL,
  PRIMARY KEY  (`mzt_referencias_ref_id`,`mzt_pedido_ped_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_perfiles`
-- 

CREATE TABLE `mzt_perfiles` (
  `prf_id` int(11) NOT NULL auto_increment,
  `prf_nombre` varchar(45) NOT NULL,
  `prf_descripcion` varchar(45) default NULL,
  PRIMARY KEY  (`prf_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_problemas`
-- 

CREATE TABLE `mzt_problemas` (
  `prb_id` int(11) NOT NULL auto_increment,
  `prb_dtcreate` datetime NOT NULL,
  `prb_nombre` varchar(45) default NULL,
  `prb_codigo` varchar(45) default NULL,
  `prb_detalle` varchar(45) default NULL,
  PRIMARY KEY  (`prb_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_proceso`
-- 

CREATE TABLE `mzt_proceso` (
  `prc_id` int(11) NOT NULL auto_increment,
  `prc_dtcreate` datetime NOT NULL,
  `prc_nombre` varchar(45) default NULL,
  `prc_descripcion` varchar(250) default NULL,
  PRIMARY KEY  (`prc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_producto`
-- 

CREATE TABLE `mzt_producto` (
  `pdc_id` int(11) NOT NULL auto_increment,
  `mzt_orden_ord_id` int(11) NOT NULL,
  `mzt_referencias_ref_id` int(11) default NULL,
  `mzt_ref_grupo_rfg_id` int(11) default NULL,
  `pdc_dtcreate` datetime NOT NULL,
  PRIMARY KEY  (`pdc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_producto_has_mzt_defectos`
-- 

CREATE TABLE `mzt_producto_has_mzt_defectos` (
  `mzt_producto_pdc_id` int(11) NOT NULL,
  `mzt_defectos_def_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY  (`mzt_producto_pdc_id`,`mzt_defectos_def_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_producto_has_mzt_ubicacion`
-- 

CREATE TABLE `mzt_producto_has_mzt_ubicacion` (
  `mzt_producto_pdc_id` int(11) NOT NULL,
  `mzt_ubicacion_ubi_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `cantidad` int(11) default NULL,
  `unidad` varchar(45) default NULL,
  `observacion` varchar(250) default NULL,
  PRIMARY KEY  (`mzt_producto_pdc_id`,`mzt_ubicacion_ubi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_proveedor`
-- 

CREATE TABLE `mzt_proveedor` (
  `pro_id` int(11) NOT NULL auto_increment,
  `pro_dtcreate` datetime NOT NULL,
  `pro_nombre` varchar(45) default NULL,
  `pro_nit` varchar(45) default NULL,
  `pro_email` varchar(100) default NULL,
  `pro_telefono` varchar(45) default NULL,
  `pro_pais` varchar(45) default NULL,
  `pro_departamento` varchar(45) default NULL,
  `pro_ciudad` varchar(45) default NULL,
  `pro_direccion` varchar(100) default NULL,
  `pro_tipo` varchar(45) default NULL,
  PRIMARY KEY  (`pro_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_referencias`
-- 

CREATE TABLE `mzt_referencias` (
  `ref_id` int(11) NOT NULL auto_increment,
  `mzt_cliente_cli_id` int(11) NOT NULL,
  `mzt_cliprod_cpr_id` int(11) default NULL,
  `ref_dtcreate` datetime NOT NULL,
  `ref_referencia` varchar(45) default NULL,
  `ref_producto` varchar(45) default NULL,
  `ref_descripcion` varchar(100) default NULL,
  `ref_precio` varchar(20) default NULL,
  `ref_ancho` varchar(45) default NULL,
  `ref_largo` varchar(45) default NULL,
  `ref_area2` varchar(45) default NULL,
  `ref_unid_empaq` int(11) default NULL,
  `ref_observacion` varchar(250) default NULL,
  PRIMARY KEY  (`ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_referencias_has_mzt_tintamezcla`
-- 

CREATE TABLE `mzt_referencias_has_mzt_tintamezcla` (
  `mzt_referencias_ref_id` int(11) NOT NULL,
  `mzt_tintamezcla_tmz_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  `ordenaplicacion` int(11) NOT NULL,
  PRIMARY KEY  (`mzt_referencias_ref_id`,`mzt_tintamezcla_tmz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_ref_grupo`
-- 

CREATE TABLE `mzt_ref_grupo` (
  `rfg_id` int(11) NOT NULL auto_increment,
  `rfg_dtcreate` datetime NOT NULL,
  `rfg_nombre` varchar(45) default NULL,
  `rfg_descripcion` varchar(250) default NULL,
  `rfg_observacion` varchar(250) default NULL,
  `rfg_ancho` varchar(45) default NULL,
  `rfg_largo` varchar(45) default NULL,
  PRIMARY KEY  (`rfg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_ref_grupo_has_mzt_marco`
-- 

CREATE TABLE `mzt_ref_grupo_has_mzt_marco` (
  `mzt_ref_grupo_rfg_id` int(11) NOT NULL,
  `mzt_marco_mrc_id` int(11) NOT NULL,
  `dtcreate` datetime NOT NULL,
  PRIMARY KEY  (`mzt_ref_grupo_rfg_id`,`mzt_marco_mrc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_ref_grupo_insumo`
-- 

CREATE TABLE `mzt_ref_grupo_insumo` (
  `rgi_id` int(11) NOT NULL auto_increment,
  `mzt_referencias_ref_id` int(11) default NULL,
  `mzt_ref_grupo_rfg_id` int(11) default NULL,
  `mzt_insumos_ins_id` int(11) default NULL,
  `rgi_dtcreate` datetime NOT NULL,
  `rgi_cant_x_refer` varchar(45) default NULL,
  `rgi_cant_x_insum` varchar(45) default NULL,
  `rgi_unidad` varchar(45) default NULL,
  `rgi_ancho` int(11) default NULL,
  `rgi_largo` int(11) default NULL,
  PRIMARY KEY  (`rgi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_tintamezcla`
-- 

CREATE TABLE `mzt_tintamezcla` (
  `tmz_id` int(11) NOT NULL auto_increment,
  `mzt_ubicacion_ubi_id` int(11) default NULL,
  `mzt_cliente_cli_id` int(11) default NULL,
  `tmz_dtcreate` datetime NOT NULL,
  `tmz_nombre` varchar(45) default NULL,
  `tmz_codtinta` varchar(45) default NULL,
  `tmz_codprobeta` varchar(45) default NULL,
  `tmz_tipocaucho` varchar(45) default NULL,
  `tmz_pres_caucho` varchar(45) default NULL,
  `tmz_pres_entinta` varchar(45) default NULL,
  `tmz_vel_caucho` varchar(45) default NULL,
  `tmz_vel_entinta` varchar(45) default NULL,
  `tmz_alturamesa` varchar(45) default NULL,
  `tmz_curado_inten` varchar(45) default NULL,
  `tmz_num_pasadas` varchar(45) default NULL,
  `tmz_num_tejido` varchar(45) default NULL,
  `tmz_observacion` varchar(250) default NULL,
  PRIMARY KEY  (`tmz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_trazabilidad`
-- 

CREATE TABLE `mzt_trazabilidad` (
  `tra_id` int(11) NOT NULL auto_increment,
  `mzt_usuario_usr_id` int(11) NOT NULL,
  `mzt_orden_ord_id` int(11) default NULL,
  `mzt_proceso_prc_id` int(11) default NULL,
  `mzt_maquina_maq_id` int(11) default NULL,
  `mzt_insumos_ins_id` int(11) default NULL,
  `mzt_excedentes_exd_id` int(11) default NULL,
  `mzt_tintamezcla_tmz_id` int(11) default NULL,
  `mzt_referencias_ref_id` int(11) default NULL,
  `tra_ref_grupo` int(11) default NULL,
  `tra_cliente` int(11) default NULL,
  `tra_dtcreate` datetime NOT NULL,
  `tra_cantidad` int(11) default NULL,
  `tra_unidad` varchar(45) default NULL,
  `tra_tipo` varchar(45) default NULL,
  `tra_proceso` varchar(45) default NULL,
  `tra_subproceso` varchar(45) default NULL,
  `tra_maculas` varchar(45) default NULL,
  `tra_fechainicio` date default NULL,
  `tra_fechafin` date default NULL,
  `tra_horainicio` time default NULL,
  `tra_horafin` time default NULL,
  `tra_observacion` varchar(250) default NULL,
  `tra_altura_mesa` varchar(45) default NULL,
  `tra_prueba` varchar(45) default NULL,
  `tra_pruebaresult` varchar(45) default NULL,
  `tra_pruebarealizo` varchar(45) default NULL,
  `tra_num_lote` varchar(45) default NULL,
  `tra_pres_caucho` varchar(45) default NULL,
  `tra_pres_entinta` varchar(45) default NULL,
  `tra_vel_caucho` varchar(45) default NULL,
  `tra_vel_entinta` varchar(45) default NULL,
  `tra_alturamesa` varchar(45) default NULL,
  `tra_curado_inten` varchar(45) default NULL,
  `tra_curado_volt` varchar(45) default NULL,
  PRIMARY KEY  (`tra_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_ubicacion`
-- 

CREATE TABLE `mzt_ubicacion` (
  `ubi_id` int(11) NOT NULL auto_increment,
  `ubi_dtcreate` datetime NOT NULL,
  `ubi_tipo` varchar(45) default NULL,
  `ubi_nombre` varchar(45) default NULL,
  `ubi_descripcion` varchar(250) default NULL,
  `ubi_codigo` varchar(45) default NULL,
  `ubi_ubicacion` varchar(100) default NULL,
  PRIMARY KEY  (`ubi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_usuario`
-- 

CREATE TABLE `mzt_usuario` (
  `usr_id` int(11) NOT NULL auto_increment,
  `mzt_cliente_cli_id` int(11) default NULL,
  `mzt_proveedor_pro_id` int(11) default NULL,
  `usr_dtcreate` datetime NOT NULL,
  `usr_nombre` varchar(100) default NULL,
  `usr_apellido` varchar(100) default NULL,
  `usr_cargo` varchar(45) default NULL,
  `usr_identificacion` varchar(45) default NULL,
  `usr_email` varchar(100) default NULL,
  `usr_pass` varchar(60) default NULL,
  `usr_telefono` varchar(45) default NULL,
  `usr_celular` varchar(45) default NULL,
  `usr_habilitado` varchar(10) default NULL,
  `usr_contacto` varchar(10) default NULL,
  PRIMARY KEY  (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

-- 
-- Table structure for table `mzt_usuario_has_mzt_perfiles`
-- 

CREATE TABLE `mzt_usuario_has_mzt_perfiles` (
  `mzt_usuario_usr_id` int(11) NOT NULL,
  `mzt_perfiles_prf_id` int(11) NOT NULL,
  PRIMARY KEY  (`mzt_usuario_usr_id`,`mzt_perfiles_prf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
