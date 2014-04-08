$(document).on('ready', initusuario);
var q, nombre, allFields, tips;
var clientes = new Array();
/**
 * se activa para inicializar el documento
 */
function initusuario() {
    q = {};
    q.ke = _ucode;
    q.lu = _ulcod;
    q.ti = _utval;
    nombre = $("#nombre");
    $("#ke").val(_ucode);
    $("#lu").val(_ulcod);
    $("#ti").val(_utval);
    allFields = $([]).add(nombre);
    tips = $(".validateTips");
    $('#dynamictable').dataTable({
        "sPaginationType": "full_numbers"
    });
    $("#crearusuario").button().click(function() {
        q.id = 0;
        $("#dialog-form").dialog("open");
    });
    $("#dialog-form").dialog({
        autoOpen: false,
        height: 570,
        width: 1000,
        modal: true,
        buttons: {
            "Guardar": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                bValid = bValid && checkLength(nombre, "nombre", 3, 16);
                if ($("#cargo").val() == "") {
                    bValid = false;
                    updateTips('Digite su cargo.');
                }
                if ($("#identificacion").val() == "") {
                    bValid = false;
                    updateTips('Digite su idenficación.');
                }
                if ($("#email").val() == "") {
                    bValid = false;
                    updateTips('Ingrese un email.');
                } else if (USUARIO.validate_email($("#email").val())) {
                    USUARIO.verificarEmailAjax();//VERIFICO SI EL CORREO ESTA DISPONIBLE CON AJAX
                } else {
                    bValid = false;
                    updateTips('El email no es valido.');
                }
                if ($("#apellido").val() == "") {
                    bValid = false;
                    updateTips('Digite el apellido.');
                }
                if ($("#nombre").val() == "") {
                    bValid = false;
                    updateTips('Digite el nombre.');
                }
                if ("seleccione" == $("#idcli").val()) {
                    bValid = false;
                    updateTips('Seleccione el cliente al cual pertenece el usuario.');
                }

                if (bValid) {
                    $('#formcreate1').submit();
                    //USUARIO.savedata();
                    //$(this).dialog("close");
                }
            },
            "Cancelar"
                    : function() {
                UTIL.clearForm('formcreate1');
                //UTIL.clearForm('formcreate2');
                $(this).dialog("close");
            }
        },
        close: function() {
            UTIL.clearForm('formcreate1');
            //UTIL.clearForm('formcreate2');
            updateTips('');
        }
    });
    $("#dialog-formsu").dialog({
        autoOpen: false,
        height: 580,
        width: 900,
        modal: true,
        buttons: {
            "Cancelar": function() {
                UTIL.clearForm('formcreate1');
                UTIL.clearForm('formcreate2');
                $(this).dialog("close");
            }
        },
        close: function() {
            UTIL.clearForm('formcreate1');
            UTIL.clearForm('formcreate2');
            updateTips('');
        }
    });
    $("#dialog-permission").dialog({
        autoOpen: false,
        height: 530,
        width: 240,
        modal: true,
        buttons: {
            "Guardar": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                if (bValid) {
                    USUARIO.savepermission();
                    //$(this).dialog("close");
                }
            },
            "Cancelar": function() {
                UTIL.clearForm('formpermission');
                $(this).dialog("close");
            }
        },
        close: function() {
            UTIL.clearForm('formpermission');
            updateTips('');
        }
    });
    USUARIO.getcustomer();
}

var USUARIO = {
    verificarEmailAjax: function() {
        if ($('#email').val() != "") {
            $.ajax({
                type: "POST",
                url: "validar.php",
                dataType: "html",
                data: "email=" + $('#email').val(),
                success: function(respuesta) {
                    if (respuesta == 1) {
                        //bValid = false;
                        //updateTips('Disponible.');
                    }
                    else {
                        bValid = false;
                        updateTips('El correo ingresado ya lo utiliza otro usuario.');
                    }
                }
            });
        }
    },
    getSeleccionarTodos: function() {
        q.op = 'usrprfget';
        UTIL.callAjaxRqst(q, this.getSeleccionarTodoshandler);
    },
    getSeleccionarTodoshandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var ava = data.output.available;
            if ($("#check_todos").is(':checked')) {
                $("#formpermission :input").each(function() {
                    for (var j in ava) {
                        this.checked = true;
                    }
                });
            } else {
                $("#formpermission :input").each(function() {
                    for (var j in ava) {
                        this.checked = false;
                    }
                });
            }
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    showuserdata: function(id) {
        q.op = 'usrget';
        q.id = id;
        UTIL.callAjaxRqst(q, this.showdatahandler);
    },
    showdatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response[0];
            var resa = data.output.response2[0];
            $('#idclisu').val(clientes[res.idcli]);
            //$('#idclisu').val(res.idcli);
            $('#nombresu').val(res.nombre);
            $('#apellidosu').val(res.apellido);
            $('#cargosu').val(res.cargo);
            $('#emailsu').val(res.email);
            $('#passsu').val(res.pass);
            $('#identificacionsu').val(res.identificacion);
            $('#celularsu').val(res.celular);
            $('#telefonosu').val(res.telefono);
            $('#habilitadosu').val(res.habilitado);
            //ARCHIVOS
            if (resa != null) {
                $('#ref_imagen').val(resa.ref_imagen);
            }
            $("#dialog-formsu").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    deletedata: function(id) {
        var continuar = confirm('Va a eliminar información de forma irreversible.\n¿Desea continuar?');
        if (continuar) {
            q.op = 'usrdelete';
            q.id = id;
            UTIL.callAjaxRqst(q, this.deletedatahandler);
        }
    },
    deletedatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            window.location = 'usuario.php';
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    editdata: function(id) {
        q.op = 'usrget';
        q.id = id;
        UTIL.callAjaxRqst(q, this.editdatahandler);
    },
    editdatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response[0];
            var resa = data.output.response2[0];
            $('#idcli').val(res.idcli);
            $('#nombre').val(res.nombre);
            $('#apellido').val(res.apellido);
            $('#cargo').val(res.cargo);
            $('#email').val(res.email);
            $('#pass').val(res.pass);
            $('#identificacion').val(res.identificacion);
            $('#celular').val(res.celular);
            $('#telefono').val(res.telefono);
            $('#habilitado').val(res.habilitado);
            $('#keyid').val(res.id);
            //ARCHIVOS
            if (resa != null) {
                $('#ref_imagen').val(resa.ref_imagen);
            }
            $("#dialog-form").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    editpermission: function(id) {
        q.op = 'usrprfget';
        q.id = id;
        UTIL.callAjaxRqst(q, this.editpermissionhandler);
    },
    editpermissionhandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var ava = data.output.available;
            var ass = data.output.assigned;
            var chks = '';
            for (var i in ava) {
                chks += '<div class="check"><input type="checkbox" name="chk' + ava[i].id + '" id="chk' + ava[i].id + '" value="' + ava[i].id + '" class="text ui-widget-content ui-corner-all" /><span>&nbsp;&nbsp;</span><label>' + ava[i].nombre + '</label></div>';
            }
            $("#formpermission").empty();
            $("#formpermission").append(chks);
            $("#formpermission :input").each(function() {
                var p = $(this).attr('id');
                for (var j in ass) {
                    var idchk = 'chk' + ass[j].id;
                    if (p == idchk) {
                        $(this).attr('checked', 'true')
                    }
                }
            });
            $("#dialog-permission").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    getcustomer: function() {
        q.op = 'cliget';
        UTIL.callAjaxRqst(q, this.getcustomerHandler);
    },
    getcustomerHandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response;
            var option = '<option value="seleccione">Seleccione...</option>';
            for (var i in res) {
                option += '<option value="' + res[i].id + '">' + res[i].nombre + '</option>';
                clientes[res[i].id] = res[i].nombre;
            }
            $("#idcli").empty();
            $("#idcli").append(option);
            //Para luego
            /* $('#dynamictable').dataTable({
             "sPaginationType": "full_numbers"
             });*/
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    savepermission: function() {
        var chk = '';
        var inputs = document.getElementById('formpermission').getElementsByTagName("input"); // get element by tag name
        for (var i in inputs) {
            if (inputs[i].type == "checkbox") {
                if ($("#" + inputs[i].id).is(':checked')) {
                    chk += $("#" + inputs[i].id).val() + '-';
                }
            }
        }
        q.op = 'usrprfsave';
        q.chk = chk;
        UTIL.callAjaxRqst(q, this.savepermissionhandler);
    },
    savepermissionhandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            updateTips('Información guardada correctamente');
            $("#dialog-permission").dialog("close");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    validate_email: function(valor) {
        // creamos nuestra regla con expresiones regulares.
        filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
        // utilizamos test para comprobar si el parametro valor cumple la regla
        if (filter.test(valor))
            return true;
        else
            return false;
    },
    savedata: function() {



//        q.contacto = 'no';
//        q.op = 'usrsave';
//        q.idcli = $('#idcli').val();
//        q.nombre = $('#nombre').val();
//        q.apellido = $('#apellido').val();
//        q.cargo = $('#cargo').val();
//        q.email = $('#email').val();
//        q.pass = '';
//        if ($('#pass').val().length > 1) {
//            q.pass = hex_sha1($('#pass').val());
//        }
//        q.identificacion = $('#identificacion').val();
//        q.celular = $('#celular').val();
//        q.telefono = $('#telefono').val();
//        q.pais = $('#pais').val();
//        q.departamento = $('#departamento').val();
//        q.ciudad = $('#ciudad').val();
//        q.direccion = $('#direccion').val();
//        q.habilitado = $('#habilitado').val();
        //debugger;
        //$('#formcreate1').submit();
        UTIL.callAjaxRqst(q, this.savedatahandler);
    },
    savedatahandler: function(data) {
        UTIL.cursorNormal();
        bandContacto = 0;
        if (data.output.valid) {
            updateTips('Información guardada correctamente');
            window.location = 'usuario.php';
        } else {
            updateTips('Error: ' + data.output.response.content);
        }
    }
}

