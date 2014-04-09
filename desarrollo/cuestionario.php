<?php
include 'include/generic_validate_session.php';
//include 'lib/ControllerCuestionario.php';
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
            $_ACTIVE_SIDEBAR = 'cuestionario';
            include 'include/generic_navbar.php';
            ?>
            <div class="container">
                <h2>Cuestionario</h2>
                <?php
                //if ($create) {
                ?>
                <a href="#" id="crearcuestionario" class="btn btn-info botoncrear">Crear</a>
                <?php
                //}
                ?>
                <div>
                    <table class="table table-hover dyntable" id="dynamictable">
                        <thead>
                            <tr>
                                <th class="head0" style="width: 70px;">Acciones</th>
                                <th class="head1">Sector</th>
                                <th class="head1">Dimensión</th>
                                <th class="head1">Criterio</th>
                            </tr>
                        </thead>
                        <colgroup>
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
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
        <div id="dialog-form" title="Cuestionario" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Sector</label>
                    <div class="controls">
                        <select name="id_sector" id="id_sector" class="text ui-widget-content ui-corner-all">
                            <option value="selecione">Seleccione Sector</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Dimensión</label>
                    <div class="controls">
                        <select name="id_dim" id="id_dim" class="text ui-widget-content ui-corner-all">
                            <option value="selecione">Seleccione Dimesión</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Criterio</label>
                    <div class="controls">
                        <select name="id_criterio" id="id_criterio" class="text ui-widget-content ui-corner-all">
                            <option value="selecione">Seleccione Criterio</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Pregunta</label>
                    <div class="controls">
                        <select name="id_pregunta" id="id_pregunta" class="text ui-widget-content ui-corner-all">
                            <option value="selecione">Seleccione Pregunta</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div id="dialog-formsc" title="Cuestionario" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Sector</label>
                    <div class="controls"><input readonly type="text" name="sectorsc" id="sectorsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Dimensión</label>
                    <div class="controls"><input readonly type="text" name="dimensionsc" id="dimensionsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Criterio</label>
                    <div class="controls"><input readonly type="text" name="id_criteriosc" id="id_criteriosc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Pregunta</label>
                    <div class="controls"><input readonly type="text" name="preguntasc" id="preguntasc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
        </div>
        <?php include 'include/generic_script.php'; ?>
        <link rel="stylesheet" media="screen" href="css/dynamictable.css" type="text/css" />
        <script type="text/javascript" src="js/jquery/jquery-dataTables.js"></script>
        <script type="text/javascript" src="js/cuestionario.js"></script>
    </body>
</html>