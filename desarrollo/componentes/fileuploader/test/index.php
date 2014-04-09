<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es-es" lang="es-es" > 
    <head> 
        <title>Ejemplo de formulario para subir archivos usando AJAX</title> 
        <link rel="stylesheet" type="text/css" href="../resources/upload-ajax.css"/>
        <script src="../resources/jquery-1.10.2.min.js"></script>
        <script src="../resources/jquery.form.js"></script>
        <script src="../resources/upload-ajax.js"></script>
        <script>
            function responseUpload(response, hidden_id) {
                $("#message").empty();
                //aqui se muestra de forma visible lo que devuelve el servidor
                $("#message").append("<font color='green'> Archivo cargado: " + response.responseText + "</font>");
                //aqui se carga el valor invisible HIDDEN
                $("#message").append("<input type='hidden' id='" + hidden_id + "' name='" + hidden_id + "' value='" + response.responseText + "' />");
            }

            $(document).ready(function() {
                sendAjaxForm(responseUpload, 'form_file', 'progress', 'bar', 'percent', 'hidden_id');
            });
        </script>
    </head> 
    <body> 
        <form class="upload-form" id="form_file" name="form_file" method="POST" action="uploader.php" enctype="multipart/form-data"> 
            <input type="file" name="archivo" id="archivo" /> 
            <BR/>
            <input name="boton" type="submit" id="boton" value="Cargar archivo" />
            <div class="upload-progress" id="progress">
                <div class="upload-bar" id="bar"></div>
                <div class="upload-percent" id="percent">0%</div >
            </div>
            <br/>
        </form>
        <div id="message"></div>
    </body> 
</html>
