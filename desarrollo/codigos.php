<?php
include 'include/generic_validate_session.php';
//include 'lib/ControllerCodigos.php';
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
            $_ACTIVE_SIDEBAR = 'codigos';
            include 'include/generic_navbar.php';
            ?>
            <div class="container">
                <h2>Preguntas</h2>
                <?php
                //if ($create) {
                ?>
                <a href="#" id="crearcodigo" class="btn btn-info botoncrear">Crear</a>
                <?php
                //}
                ?>
                <div>
                    <table class="table table-hover dyntable" id="dynamictable">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 70px;">Acciones</th>
                                <th class="head1">Criterio</th>
                                <th class="head1">Pregunta</th>
                                <th class="head0">Valor</th>
                                <th class="head1">Pregunta Activa</th>
                                <th class="head1">Pregunta Abierta</th>
                            </tr>
                        </thead>
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con0" />
                        </colgroup>
                        <tbody>
                            <?php
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>	    
        </section>
        <footer id="footer_wrap">
            <?php include 'include/generic_footer.php'; ?>
        </footer>
        <div id="dialog-form" title="Códigos" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Promotor</label>
                    <div class="controls">
                        <select name="id_promotor" id="id_promotor" class="text ui-widget-content ui-corner-all">
                            <option value="selecione">ConTRREbute</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Cliente Assessment</label>
                    <div class="controls">
                        <select name="cliente" id="cliente" class="text ui-widget-content ui-corner-all">
                             <option value="selecione">Secuencia24</option>
                        </select>
                    </div>
                </div>
                    <div class="control-group">
                        <label class="control-label">Cantidad</label>
                        <div class="controls"><input type="Number" name="cant" id="cant" class="text ui-widget-content ui-corner-all" /></div>
                    </div>
            </form>
        </div>

        <div id="dialog-formsc" title="Códigos" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Promotor</label>
                    <div class="controls"><input readonly type="text" name="id_promotorsc" id="id_promotorsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Cliente Assessment</label>
                    <div class="controls"><input readonly type="text" name="clientesc" id="clientesc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Cantidad</label>
                    <div class="controls"><input readonly type="text" name="cantsc" id="cantsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
        </div>
        <?php include 'include/generic_script.php'; ?>
        <link rel="stylesheet" media="screen" href="css/dynamictable.css" type="text/css" />
        <script type="text/javascript" src="js/jquery/jquery-dataTables.js"></script>
        <script type="text/javascript" src="js/codigos.js"></script>
    </body>
</html>