<?php
include 'include/generic_validate_session.php';
include 'lib/ControllerUser.php';
/**
 * se cargan los permisos 
 */
//if (!$SESSION_DATA->getPermission(5)) {
//    header('Location: main.php');
//}
//$create = $SESSION_DATA->getPermission(6);
//$edit = $SESSION_DATA->getPermission(7);
//$delete = $SESSION_DATA->getPermission(8);
//$editpermission = $SESSION_DATA->getPermission(9);
/**
 * se cargan datos
 */
$USUARIO = new ControllerUser();
$USUARIO->usrget();
//$USUARIO->contactget();
$arrusuarios = $USUARIO->getResponse();
$isvalid = $arrusuarios['output']['valid'];
$arrusuarios = $arrusuarios['output']['response'];
?>
<!DOCTYPE html>
<html>
    <head>
        <?php include 'include/generic_head.php'; ?>
    </head>
    <body>
        <header>
            <?php
            include 'include/generic_header.php';
            ?>
        </header>
        <section id="section_wrap">
            <?php
            $_ACTIVE_SIDEBAR = 'usuario';
            include 'include/generic_navbar.php';
            ?>
            <div class="container">
                <h2>Usuarios</h2>
                <?php
                //if ($create) {
                    ?>
                    <a href="#" id="crearusuario" class="btn btn-info botoncrear">Crear</a>
                    <?php
                //}
                ?>
                <div>
                    <table class="table table-hover dyntable" id="dynamictable">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 100px;">Acciones</th>
                                <th class="head1">Identificación</th>
                                <th class="head0">Nombre completo</th>
                                <th class="head1">Telefono / Celular</th>
                                <th class="head0">Email</th>
                            </tr>
                        </thead>
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
<!--                                    <td class="con0"><a href="#" onclick="editdata();"><span class="ui-icon ui-icon-pencil"></span></a><a href="#"><span class="ui-icon ui-icon-trash"></span></a></td>-->
                        <tbody>
                            <?php
                            $c = count($arrusuarios);
                            if ($isvalid) {
                                for ($i = 0; $i < $c; $i++) {
                                    ?>
                                    <tr class="gradeC">
                                        <td class="con0">
                                            <?php
                                            //if ($delete) {
                                                ?>
                                                <a href="#" onclick="USUARIO.editdata(<?php echo $arrusuarios[$i]['id']; ?>);"><span class="icon-pencil"></span></a>
                                                <?php
                                            //}
                                            //if ($edit) {
                                                ?>
                                                <a href="#" onclick="USUARIO.deletedata(<?php echo $arrusuarios[$i]['id']; ?>);"><span class="icon-trash"></span></a>
                                                <?php
                                            //}
                                            if ($editpermission) {
                                                ?>
                                                <a href="#" onclick="USUARIO.editpermission(<?php echo $arrusuarios[$i]['id']; ?>);"><span class="icon-ban-circle"></span></a>
                                                <?php
                                            }
                                            ?>
                                            <a href="#" onclick="USUARIO.showuserdata(<?php echo $arrusuarios[$i]['id']; ?>);"><span class="icon-eye-open"></span></a>
                                            <a target="_blank" href="archivosverusuarios.php?ac=view&id=<?php echo $arrusuarios[$i]['id']; ?>"><span class="icon-zoom-in"></span></a><span>&nbsp;</span>
                                        </td>
                                        <td class="con1"><?php echo $arrusuarios[$i]['identificacion']; ?></td>
                                        <td class="con0"><?php echo $arrusuarios[$i]['nombre'] . ' ' . $arrusuarios[$i]['apellido']; ?></td>
                                        <td class="con1"><?php echo $arrusuarios[$i]['telefono'] . ' / ' . $arrusuarios[$i]['celular']; ?></td>
                                        <td class="con0"><?php echo $arrusuarios[$i]['email']; ?></td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>	    
        </section>
        <footer id="footer_wrap">
            <?php include 'include/generic_footer.php'; ?>
        </footer>
        <div id="dialog-form" title="Usuario" style="display: none;">
            <p class="validateTips"></p>
            <table>
                <tr>
                    <td>
                        <!--<form id="formcreate1" class="form-horizontal">-->
                        <form id="formcreate1" class="form-horizontal" method="POST" action="usuariocreate.php" enctype="multipart/form-data">    
                            <div style="width: 49%; display: inline-block; vertical-align: top;">
                                <div class="control-group">
                                    <label class="control-label">Pertenenece a</label>
                                    <div class="controls">
                                        <select name="idcli" id="idcli" class="text ui-widget-content ui-corner-all">
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Nombres</label>
                                    <div class="controls"><input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Apellidos</label>
                                    <div class="controls"><input type="text" name="apellido" id="apellido" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Email</label>
                                    <div class="controls"><input type="email" name="email" id="email" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Contraseña</label>
                                    <div class="controls"><input type="password" name="pass" id="pass" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Repita Contraseña</label>
                                    <div class="controls"><input type="password" name="pass1" id="pass1" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                            </div>
                            <div style="width: 49%; display: inline-block; vertical-align: top;">
                                <div class="control-group">
                                    <label class="control-label">Identificación</label>
                                    <div class="controls"><input type="text" name="identificacion" id="identificacion" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Cargo</label>
                                    <div class="controls"><input type="text" name="cargo" id="cargo" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Celular</label>
                                    <div class="controls"><input type="text" name="celular" id="celular" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Telefono</label>
                                    <div class="controls"><input type="text" name="telefono" id="telefono" class="text ui-widget-content ui-corner-all" /></div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Habilitado</label>
                                    <div class="controls"><select name="habilitado" id="habilitado" class="text ui-widget-content ui-corner-all">
                                            <option value="si">Sí</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                                </div>
                                <label class="control-label">Archivo (Max. 14MB)</label>
                                <div class="controls">
                                    <input type="hidden" name="op" id="op" value="usrsaveimage"/>
                                    <input type="hidden" name="ke" id="ke" />
                                    <input type="hidden" name="lu" id="lu" />
                                    <input type="hidden" name="ti" id="ti" />
                                    <input type="text" name="ref_imagen" id="ref_imagen" class="text ui-widget-content ui-corner-all" />
                                    <input type="file" name="archivo" id="archivo" />
                                </div>
                                <div class="control-group">
                                    <input type="text" name="keyid" id="keyid" class="text ui-widget-content ui-corner-all" style="display:none; "/>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">&nbsp;</label>
                                    <div class="controls">&nbsp;</div>
                                </div>
                            </div>

                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div id="dialog-formsu" title="Usuario" style="display: none;">
            <p class="validateTips"></p>
            <table>
                <tr>
                    <td>
                        <form id="formcreate1" class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Pertenenece a</label>
                                <div class="controls"><input readonly type="text" name="idclisu" id="idclisu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Nombre</label>
                                <div class="controls"><input readonly type="text" name="nombresu" id="nombresu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Apellidos</label>
                                <div class="controls"><input readonly type="text" name="apellidosu" id="apellidosu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Email</label>
                                <div class="controls"><input readonly type="email" name="emailsu" id="emailsu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Identificación</label>
                                <div class="controls"><input readonly type="text" name="identificacionsu" id="identificacionsu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Cargo</label>
                                <div class="controls"><input readonly type="text" name="cargosu" id="cargosu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>
                        </form>
                    </td>
                    <td>
                        <form id="formcreate2" class="form-horizontal">
                            <div class="control-group">
                                <label class="control-label">Celular</label>
                                <div class="controls"><input readonly type="text" name="celularsu" id="celularsu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Telefono</label>
                                <div class="controls"><input readonly type="text" name="telefonosu" id="telefonosu" class="text ui-widget-content ui-corner-all" /></div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">Habilitado</label>
                                <div class="controls"><input readonly type="text" name="telefonosu" id="habilitadosu" class="text ui-widget-content ui-corner-all" /></div>

                            </div>
                            <div class="control-group">
                                <label class="control-label">&nbsp;</label>
                                <div class="controls">&nbsp;</div>
                            </div>
                        </form>
                    </td>
                </tr>
            </table>
        </div>
        <div id="dialog-permission" title="Permisos">
            <div class="control-group"> 
                <label class="control-label">Checkear Todos <input type="checkbox" onChange="USUARIO.getSeleccionarTodos();" name="check_todos" id="check_todos" /> </label> 
            </div>
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formpermission">
                <div class="check"><input type="checkbox" checked="true" name="chk1" id="chk1" class="text ui-widget-content ui-corner-all" /><span>&nbsp;&nbsp;</span><label>Franquicia</label></div>
            </form>
        </div>
        <?php include 'include/generic_script.php'; ?>
        <link rel="stylesheet" media="screen" href="css/dynamictable.css" type="text/css" />
        <script type="text/javascript" src="js/jquery/jquery-dataTables.js"></script>
        <script type="text/javascript" src="js/lib/data-sha1.js"></script>
        <script type="text/javascript" src="js/usuario.js"></script>
    </body>
</html>