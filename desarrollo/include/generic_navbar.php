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
                    <td <?php if ($_ACTIVE_SIDEBAR == "preguntas") echo 'class="active"'; ?>><a href="preguntas.php" title="Preguntas" ><img src="img/preguntas.png" name="preguntas" width="72" height="51" border="0" id="preguntas" /></a></td>
                    <td><a href="logout.php"  title="Salir"><img src="img/Salir.png" name="salir" width="72" height="51" border="0" id="salir" /></a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
