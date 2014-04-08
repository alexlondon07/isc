$(document).on('ready', initcliente);
var q, nombre, estado, allFields, tips;
var contactos, idcliente, idcont, band;
var bTabla = 0;

/**
 * se activa para inicializar el documento
 */
function initcliente() {
    q = {};
    q.ke = _ucode;
    q.lu = _ulcod;
    q.ti = _utval;
    nombre = $("#nombre");
    allFields = $([]).add(nombre);
    tips = $(".validateTips");


    $('#dynamictable').dataTable({
        "sPaginationType": "full_numbers"
    });

    $("#crearcliente").button().click(function() {
        q.id = 0;
        $("#dialog-form").dialog("open");
    });

    $("#dialog-form").dialog({
        autoOpen: false, height: 570, width: 850, modal: true,
        buttons: {
            "Guardar": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                bValid = bValid && checkLength(nombre, "nombre", 3, 30);
                if (bValid) {
                    CLIENTE.savedata();
                }
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
        autoOpen: false, height: 570, width: 850, modal: true,
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
    $("#dialog-form-contact").dialog({
        autoOpen: false, height: 480, width: 950, modal: true,
        buttons: {
            "Nuevo": function() {
                $("#dialog-form-crear-cont").dialog("open");
            },
            "Cancelar": function() {
                UTIL.clearForm("formcreate-crear");
                $(this).dialog("close");
            }
        },
        close: function() {
            UTIL.clearForm('formcreate-crear');
            updateTips('');
        }
    });

    $("#dialog-form-crear-cont").dialog({
        autoOpen: false,
        height: 580,
        width: 450,
        modal: true,
        buttons: {
            "Guardar": function() {
                var bValid = true;
                allFields.removeClass("ui-state-error");
                //bValid = bValid && checkLength(nombre, "nombre", 3, 16);
                //if ("seleccione" == $("#idcli").val()){
                //  bValid = false;
                //updateTips('Seleccione el cliente al cual pertenece el usuario.');
                //}
                if (bValid) {
                    CLIENTE.savecontact();
                    //$(this).dialog("close");
                }
            },
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

    $("#dialog-form-ver-cont").dialog({
        autoOpen: false,
        height: 580,
        width: 450,
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
}

var CLIENTE = {
    hideshowDim: function(Mostrar) {
        if (Mostrar == "No") {
            show = '';
        } else if (Mostrar == "Si") {
            show = 's';
        }
        if ($('#matrizces' + show).val() == 'No') {
            $('#divsector' + show).hide();
        } else {
            $('#divsector' + show).show();
        }
    },
    editcont: function(id) {
        c = {};
        idcont = id;
        c.ke = _ucode;
        c.lu = _ulcod;
        c.ti = _utval;
        c.op = 'contactget';
        c.id = id;
        c.idcli = idcliente;
        band = 1;//Para que envíe el id en save data y no lo guarde como uno nuevo sino que lo edite
        debugger;
        UTIL.callAjaxRqst(c, this.editconthandler);
    },
    editconthandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            //idcont='';
            var res = data.output.response[0];
            //$('#idclisu').val(res.idcli);
            $('#nombrec').val(res.nombre);
            $('#apellidoc').val(res.apellido);
            $('#emailc').val(res.email);
            $('#identificacionc').val(res.identificacion);
            $('#celularc').val(res.celular);
            $('#cargoc').val(res.cargo);
            $('#telefonoc').val(res.telefono);
            $("#dialog-form-crear-cont").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    showcont: function(id) {
        c = {};
        c.ke = _ucode;
        c.lu = _ulcod;
        c.ti = _utval;
        c.op = 'contactget';
        c.id = id;
        c.idcli = idcliente;
        debugger;
        UTIL.callAjaxRqst(c, this.showconthandler);
    },
    showconthandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response[0];
            //$('#idclisu').val(res.idcli);
            $('#nombrecv').val(res.nombre);
            $('#apellidocv').val(res.apellido);
            $('#emailcv').val(res.email);
            $('#identificacioncv').val(res.identificacion);
            $('#celularcv').val(res.celular);
            $('#cargocv').val(res.cargo);
            $('#telefonocv').val(res.telefono);
            $("#dialog-form-ver-cont").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    deletecont: function(id) {
        var continuar = confirm('Va a eliminar información de forma irreversible.\n¿Desea continuar?');
        if (continuar) {
            c = {};
            c.ke = _ucode;
            c.lu = _ulcod;
            c.ti = _utval;
            c.op = 'usrdelete';
            c.id = id;
            UTIL.callAjaxRqst(c, this.deleteconthandler);
        }
    },
    deleteconthandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            window.location = 'clientes.php';
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    savecontact: function() {
        c = {};
        c.ke = _ucode;
        c.lu = _ulcod;
        c.ti = _utval;
        c.contacto = 'si';
        c.op = 'usrsave';
        c.idcli = idcliente;
        if (band == 1) {
            c.id = idcont;
            idcont = "";
            band = 0;
        } else {
            c.id = "";
        }
        c.nombre = $('#nombrec').val();
        c.apellido = $('#apellidoc').val();
        c.cargo = $('#cargoc').val();
        c.email = $('#emailc').val();
        c.identificacion = $('#identificacionc').val();
        c.celular = $('#celularc').val();
        c.telefono = $('#telefonoc').val();
        debugger;
        UTIL.callAjaxRqst(c, this.savecontacthandler);
    },
    savecontacthandler: function(data) {
        UTIL.cursorNormal();
        bandContacto = 0;
        if (data.output.valid) {
            updateTips('Información guardada correctamente');
            window.location = 'clientes.php';
        } else {
            updateTips('Error: ' + data.output.response.content);
        }
    },
    showcontact: function(id) {
        idcliente = id;
        c = {};
        c.ke = _ucode;
        c.lu = _ulcod;
        c.ti = _utval;
        c.op = 'contactget';
        c.idcli = id;
        debugger;
        UTIL.callAjaxRqst(c, this.showcontacthandler);
    },
    showcontacthandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response;
            contactos = res;
            var cont = '';
            debugger;
            for (var i in res) {
                cont += '<tr class="gradeC">\n\
                            <td class="con0">\n\
                                <a href="#" onclick= "CLIENTE.editcont(' + contactos[i]['id'] + ')"><span class="icon-pencil"></span></a>\n\
                                <a href="#" onclick= "CLIENTE.deletecont(' + contactos[i]['id'] + ')"><span class="icon-trash"></span></a>\n\
                                <a href="#" onclick= "CLIENTE.showcont(' + contactos[i]['id'] + ')"><span class="icon-eye-open"></span></a>\n\
                            </td>\n\
                            <td class="con1">' + contactos[i]['identificacion'] + '</td>\n\
                            <td class="con0">' + contactos[i]['nombre'] + ' ' + contactos[i]['apellido'] + '</td>\n\
                            <td class="con1">' + contactos[i]['telefono'] + ' / ' + contactos[i]['celular'] + '</td>\n\
                            <td class="con0">' + contactos[i]['email'] + '</td>\n\
                       </tr>';
            }
            debugger;
            $("#dialog-form-contact").dialog("open");
            $("#mostrar_contactos").empty();
            $("#mostrar_contactos").append(cont);
            if (bTabla == 0) {
                $('#dynamictablecontact').dataTable({
                    "sPaginationType": "full_numbers"
                });
                bTabla = 1;
            }
        } else {
            debugger;
            if (data.output.response.content == ' Sin resultados.') {
                ////alert(data.output.response.content);
                aviso = '<tr class="gradeC">\n\
                            <td class="con0"></td>\n\
                            <td class="con1">Sin Contactos</td>\n\
                            <td class="con0"></td>\n\
                            <td class="con1"></td>\n\
                            <td class="con0"></td>\n\
                       </tr>';
                $("#dialog-form-contact").dialog("open");
                $("#mostrar_contactos").empty();
                $("#mostrar_contactos").append(aviso);

                if (bTabla == 0) {
                    $('#dynamictablecontact').dataTable({
                        "sPaginationType": "full_numbers"
                    });
                    bTabla = 1;
                }
            } else {
                //alert('Error: ' + data.output.response.content);
            }
        }

    },
    showdata: function(id) {
        q.op = 'cliget';
        q.id = id;
        debugger;
        UTIL.callAjaxRqst(q, this.showdatahandler);
    },
    showdatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response[0];
            $('#nombresc').val(res.nombre);
            $('#emailsc').val(res.email);
            $('#nitsc').val(res.nit);
            $('#telefonosc').val(res.telefono);
            $('#paissc').val(res.pais);
            $('#departamentosc').val(res.departamento);
            $('#ciudadsc').val(res.ciudad);
            $('#direccionsc').val(res.direccion);
            $("#dialog-formsc").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    deletedata: function(id) {
        var continuar = confirm('Va a eliminar información de forma irreversible.\n¿Desea continuar?');
        if (continuar) {
            q.op = 'clidelete';
            q.id = id;
            debugger;
            UTIL.callAjaxRqst(q, this.deletedatahandler);
        }
    },
    deletedatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            window.location = 'clientes.php';
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    editdata: function(id) {
        q.op = 'cliget';
        q.id = id;
        UTIL.callAjaxRqst(q, this.editdatahandler);
    },
    editdatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            var res = data.output.response[0];
            $('#nombre').val(res.nombre);
            $('#email').val(res.email);
            $('#nit').val(res.nit);
            $('#telefono').val(res.telefono);
            $('#pais').val(res.pais);
            $('#departamento').val(res.departamento);
            $('#ciudad').val(res.ciudad);
            $('#direccion').val(res.direccion);
            $("#dialog-form").dialog("open");
        } else {
            //alert('Error: ' + data.output.response.content);
        }
    },
    savedata: function() {
        q.op = 'clisave';
        q.nombre = $('#nombre').val();
        q.email = $('#email').val();
        q.nit = $('#nit').val();
        q.telefono = $('#telefono').val();
        q.pais = $('#pais').val();
        q.departamento = $('#departamento').val();
        q.ciudad = $('#ciudad').val();
        q.direccion = $('#direccion').val();
        UTIL.callAjaxRqst(q, this.savedatahandler);
    },
    savedatahandler: function(data) {
        UTIL.cursorNormal();
        if (data.output.valid) {
            updateTips('Información guardada correctamente');
            window.location = 'clientes.php';
        } else {
            updateTips('Error: ' + data.output.response.content);
        }
    }
}

