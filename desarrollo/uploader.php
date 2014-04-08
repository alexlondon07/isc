<?php

require 'lib/ConectionDb.php';
$conexionDB = new ConectionDb();
$conexion = $conexionDB->openConect();
$file = $_FILES['archivo'];
if (isset($file)) {
    $file_name = utf8_decode($file['name']);
    $file_type = $file['type'];
    $file_tmp_name = $file['tmp_name'];
    $file_error = $file['error'];
    $file_size = $file['size'];
    $contenido = '';

    $fp = fopen($file_tmp_name, "rb");
    //echo '<br> este es el fp = ' . $fp . '<br><br>';
    $contenido = fread($fp, $file_size);
    //print_r($file);
    //echo '<br><br>';
    //echo $contenido.'<br><br>';
    $contenido = addslashes($contenido);
    fclose($fp);
    //echo 'contenido ' . $contenido . '<br><br>';
    if ($file_error == 0 && $file_size > 0 && $file_size < 16777216) {
        $q = "INSERT INTO mzt_archivos (arc_nombre,arc_tipo,arc_contenido,arc_tamanio)VALUES('" . $file_name . "','" . $file_type . "','" . $contenido . "','" . $file_size . "')";
        mysql_query($q, $conexion) or die("No se pudo realizar la consulta. ***isset***" . mysql_error() . '<br/><br/>' . $q);
        if ($q) {
            //echo "El archivo ha sido copiado exitosamente";
            echo $file_name;
        } else {
            echo "Ocurrio un error al subir el archivo.";
        }
    }
}
?>
 