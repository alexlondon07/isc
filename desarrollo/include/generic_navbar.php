<?php ?>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td  background="img/fon_btn.jpg" height="69">
            <table border="0" cellspacing="5" cellpadding="0">
                <tr>
                    <?php
                    // if ($SESSION_DATA->getPermission(1)) {
                    ?>
                    <td <?php if ($_ACTIVE_SIDEBAR == "clientes") echo 'class="active"'; ?>><a href="clientes.php" title="Clientes" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('clientes', '', 'img/Clientes.png', 1)"><img src="img/Clientes.png" name="clientes" width="72" height="51" border="0" id="clientes" /></a></td>
                    <?php
                    //}
                    // if ($SESSION_DATA->getPermission(5)) {
                    ?>
                    <td <?php if ($_ACTIVE_SIDEBAR == "usuario") echo 'class="active"'; ?>><a href="usuario.php" title="Usuarios" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('usuarios', '', 'img/Usuarios.png', 1)"><img src="img/Usuarios.png" name="usuarios" width="72" height="51" border="0" id="usuarios" /></a></td>
                    <?php
                    //}
                    ?> 
                    <td <?php if ($_ACTIVE_SIDEBAR == "usuario") echo 'class="active"'; ?>><a href="promotores.php" title="Promotores" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('usuarios', '', 'img/Usuarios.png', 1)"><img src="img/Promotores.png" name="usuarios" width="72" height="51" border="0" id="usuarios" /></a></td>
                    <?php //<td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('informes','','img/btn_14_b.jpg',1)"><img src="img/btn_14_a.jpg" name="informes" width="72" height="51" border="0" id="informes" /></a></td>?>
                    <td><a href="logout.php"  title="Salir"><img src="img/Salir.png" name="paros" width="72" height="51" border="0" id="salir" /></a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
