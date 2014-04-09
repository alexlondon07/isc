$(document).on('ready', initcodigos);
var q, id_promotor, allFields, tips;

/**
 * se activa para inicializar el documento
 */
function initcodigos() {
    q = {};
    q.ke = _ucode;
    q.lu = _ulcod;
    q.ti = _utval;
    id_promotor = $("#id_promotor");
    allFields = $([]).add(id_promotor);
    tips = $(".validateTips");


    $('#dynamictable').dataTable({
        "sPaginationType": "full_numbers"
    });

    $("#crearcodigo").button().click(function() {
        q.id = 0;
        $("#dialog-form").dialog("open");
    });

    $("#dialog-form").dialog({
        autoOpen: false, height: 300, width: 550, modal: true,
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
        autoOpen: false, height: 300, width: 450, modal: true,
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