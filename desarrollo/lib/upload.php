<?php
$output_dir = "uploads/";
$rqst = $_REQUEST;
$nombre = isset($rqst['nombre']) ? $rqst['nombre'] : '';
if(isset($_FILES["myfile"]))
{
    //Filter the file types , if you want.
    if ($_FILES["myfile"]["error"] > 0)
    {
      echo "Error: " . $_FILES["file"]["error"] . "<br>";
    }
    else
    {
        //move the uploaded file to uploads folder;
        move_uploaded_file($_FILES["myfile"]["tmp_name"],$output_dir. $_FILES["myfile"]["name"]);
 
     echo "Uploaded File :".$_FILES["myfile"]["name"]." *** nombre = ".$nombre;
    }
 
}

?>
