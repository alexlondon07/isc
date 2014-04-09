-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 09-04-2014 a las 17:28:25
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `isc_db`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ass_archivos`
-- 

CREATE TABLE `ass_archivos` (
  `arc_id` int(11) NOT NULL auto_increment,
  `mzt_usuario_usr_id` int(11) default NULL,
  `arc_dtcreate` datetime default NULL,
  `arc_nombre` varchar(100) default NULL,
  `arc_tipo` varchar(45) default NULL,
  `arc_contenido` mediumblob,
  `arc_encoding` varchar(45) default NULL,
  `arc_tamanio` int(11) default NULL,
  PRIMARY KEY  (`arc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=284 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ass_cliente`
-- 

CREATE TABLE `ass_cliente` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ass_perfiles`
-- 

CREATE TABLE `ass_perfiles` (
  `prf_id` int(11) NOT NULL auto_increment,
  `prf_nombre` varchar(45) NOT NULL,
  `prf_descripcion` varchar(45) default NULL,
  PRIMARY KEY  (`prf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ass_usuario`
-- 

CREATE TABLE `ass_usuario` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=163 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ass_usuario_has_mzt_perfiles`
-- 

CREATE TABLE `ass_usuario_has_mzt_perfiles` (
  `mzt_usuario_usr_id` int(11) NOT NULL,
  `mzt_perfiles_prf_id` int(11) NOT NULL,
  PRIMARY KEY  (`mzt_usuario_usr_id`,`mzt_perfiles_prf_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
