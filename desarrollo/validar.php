<?php
require 'lib/ConectionDb.php';
if (isset($_REQUEST['email'])) {
    $conexionDB = new ConectionDb();
    $conexion = $conexionDB->openConect();
    $correo = $_POST['email'];
    $consulta = "SELECT usr_id FROM mzt_usuario WHERE usr_email = '" . $correo . "'";
    $con = mysql_query($consulta, $conexion) or die(mysql_error() . "***ERROR: " . $consulta);
    $result = mysql_num_rows($con);
    if ($result > 0) {
        //Esta NO disponible
        echo 0;
    } else {
        //Esta disponible
        echo 1;
    }
}
?>


