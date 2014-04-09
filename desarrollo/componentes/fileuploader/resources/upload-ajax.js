/**
 * Funcion que encapsula la carga de archivos por ajax.
 * Requiere:
 * 
 * http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.js
 * http://malsup.github.io/jquery.form.js
 * 
 * @param {function} callBackResponse, funcion que captura la respuesta del servidor
 * @param {String} form_id, ID del formulario que contiene el formulario con el archivo a enviar
 * @param {String} progress_id, ID del div que contiene bar_id y percent_id
 * @param {String} bar_id, ID del div que indica el porcentaje de avance
 * @param {String} percent_id, ID del div que contiene el valor numerico del avance en porcentaje
 * @param {String} listener_id, ID del elemento que recibe la respuesta
 */
function sendAjaxForm(callBackResponse, form_id, progress_id, bar_id, percent_id, listener_id ) {
    var options = {
        beforeSend: function()
        {
            $("#" + progress_id).show();
            //clear everything
            $("#" + bar_id).width('0%');
            $("#" + percent_id).html("0%");
        },
        uploadProgress: function(event, position, total, percentComplete)
        {
            $("#" + bar_id).width(percentComplete + '%');
            $("#" + percent_id).html(percentComplete + '%');
        },
        success: function()
        {
            $("#" + bar_id).width('100%');
            $("#" + percent_id).html('100%');
            $("#" + form_id + " #archivo").hide();
            $("#" + form_id + " #boton").hide();
        },
        complete: function (response){
            callBackResponse(response, listener_id);
        },
        error: function()
        {
            $("#" + percent_id).html("<font color='red'> ERROR: al cargar archivo</font>");
        }
    };

    $("#" + form_id).ajaxForm(options);
}