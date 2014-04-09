-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2013 a las 17:55:32
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mzpro_db`
--

--
-- Volcado de datos para la tabla `mzt_cliente`
--

INSERT INTO `mzt_cliente` (`cli_id`, `cli_dtcreate`, `cli_nombre`, `cli_nit`, `cli_email`, `cli_telefono`, `cli_pais`, `cli_departamento`, `cli_ciudad`, `cli_direccion`) VALUES
(1, '2013-05-14 21:17:41', 'Secuencia24', '988.478.997-1', 'auteco@info.com', '8879954', 'Colombia', 'Antioquia', 'Medellin', 'Carrera 51 #88-48'),
(3, '2013-05-15 11:38:23', 'Fanalca', '990.645.837-2', 'fanalca@correo.com', '4457889', 'Colombia', 'Cundinamarca', 'Bogota', 'Calle 11 #8-17'),
(4, '2013-05-15 11:39:53', 'Auteco', '890.645.837-2', 'auteco@correo.com', '2767446', 'Colombia', 'Antioquia', 'Medellin', 'Carrera 47 #36C sur-77'),
(5, '2013-05-15 11:41:22', 'Ducon ', '890.645.774-2', 'ducon@correo.com', '2416641', 'Colombia', 'Valle del Cauca', 'Cali', 'Carrera 41 # 66-74'),
(6, '2013-05-29 18:45:34', 'ensayo borrar', '65', 'asp@asd.a', '65', '6', '65', '65', '56');

--
-- Volcado de datos para la tabla `mzt_cliprod`
--

INSERT INTO `mzt_cliprod` (`cpr_id`, `mzt_cliente_cli_id`, `cpr_dtcreate`, `cpr_nombre`, `cpr_codigo`) VALUES
(1, 5, '2013-06-11 13:35:48', 'Producto1', '6496'),
(3, 5, '2013-06-11 16:35:34', 'Producto2', '4877'),
(4, 3, '2013-06-11 16:35:47', 'Producto3', '778'),
(5, 4, '2013-07-17 01:07:21', 'Producto 4', '4778527');

--
-- Volcado de datos para la tabla `mzt_defectos`
--

INSERT INTO `mzt_defectos` (`def_id`, `def_dtcreate`, `def_nombre`, `def_descripcion`) VALUES
(1, '2013-07-09 16:50:22', 'Faltante de tinta', 'Partes sin imprimir'),
(2, '2013-07-09 16:51:56', 'Registro', 'Partes que no registran correctamente'),
(3, '2013-07-09 16:52:57', 'Mancha de tinta', 'Mancha que deteriora la calidad de la calcomania'),
(4, '2013-07-09 16:53:42', 'Poro', 'Agujero de tamaño mayor a 2mm'),
(5, '2013-07-09 16:54:53', 'Punto deformado', 'Deformación de la figura de interés'),
(6, '2013-07-09 16:55:28', 'Tono', 'Tono inconsistente con lo esperado'),
(7, '2013-07-09 16:56:11', 'Rayas', 'Mala calidad en la impresión por rayas en la figura'),
(8, '2013-07-09 16:57:12', 'Lanas en impresion', 'Impurezas que deterioran la calidad del producto'),
(9, '2013-07-09 17:10:00', 'Otra impureza', 'Impurezas que deterioran la calidad del producto'),
(10, '2013-07-09 17:10:33', 'Retoque impresion', 'Se hace el retoque a la impresión'),
(11, '2013-07-10 10:13:54', 'Ninguno', 'Ninguno');

--
-- Volcado de datos para la tabla `mzt_excedentes`
--

INSERT INTO `mzt_excedentes` (`exd_id`, `mzt_insumos_ins_id`, `mzt_trazabilidad_tra_id`, `exd_dtcreate`, `exd_codigo`, `exd_fechareporte`, `exd_ancho`, `exd_largo`, `exd_cantidad`, `exd_num_lote`) VALUES
(12, 13, 17, '2013-06-26 19:15:38', NULL, '2013-06-15', '15', '10', '20', '12345'),
(13, 13, 20, '2013-06-28 11:43:32', NULL, '2013-06-29', '15', '10', '20', ''),
(14, 13, 21, '2013-07-03 16:16:35', NULL, '2013-07-27', '13', '12', '14', '1223'),
(15, 13, 22, '2013-07-03 16:18:05', NULL, '2013-07-13', '16', '15', '17', ''),
(16, 13, 34, '2013-07-07 15:32:37', NULL, '2013-07-25', '20', '10', '30', '1234'),
(17, 13, 35, '2013-07-07 15:32:56', NULL, '2013-07-25', '20', '10', '30', '1234'),
(18, 13, 38, '2013-07-07 15:35:46', NULL, '2013-07-25', '20', '10', '30', '1234'),
(19, 13, 40, '2013-07-07 15:37:06', NULL, '2013-07-25', '20', '10', '30', '1234'),
(20, 13, 41, '2013-07-07 15:37:57', NULL, '2013-07-25', '20', '10', '30', '1234'),
(21, 13, 42, '2013-07-07 15:38:57', NULL, '2013-07-25', '20', '10', '30', '1234'),
(22, 13, 43, '2013-07-07 15:39:53', NULL, '2013-07-26', '20', '10', '30', ''),
(23, 14, 53, '2013-07-08 14:21:04', NULL, '0000-00-00', '2', '1', '3', '123'),
(24, 14, 54, '2013-07-08 14:21:24', NULL, '0000-00-00', '1', '1', '1', ''),
(25, 13, 65, '2013-07-08 17:25:04', NULL, '0000-00-00', '1', '1', '1', '123'),
(26, 13, 66, '2013-07-08 17:25:37', NULL, '0000-00-00', '1', '1', '1', ''),
(27, 13, 73, '2013-07-09 11:55:20', NULL, '0000-00-00', '1', '1', '1', '1'),
(28, 13, 74, '2013-07-09 11:55:43', NULL, '0000-00-00', '1', '1', '1', ''),
(29, 14, 84, '2013-07-09 13:24:14', NULL, '0000-00-00', '1', '1', '1', '1'),
(30, 14, 85, '2013-07-09 13:24:33', NULL, '0000-00-00', '1', '1', '1', ''),
(31, 13, 106, '2013-07-12 03:57:44', NULL, '2013-07-27', '20', '10', '30', '123'),
(32, 13, 108, '2013-07-17 12:34:53', NULL, '0000-00-00', '1', '1', '1', '');

--
-- Volcado de datos para la tabla `mzt_insumos`
--

INSERT INTO `mzt_insumos` (`ins_id`, `mzt_proveedor_pro_id`, `mzt_ubicacion_ubi_id`, `ins_dtcreate`, `ins_tipo`, `ins_precio`, `ins_nombre`, `ins_codigo`, `ins_marca`, `ins_lote`, `ins_cantidad`, `ins_unidad`, `ins_serial`, `ins_fecharecepcion`, `ins_fechavencimiento`, `ins_numtroquel`, `ins_numpretroquel`, `ins_ancho`, `ins_largo`, `ins_area2`) VALUES
(1, 1, 1, '2013-05-28 10:00:41', 'Tinta', NULL, 'Tinta base cyan', 'aff897', 'Pintuco', '40f36', '200', 'gramos', '47787', '2013-02-15', '2013-03-25', '15', '20', '10', '20', '200'),
(2, 1, 2, '2013-05-28 13:00:36', 'Transfer', NULL, 'nombre1e', 'codigo1e', 'marca1e', 'lote1e', 'cantidad1e', 'unidad1e', 'serial1e', '2012-05-02', '2012-05-03', 'numetrotroquel1e', 'numeropretroquel1e', 'largo1e', 'ancho1e', 'area1e'),
(5, 1, 3, '2013-06-04 13:31:06', 'Tinta', NULL, 'Tinta Ensayo', '857SS', 'Pintuco', '45F', '500', 'onzas', '45587DED', '2013-06-10', '2013-06-22', '', '', '', '', ''),
(6, 1, 2, '2013-06-04 18:56:21', 'Tinta', NULL, 'Tinta Base Roja', '587RF', 'Viniltex', '587DEF', '2000', 'gramos', '4877FW89', '2013-06-10', '2013-06-22', '', '', '', '', ''),
(7, 4, 2, '2013-06-06 23:26:09', 'Tinta', NULL, 'Tinta verde lima', '45ADD', 'Viniltex', '4F5', '1000', 'gramos', 'DCC41', '2013-06-04', '2016-06-19', '15', '20', '10', '5', '100'),
(8, 1, 2, '2013-06-11 14:18:43', 'Troquel', NULL, 'troquel1', 'codigo1', 'marca1', 'lote1', 'cantidad1', 'unidad1', 'serial1', '2013-06-03', '2013-06-23', 'numero1', 'numeropretro1', 'ancho1', 'largo1', 'area1'),
(9, 4, 2, '2013-06-11 16:37:49', 'Pretroquel', NULL, 'Nombre2', 'CÃ³digo2', 'Marca2', 'Lote2', 'Cantidad2', 'Unidad2', 'Serial2', '2013-06-03', '2013-06-22', 'Numtroquel2', 'Codigo Pretroquel2', 'Ancho2', 'Largo2', 'Area2'),
(10, 1, 2, '2013-06-11 16:38:59', 'Troquel', NULL, 'Nombre3', 'Codigo3', 'Marca3', 'Lote3', 'Cantidad3', 'Unidad3', 'Serial3', '2013-06-03', '2013-06-16', 'Numerotroquel3', 'NumeroPretroquel3', 'Ancho3', 'Largo3', 'Area3'),
(11, 6, 3, '2013-06-11 16:40:06', 'Pretroquel', NULL, 'Nombre4', 'Codigo4', 'Marca4', 'Lote4', 'Cantidad4', 'Unidad4', 'Serial4', '2013-06-18', '2013-06-22', 'Numetrotroquel4', 'Numeropretroquel4', 'Ancho4', 'largo4', 'Ãrea4'),
(12, 1, 3, '2013-06-24 16:50:39', 'Vinilo', NULL, 'Vinilo0', 'sdfsdf', 'sdfsdf', 'sdf', 'sdfsdf', 'sdfsdf', 'fdsf', '2013-06-12', '2013-06-23', 'sdf', 'sdf', '100', '200', 'sdf'),
(13, 4, 2, '2013-06-25 17:31:38', 'Vinilo', NULL, 'Vinilo 01', '5878', 'asdd', 'ddd', 'dasd', 'asdasd', 'asd', '2013-06-19', '2013-06-16', 'asd', 'asd', '110', '220', 'asd'),
(14, 1, 1, '2013-06-25 17:32:17', 'Vinilo', NULL, 'Vinilo 02', '5658', 'jjaja', 'adsasd', 'asd', 'ads', 'asd', '2013-06-12', '2013-06-14', 'ads', 'asd', '120', '240', ''),
(15, 1, 3, '2013-07-17 02:47:54', 'Troquel', '1000000e', 'Troqueladora Nu', '785522e', 'Troqueles SAe', '78852e', '1', '10', '778ASSQ98e', '2013-07-19', '2013-07-12', '14452e', '', '10', '20', '500');

--
-- Volcado de datos para la tabla `mzt_insumos_has_mzt_tintamezcla`
--

INSERT INTO `mzt_insumos_has_mzt_tintamezcla` (`mzt_insumos_ins_id`, `mzt_tintamezcla_tmz_id`, `dtcreate`, `porcentaje`, `cantidad`, `unidad`, `tipoproceso`, `orden`) VALUES
(1, 1, '2013-06-11 13:56:38', '95', '500', 'gramos', 'entonacion', 1),
(1, 2, '2013-06-11 16:25:14', '2', '5', 'gramos', 'entonacion', 3),
(1, 3, '2013-07-02 16:58:00', '100', '50', 'gramos', 'entonacion', 1),
(6, 2, '2013-06-11 16:25:14', '96', '450', 'gramos', 'entonacion', 1),
(6, 4, '2013-07-02 16:58:32', '100', '10', 'gramos', 'entonacion', 1),
(6, 6, '2013-07-02 16:59:14', '666', '50', 'gramos', 'entonacion', 1),
(7, 1, '2013-06-11 13:56:38', '5', '50', 'gramos', 'entonacion', 2),
(7, 2, '2013-06-11 16:25:14', '2', '25', 'gramos', 'entonacion', 2),
(7, 7, '2013-07-02 16:59:54', '98', '666', 'gramos', 'entonacion', 1);

--
-- Volcado de datos para la tabla `mzt_maqeventos`
--

INSERT INTO `mzt_maqeventos` (`mqe_id`, `mzt_maquina_maq_id`, `mqe_dtcreate`, `mqe_tipo`, `mqe_descripcion`) VALUES
(1, 1, '2013-05-29 12:24:58', 'Mantenimiento', 'Se exploto'),
(2, 10, '2013-05-29 15:02:00', 'Reparacion', 'Se daÃ±o'),
(3, 12, '2013-05-29 15:02:59', 'Otro', 'Se la robaron'),
(4, 9, '2013-05-29 15:03:54', 'Fuera de servicio', 'era la Ãºnica que faltaba'),
(5, 10, '2013-05-29 15:59:56', 'Mantenimiento', 'Se reparÃ³ exitaosamente'),
(6, 13, '2013-05-30 13:42:56', 'Fuera de servicio', 'PUM');

--
-- Volcado de datos para la tabla `mzt_maquina`
--

INSERT INTO `mzt_maquina` (`maq_id`, `mzt_proveedor_pro_id`, `mzt_ubicacion_ubi_id`, `maq_dtcreate`, `maq_nombre`, `maq_codigo`, `maq_tipo`, `maq_marca`, `maq_modelo`, `maq_serial`, `maq_fechainiciogarantia`, `maq_fechafingarantia`, `maq_descirpcion`) VALUES
(1, 4, 1, '2013-05-27 10:05:57', 'Impresora 01', '12345', 'Impresora', 'MERK', 'ASD1574', 'CF888746', '2002-07-17', '2013-05-22', 'Impresora de primera clase laser'),
(9, 1, 1, '2013-05-27 16:49:47', 'Troqueladora 01', '7748', 'Primer nivel', 'MULHOUSE', '3A44.1', '167846857', '2013-05-16', '2008-05-21', 'Realiza el primer troquel'),
(10, 1, 1, '2013-05-27 16:58:26', 'Cortadora 01', '4147', 'Nueva', 'CUTTLER', 'SD336', '232346678', '2010-09-22', '2012-11-18', 'Corta las tiras de vinilo'),
(12, 1, 2, '2013-05-29 13:32:01', 'Empacadora', 'codigo', 'tipo', 'marca', 'modelo', 'asd', '2013-05-08', '2013-05-18', 'este es un ensayo del textarea'),
(13, 1, 2, '2013-05-29 16:09:17', 'Transportadora', 't', 't', 't', 't', 't', '2013-05-17', '2013-05-10', 't');

--
-- Volcado de datos para la tabla `mzt_marco`
--

INSERT INTO `mzt_marco` (`mrc_id`, `mrc_dtcreate`, `mrc_codigo`, `mrc_nombre`, `mrc_descripcion`) VALUES
(1, '2013-05-28 12:22:30', '57789S', 'Marco Rectangular', 'Marco mediano'),
(3, '2013-05-28 15:05:28', '65697a', 'marco', 'descripcion'),
(4, '2013-07-21 23:59:27', '1234', 'Ensayo Ã¡ Ã© Ã­ Ã³ Ãº Ã±', 'Ã±aca Ã±aca');

--
-- Volcado de datos para la tabla `mzt_orden`
--

INSERT INTO `mzt_orden` (`ord_id`, `mzt_pedido_ped_id`, `mzt_usuario_usr_id`, `ord_dtcreate`, `ord_consecutivo`, `ord_producto`, `ord_estado`, `ord_prc_actual`, `ord_tiracantidad`, `ord_cantidad_programada`, `ord_maculas`) VALUES
(9, 5, 2, '2013-06-20 22:41:20', '26356', '', 'Anulada', 'Corte01', 0, 0, 0),
(11, 5, 2, '2013-06-21 00:12:41', '655', '', 'Terminada', 'Ninguno', 0, 0, 0),
(12, 5, 2, '2013-06-21 00:22:50', '65526', '', 'Anulada', 'Ninguno', 0, 0, 0),
(16, 5, 2, '2013-06-26 14:56:22', '99999', '', 'Anulada', 'Corte 01', 30, 0, 0),
(17, 7, 2, '2013-06-26 15:04:30', '4444', '', 'Anulada', 'Corte 02', 35, 0, 0),
(18, 5, 2, '2013-07-02 19:24:51', '4567', '', 'Anulada', 'Ninguno', 30, 500, 50),
(19, 5, 2, '2013-07-03 12:20:20', '1230', '', 'Anulada', 'Impresion', 300, 150, 10),
(20, 5, 2, '2013-07-07 15:04:50', '4560', '', 'Anulada', 'Ninguno', 20, 300, 10),
(21, 5, 2, '2013-07-07 15:11:06', '1111', '', 'Anulada', 'Ninguno', 20, 300, 10),
(22, 5, 2, '2013-07-07 15:18:38', '2222', '', 'Anulada', 'Corte Posterior', 20, 250, 10),
(23, 7, 2, '2013-07-08 14:18:56', '3333', '', 'Anulada', 'Pretroquelado', 50, 500, 10),
(24, 6, 2, '2013-07-08 17:24:15', '5555', '', 'Anulada', 'Pretroquelado', 50, 500, 10),
(25, 7, 2, '2013-07-09 11:53:07', '6666', '', 'Anulada', 'Acabados 01', 50, 350, 10),
(26, 6, 2, '2013-07-09 13:11:48', '7777', '', 'Pendiente', 'Acabados 02', 50, 550, 10),
(27, 5, 2, '2013-07-10 14:13:11', '8888', '', 'Pendiente', 'Preparacion Tintas', 50, 500, 20),
(28, 5, 2, '2013-07-11 13:57:50', '9999', '', 'Pendiente', 'Acabados 01', 40, 500, 10);

--
-- Volcado de datos para la tabla `mzt_orden_proceso`
--

INSERT INTO `mzt_orden_proceso` (`orp_id`, `mzt_orden_ord_id`, `mzt_producto_pdc_id`, `mzt_proceso_prc_id`, `orp_dtcreate`, `orp_prioridad`, `orp_estado_prc`) VALUES
(23, 9, 7, 2, '2013-06-20 22:41:44', 2, NULL),
(24, 9, 7, 3, '2013-06-20 22:41:44', 3, NULL),
(30, 11, 9, 1, '2013-06-21 00:15:44', 1, NULL),
(43, 12, 10, 1, '2013-06-21 09:49:38', 1, NULL),
(44, 12, 10, 3, '2013-06-21 09:49:39', 2, NULL),
(59, 16, 14, 1, '2013-06-26 15:16:58', 1, 'corte01_completo'),
(62, 17, 15, 1, '2013-06-26 18:59:59', 1, 'corte01_completo'),
(63, 17, 15, 2, '2013-06-26 18:59:59', 2, 'corte02_completo'),
(64, 18, 16, 1, '2013-07-02 19:24:51', 1, NULL),
(65, 18, 16, 2, '2013-07-02 19:24:51', 2, NULL),
(66, 18, 16, 4, '2013-07-02 19:24:51', 3, NULL),
(67, 19, 17, 1, '2013-07-03 12:20:20', 1, 'corte01_completo'),
(68, 19, 17, 2, '2013-07-03 12:20:20', 2, 'corte02_completo'),
(69, 19, 17, 4, '2013-07-03 12:20:20', 3, 'impresion_completo'),
(70, 20, 18, 1, '2013-07-07 15:04:50', 1, NULL),
(71, 20, 18, 2, '2013-07-07 15:04:50', 2, NULL),
(72, 20, 18, 4, '2013-07-07 15:04:50', 3, NULL),
(73, 20, 18, 5, '2013-07-07 15:04:50', 4, NULL),
(74, 21, 19, 1, '2013-07-07 15:11:06', 1, NULL),
(75, 21, 19, 2, '2013-07-07 15:11:06', 2, NULL),
(76, 21, 19, 4, '2013-07-07 15:11:07', 3, NULL),
(77, 21, 19, 5, '2013-07-07 15:11:07', 4, NULL),
(78, 22, 20, 1, '2013-07-07 15:18:38', 1, 'corte01_completo'),
(79, 22, 20, 2, '2013-07-07 15:18:38', 2, 'corte02_completo'),
(80, 22, 20, 4, '2013-07-07 15:18:38', 3, 'impresion_completo'),
(81, 22, 20, 5, '2013-07-07 15:18:38', 4, 'corteposterior_completo'),
(82, 23, 21, 1, '2013-07-08 14:18:56', 1, 'corte01_completo'),
(83, 23, 21, 2, '2013-07-08 14:18:56', 2, 'corte02_completo'),
(84, 23, 21, 4, '2013-07-08 14:18:56', 3, 'impresion_completo'),
(85, 23, 21, 5, '2013-07-08 14:18:56', 4, 'corteposterior_completo'),
(86, 23, 21, 6, '2013-07-08 14:18:57', 5, 'pretroquelado_completo'),
(87, 24, 22, 1, '2013-07-08 17:24:15', 1, 'corte01_completo'),
(88, 24, 22, 2, '2013-07-08 17:24:15', 2, 'corte02_completo'),
(89, 24, 22, 4, '2013-07-08 17:24:15', 3, 'impresion_completo'),
(90, 24, 22, 5, '2013-07-08 17:24:15', 4, 'corteposterior_completo'),
(91, 24, 22, 6, '2013-07-08 17:24:15', 5, 'pretroquelado_completo'),
(92, 24, 22, 7, '2013-07-08 17:24:15', 6, 'acabados01_completo'),
(93, 25, 23, 1, '2013-07-09 11:53:07', 1, 'corte01_completo'),
(94, 25, 23, 2, '2013-07-09 11:53:07', 2, 'corte02_completo'),
(95, 25, 23, 4, '2013-07-09 11:53:07', 3, 'impresion_completo'),
(96, 25, 23, 5, '2013-07-09 11:53:07', 4, 'corteposterior_completo'),
(97, 25, 23, 6, '2013-07-09 11:53:08', 5, 'pretroquelado_completo'),
(98, 25, 23, 7, '2013-07-09 11:53:08', 6, 'acabados01_completo'),
(99, 25, 23, 8, '2013-07-09 11:53:08', 7, 'troquelado_completo'),
(100, 26, 24, 1, '2013-07-09 13:11:48', 1, 'corte01_completo'),
(101, 26, 24, 2, '2013-07-09 13:11:48', 2, 'corte02_completo'),
(102, 26, 24, 4, '2013-07-09 13:11:48', 3, 'impresion_completo'),
(103, 26, 24, 5, '2013-07-09 13:11:48', 4, 'corteposterior_completo'),
(104, 26, 24, 6, '2013-07-09 13:11:48', 5, 'pretroquelado_completo'),
(105, 26, 24, 7, '2013-07-09 13:11:48', 6, 'acabados01_completo'),
(106, 26, 24, 8, '2013-07-09 13:11:48', 7, 'troquelado_completo'),
(107, 26, 24, 9, '2013-07-09 13:11:48', 8, 'acabados02_completo'),
(108, 27, 30, 10, '2013-07-10 14:13:11', 1, 'preparaciontintas_completo'),
(109, 28, 31, 1, '2013-07-11 13:57:50', 1, 'corte01_completo'),
(110, 28, 31, 2, '2013-07-11 13:57:50', 2, 'corte02_completo'),
(111, 28, 31, 4, '2013-07-11 13:57:51', 3, 'impresion_completo'),
(112, 28, 31, 5, '2013-07-11 13:57:51', 4, 'corteposterior_completo'),
(113, 28, 31, 6, '2013-07-11 13:57:51', 5, 'pretroquelado_completo'),
(114, 28, 31, 7, '2013-07-11 13:57:51', 6, 'acabados01_completo'),
(115, 28, 31, 8, '2013-07-11 13:57:51', 7, 'troquelado_completo'),
(116, 28, 31, 9, '2013-07-11 13:57:51', 8, NULL),
(117, 28, 31, 10, '2013-07-11 13:57:51', 9, NULL);

--
-- Volcado de datos para la tabla `mzt_orden_proceso_has_mzt_insumos`
--

INSERT INTO `mzt_orden_proceso_has_mzt_insumos` (`mzt_orden_proceso_orp_id`, `mzt_insumos_ins_id`, `dtcreate`) VALUES
(23, 9, '2013-06-20 22:41:44'),
(24, 10, '2013-06-20 22:41:44'),
(30, 10, '2013-06-21 00:15:44'),
(43, 8, '2013-06-21 09:49:38'),
(44, 2, '2013-06-21 09:49:39'),
(59, 13, '2013-06-26 15:16:58'),
(62, 13, '2013-06-26 18:59:59'),
(63, 13, '2013-06-26 18:59:59'),
(67, 13, '2013-07-03 12:20:20'),
(68, 13, '2013-07-03 12:20:20'),
(74, 13, '2013-07-07 15:11:06'),
(75, 14, '2013-07-07 15:11:07'),
(78, 13, '2013-07-07 15:18:38'),
(79, 13, '2013-07-07 15:18:38'),
(81, 14, '2013-07-07 15:18:38'),
(82, 14, '2013-07-08 14:18:56'),
(83, 14, '2013-07-08 14:18:56'),
(85, 14, '2013-07-08 14:18:57'),
(86, 9, '2013-07-08 14:18:57'),
(86, 11, '2013-07-08 14:18:57'),
(87, 13, '2013-07-08 17:24:15'),
(88, 13, '2013-07-08 17:24:15'),
(90, 14, '2013-07-08 17:24:15'),
(91, 11, '2013-07-08 17:24:15'),
(92, 2, '2013-07-08 17:24:16'),
(93, 13, '2013-07-09 11:53:07'),
(94, 13, '2013-07-09 11:53:07'),
(96, 14, '2013-07-09 11:53:08'),
(97, 11, '2013-07-09 11:53:08'),
(98, 2, '2013-07-09 11:53:08'),
(99, 8, '2013-07-09 11:53:08'),
(99, 10, '2013-07-09 11:53:08'),
(100, 14, '2013-07-09 13:11:48'),
(101, 14, '2013-07-09 13:11:48'),
(103, 14, '2013-07-09 13:11:48'),
(104, 9, '2013-07-09 13:11:48'),
(105, 2, '2013-07-09 13:11:48'),
(106, 8, '2013-07-09 13:11:48'),
(107, 14, '2013-07-09 13:11:48'),
(109, 13, '2013-07-11 13:57:50'),
(110, 13, '2013-07-11 13:57:51'),
(112, 14, '2013-07-11 13:57:51'),
(113, 9, '2013-07-11 13:57:51'),
(114, 2, '2013-07-11 13:57:51'),
(115, 8, '2013-07-11 13:57:51'),
(116, 14, '2013-07-11 13:57:51');

--
-- Volcado de datos para la tabla `mzt_orden_proceso_has_mzt_maquina`
--

INSERT INTO `mzt_orden_proceso_has_mzt_maquina` (`mzt_orden_proceso_orp_id`, `mzt_maquina_maq_id`, `dtcreate`) VALUES
(23, 12, '2013-06-20 22:41:44'),
(24, 13, '2013-06-20 22:41:44'),
(30, 12, '2013-06-21 00:15:44'),
(43, 1, '2013-06-21 09:49:38'),
(44, 12, '2013-06-21 09:49:39'),
(59, 10, '2013-06-26 15:16:58'),
(62, 10, '2013-06-26 18:59:59'),
(63, 10, '2013-06-26 18:59:59'),
(67, 10, '2013-07-03 12:20:20'),
(68, 10, '2013-07-03 12:20:20'),
(69, 1, '2013-07-03 12:20:20'),
(74, 10, '2013-07-07 15:11:06'),
(75, 10, '2013-07-07 15:11:07'),
(76, 1, '2013-07-07 15:11:07'),
(77, 10, '2013-07-07 15:11:07'),
(78, 10, '2013-07-07 15:18:38'),
(79, 10, '2013-07-07 15:18:38'),
(80, 1, '2013-07-07 15:18:38'),
(81, 10, '2013-07-07 15:18:38'),
(82, 10, '2013-07-08 14:18:56'),
(83, 10, '2013-07-08 14:18:56'),
(84, 1, '2013-07-08 14:18:56'),
(85, 10, '2013-07-08 14:18:56'),
(86, 9, '2013-07-08 14:18:57'),
(87, 10, '2013-07-08 17:24:15'),
(88, 10, '2013-07-08 17:24:15'),
(89, 1, '2013-07-08 17:24:15'),
(90, 10, '2013-07-08 17:24:15'),
(91, 9, '2013-07-08 17:24:15'),
(92, 9, '2013-07-08 17:24:15'),
(93, 10, '2013-07-09 11:53:07'),
(94, 10, '2013-07-09 11:53:07'),
(95, 1, '2013-07-09 11:53:07'),
(96, 10, '2013-07-09 11:53:07'),
(97, 9, '2013-07-09 11:53:08'),
(98, 9, '2013-07-09 11:53:08'),
(99, 9, '2013-07-09 11:53:08'),
(100, 10, '2013-07-09 13:11:48'),
(101, 10, '2013-07-09 13:11:48'),
(102, 1, '2013-07-09 13:11:48'),
(103, 10, '2013-07-09 13:11:48'),
(104, 13, '2013-07-09 13:11:48'),
(105, 9, '2013-07-09 13:11:48'),
(106, 9, '2013-07-09 13:11:48'),
(107, 9, '2013-07-09 13:11:48'),
(108, 9, '2013-07-10 14:13:11'),
(109, 10, '2013-07-11 13:57:50'),
(110, 10, '2013-07-11 13:57:51'),
(111, 1, '2013-07-11 13:57:51'),
(112, 10, '2013-07-11 13:57:51'),
(113, 9, '2013-07-11 13:57:51'),
(114, 9, '2013-07-11 13:57:51'),
(115, 10, '2013-07-11 13:57:51'),
(116, 9, '2013-07-11 13:57:51'),
(117, 9, '2013-07-11 13:57:51');

--
-- Volcado de datos para la tabla `mzt_orden_proceso_has_tintamezcla`
--

INSERT INTO `mzt_orden_proceso_has_tintamezcla` (`mzt_tintamezcla_tmz_id`, `mzt_orden_proceso_orp_id`, `dtcreate`) VALUES
(1, 72, '2013-07-07 15:04:50'),
(1, 76, '2013-07-07 15:11:07'),
(1, 80, '2013-07-07 15:18:38'),
(1, 89, '2013-07-08 17:24:15'),
(1, 108, '2013-07-10 14:13:11'),
(2, 108, '2013-07-10 14:13:11'),
(3, 66, '2013-07-02 19:24:51'),
(3, 69, '2013-07-03 12:20:20'),
(3, 84, '2013-07-08 14:18:56'),
(3, 89, '2013-07-08 17:24:15'),
(3, 95, '2013-07-09 11:53:07'),
(3, 102, '2013-07-09 13:11:48'),
(3, 108, '2013-07-10 14:13:11'),
(4, 66, '2013-07-02 19:24:51'),
(4, 69, '2013-07-03 12:20:20'),
(4, 84, '2013-07-08 14:18:56'),
(4, 108, '2013-07-10 14:13:11'),
(6, 72, '2013-07-07 15:04:50'),
(6, 76, '2013-07-07 15:11:07'),
(6, 80, '2013-07-07 15:18:38'),
(6, 84, '2013-07-08 14:18:56'),
(6, 95, '2013-07-09 11:53:07'),
(6, 111, '2013-07-11 13:57:51'),
(6, 117, '2013-07-11 13:57:51'),
(7, 72, '2013-07-07 15:04:50'),
(7, 76, '2013-07-07 15:11:07'),
(7, 80, '2013-07-07 15:18:38'),
(7, 111, '2013-07-11 13:57:51'),
(7, 117, '2013-07-11 13:57:51');

--
-- Volcado de datos para la tabla `mzt_paros`
--

INSERT INTO `mzt_paros` (`prs_id`, `mzt_trazabilidad_tra_id`, `mzt_problemas_prb_id`, `prs_dtcreate`, `prs_descripcion`) VALUES
(1, 104, 1, '2013-07-12 02:52:36', 'Primer paro, corresponde a corte01, clietne ducon, orden 9999 osea el grupo 987'),
(2, 105, 4, '2013-07-12 02:53:18', 'Segundo paro, es lo mismo del anterior pero con el proceso de la preparaciÃ³n de tintas'),
(3, 107, 3, '2013-07-12 03:58:05', 'Se estallÃ³ la cortadora 02');

--
-- Volcado de datos para la tabla `mzt_pedido`
--

INSERT INTO `mzt_pedido` (`ped_id`, `mzt_cliente_cli_id`, `mzt_usuario_usr_id`, `ped_dtcreate`, `ped_codigo`, `ped_fechaentrega`, `ped_descripcion`, `ped_estado`) VALUES
(5, 5, 2, '2013-06-18 14:21:49', '114174', '2013-06-22 00:00:00', '6+5+6985', 'Pendiente'),
(6, 3, 1, '2013-06-20 00:45:26', '66214', '2013-06-30 00:00:00', 'Pedido Urgente', 'Pendiente'),
(7, 4, 2, '2013-06-20 22:44:55', '45888', '2013-06-30 00:00:00', 'nuevo pedido', 'Pendiente');

--
-- Volcado de datos para la tabla `mzt_pedido_has_mzt_referencias`
--

INSERT INTO `mzt_pedido_has_mzt_referencias` (`mzt_pedido_ped_id`, `mzt_referencias_ref_id`, `dtcreate`, `cantidad`) VALUES
(6, 27, '2013-06-20 00:45:26', 15),
(7, 27, '2013-06-21 09:46:59', 15),
(5, 28, '2013-06-26 15:17:23', 15),
(6, 28, '2013-06-20 00:45:26', 30);

--
-- Volcado de datos para la tabla `mzt_perfiles`
--

INSERT INTO `mzt_perfiles` (`prf_id`, `prf_nombre`, `prf_descripcion`) VALUES
(1, 'Clientes - Ver', NULL),
(2, 'Clientes - Crear', NULL),
(3, 'Clientes - Editar', NULL),
(4, 'Clientes - Eliminar', NULL),
(5, 'Usuarios - Ver', NULL),
(6, 'Usuarios - Crear', NULL),
(7, 'Usuarios - Editar', NULL),
(8, 'Usuarios - Eliminar', NULL),
(9, 'Usuarios - Permisos', NULL),
(10, 'Proveedores - Ver', NULL),
(11, 'Proveedores - Crear', NULL),
(12, 'Proveedores - Editar', NULL),
(13, 'Proveedores - Eliminar', NULL),
(14, 'Ubicaciones - Ver', NULL),
(15, 'Ubicaciones - Crear', NULL),
(16, 'Ubicaciones - Editar', NULL),
(17, 'Ubicaciones - Eliminar', NULL),
(18, 'Maquinas - Ver', NULL),
(19, 'Maquinas - Crear', NULL),
(20, 'Maquinas - Editar', NULL),
(21, 'Maquinas - Eliminar', NULL),
(22, 'Insumos - Ver', NULL),
(23, 'Insumos - Crear', NULL),
(24, 'Insumos - Editar', NULL),
(25, 'Insumos - Eliminar', NULL),
(26, 'Marcos - Ver', NULL),
(27, 'Marcos - Crear', NULL),
(28, 'Marcos - Editar', NULL),
(29, 'Marcos - Eliminar', NULL),
(30, 'Procesos - Ver', NULL),
(31, 'Procesos - Crear', NULL),
(32, 'Procesos - Editar', NULL),
(33, 'Procesos - Eliminar', NULL),
(34, 'Tintas - Ver', NULL),
(35, 'Tintas - Crear', NULL),
(36, 'Tintas - Editar', NULL),
(37, 'Tintas - Eliminar', NULL),
(38, 'Producto Cliente - Ver', NULL),
(39, 'Producto Cliente - Crear', NULL),
(40, 'Producto Cliente - Editar', NULL),
(41, 'Producto Cliente - Eliminar', NULL),
(42, 'Referencias - Ver', NULL),
(43, 'Referencias - Crear', NULL),
(44, 'Referencias - Editar', NULL),
(45, 'Referencias - Eliminar', NULL),
(46, 'Grupo Referencias - Ver', NULL),
(47, 'Grupo Referencias - Crear', NULL),
(48, 'Grupo Referencias - Editar', NULL),
(49, 'Grupo Referencias - Eliminar', NULL),
(50, 'Pedidos - Ver', NULL),
(51, 'Pedidos - Crear', NULL),
(52, 'Pedidos - Editar', NULL),
(53, 'Pedidos - Eliminar', NULL),
(54, 'Ordenes - Ver', NULL),
(55, 'Ordenes - Crear', NULL),
(56, 'Ordenes - Editar', NULL),
(57, 'Ordenes - Eliminar', NULL),
(58, 'Produccion - Ver', NULL),
(59, 'Paros y problemas - Ver', NULL),
(60, 'Paros y problemas - Crear', NULL),
(61, 'Paros y problemas - Editar', NULL),
(62, 'Paros y problemas - Eliminar', NULL);

--
-- Volcado de datos para la tabla `mzt_problemas`
--

INSERT INTO `mzt_problemas` (`prb_id`, `prb_dtcreate`, `prb_nombre`, `prb_codigo`, `prb_detalle`) VALUES
(1, '2013-07-11 01:42:51', 'Codigo 01', '123', 'Primer codigo'),
(2, '2013-07-11 01:47:07', 'Codigo 02', '456', 'Segundo cÃ³digo creado'),
(3, '2013-07-11 01:47:25', 'Codigo 03', '789', 'Tercer cÃ³digo'),
(4, '2013-07-11 01:47:39', 'Codigo 04', '852', 'El cuarto y editado');

--
-- Volcado de datos para la tabla `mzt_proceso`
--

INSERT INTO `mzt_proceso` (`prc_id`, `prc_dtcreate`, `prc_nombre`, `prc_descripcion`) VALUES
(1, '2013-06-04 09:54:12', 'Corte 01', 'Lore Ipsum'),
(2, '2013-06-18 18:41:05', 'Corte 02', 'Lore Ipsum\n'),
(3, '2013-06-20 00:44:35', 'Empaque 01', 'Se empacan todas las tiras cortadas'),
(4, '2013-07-02 12:22:03', 'Impresion', 'Lore Ipsum'),
(5, '2013-07-07 14:46:34', 'Corte Posterior', 'Lore Ipsum'),
(6, '2013-07-08 14:17:13', 'Pretroquelado', 'Lore Ipsum'),
(7, '2013-07-08 16:36:38', 'Acabados 01', 'InspecciÃ³n'),
(8, '2013-07-09 11:45:02', 'Troquelado', 'Lore ipsum\n'),
(9, '2013-07-09 12:46:01', 'Acabados 02', 'lore ipsum'),
(10, '2013-07-10 14:03:29', 'Preparacion Tintas', 'Lore Ipsum');

--
-- Volcado de datos para la tabla `mzt_producto`
--

INSERT INTO `mzt_producto` (`pdc_id`, `mzt_orden_ord_id`, `mzt_referencias_ref_id`, `mzt_ref_grupo_rfg_id`, `pdc_dtcreate`) VALUES
(7, 9, NULL, 13, '2013-06-20 22:41:20'),
(9, 11, NULL, 13, '2013-06-21 00:12:41'),
(10, 12, NULL, 12, '2013-06-21 00:22:50'),
(14, 16, NULL, 14, '2013-06-26 14:56:22'),
(15, 17, NULL, 12, '2013-06-26 15:04:30'),
(16, 18, NULL, 15, '2013-07-02 19:24:51'),
(17, 19, NULL, 15, '2013-07-03 12:20:20'),
(18, 20, NULL, 15, '2013-07-07 15:04:50'),
(19, 21, NULL, 15, '2013-07-07 15:11:06'),
(20, 22, NULL, 15, '2013-07-07 15:18:38'),
(21, 23, NULL, 15, '2013-07-08 14:18:56'),
(22, 24, NULL, 15, '2013-07-08 17:24:15'),
(23, 25, NULL, 15, '2013-07-09 11:53:07'),
(24, 26, NULL, 15, '2013-07-09 13:11:48'),
(25, 26, 30, NULL, '2013-07-10 13:26:37'),
(26, 26, 27, NULL, '2013-07-10 13:31:04'),
(27, 26, 27, NULL, '2013-07-10 13:32:26'),
(28, 26, 27, NULL, '2013-07-10 13:38:20'),
(29, 26, 27, NULL, '2013-07-10 13:41:40'),
(30, 27, NULL, 15, '2013-07-10 14:13:11'),
(31, 28, NULL, 18, '2013-07-11 13:57:50');

--
-- Volcado de datos para la tabla `mzt_producto_has_mzt_defectos`
--

INSERT INTO `mzt_producto_has_mzt_defectos` (`mzt_producto_pdc_id`, `mzt_defectos_def_id`, `dtcreate`, `cantidad`) VALUES
(26, 6, '2013-07-10 13:31:04', 3),
(26, 10, '2013-07-10 13:31:04', 5),
(27, 11, '2013-07-10 13:32:26', 0),
(28, 6, '2013-07-10 13:38:20', 5),
(28, 7, '2013-07-10 13:38:20', 15),
(28, 10, '2013-07-10 13:38:20', 10),
(29, 10, '2013-07-10 13:41:40', 23);

--
-- Volcado de datos para la tabla `mzt_proveedor`
--

INSERT INTO `mzt_proveedor` (`pro_id`, `pro_dtcreate`, `pro_nombre`, `pro_nit`, `pro_email`, `pro_telefono`, `pro_pais`, `pro_departamento`, `pro_ciudad`, `pro_direccion`) VALUES
(1, '2013-05-20 15:00:17', '3M COLOMBIA S.A', '860.002.693', '3mcolombia@info.com', '5789965', 'Colombia', 'Antioquia', 'Medellin', 'Calle 45 #44-89'),
(4, '2013-05-20 19:12:27', 'GRAFITINAS S.A', '878.547.698', 'grafitina@info.com.co', '7415896', 'Colombia', 'Valle del Cauca', 'Palmira', 'Carrera 45A #77-89'),
(6, '2013-05-28 16:53:42', 'PROVEEDOR 3', '874.147.697-1', 'prov3@hotmail.com', '8494958', 'Bolivia', 'Guanteros', 'La paz', 'Centro');

--
-- Volcado de datos para la tabla `mzt_referencias`
--

INSERT INTO `mzt_referencias` (`ref_id`, `mzt_cliente_cli_id`, `mzt_cliprod_cpr_id`, `ref_dtcreate`, `ref_referencia`, `ref_producto`, `ref_descripcion`, `ref_precio`, `ref_ancho`, `ref_largo`, `ref_area2`, `ref_unid_empaq`, `ref_observacion`) VALUES
(27, 4, 1, '2013-06-12 23:56:24', '0001', 'Marquilla', 'PequeÃ±a para bicicleta', '50000', '50cm', '40cm', '2000cm', 15, 'Delicada de una sola aplicaciÃ³n'),
(28, 3, 3, '2013-06-12 23:59:12', '0002', 'Estampa', 'Estampa mediana', '45000', '35cm', '40cm', '1750cm2', 45, 'Para motos y bicicletas'),
(29, 5, 4, '2013-06-13 00:00:43', '0003', 'CalcomanÃ­a', 'Grupo de 2 tandas', '85000', '80cm', '35cm', '1500cm2', 80, 'Grupo de calcomanÃ­as reutilizables'),
(30, 5, 1, '2013-07-02 17:01:12', '1234', '6565', '6+55', '6566', '12', '12', '12', 12, '12'),
(31, 3, 1, '2013-07-02 17:02:02', '987', '6565', 'dewfr', '6565', 'sdf', 'sdf', 'sdf', 20, 'sdf'),
(32, 4, 5, '2013-07-17 01:52:02', '852', 'Producto 4', 'Es la de fanalca prod 3edite', '1500', '10', '15', '150', 40, 'Ninguna edite opir ducon prod 2');

--
-- Volcado de datos para la tabla `mzt_referencias_has_mzt_tintamezcla`
--

INSERT INTO `mzt_referencias_has_mzt_tintamezcla` (`mzt_referencias_ref_id`, `mzt_tintamezcla_tmz_id`, `dtcreate`, `ordenaplicacion`) VALUES
(27, 1, '2013-06-12 23:56:25', 1),
(27, 2, '2013-06-12 23:56:25', 2),
(28, 2, '2013-06-12 23:59:12', 0),
(29, 1, '2013-06-13 00:01:40', 0),
(29, 2, '2013-06-13 00:01:40', 1),
(30, 3, '2013-07-02 17:01:12', 0),
(30, 4, '2013-07-02 17:01:12', 0),
(31, 6, '2013-07-09 17:34:46', 1),
(31, 7, '2013-07-09 17:34:46', 2),
(32, 3, '2013-07-17 02:05:22', 1);

--
-- Volcado de datos para la tabla `mzt_ref_grupo`
--

INSERT INTO `mzt_ref_grupo` (`rfg_id`, `rfg_dtcreate`, `rfg_nombre`, `rfg_descripcion`, `rfg_observacion`, `rfg_ancho`, `rfg_largo`) VALUES
(12, '2013-06-13 00:02:34', '2', 'Para mÃºltiple propÃ³sito', 'Todo para motos', '10', '20'),
(13, '2013-06-13 00:03:15', '3', 'Algo mejorado', 'CalcomanÃ­as grandes, corregido', '15', '30'),
(14, '2013-06-20 00:44:08', '1', 'Referencias nuevas', 'El grupo 3', '5', '10'),
(15, '2013-07-02 17:02:51', '1234', '65555', 'ulitmo', '5', '10'),
(16, '2013-07-09 16:28:32', '1234N', 'Nuevo Grupo Con cant', 'Todas las cantidades son 100, para un total de 300', '5', '10'),
(17, '2013-07-09 16:33:30', '987viejo', 'Nuevo', 'El que se llama 987', '5', '10'),
(18, '2013-07-11 13:49:46', '987', 'Grupo de ensayo completo', 'SÃ³lo para ensayar', '5', '10');

--
-- Volcado de datos para la tabla `mzt_ref_grupo_has_mzt_marco`
--

INSERT INTO `mzt_ref_grupo_has_mzt_marco` (`mzt_ref_grupo_rfg_id`, `mzt_marco_mrc_id`, `dtcreate`) VALUES
(12, 3, '2013-06-26 19:05:44'),
(14, 3, '2013-06-26 19:05:24'),
(15, 3, '2013-07-02 17:39:58'),
(16, 1, '2013-07-09 16:28:32'),
(16, 3, '2013-07-09 16:28:32'),
(17, 1, '2013-07-09 16:33:30'),
(17, 3, '2013-07-09 16:33:30'),
(18, 1, '2013-07-11 13:49:46'),
(18, 3, '2013-07-11 13:49:46');

--
-- Volcado de datos para la tabla `mzt_ref_grupo_insumo`
--

INSERT INTO `mzt_ref_grupo_insumo` (`rgi_id`, `mzt_referencias_ref_id`, `mzt_ref_grupo_rfg_id`, `mzt_insumos_ins_id`, `rgi_dtcreate`, `rgi_cant_x_refer`, `rgi_cant_x_insum`, `rgi_unidad`, `rgi_ancho`, `rgi_largo`) VALUES
(101, 27, NULL, 8, '2013-06-12 23:56:25', '', '', '', 0, 0),
(102, 27, NULL, 9, '2013-06-12 23:56:25', '', '', '', 0, 0),
(103, 28, NULL, 11, '2013-06-12 23:59:12', '', '', '', 0, 0),
(106, 29, NULL, 11, '2013-06-13 00:01:40', '', '', '', 0, 0),
(107, 29, NULL, 10, '2013-06-13 00:01:40', '', '', '', 0, 0),
(108, 29, NULL, 9, '2013-06-13 00:01:40', '', '', '', 0, 0),
(137, 27, 14, NULL, '2013-06-26 19:05:24', '', '', '', 0, 0),
(138, 28, 12, NULL, '2013-06-26 19:05:44', '', '', '', 0, 0),
(142, 30, NULL, 9, '2013-07-02 17:01:12', '', '', '', 0, 0),
(143, 30, NULL, 10, '2013-07-02 17:01:13', '', '', '', 0, 0),
(147, 30, 15, NULL, '2013-07-02 17:39:58', '350', '', '', 0, 0),
(149, 27, 15, NULL, '2013-07-02 17:39:58', '100', '', '', 0, 0),
(150, 27, 16, NULL, '2013-07-09 16:28:32', '', '', '', 0, 0),
(151, 28, 16, NULL, '2013-07-09 16:28:32', '', '', '', 0, 0),
(152, 30, 16, NULL, '2013-07-09 16:28:32', '', '', '', 0, 0),
(154, 30, 17, NULL, '2013-07-09 16:33:30', '200', '', '', 0, 0),
(155, 31, NULL, 9, '2013-07-09 17:34:46', '', '', '', 0, 0),
(156, 31, 18, NULL, '2013-07-11 13:49:46', '200', '', '', 0, 0),
(157, 30, 18, NULL, '2013-07-11 13:49:46', '300', '', '', 0, 0),
(161, 32, NULL, 9, '2013-07-17 02:05:22', '', '', '', 0, 0);

--
-- Volcado de datos para la tabla `mzt_tintamezcla`
--

INSERT INTO `mzt_tintamezcla` (`tmz_id`, `mzt_ubicacion_ubi_id`, `mzt_cliente_cli_id`, `tmz_dtcreate`, `tmz_nombre`, `tmz_codtinta`, `tmz_codprobeta`, `tmz_tipocaucho`, `tmz_pres_caucho`, `tmz_pres_entinta`, `tmz_vel_caucho`, `tmz_vel_entinta`, `tmz_alturamesa`, `tmz_curado_inten`, `tmz_num_pasadas`, `tmz_num_tejido`, `tmz_observacion`) VALUES
(1, 2, 4, '2013-06-11 13:56:38', 'TINTA AZUL REY', 'AF774', '45887', 'Nuevo', '40 PSI', '100 PSI', '45 mm/s', '50 mm/s', '15 cm', '55%', '15', '5778', 'Se aplica despacio'),
(2, 3, 5, '2013-06-11 16:25:14', 'TINTA ROJO CARMESÃ', 'DWE445', '4778', 'Usado', '54 PSI', '75 PSI', '70 mm/s', '15 mm/s', '25 cm', '60%', '14', '66857', 'Tinta de secado rÃ¡pido'),
(3, 2, 5, '2013-07-02 16:58:00', 'TINTA AMARILLA', 'fwe', '89996', 'Nuevo', 'asd', 'fwr', 'wfe', 'fwe', 'fw', 'ef', 'wef', 'wef', 'ef'),
(4, 3, 5, '2013-07-02 16:58:32', 'TINTA FUCSIA', 'asd', '9865', 'Nuevo', 'aSD', 'asd', 'sad', 'asd', 'asd', 'asd', 'asdas', 'd', 'asd'),
(6, 2, 3, '2013-07-02 16:59:14', 'TINTA NEGRA', 'sdf', '9899', 'Usado', '65898', 'fdsf', 'sdf', 'sdf', 'sfd', 'sdf', 'sdf', 'sdf', 'sdf'),
(7, 2, 3, '2013-07-02 16:59:54', 'TINTA BLANCA', 'sdf', '1565', 'Usado', 'fdsf', 'sdf', 'sdf', 'fds', 'sdf', 'dsf', 'sdf', 'dsf', 'sdf');

--
-- Volcado de datos para la tabla `mzt_trazabilidad`
--

INSERT INTO `mzt_trazabilidad` (`tra_id`, `mzt_usuario_usr_id`, `mzt_orden_ord_id`, `mzt_proceso_prc_id`, `mzt_maquina_maq_id`, `mzt_insumos_ins_id`, `mzt_excedentes_exd_id`, `mzt_tintamezcla_tmz_id`, `mzt_referencias_ref_id`, `tra_ref_grupo`, `tra_cliente`, `tra_dtcreate`, `tra_cantidad`, `tra_unidad`, `tra_tipo`, `tra_proceso`, `tra_subproceso`, `tra_maculas`, `tra_fechainicio`, `tra_fechafin`, `tra_horainicio`, `tra_horafin`, `tra_observacion`, `tra_altura_mesa`, `tra_prueba`, `tra_pruebaresult`, `tra_pruebarealizo`, `tra_num_lote`, `tra_pres_caucho`, `tra_pres_entinta`, `tra_vel_caucho`, `tra_vel_entinta`, `tra_alturamesa`, `tra_curado_inten`, `tra_curado_volt`) VALUES
(17, 2, 17, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-06-26 19:15:37', NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-22', '2013-06-15', '12:00:00', '17:15:00', '141685dfsfd', NULL, NULL, NULL, NULL, '12345', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 2, 17, 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-06-28 11:43:32', NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-23', '2013-06-29', '09:42:00', '12:00:00', 'Observacion vinilo 01 corte 02', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 2, 19, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-03 16:16:35', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-02', '2013-07-27', '12:00:00', '14:16:00', 'Ninguna', NULL, NULL, NULL, NULL, '1223', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 2, 19, 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-03 16:18:05', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-04', '2013-07-13', '05:00:00', '13:00:00', 'Ninguna', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-05 23:15:36', 50, NULL, NULL, NULL, NULL, NULL, '2013-07-02', '2013-07-18', '04:00:00', '21:14:00', 'TInta amarilla, primera impresion', NULL, 'Camilo', NULL, 'Alex', NULL, '10', '20', '13', '12', '2', '15', '55'),
(24, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-05 23:16:52', 100, NULL, NULL, NULL, NULL, NULL, '2013-07-10', '2013-07-16', '09:00:00', '00:19:00', 'Nuevo tinta amarilla', NULL, '', NULL, '', NULL, '10', '20', '23', '66', '3', '15', '11'),
(25, 2, 19, 4, 1, NULL, NULL, 4, NULL, NULL, NULL, '2013-07-05 23:19:42', 150, NULL, NULL, NULL, NULL, NULL, '2013-07-11', '2013-07-02', '09:00:00', '21:19:00', 'la de la fuccia', NULL, '', NULL, 'Mauricio', NULL, '2', '3', '5', '6', '7', '1', '4'),
(29, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-06 15:54:41', 110, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(30, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-06 15:55:34', 120, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '50', '1'),
(31, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-07 14:04:54', 140, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(32, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-07 14:05:44', 140, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(33, 2, 19, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-07 14:11:17', 150, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(34, 2, 22, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:32:37', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-18', '2013-07-25', '07:00:00', '13:32:00', 'Ninguna', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 2, 22, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:32:56', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-18', '2013-07-25', '07:00:00', '13:32:00', 'Ninguna', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 2, 22, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:35:46', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-18', '2013-07-25', '07:00:00', '13:32:00', 'Ninguna', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 2, 22, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:37:06', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-18', '2013-07-25', '07:00:00', '13:32:00', 'Ninguna', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 2, 22, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:37:57', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-18', '2013-07-25', '07:00:00', '13:32:00', 'Ninguna', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 2, 22, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:38:57', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-18', '2013-07-25', '07:00:00', '13:32:00', 'Ninguna', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 2, 22, 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-07 15:39:53', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-22', '2013-07-26', '13:39:00', '00:00:00', 'ninguna', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 2, 22, 4, 1, NULL, NULL, 1, NULL, NULL, NULL, '2013-07-07 15:40:50', 250, NULL, NULL, NULL, NULL, NULL, '2013-07-02', '2013-07-12', '03:00:00', '13:40:00', 'ninguna', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(46, 2, 22, 4, 1, NULL, NULL, 6, NULL, NULL, NULL, '2013-07-07 16:30:15', 250, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(47, 2, 22, 4, 1, NULL, NULL, 7, NULL, NULL, NULL, '2013-07-07 16:30:51', 50, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '11', '1', '1', '1', '1', '1'),
(48, 2, 22, 4, 1, NULL, NULL, 7, NULL, NULL, NULL, '2013-07-07 16:31:26', 150, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(49, 2, 22, 4, 1, NULL, NULL, 7, NULL, NULL, NULL, '2013-07-07 16:31:51', 250, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(50, 2, 22, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-08 13:29:24', 50, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', 'Ninguna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 2, 22, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-08 13:56:49', 150, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 2, 22, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-08 14:00:21', 250, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 2, 23, 1, NULL, 14, NULL, NULL, NULL, NULL, NULL, '2013-07-08 14:21:04', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 2, 23, 2, NULL, 14, NULL, NULL, NULL, NULL, NULL, '2013-07-08 14:21:23', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 2, 23, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-08 14:21:59', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(56, 2, 23, 4, 1, NULL, NULL, 4, NULL, NULL, NULL, '2013-07-08 14:22:38', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(57, 2, 23, 4, 1, NULL, NULL, 6, NULL, NULL, NULL, '2013-07-08 14:23:08', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(58, 2, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-08 14:23:28', 250, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 2, 23, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-08 14:24:09', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 2, 23, 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2013-07-08 16:24:27', 100, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 2, 23, 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2013-07-08 16:24:42', 100, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 2, 23, 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2013-07-08 16:25:40', 300, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 2, 23, 6, NULL, 11, NULL, NULL, NULL, NULL, NULL, '2013-07-08 16:26:42', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 2, 23, 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2013-07-08 16:27:09', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 2, 24, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-08 17:25:04', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 2, 24, 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-08 17:25:37', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 2, 24, 4, 1, NULL, NULL, 1, NULL, NULL, NULL, '2013-07-08 17:26:04', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(68, 2, 24, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-08 17:26:32', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '0', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(69, 2, 24, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-08 17:27:08', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 2, 24, 6, NULL, 11, NULL, NULL, NULL, NULL, NULL, '2013-07-08 17:27:29', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 2, 24, 7, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2013-07-08 18:23:01', 250, NULL, NULL, NULL, 'escalerillar', NULL, '0000-00-00', '0000-00-00', '00:00:00', '00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 2, 24, 7, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2013-07-08 18:23:38', 500, NULL, NULL, NULL, 'transportar', NULL, '0000-00-00', '0000-00-00', '00:00:00', '00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 2, 25, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-09 11:55:20', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', 'obs', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 2, 25, 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-09 11:55:43', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '10', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 2, 25, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-09 11:57:19', 349, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(76, 2, 25, 4, 1, NULL, NULL, 6, NULL, NULL, NULL, '2013-07-09 11:57:49', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(77, 2, 25, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-09 11:58:17', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(78, 2, 25, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-09 11:58:37', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 2, 25, 6, NULL, 11, NULL, NULL, NULL, NULL, NULL, '2013-07-09 11:59:37', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '350', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 2, 25, 7, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2013-07-09 12:00:07', 350, NULL, NULL, NULL, 'escalerillar', NULL, '0000-00-00', '0000-00-00', '00:00:00', '00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 2, 25, 8, NULL, 8, NULL, NULL, NULL, NULL, NULL, '2013-07-09 12:29:42', 50, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 2, 25, 8, NULL, 10, NULL, NULL, NULL, NULL, NULL, '2013-07-09 12:30:28', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 2, 25, 8, NULL, 8, NULL, NULL, NULL, NULL, NULL, '2013-07-09 12:32:03', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 2, 26, 1, NULL, 14, NULL, NULL, NULL, NULL, NULL, '2013-07-09 13:24:14', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 2, 26, 2, NULL, 14, NULL, NULL, NULL, NULL, NULL, '2013-07-09 13:24:33', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 2, 26, 4, 1, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-09 13:25:56', 550, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:02', '00:00:02', 'a', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(87, 2, 26, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-09 13:26:19', 550, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 2, 26, 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2013-07-09 13:26:39', 550, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 2, 26, 7, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2013-07-09 13:27:02', 550, NULL, NULL, NULL, 'inspeccion_sin_luz', NULL, '0000-00-00', '0000-00-00', '00:00:00', '00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 2, 26, 8, NULL, 8, NULL, NULL, NULL, NULL, NULL, '2013-07-09 13:27:23', 550, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 2, 26, 9, NULL, NULL, NULL, NULL, 30, NULL, NULL, '2013-07-10 13:26:37', 350, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:05', '00:00:05', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 2, 26, 9, NULL, NULL, NULL, NULL, 27, NULL, NULL, '2013-07-10 13:31:04', 10, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:10', '00:00:20', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 2, 26, 9, NULL, NULL, NULL, NULL, 27, NULL, NULL, '2013-07-10 13:32:26', 60, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 2, 26, 9, NULL, NULL, NULL, NULL, 27, NULL, NULL, '2013-07-10 13:38:19', 70, NULL, NULL, NULL, NULL, NULL, '2013-07-04', '2013-07-31', '11:37:00', '06:00:00', 'Ninguna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 2, 26, 9, NULL, NULL, NULL, NULL, 27, NULL, NULL, '2013-07-10 13:41:40', 100, NULL, NULL, NULL, NULL, NULL, '2013-07-31', '2013-07-23', '06:00:00', '00:08:00', 'NInguna', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 2, 27, 10, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2013-07-10 17:08:01', 100, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 2, 27, 10, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-10 17:08:24', 250, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 2, 27, 10, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2013-07-10 17:09:39', 499, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 2, 27, 10, NULL, NULL, NULL, 1, NULL, NULL, NULL, '2013-07-10 17:10:12', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 2, 27, 10, NULL, NULL, NULL, 2, NULL, NULL, NULL, '2013-07-10 17:10:37', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 2, 27, 10, NULL, NULL, NULL, 3, NULL, NULL, NULL, '2013-07-10 17:10:58', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 2, 27, 10, NULL, NULL, NULL, 4, NULL, NULL, NULL, '2013-07-10 17:11:17', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 2, 28, 1, NULL, NULL, NULL, NULL, NULL, 18, 5, '2013-07-12 02:52:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 2, 28, 10, NULL, NULL, NULL, NULL, NULL, 18, 5, '2013-07-12 02:53:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 2, 28, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-12 03:57:44', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-11', '2013-07-27', '07:00:00', '06:00:00', 'Ninguna', NULL, NULL, NULL, NULL, '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 2, 28, 2, NULL, NULL, NULL, NULL, NULL, 18, 5, '2013-07-12 03:58:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 2, 28, 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, '2013-07-17 12:34:53', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 2, 28, 4, 1, NULL, NULL, 6, NULL, NULL, NULL, '2013-07-17 12:35:18', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(110, 2, 28, 4, 1, NULL, NULL, 7, NULL, NULL, NULL, '2013-07-17 12:35:41', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, '', NULL, '', NULL, '1', '1', '1', '1', '1', '1', '1'),
(111, 2, 28, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-17 12:35:56', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 2, 28, 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, '2013-07-17 12:36:16', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 2, 28, 7, NULL, 2, NULL, NULL, NULL, NULL, NULL, '2013-07-17 12:36:36', 500, NULL, NULL, NULL, 'escalerillar', NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', 's', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 2, 28, 8, NULL, 8, NULL, NULL, NULL, NULL, NULL, '2013-07-17 12:36:54', 500, NULL, NULL, NULL, NULL, NULL, '0000-00-00', '0000-00-00', '00:00:01', '00:00:01', 's', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Volcado de datos para la tabla `mzt_ubicacion`
--

INSERT INTO `mzt_ubicacion` (`ubi_id`, `ubi_dtcreate`, `ubi_tipo`, `ubi_nombre`, `ubi_descripcion`, `ubi_codigo`, `ubi_ubicacion`) VALUES
(1, '2013-05-22 14:16:57', 'Almacen e', 'Guardatodo edit', 'Se guarda todo tipo de objeto ee', '8879954 e ', 'Calle44 #44-55e e'),
(2, '2013-05-27 17:05:01', 'Bodega', 'AlmacÃ©n', 'Guarda Insumos', '44857', 'Calle 45 #45-87'),
(3, '2013-05-28 16:53:01', 'Almacen', 'Bodega', 'Bodega grande', '788ASQ8', 'Bolivar');

--
-- Volcado de datos para la tabla `mzt_usuario`
--

INSERT INTO `mzt_usuario` (`usr_id`, `mzt_cliente_cli_id`, `mzt_proveedor_pro_id`, `usr_dtcreate`, `usr_nombre`, `usr_apellido`, `usr_cargo`, `usr_identificacion`, `usr_email`, `usr_pass`, `usr_telefono`, `usr_celular`, `usr_habilitado`, `usr_contacto`) VALUES
(1, 5, 4, '2013-05-14 21:17:41', 'tercer ensayo', 'secuencia', 'odsajuoidfsau', 'sfsd', 'asdas@asd.cd', 'AFA7A99B6F47185EB381114677B82598B4D1542E', 'l;kl;k', 'sdfsdf', 'si', 'no'),
(2, 1, NULL, '2013-05-14 21:17:41', 'prueba', 'apellido_prueba', 'testing', '123456789', 'prueba@correo.com', '95B490918894B85EB280AF6B54DB9DBF811ED3D7', '654987321', '321654987', 'si', 'no'),
(6, 4, NULL, '2013-05-22 11:10:07', 'Alex Mauricio', 'Castro RamÃ­rez', 'Desarrollador', '1045047741', 'alex@correo.com', 'E25B7359BB97A868FCBEA8A1E3A24521A866BEE3', '2763672', '3146218200', 'si', 'no'),
(36, 4, NULL, '2013-05-23 22:43:14', 'contacto01 edit', 'apellido01 edit', 'cargo01 edit', '01  edit', 'email01@correo.comedit', '', 'telefono01 edit', 'celular01 edit', 'no', 'si'),
(38, NULL, 1, '2013-05-23 22:49:57', 'contacto03  edit', 'apellido03 edit', 'cargo03 edit', '03 edit', 'email03@correo.comedit', '', 'telefono03 edit', 'celular03 edit', 'no', 'si'),
(40, NULL, 4, '2013-05-24 00:07:33', 'nombre04 edit', 'apellido04 edit', 'cargo04 edit', '04 edit', 'email04@correo.comedit', '', 'telefono04 edit', 'celular04 edit', 'no', 'si'),
(43, 5, NULL, '2013-05-24 00:13:18', 'nombre07 edit', 'apellido07 edit', 'cargo07 edit', '07 edit', 'email07@correo.comedit', '', 'telefono07 edit', 'celular07 edit', 'no', 'si'),
(44, 3, NULL, '2013-05-28 13:56:10', 'Contacto Fanalca e', 'Apellidoe', 'cargoe', 'identificacione', 'email@correo.ensayoe', '', 'telefonoe', 'celulare', 'no', 'si'),
(45, 6, NULL, '2013-05-29 18:45:57', 'wrewe', 'a', 'a', 'a', 'asda@correo.com', 'D2EAB8D40698AEF7B7FF53745B76FA25EDD5523C', 'a', 'a', 'si', 'no');

--
-- Volcado de datos para la tabla `mzt_usuario_has_mzt_perfiles`
--

INSERT INTO `mzt_usuario_has_mzt_perfiles` (`mzt_usuario_usr_id`, `mzt_perfiles_prf_id`) VALUES
(1, 1),
(2, 1),
(6, 1),
(1, 2),
(2, 2),
(6, 2),
(1, 3),
(2, 3),
(6, 3),
(1, 4),
(2, 4),
(6, 4),
(1, 5),
(2, 5),
(6, 5),
(1, 6),
(2, 6),
(6, 6),
(1, 7),
(2, 7),
(6, 7),
(1, 8),
(2, 8),
(6, 8),
(1, 9),
(2, 9),
(6, 9),
(1, 10),
(2, 10),
(6, 10),
(1, 11),
(2, 11),
(6, 11),
(1, 12),
(2, 12),
(6, 12),
(1, 13),
(2, 13),
(6, 13),
(1, 14),
(2, 14),
(6, 14),
(1, 15),
(2, 15),
(6, 15),
(1, 16),
(2, 16),
(6, 16),
(1, 17),
(2, 17),
(6, 17),
(2, 18),
(6, 18),
(2, 19),
(6, 19),
(2, 20),
(6, 20),
(2, 21),
(6, 21),
(2, 22),
(6, 22),
(2, 23),
(6, 23),
(2, 24),
(6, 24),
(2, 25),
(6, 25),
(2, 26),
(6, 26),
(2, 27),
(6, 27),
(2, 28),
(6, 28),
(2, 29),
(6, 29),
(2, 30),
(6, 30),
(2, 31),
(6, 31),
(2, 32),
(6, 32),
(2, 33),
(6, 33),
(2, 34),
(6, 34),
(2, 35),
(6, 35),
(2, 36),
(6, 36),
(2, 37),
(6, 37),
(2, 38),
(6, 38),
(2, 39),
(6, 39),
(2, 40),
(6, 40),
(2, 41),
(6, 41),
(2, 42),
(6, 42),
(2, 43),
(6, 43),
(2, 44),
(6, 44),
(2, 45),
(6, 45),
(2, 46),
(6, 46),
(2, 47),
(6, 47),
(2, 48),
(6, 48),
(2, 49),
(6, 49),
(2, 50),
(6, 50),
(2, 51),
(6, 51),
(2, 52),
(6, 52),
(2, 53),
(6, 53),
(2, 54),
(6, 54),
(2, 55),
(6, 55),
(2, 56),
(6, 56),
(2, 57),
(6, 57),
(2, 58),
(6, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
