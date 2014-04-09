<?php
include 'include/generic_validate_session.php';
//include 'lib/ControllerCriterios.php';
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
            $_ACTIVE_SIDEBAR = 'criterios';
            include 'include/generic_navbar.php';
            ?>
            <div class="container">
                <h2>Criterios</h2>
                <?php
                //if ($create) {
                ?>
                <a href="#" id="crearcriterios" class="btn btn-info botoncrear">Crear</a>
                <?php
                //}
                ?>
                <div>
                    <table class="table table-hover dyntable" id="dynamictable">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 70px;">Acciones</th>
                                <th class="head1">Nombre</th>
                                <th class="head0">Valor del criterio en la  dimensión</th>
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
        <div id="dialog-form" title="Criterios" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Nombre</label>
                    <div class="controls"><input type="text" name="nombre" id="nombre" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Valor del criterio enla dimension</label>
                    <div class="controls"><input type="text" name="valor" id="valor" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
            </form>
        </div>
        <div id="dialog-formsc" title="Criterios" style="display: none;">
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
        <script type="text/javascript" src="js/criterios.js"></script>
    </body>
</html>
