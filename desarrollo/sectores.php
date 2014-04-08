<?php
include 'include/generic_validate_session.php';
//include 'lib/ControllerSectores.php';
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
            $_ACTIVE_SIDEBAR = 'sectores';
            include 'include/generic_navbar.php';
            ?>
            <div class="container">
                <h2>Sectores</h2>
                <?php
                //if ($create) {
                ?>
                <a href="#" id="crearsectores" class="btn btn-info botoncrear">Crear</a>
                <?php
                //}
                ?>
                <div>
                    <table class="table table-hover dyntable" id="dynamictable">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 70px;">Acciones</th>
                                <th class="head1">Nombre</th>
                                <th class="head0">Valor del Sector Social</th>
                            </tr>
                        </thead>
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                        </colgroup>
                        <tbody>
                            <?php
                            //Aqui va el ciclo para traer los datos de la bd
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>	    
        </section>
        <footer id="footer_wrap">
            <?php include 'include/generic_footer.php'; ?>
        </footer>
        <div id="dialog-form" title="Sectores" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="alinear"  style="width: 45%; display: inline-block; vertical-align: top;"  id="divform">
                    <div class="control-group">
                        <label class="control-label">Nombre</label>
                        <div class="controls"><input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all" /></div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">Dimenciones Disponibles</label>
                        <div class="controls">
                            <select name="iddimen" id="iddimen" class="text ui-widget-content ui-corner-all">
                                <option value="nombre_valor">Nombre - Valor</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="alinear"  style="width: 45%; display: inline-block; vertical-align: top;"  id="divform">
                    <div class="control-group">
                        <label class="control-label">Valor del Sector Social</label>
                        <div class="controls"><input type="text" name="valor" id="valor" class="text ui-widget-content ui-corner-all" /></div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Dimenciones Relacionadas</label>
                        <div class="controls">
                            <textarea style="margin: 0px; height: 135px; width: 280px;" name="dime_relacionadas" id="dime_relacionadas" class="text ui-widget-content ui-corner-all">Nombre - Valor</textarea>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div id="dialog-formsc" title="Sectores" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Nombre</label>
                    <div class="controls"><input readonly type="text" name="nombresc" id="nombresc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Valor del Sector Social</label>
                    <div class="controls"><input readonly type="text" name="razonsc" id="razonsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
        </div>
        <?php include 'include/generic_script.php'; ?>
        <link rel="stylesheet" media="screen" href="css/dynamictable.css" type="text/css" />
        <script type="text/javascript" src="js/jquery/jquery-dataTables.js"></script>
        <script type="text/javascript" src="js/sectores.js"></script>
    </body>
</html>