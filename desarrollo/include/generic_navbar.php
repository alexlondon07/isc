<?php ?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td  background="img/fon_btn.jpg" height="69">
            <table border="0" cellspacing="5" cellpadding="0">
                <tr>
                    <td <?php if ($_ACTIVE_SIDEBAR == "promotores") echo 'class="active"'; ?>><a href="promotores.php" title="Promotores" ><img src="img/Promotores.png" name="promotores" width="72" height="51" border="0" id="promotores" /></a></td>
                    <?php
                    // if ($SESSION_DATA->getPermission(1)) {
                    ?>
                    <td <?php if ($_ACTIVE_SIDEBAR == "clientes") echo 'class="active"'; ?>><a href="clientes.php" title="Clientes" ><img src="img/Clientes.png" name="clientes" width="72" height="51" border="0" id="clientes" /></a></td>
                    <?php
                    //}
                    // if ($SESSION_DATA->getPermission(5)) {
                    ?>
                    <td <?php if ($_ACTIVE_SIDEBAR == "usuario") echo 'class="active"'; ?>><a href="usuario.php" title="Usuarios" ><img src="img/Usuarios.png" name="usuarios" width="72" height="51" border="0" id="usuarios" /></a></td>
                    <?php
                    //}
                    ?> 
                    <td <?php if ($_ACTIVE_SIDEBAR == "sectores") echo 'class="active"'; ?>><a href="sectores.php" title="Sectores" ><img src="img/Sectores.png" name="sectores" width="72" height="51" border="0" id="sectores" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "dimensiones") echo 'class="active"'; ?>><a href="dimensiones.php" title="Dimensiones" ><img src="img/Dimensiones.png" name="dimensiones" width="72" height="51" border="0" id="dimensiones" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "criterios") echo 'class="active"'; ?>><a href="criterios.php" title="Criterios" ><img src="img/Criterios.png" name="criterios" width="72" height="51" border="0" id="criterios" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "preguntas") echo 'class="active"'; ?>><a href="preguntas.php" title="Preguntas" ><img src="img/Preguntas.png" name="preguntas" width="72" height="51" border="0" id="preguntas" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "respuestas") echo 'class="active"'; ?>><a href="respuestas.php" title="Respuestas" ><img src="img/Respuestas.png" name="respuestas" width="72" height="51" border="0" id="respuestas" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "faq") echo 'class="active"'; ?>><a href="faq.php" title="Faq" ><img src="img/faq.png" name="faq" width="72" height="51" border="0" id="faq" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "preguntasabiertas") echo 'class="active"'; ?>><a href="preguntasabiertas.php" title="Preguntas Abiertas" ><img src="img/PreguntasAbiertas.png" name="preguntasabiertas" width="72" height="51" border="0" id="preguntasabiertas" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "cuestionario") echo 'class="active"'; ?>><a href="cuestionario.php" title="Cuestionario" ><img src="img/Cuestionario.png" name="cuestionario" width="72" height="51" border="0" id="cuestionario" /></a></td>
                    <td <?php if ($_ACTIVE_SIDEBAR == "codigos") echo 'class="active"'; ?>><a href="codigos.php" title="Codigos" ><img src="img/codigos.png" name="codigos" width="72" height="51" border="0" id="codigos" /></a></td>
                    <td><a href="logout.php"  title="Salir"><img src="img/Salir.png" name="salir" width="72" height="51" border="0" id="salir" /></a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
