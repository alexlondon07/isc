<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
	<td align="center">

	    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
		    <td bgcolor="#efefef">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			    <tr>
				<td width="12%"><img src="img/logo.png" width="191" height="96" /></td>
				<td width="1%"><img src="img/sep_log.jpg" width="3" height="96" /></td>

				<td width="30%">&nbsp;</td>
				<td width="30%" align="right" valign="center">
				    <?php
				    if (isset($_SESSION['usuario'])) {
					?>
    				    <table width="100%" border="0" cellpadding="0" cellspacing="5">
    					<tr>
    <!--					    <td valign="bottom"><img src="img/flecha.jpg" width="9" height="9" /></td>-->
    					    <td valign="bottom" class="tex_numeros">Bienvenido:</td>
    					    <td valign="bottom" class="tex_numeros">
                                                    <input type="hidden"  id="id_user" value="<?php echo $SESSION_DATA->getUserId(); ?>"/>
                                                    <input type="hidden"  id="user_name" value="<?php echo $SESSION_DATA->getUserFullName(); ?>"/>
						    <?php echo $SESSION_DATA->getUserFullName(); ?>
    					    </td>
<!--                                           <?php 'el id es '. $_SESSION['usuario']['id']; ?>
    					    <td><img src="img/foto.jpg" width="79" height="79" /></td>-->
    					    <td><img src="archivosverusuarios.php?ac=view&id=<?php echo  $_SESSION['usuario']['id'];?>" width="79" height="79" /></td>
    					</tr>
    				    </table>
				    <?php } ?>
				</td>
			    </tr>
			</table>
		    </td>
		</tr>
		<tr>
		    <td background="img/fon_barra_sup.jpg" height="27">&nbsp;</td>
		</tr>

	    </table>
	</td>
    </tr>
</table>