<?php
include '../FileUpload.php';
$uploadDirectory = 'uploadedfiles';
$uploadFileInfoArr = $_FILES['archivo'];
$up = new FileUpload();
$uploadPath = $up->get_directory() . DIRECTORY_SEPARATOR . $uploadDirectory . DIRECTORY_SEPARATOR;
$respuesta = $up->uploadSingleFile(6, $uploadFileInfoArr, $uploadPath, "txt|rtf|pdf|doc|docx|xls|xlsx|ppt|pptx|avi|mp3|jpg|jpeg|gif|png|zip|rar", "no");
if ($respuesta['code'] == 0) {
    echo $respuesta['filename'];
} else {
    echo "ERROR";
    //echo "ERROR. CODE=" . $respuesta['code'] . " CONTENT=" . $respuesta['content'];
}
?> 