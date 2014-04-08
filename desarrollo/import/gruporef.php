<?php

//include '../lib/ConectionDb.php';
//include '../lib/Util.php';
//
//$CDB = new ConectionDb();
//$UTILITY = new Util();
//$conexion = $CDB->openConect();

//$fp = fopen('csv_grupo_referencias.csv', 'r') or die("can't open file");
//
//
//while ($csv_line = fgetcsv($fp, 1024)) {
//    for ($i = 0, $j = count($csv_line); $i < $j; $i++) {
//	$arr = explode(";", $csv_line[$i]);
//	$idref = $arr[0];
//	for ($i = 1; $i < count($arr); $i++) {
//	    $q = "INSERT INTO mzt_ref_grupo_insumo (rgi_dtcreate, mzt_ref_grupo_rfg_id, mzt_referencias_ref_id, rgi_cant_x_refer) VALUES (NOW(), '" . $idref . "'";
//	    if ($arr[$i] != '') {
//		$nombreref = $arr[$i];
//		$idref2 = 0;
//		$qref = "SELECT ref_id FROM mzt_referencias WHERE ref_referencia = '" . $nombreref . "'";
//		$con = mysql_query($qref, $conexion) or die(mysql_error() . "***ERROR: " . $qref);
//		while ($obj = mysql_fetch_object($con)) {
//		    $idref2 = $obj->ref_id;
//		}
//		if ($idref2 > 0){
//		    $q .= ", '" . $idref2 . "','1');";
//		    echo $q . "<br/>";
//		}
//	    }
//	}
//    }
//}
//fclose($fp) or die("can't close file");

for ($index = 0; $index < 550; $index++) {
    $q="INSERT INTO mzpro_dev.mzt_ref_grupo_has_mzt_marco (mzt_ref_grupo_rfg_id, mzt_marco_mrc_id, dtcreate) VALUES (".$index.", 1, NOW());";
    echo $q . "<br/>";
}


?>
