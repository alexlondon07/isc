<?php
include 'include/generic_validate_session.php';
//include 'lib/ControllerFaq.php';
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
            $_ACTIVE_SIDEBAR = 'faq';
            include 'include/generic_navbar.php';
            ?>
            <div class="container">
                <h2>Faq</h2>
                <?php
                //if ($create) {
                ?>
                <a href="#" id="crearfaq" class="btn btn-info botoncrear">Crear</a>
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
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
                            <col class="con0" />
                            <col class="con1" />
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
        <div id="dialog-form" title="Faq" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
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
                            <option value="seleccione">Seleccione Pregunta</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Respuesta</label>
                    <div class="controls">
                        <textarea style="margin: 0px; height: 135px; width: 280px;" name="respuesta" id="respuesta" class="text ui-widget-content ui-corner-all"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Calificación</label>
                    <div class="controls"><input type="Number" name="calificacion" id="calificacion" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Pregunta Activa</label>
                    <div class="controls">
                        <select name="estado" id="estado" class="text ui-widget-content ui-corner-all">
                            <option value="si">Sí</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>

        <div id="dialog-formsc" title="Faq" style="display: none;">
            <p class="validateTips"></p>
            <form class="form-horizontal" id="formcreate">
                <div class="control-group">
                    <label class="control-label">Pregunta</label>
                    <div class="controls"><input readonly type="text" name="id_preguntasc" id="id_preguntasc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Respuesta</label>
                    <div class="controls">
                        <textarea readonly style="margin: 0px; height: 135px; width: 280px;" name="respuestassc" id="respuestasc" class="text ui-widget-content ui-corner-all"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Calificación</label>
                    <div class="controls"><input readonly type="text" name="calificacionsc" id="calificacionsc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
                <div class="control-group">
                    <label class="control-label">Pregunta Activa</label>
                    <div class="controls"><input readonly type="text" name="estadosc" id="estadosc" class="text ui-widget-content ui-corner-all" /></div>
                </div>
            </form>
        </div>
        <?php include 'include/generic_script.php'; ?>
        <link rel="stylesheet" media="screen" href="css/dynamictable.css" type="text/css" />
        <script type="text/javascript" src="js/jquery/jquery-dataTables.js"></script>
        <script type="text/javascript" src="js/faq.js"></script>
    </body>
</html>