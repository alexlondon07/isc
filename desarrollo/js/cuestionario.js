$(document).on('ready', initcuestionario);
var q, pregunta, allFields, tips;

/**
 * se activa para inicializar el documento
 */
function initcuestionario() {
    q = {};
    q.ke = _ucode;
    q.lu = _ulcod;
    q.ti = _utval;
    pregunta = $("#pregunta");
    allFields = $([]).add(pregunta);
    tips = $(".validateTips");


    $('#dynamictable').dataTable({
        "sPaginationType": "full_numbers"
    });

    $("#crearcuestionario").button().click(function() {
        q.id = 0;
        $("#dialog-form").dialog("open");
    });

    $("#dialog-form").dialog({
        autoOpen: false, height: 500, width: 550, modal: true,
        buttons: {
            "Guardar": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
//               bValid = bValid && checkLength(nombre, "nombre", 3, 30);
//                if (bValid) {
//                    CLIENTE.savedata();
//                }
            },
            "Cancelar": function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            UTIL.clearForm('formcreate');
            updateTips('');
        }
    });
    $("#dialog-formsc").dialog({
        autoOpen: false, height: 500, width: 450, modal: true,
        buttons: {
            "Cancelar": function() {
                $(this).dialog("close");
            }
        },
        close: function() {
            UTIL.clearForm('formcreate');
            updateTips('');
        }
    });
}