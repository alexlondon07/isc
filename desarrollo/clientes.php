<?php
include 'include/generic_validate_session.php';
include 'lib/ControllerCustomer.php';
/**
 * se cargan los permisos 
 */
//if (!$SESSION_DATA->getPermission(1)) {
//    header('Location: main.php');
//}
//$create = $SESSION_DATA->getPermission(2);
//$edit = $SESSION_DATA->getPermission(3);
//$delete = $SESSION_DATA->getPermission(4);

/**
 * se cargan datos
 */
$CLIENTE = new ControllerCustomer();
$CLIENTE->cliget();
$arrclientes = $CLIENTE->getResponse();
$isvalid = $arrclientes['output']['valid'];
$arrclientes = $arrclientes['output']['response'];
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
	    $_ACTIVE_SIDEBAR = 'clientes';
	    include 'include/generic_navbar.php';
	    ?>
            <div class="container">
		<h2>Clientes</h2>
		<?php
		if ($create) {
		    ?>
    		<a href="#" id="crearcliente" class="btn btn-info botoncrear">Crear</a>
		    <?php
		}
		?>
                <div>
                    <table class="table table-hover dyntable" id="dynamictable">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 70px;">Acciones</th>
                                <th class="head1">Nombre</th>
                                <th class="head0">Nit</th>
                                <th class="head1">Telefono</th>
                            </tr>
                        </thead>
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                        </colgroup>
<!--                                    <td class="con0"><a href="#" onclick="editdata();"><span class="ui-icon ui-icon-pencil"></span></a><a href="#"><span class="ui-icon ui-icon-trash"></span></a></td>-->
                        <tbody>
			    <?php
			    $c = count($arrclientes);
			    if ($isvalid) {
				for ($i = 0; $i < $c; $i++) {
				    ?>
				    <tr class="gradeC">
					<td class="con0">
					    <?php
					    //if ($delete) {
						?>
	    				    <a href="#" onclick="CLIENTE.editdata(<?php echo $arrclientes[$i]['id']; ?>);"><span class="icon-pencil"></span></a>
						<?php
					   // }
					    //if ($edit) {
						?>
	    				    <a href="#" onclick="CLIENTE.deletedata(<?php echo $arrclientes[$i]['id']; ?>);"><span class="icon-trash"></span></a>
						<?php
					    //}
					    ?>
					    <a href="#" onclick="CLIENTE.showdata(<?php echo $arrclientes[$i]['id']; ?>);"><span class="icon-eye-open"></span></a>
                                            <a href="#" onclick="CLIENTE.showcontact(<?php echo $arrclientes[$i]['id']; ?>);"><span class="icon-list-alt"></span></a>
					</td>
					<td class="con1"><?php echo $arrclientes[$i]['nombre']; ?></td>
					<td class="con0"><?php echo $arrclientes[$i]['nit']; ?></td>
					<td class="con1"><?php echo $arrclientes[$i]['telefono']; ?></td>
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
        <div id="dialog-form" title="Cliente" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Nombre</label>
                    <div class="controls"><input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls"><input type="email" name="email" id="email" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">NIT</label>
                    <div class="controls"><input type="text" name="nit" id="nit" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Telefono</label>
                    <div class="controls"><input type="text" name="telefono" id="telefono" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">País</label>
                    <div class="controls"><input type="text" name="pais" id="pais" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Departamento</label>
                    <div class="controls"><input type="text" name="departamento" id="departamento" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Ciudad</label>
                    <div class="controls"><input type="text" name="ciudad" id="ciudad" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Dirección</label>
                    <div class="controls"><input type="text" name="direccion" id="direccion" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
        </div>

        <div id="dialog-formsc" title="Cliente" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Nombre</label>
                    <div class="controls"><input readonly type="text" name="nombresc" id="nombresc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls"><input readonly type="email" name="emailsc" id="emailsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">NIT</label>
                    <div class="controls"><input readonly type="text" name="nitsc" id="nitsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Telefono</label>
                    <div class="controls"><input readonly type="text" name="telefonosc" id="telefonosc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">País</label>
                    <div class="controls"><input readonly type="text" name="paissc" id="paissc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Departamento</label>
                    <div class="controls"><input readonly type="text" name="departamentosc" id="departamentosc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Ciudad</label>
                    <div class="controls"><input readonly type="text" name="ciudadsc" id="ciudadsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Dirección</label>
                    <div class="controls"><input readonly type="text" name="direccionc" id="direccionsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
        </div>
        
        <div id="dialog-form-contact" title="Contactos Clientes" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate-crear">
                <div class="control-group">
                    <table class="table table-hover dyntable" id="dynamictablecontact">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 70px;">Acciones</th>
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
                        <tbody id="mostrar_contactos">
                        </tbody>
                    </table>   
                </div>
            </form>
        </div>
        
        <div id="dialog-form-crear-cont" title="Crear Contacto" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Nombre</label>
                    <div class="controls"><input type="text" id="nombrec" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Apellido</label>
                    <div class="controls"><input type="text"  id="apellidoc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls"><input type="email"  id="emailc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                 <div class="control-group">
                    <label class="control-label">Identificación</label>
                    <div class="controls"><input type="text"  id="identificacionc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Cargo</label>
                    <div class="controls"><input type="text" id="cargoc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Telefono</label>
                    <div class="controls"><input type="text" id="telefonoc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Celular</label>
                    <div class="controls"><input type="text"  id="celularc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
           
            </form>
        </div>
        
        <div id="dialog-form-ver-cont" title="Contacto" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Nombre</label>
                    <div class="controls"><input readonly type="text" id="nombrecv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Apellido</label>
                    <div class="controls"><input readonly type="text"  id="apellidocv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Email</label>
                    <div class="controls"><input readonly type="email"  id="emailcv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                 <div class="control-group">
                    <label class="control-label">Identificación</label>
                    <div class="controls"><input readonly type="text"  id="identificacioncv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Cargo</label>
                    <div class="controls"><input readonly  type="text" id="cargocv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Telefono</label>
                    <div class="controls"><input readonly type="text" id="telefonocv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Celular</label>
                    <div class="controls"><input readonly type="text"  id="celularcv" class="text ui-widget-content ui-corner-all" /></div>
                </div>
           
            </form>
        </div>
        

	<?php include 'include/generic_script.php'; ?>
        <link rel="stylesheet" media="screen" href="css/dynamictable.css" type="text/css" />
        <script type="text/javascript" src="js/jquery/jquery-dataTables.js"></script>
        <script type="text/javascript" src="js/clientes.js"></script>
      
    </body>
</html>