<?php

include 'ConectionDb.php';
include 'Util.php';

/**
 * Clase que contiene todas las operaciones utilizadas sobre la base de datos
 * @author Camilo Garzon Calle
 */
class ControllerUser {

    private $conexion, $CDB, $op, $id, $euid, $sdid;
    private $UTILITY;
    private $response;

    function __construct() {
        $this->CDB = new ConectionDb();
        $this->UTILITY = new Util();
        $this->conexion = $this->CDB->openConect();
        $rqst = $_REQUEST;
        $this->op = isset($rqst['op']) ? $rqst['op'] : '';
        $this->id = isset($rqst['id']) ? intval($rqst['id']) : 0;
        $this->ke = isset($rqst['ke']) ? $rqst['ke'] : '';
        $this->lu = isset($rqst['lu']) ? $rqst['lu'] : '';
        $this->ti = isset($rqst['ti']) ? $rqst['ti'] : '';
        if ($this->op != 'usrlogin') {
            if (!$this->UTILITY->validate_key($this->ke, $this->ti, $this->lu)) {
                $this->op = 'noautorizado';
            }
        } else {
            if (!$this->UTILITY->validate_key($this->ke, $this->ti)) {
                $this->op = 'noautorizado';
            }
        }
        if ($this->op == 'usrsave') {
            $this->idcli = isset($rqst['idcli']) ? intval($rqst['idcli']) : 'NULL';
            $this->idprov = isset($rqst['idprov']) ? intval($rqst['idprov']) : 'NULL';
            $this->nombre = isset($rqst['nombre']) ? $rqst['nombre'] : '';
            $this->apellido = isset($rqst['apellido']) ? $rqst['apellido'] : '';
            $this->email = isset($rqst['email']) ? $rqst['email'] : '';
            $this->pass = isset($rqst['pass']) ? $rqst['pass'] : '';
            $this->identificacion = isset($rqst['identificacion']) ? $rqst['identificacion'] : '';
            $this->cargo = isset($rqst['cargo']) ? $rqst['cargo'] : '';
            $this->telefono = isset($rqst['telefono']) ? $rqst['telefono'] : '';
            $this->celular = isset($rqst['celular']) ? $rqst['celular'] : '';
            $this->habilitado = isset($rqst['habilitado']) ? ($rqst['habilitado']) : 'no';
            $this->contacto = isset($rqst['contacto']) ? ($rqst['contacto']) : '';
            $this->usrsave();
        } else if ($this->op == 'usrsaveimage') {
            $this->idcli = isset($rqst['idcli']) ? intval($rqst['idcli']) : 'NULL';
            $this->idprov = isset($rqst['idprov']) ? intval($rqst['idprov']) : 'NULL';
            $this->nombre = isset($rqst['nombre']) ? $rqst['nombre'] : '';
            $this->apellido = isset($rqst['apellido']) ? $rqst['apellido'] : '';
            $this->email = isset($rqst['email']) ? $rqst['email'] : '';
            $this->pass = isset($rqst['pass']) ? $rqst['pass'] : '';
            $this->identificacion = isset($rqst['identificacion']) ? $rqst['identificacion'] : '';
            $this->cargo = isset($rqst['cargo']) ? $rqst['cargo'] : '';
            $this->telefono = isset($rqst['telefono']) ? $rqst['telefono'] : '';
            $this->celular = isset($rqst['celular']) ? $rqst['celular'] : '';
            $this->habilitado = isset($rqst['habilitado']) ? ($rqst['habilitado']) : 'no';
            $this->contacto = isset($rqst['contacto']) ? ($rqst['contacto']) : '';
            $this->ref_imagen = isset($rqst['ref_imagen']) ? ($rqst['ref_imagen']) : '';
            $this->archivo = isset($rqst['archivo']) ? ($rqst['archivo']) : '';
            $this->usrsaveimage();
        } else if ($this->op == 'usrlogin') {
            $this->email = isset($rqst['email']) ? $rqst['email'] : '';
            $this->pass = isset($rqst['pass']) ? $rqst['pass'] : '';
            $this->usrlogin();
        } else if ($this->op == 'usrget') {
            $this->usrget();
        } else if ($this->op == 'contactget') {
            $this->idcli = isset($rqst['idcli']) ? intval($rqst['idcli']) : NULL;
            $this->contactget();
        } else if ($this->op == 'contprovget') {
            $this->idprov = isset($rqst['idprov']) ? intval($rqst['idprov']) : NULL;
            $this->contprovget();
        } else if ($this->op == 'usrprfget') {
            $this->usrprfget();
        } else if ($this->op == 'usrprfsave') {
            $this->chk = isset($rqst['chk']) ? $rqst['chk'] : '';
            $this->usrprfsave();
        } else if ($this->op == 'usrdelete') {
            $this->usrdelete();
        } else if ($this->op == 'noautorizado') {
            $this->response = $this->UTILITY->error_invalid_authorization();
        } else {
            $this->response = $this->UTILITY->error_invalid_method_called();
        }
        //$this->CDB->closeConect();
    }

    /**
     * Metodo para guardar y actualizar
     */
    private function usrsave() {
        $id = 0;
        $resultado = 0;
        $pass = '';
        if ($this->UTILITY->validate_email($this->email)) {
            $arrjson = $this->UTILITY->error_wrong_email();
        } else {
            if ($this->id > 0) {
                //se verifica que el email está disponible
                $q = "SELECT usr_id FROM ass_usuario WHERE usr_email = '" . $this->email . "' AND usr_id != $this->id ";
                $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                $resultado = mysql_num_rows($con);
                if ($resultado == 0) {
                    //actualiza la informacion
                    $q = "SELECT usr_id FROM ass_usuario WHERE usr_id = " . $this->id;
                    $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                    while ($obj = mysql_fetch_object($con)) {
                        $id = $obj->usr_id;
                        if (strlen($this->pass) > 2) {
                            $pass = $this->UTILITY->make_hash_pass($this->email, $this->pass);
                        }
                        $table = "ass_usuario";
                        $arrfieldscomma = array(
                            'usr_nombre' => $this->nombre,
                            'usr_apellido' => $this->apellido,
                            'usr_email' => $this->email,
                            'usr_pass' => $pass,
                            'usr_cargo' => $this->cargo,
                            'usr_identificacion' => $this->identificacion,
                            'usr_celular' => $this->celular,
                            'usr_telefono' => $this->telefono,
                            'usr_habilitado' => $this->habilitado,
                            'usr_contacto' => $this->contacto);
                        $arrfieldsnocomma = array('mzt_proveedor_pro_id' => $this->idprov, 'mzt_cliente_cli_id' => $this->idcli, 'usr_dtcreate' => $this->UTILITY->date_now_server());
                        $q = $this->UTILITY->make_query_update($table, "usr_id = '$id'", $arrfieldscomma, $arrfieldsnocomma);
                        mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                        $arrjson = array('output' => array('valid' => true, 'id' => $id));
                    }
                } else {
                    $arrjson = $this->UTILITY->error_user_already_exist();
                }
            } else {
                //se verifica que el email está disponible
                $q = "SELECT usr_id FROM ass_usuario WHERE usr_email = '" . $this->email . "'";
                $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                $resultado = mysql_num_rows($con);
                if ($resultado == 0) {
                    if (strlen($this->pass) > 2) {
                        $pass = $this->UTILITY->make_hash_pass($this->email, $this->pass);
                    }
                    $this->pass = $pass;
                    $q = "INSERT INTO ass_usuario (usr_dtcreate, mzt_cliente_cli_id, mzt_proveedor_pro_id, usr_habilitado, usr_nombre, usr_apellido, usr_cargo, usr_email, usr_pass, usr_identificacion, usr_celular, usr_telefono, usr_contacto) VALUES (" . $this->UTILITY->date_now_server() . ", $this->idcli, $this->idprov, '$this->habilitado', '$this->nombre', '$this->apellido', '$this->cargo', '$this->email', '$this->pass', '$this->identificacion', '$this->celular', '$this->telefono', '$this->contacto')";
                    mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                    $id = mysql_insert_id();
                    $arrjson = array('output' => array('valid' => true, 'id' => $id));
                } else {
                    $arrjson = $this->UTILITY->error_user_already_exist();
                }
            }
        }
        $this->response = ($arrjson);
    }

    private function usrsaveimage() {
        $keyid = isset($_REQUEST['keyid']) ? $_REQUEST['keyid'] : ''; //ID QUE ME TRAIGO DEL FORMULARIO
        $file = isset($_FILES['archivo']) ? $_FILES['archivo'] : ''; //ARCHIVO
        $idfile = 0;
        $id = 0;
        $resultado = 0;
        $pass = '';
        if ($this->UTILITY->validate_email($this->email)) {
            $arrjson = $this->UTILITY->error_wrong_email();
        } else {
            if ($keyid > 0) {
                //se verifica que el email está disponible
                $q = "SELECT usr_id FROM ass_usuario WHERE usr_email = '" . $this->email . "' AND usr_id != $keyid ";
                $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                $resultado = mysql_num_rows($con);
                if ($resultado == 0) {
                    //actualiza la informacion
                    $q = "SELECT usr_id FROM ass_usuario WHERE usr_id = " . $keyid;
                    $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                    while ($obj = mysql_fetch_object($con)) {
                        $id = $obj->usr_id;
                        if (strlen($this->pass) > 1) {
                            $pass1 = sha1($this->pass);
                        }
                        if (strlen($this->pass) > 2) {
                            $pass = $this->UTILITY->make_hash_pass($this->email, $pass1);
                        }
                        $this->pass = $pass;
                        $table = "ass_usuario";
                        $arrfieldscomma = array(
                            'usr_nombre' => $this->nombre,
                            'usr_apellido' => $this->apellido,
                            'usr_email' => $this->email,
                            'usr_pass' => $this->pass,
                            'usr_cargo' => $this->cargo,
                            'usr_identificacion' => $this->identificacion,
                            'usr_celular' => $this->celular,
                            'usr_telefono' => $this->telefono,
                            'usr_habilitado' => $this->habilitado,
                            'usr_contacto' => $this->contacto);
                        $arrfieldsnocomma = array('mzt_proveedor_pro_id' => $this->idprov, 'mzt_cliente_cli_id' => $this->idcli, 'usr_dtcreate' => $this->UTILITY->date_now_server());
                        $q = $this->UTILITY->make_query_update($table, "usr_id = '$id'", $arrfieldscomma, $arrfieldsnocomma);
                        mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                        $arrjson = array('output' => array('valid' => true, 'id' => $id));
                    }
                    //SE VERIFICA SI TIENE IMAGES ASOCIADA
                    $q2 = "SELECT arc_id FROM ass_archivos WHERE mzt_usuario_usr_id= '" . $keyid . "'";
                    $con2 = mysql_query($q2, $this->conexion) or die(mysql_error() . "***ERROR: " . $q2);
                    $resultado2 = mysql_num_rows($con2);
                    $arr2 = array();
                    if ($q2 != "") {
                        while ($obj2 = mysql_fetch_object($con2)) {
                            $arr2[] = array(
                                'arc_id' => ($obj2->arc_id));
                            $id_archivo = $obj2->arc_id; //OBTENGO EL ID DE ARCHIVO
                        }
                    }
                    //SI NO TIENE IMAGES ASOCIDA VA A INGRESARLA IMAGES
                    if ($resultado2 < 1) {
                        //GUARADAR LA IMAGEN
                        if ($file > 0) {
                            $file_name = utf8_decode($file['name']);
                            $file_type = $file['type'];
                            $file_tmp_name = $file['tmp_name'];
                            $file_error = $file['error'];
                            $file_size = $file['size'];
                            $contenido = '';
                            //SI AL ACTUALZIAR SE HA SUBIDO NIGUN ARCHIVO ENTRA SI NO, NO ACTUALIZA EL REGISTROM DE ARCHIVOS
                            if ($file_name != '') {
                                $fp = fopen($file_tmp_name, "rb");
                                $contenido = fread($fp, $file_size);
                                $contenido = addslashes($contenido);
                                fclose($fp);
                                if ($file_error == 0 && $file_size > 0 && $file_size < 14716800) {
                                    $q = "INSERT INTO ass_archivos (arc_nombre,arc_tipo,arc_contenido,arc_tamanio)VALUES('" . $file_name . "','" . $file_type . "','" . $contenido . "','" . $file_size . "')";
                                    mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                                    $idfile = mysql_insert_id();
                                    if ($idfile <= 0) {
                                        header('Location: usuario.php');
                                        //$this->response = $this->UTILITY->error_missing_data_file();
                                        return;
                                    } else {
                                        $q3 = "UPDATE ass_archivos SET arc_dtcreate = " . $this->UTILITY->date_now_server() . ",  mzt_usuario_usr_id = '" . $keyid . "' WHERE arc_id = " . $idfile . "";
                                        mysql_query($q3, $this->conexion) or die(mysql_error() . "***ERROR: " . $q3);
                                    }
                                    header('Location: usuario.php');
                                }
                            }
                            header('Location: usuario.php');
                        } else {
                            //si no se manda archivo se redirige oi sale de aqui
                            header('Location: usuario.php');
                            //$this->response = $this->UTILITY->error_missing_data_file();
                        }
                        header('Location: usuario.php');
                    } else {
                        //SI TIENE IMAGES ASOCIADA VA A ACTUALIZAR EL REGISTRO DE ARCHIVOS
                        if ($file > 0) {
                            $file_name = utf8_decode($file['name']);
                            $file_type = $file['type'];
                            $file_tmp_name = $file['tmp_name'];
                            $file_error = $file['error'];
                            $file_size = $file['size'];
                            $contenido = '';
                            //ACTULIZA EL RESGIRO SI LA VARIABLE $file_name NO ESTA VACIA 
                            if ($file_name != '') {
                                $fp = fopen($file_tmp_name, "rb");
                                $contenido = fread($fp, $file_size);
                                $contenido = addslashes($contenido);
                                fclose($fp);
                                if ($file_error == 0 && $file_size > 0 && $file_size < 14716800) {
                                    $q = "UPDATE ass_archivos SET arc_nombre='" . $file_name . "' ,arc_tipo='" . $file_type . "',arc_contenido='" . $contenido . "',arc_tamanio='" . $file_size . "' WHERE arc_id =" . $id_archivo . "";
                                    mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                                    $idfile = mysql_insert_id();
                                    if ($idfile <= 0) {
                                        header('Location: usuario.php');
                                        //$this->response = $this->UTILITY->error_missing_data_file();
                                    }
                                }
                                header('Location: usuario.php');
                            } else {
                                //si no se manda archivo se redirige oi sale de aqui                           
                                header('Location: usuario.php');
                                //$this->response = $this->UTILITY->error_missing_data_file();
                            }
                        }
                        header('Location: usuario.php');
                    }
                    header('Location: usuario.php');
                }
                //El correo ya existe
                //$this->response = $this->UTILITY->error_user_already_exist();
                header('Location: usuario.php');
            } else {
                if ($file > 0) {
                    $file_name = utf8_decode($file['name']);
                    $file_type = $file['type'];
                    $file_tmp_name = $file['tmp_name'];
                    $file_error = $file['error'];
                    $file_size = $file['size'];
                    $contenido = '';
                    if ($file_name != '') {
                        $fp = fopen($file_tmp_name, "rb");
                        $contenido = fread($fp, $file_size);
                        $contenido = addslashes($contenido);
                        fclose($fp);
                        if ($file_error == 0 && $file_size > 0 && $file_size < 14716800) {
                            $q = "INSERT INTO ass_archivos (arc_nombre,arc_tipo,arc_contenido,arc_tamanio)VALUES('" . $file_name . "','" . $file_type . "','" . $contenido . "','" . $file_size . "')";
                            mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                            $idfile = mysql_insert_id();
                            if ($idfile <= 0) {
                                //$this->response = $this->UTILITY->error_missing_data_file();
                                header('Location: usuario.php');
                            }
                            header('Location: usuario.php');
                        }
                    } else {
                        //SI NO INGRESA FOTO SE LE ASIGNA UNA FOTO GENERICA
                        $q_foto = " INSERT INTO `ass_archivos` (mzt_usuario_usr_id,arc_dtcreate,arc_nombre,arc_tipo,arc_contenido,arc_encoding,arc_tamanio) VALUES (NULL, " . $this->UTILITY->date_now_server() . ", 'foto.jpg', 'image/jpeg', 0xffd8ffe1001845786966000049492a00080000000000000000000000ffec00114475636b7900010004000000500000ffe1036d687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f003c3f787061636b657420626567696e3d22efbbbf222069643d2257354d304d7043656869487a7265537a4e54637a6b633964223f3e203c783a786d706d65746120786d6c6e733a783d2261646f62653a6e733a6d6574612f2220783a786d70746b3d2241646f626520584d5020436f726520352e302d633036302036312e3133343737372c20323031302f30322f31322d31373a33323a30302020202020202020223e203c7264663a52444620786d6c6e733a7264663d22687474703a2f2f7777772e77332e6f72672f313939392f30322f32322d7264662d73796e7461782d6e7323223e203c7264663a4465736372697074696f6e207264663a61626f75743d222220786d6c6e733a786d704d4d3d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f6d6d2f2220786d6c6e733a73745265663d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f73547970652f5265736f75726365526566232220786d6c6e733a786d703d22687474703a2f2f6e732e61646f62652e636f6d2f7861702f312e302f2220786d704d4d3a4f726967696e616c446f63756d656e7449443d22786d702e6469643a39463834323732323245413145323131414544304132373636414130463246322220786d704d4d3a446f63756d656e7449443d22786d702e6469643a42354341423837454237463831314532383638444343364132413144303032352220786d704d4d3a496e7374616e636549443d22786d702e6969643a42354341423837444237463831314532383638444343364132413144303032352220786d703a43726561746f72546f6f6c3d2241646f62652050686f746f73686f70204353352057696e646f7773223e203c786d704d4d3a4465726976656446726f6d2073745265663a696e7374616e636549443d22786d702e6969643a4242343942464545463141314532313141384342384430324336463636344432222073745265663a646f63756d656e7449443d22786d702e6469643a3946383432373232324541314532313141454430413237363641413046324632222f3e203c2f7264663a4465736372697074696f6e3e203c2f7264663a5244463e203c2f783a786d706d6574613e203c3f787061636b657420656e643d2272223f3effee000e41646f62650064c000000001ffdb0084000202020202020202020203020202030403020203040504040404040506050505050505060607070807070609090a0a09090c0c0c0c0c0c0c0c0c0c0c0c0c0c0c01030303050405090606090d0b090b0d0f0e0e0e0e0f0f0c0c0c0c0c0f0f0c0c0c0c0c0c0f0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc0001108004f004f03011100021101031101ffc4007a000002020301010000000000000000000000070608010205040301010000000000000000000000000000000010000102050202040c0600070000000000010203001104050706082131411277186171813213b53656b6d69738512214d49658c1722324343516110100000000000000000000000000000000ffda000c03010002110311003f00b3fb7adbd602bd602c1d79bce0ec7f76bbddb1fe99adbadd6b74cda9fa9a9a97ed54ce3cfbcf394ca5b8b716a2a52944924cc99c0383bb3edc3fafd8dbf8a59ff6b007767db87f5fb1b7f14b3fed60361b64db915a1beefb8d829ceaf567a52cfc7adc8ffc580e951ed3b6ff005efad8a6dbc6377034ff00a079effc9da3aa9333327fdaf212e301226f65fb7f586d4ee06c654a829529e2bd2b6852932519704d2cbcd00f38085b9b65db7256b4a3006375212a210a3a52ce0900c8197e97a6035eecfb70febf636fe2967fdac01dd9f6e1fd7ec6dfc52cff00b5804fe71dbd602b4e8bb2d55ab0763fb6553b9031ed13b5349a66d4cb8aa6add6566a5aa64a914c0943cc3ab69c4f25214a4a81492201c1b67fb70dbf766da53d4f4b00ed80ca44d40150483c0a8f21e38067698b326a2969dfad641551a94861464a43cd921c4281e90954e4478a027a869b6e7d442513249ea894c9e64ca03722700b9d59a7d2dd326aadd4edb4d30a52eb1b427f32bad292e7cccbf0805b4010092dc0fb0961ed2719fc73628036cff6e1b7eecdb4a7a9e9601db00403bf4c282ac76f294047fa642804f544c2882643f13012180203c3724a57415a85a8a50a61c0a5244c80526665d3015f4721004024b703ec2587b49c67f1cd8a00db3fdb86dfbb36d29ea7a58076c01e19ca5d3ca01e3a682c596de16dadb21be285924f9c6478f41e6203bf004078ae3d7fd1567a3f3fd02fa9c0ab8c8cb82789f24057ce448e523ca0080496e07d84b0f6938cfe39b1401b67fb70dbf766da53d4f4b00ed80201e9a72a535366a0587038a43296dc9742902441f0c077203101e6ad7d34d495150a5250196d4aeb28c8701c267c7015e4a8a895ab9ac951f2f18020125b81f612c3da4e33f8e6c5006d9fedc36fdd9b694f53d2c03b6008062683ae4a4d6dbd5c16b21f6bf02000950f1f280664010108d715c966dc8a21c5cac58329f242085132f1c84029a0080496e07d84b0f6938cfe39b1401b67fb70dbf766da53d4f4b00ed8020241a592b5dfade1048eaa94a578820ce01e100402935e095de9b89fcd4c0807fccae5010a8020125b81f612c3da4e33f8e6c5006d9fedc36fdd9b694f53d2c03b6032015109482a51e01204c9f10806a68cb3bd44d5455d6d37a17de212c85892c200e278f2993013b802022bab6d6e5c6da4d331e9aad85a56d0481d7291c14904f80ce5009c71a719596dd6d4d3839b6b0524790c0690092dc0fb0961ed2719fc736280fbed7a9aa2b36edb7ca7a565750f2f1b6949368133ff004f4bc4fe03c2602d25bb42d43a12e5caa0309e9a66a4a5f956780f203013ca0b25b2d807e92952db8260be7f33867ce6a3c603ac2008020080e7d75ae86e4dfa3aca74bd29f55444949f0850e22020d70d07e7b96ca99719a699ee5e20b1fe2202ae6e1ed370a7d1fa7285fa653550fe4cc64db215e6a94ad77624892b91e260395b57cfd8c6c1b71c0f66163c895170b663cd2f4b777adb8d35cdc69d552d5a2990e16ab28ec4f30fa3ac0f51c69c521499290a5248242c0f796c73d1a732afd27c87f2f4067bcb63af7732afd27c87f2f401de5b1d7bb9957e93e43f97a00ef2d8ebddccabf49f21fcbd007796c75eee655fa4f90fe5e803bcb63af7732afd27c87f2f401de5b1d7bb9957e93e43f97a031de5b1d7bb9957e93e43f97a0117b85dc1e3ebb686d394b4f61c90d3ed64cc675a9557632d7344828a2d7363aa752876aac4d214ea9b6941b6d27d23ab2969a4adc5a10a0fffd9, NULL, 2505)";
                        $con_foto = mysql_query($q_foto, $this->conexion) or die(mysql_error() . "***ERROR: " . $q_foto);
                        $idfile = mysql_insert_id();
                        if ($idfile <= 0) {
                            //$this->response = $this->UTILITY->error_missing_data_file();
                            header('Location: usuario.php');
                        }
                    }
                    //si no se manda archivo se redirige oi sale de aqui
                    header('Location: usuario.php');
                    //$this->response = $this->UTILITY->error_missing_data_file();
                    //return;
                }
                //se verifica que el email está disponible
                $q = "SELECT usr_id FROM ass_usuario WHERE usr_email = '" . $this->email . "'";
                $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                $resultado = mysql_num_rows($con);
                if ($resultado == 0) {
                    if (strlen($this->pass) > 1) {
                        $pass1 = sha1($this->pass);
                    }
                    if (strlen($this->pass) > 2) {
                        $pass = $this->UTILITY->make_hash_pass($this->email, $pass1);
                    }
                    $this->pass = $pass;
                    $q = "INSERT INTO ass_usuario (usr_dtcreate, mzt_cliente_cli_id, mzt_proveedor_pro_id, usr_habilitado, usr_nombre, usr_apellido, usr_cargo, usr_email, usr_pass, usr_identificacion, usr_celular, usr_telefono, usr_contacto) 
                        VALUES (" . $this->UTILITY->date_now_server() . ", $this->idcli, $this->idprov, '$this->habilitado', '$this->nombre', '$this->apellido', '$this->cargo', '$this->email', '$this->pass', '$this->identificacion', '$this->celular', '$this->telefono','no')";
                    mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                    $id = mysql_insert_id();

                    //ACTUALIZO EL REGISTRO DE ARCHIVOS
                    $q1 = "UPDATE ass_archivos SET arc_dtcreate = " . $this->UTILITY->date_now_server() . ",  mzt_usuario_usr_id = '" . $id . "' WHERE arc_id = " . $idfile . "";
                    mysql_query($q1, $this->conexion) or die(mysql_error() . "***ERROR: " . $q1);

                    //$arrjson = array('output' => array('valid' => true, 'id' => $id));
                    header('Location: usuario.php');
                } else {
                    //$arrjson = $this->UTILITY->error_user_already_exist();
                    header('Location: usuario.php');
                }
            }
            header('Location: usuario.php');
        }
        //$this->response = ($arrjson);
        header('Location: usuario.php');
    }

//$q = "SELECT usr_id FROM ass_usuario WHERE usr_email = '" . $this->email . "' AND usr_id != $this->id ";
    public function usrget() {
        $q = "SELECT * FROM ass_usuario WHERE usr_contacto='no' ORDER BY usr_nombre ASC";
        if ($this->id > 0) {
            $q = "SELECT * FROM ass_usuario WHERE usr_contacto='no' AND usr_id = " . $this->id;
        }
        //if ($this->sdid > 0) {
        //    $q = "SELECT * FROM fir_usuario WHERE fir_sede_sde_id = " . $this->sdid;
        //}
        //if ($this->euid > 0) {
        //    $q = "SELECT * FROM fir_usuario WHERE fir_empresa_emp_id = " . $this->euid;
        //}
        $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
        $resultado = mysql_num_rows($con);
        $arr = array();
        while ($obj = mysql_fetch_object($con)) {
            $arr[] = array(
                'id' => $obj->usr_id,
                'idcli' => $obj->mzt_cliente_cli_id,
                'idprov' => $obj->mzt_proveedor_pro_id,
                'nombre' => ($obj->usr_nombre),
                'apellido' => ($obj->usr_apellido),
                'cargo' => ($obj->usr_cargo),
                'email' => ($obj->usr_email),
                'identificacion' => ($obj->usr_identificacion),
                'celular' => ($obj->usr_celular),
                'telefono' => ($obj->usr_telefono),
                'habilitado' => ($obj->usr_habilitado),
                'dtcreate' => ($obj->usr_dtcreate));
        }
//PEDIR ARCHIVOS
        $qa = "SELECT arc_nombre FROM ass_archivos WHERE mzt_usuario_usr_id= " . $this->id;
        if ($qa != "") {
            $cona = mysql_query($qa, $this->conexion) or die(mysql_error() . "***ERROR: " . $qa);
            $resultadoa = mysql_num_rows($cona);
            $arra = array();
            while ($obja = mysql_fetch_object($cona)) {
                $arra[] = array(
                    'ref_imagen' => ($obja->arc_nombre));
            }
        }
        if ($resultado > 0) {
            $arrjson = array('output' => array('valid' => true, 'response' => $arr, 'response2' => $arra));
        } else {
            $arrjson = $this->UTILITY->error_no_result();
        }
        $this->response = ($arrjson);
    }

    // $q = "SELECT usr_id FROM ass_usuario WHERE usr_email = '" . $this->email . "' AND 
    public function contactget() {
        $q = "SELECT * FROM ass_usuario WHERE usr_contacto='si' AND mzt_cliente_cli_id ='" . $this->idcli . "' ORDER BY usr_nombre ASC";
        if ($this->id > 0) {
            $q = "SELECT * FROM ass_usuario WHERE usr_id = " . $this->id;
        }
        $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
        $resultado = mysql_num_rows($con);
        $arr = array();
        while ($obj = mysql_fetch_object($con)) {
            $arr[] = array(
                'id' => $obj->usr_id,
                'idcli' => $obj->mzt_cliente_cli_id,
                'nombre' => ($obj->usr_nombre),
                'apellido' => ($obj->usr_apellido),
                'cargo' => ($obj->usr_cargo),
                'email' => ($obj->usr_email),
                'identificacion' => ($obj->usr_identificacion),
                'celular' => ($obj->usr_celular),
                'telefono' => ($obj->usr_telefono),
                'habilitado' => ($obj->usr_habilitado),
                'dtcreate' => ($obj->usr_dtcreate));
        }
        if ($resultado > 0) {
            $arrjson = array('output' => array('valid' => true, 'response' => $arr));
        } else {
            $arrjson = $this->UTILITY->error_no_result();
        }
        $this->response = ($arrjson);
    }

    public function contprovget() {
        $q = "SELECT * FROM ass_usuario WHERE usr_contacto='si' AND mzt_proveedor_pro_id ='" . $this->idprov . "' ORDER BY usr_nombre ASC";
        if ($this->id > 0) {
            $q = "SELECT * FROM ass_usuario WHERE usr_id = " . $this->id;
        }
        $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
        $resultado = mysql_num_rows($con);
        $arr = array();
        while ($obj = mysql_fetch_object($con)) {
            $arr[] = array(
                'id' => $obj->usr_id,
                'idprov' => $obj->mzt_proveedor_pro_id,
                'nombre' => ($obj->usr_nombre),
                'apellido' => ($obj->usr_apellido),
                'cargo' => ($obj->usr_cargo),
                'email' => ($obj->usr_email),
                'identificacion' => ($obj->usr_identificacion),
                'celular' => ($obj->usr_celular),
                'telefono' => ($obj->usr_telefono),
                'habilitado' => ($obj->usr_habilitado),
                'dtcreate' => ($obj->usr_dtcreate));
        }
        if ($resultado > 0) {
            $arrjson = array('output' => array('valid' => true, 'response' => $arr));
        } else {
            $arrjson = $this->UTILITY->error_no_result();
        }
        $this->response = ($arrjson);
    }

    private function usrdelete() {
        if ($this->id > 0) {
            //actualiza la informacion
            $q2 = "DELETE FROM ass_archivos WHERE mzt_usuario_usr_id= '" . $this->id . "'";
            mysql_query($q2, $this->conexion) or die(mysql_error() . "***ERROR: " . $q2);

            $q = "DELETE FROM ass_usuario WHERE usr_id = " . $this->id;
            mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
            $arrjson = array('output' => array('valid' => true, 'id' => $this->id));
        } else {
            $arrjson = $this->UTILITY->error_missing_data();
        }
        $this->response = ($arrjson);
    }

    /**
     * Metodo para loguearse
     */
    private function usrlogin() {
        $resultado = 0;
        if ($this->UTILITY->validate_email($this->email)) {
            $arrjson = $this->UTILITY->error_wrong_email();
        } else {
            if ($this->email == "" || $this->pass == "") {
                $arrjson = $this->UTILITY->error_missing_data();
            } else {
                $pass = $this->UTILITY->make_hash_pass($this->email, $this->pass);
//                echo 'este el clave' .$pass;
//                exit();
                $q = "SELECT * FROM ass_usuario WHERE usr_email = '$this->email' AND usr_pass = '$pass' AND usr_habilitado = 'si'";
                $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                $resultado = mysql_num_rows($con);
                while ($obj = mysql_fetch_object($con)) {
                    $q2 = "SELECT cli_id, cli_nombre FROM ass_cliente WHERE cli_id = " . $obj->mzt_cliente_cli_id;
                    $con2 = mysql_query($q2, $this->conexion) or die(mysql_error() . "***ERROR: " . $q2);
                    $cliente = '0';
                    $clientenombre = 'ninguno';
                    while ($obj2 = mysql_fetch_object($con2)) {
                        $cliente = $obj2->cli_id;
                        $clientenombre = $obj2->cli_nombre;
                    }

                    //se consultan los perfiles asignados
                    $q3 = "SELECT mzt_perfiles_prf_id FROM ass_usuario_has_mzt_perfiles WHERE mzt_usuario_usr_id = $obj->usr_id ORDER BY mzt_perfiles_prf_id ASC";
                    $con3 = mysql_query($q3, $this->conexion) or die(mysql_error() . "***ERROR: " . $q3);
                    $arrassigned = array();
                    while ($obj3 = mysql_fetch_object($con3)) {
                        $arrassigned[] = ($obj3->mzt_perfiles_prf_id);
                    }
                    $arrjson = array('output' => array(
                            'valid' => true,
                            'id' => $obj->usr_id,
                            'idcli' => ($cliente),
                            'clientenombre' => ($clientenombre),
                            'nombre' => ($obj->usr_nombre),
                            'apellido' => ($obj->usr_apellido),
                            'cargo' => ($obj->usr_cargo),
                            'email' => ($obj->usr_email),
                            'identificacion' => ($obj->usr_identificacion),
                            'celular' => ($obj->usr_celular),
                            'telefono' => ($obj->usr_telefono),
                            'habilitado' => ($obj->usr_habilitado),
                            'dtcreate' => ($obj->usr_dtcreate),
                            'permisos' => $arrassigned));
                }
                if ($resultado == 0) {
                    $arrjson = $this->UTILITY->error_wrong_data_login();
                }
            }
        }
        $this->response = ($arrjson);
    }

    private function usrprfget() {
        //se consultan los perfiles asignados
        $q = "SELECT * FROM ass_usuario_has_mzt_perfiles WHERE mzt_usuario_usr_id = $this->id ORDER BY mzt_perfiles_prf_id ASC";
        $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
        $arrassigned = array();
        $arravailable = array();
        while ($obj = mysql_fetch_object($con)) {
            $arrassigned[] = array('id' => $obj->mzt_perfiles_prf_id);
        }
        //se consultan los perfiles disponibles
        $q = "SELECT * FROM ass_perfiles ORDER BY prf_nombre ASC";
        $con = mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
        while ($obj = mysql_fetch_object($con)) {
            $arravailable[] = array(
                'id' => ($obj->prf_id),
                'nombre' => ($obj->prf_nombre),
                'descripcion' => ($obj->prf_descripcion));
        }

        $arrjson = array('output' => array('valid' => true, 'available' => $arravailable, 'assigned' => $arrassigned));
        $this->response = ($arrjson);
    }

    private function usrprfsave() {
        if ($this->id > 0) {
            //actualiza la informacion
            $q = "DELETE FROM ass_usuario_has_mzt_perfiles WHERE mzt_usuario_usr_id = " . $this->id;
            mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
            $arrchk = explode('-', $this->chk);
            for ($i = 0; $i < count($arrchk); $i++) {
                $prf_id = intval($arrchk[$i]);
                if ($prf_id > 0) {
                    $q = "INSERT INTO ass_usuario_has_mzt_perfiles (mzt_usuario_usr_id, mzt_perfiles_prf_id) VALUES ($this->id, $prf_id)";
                    mysql_query($q, $this->conexion) or die(mysql_error() . "***ERROR: " . $q);
                }
            }
            $arrjson = array('output' => array('valid' => true, 'id' => $this->id));
        } else {
            $arrjson = $this->UTILITY->error_missing_data();
        }
        $this->response = ($arrjson);
    }

    public function getResponse() {
        $this->CDB->closeConect();
        return $this->response;
    }

    public function getResponseJSON() {
        $this->CDB->closeConect();
        return json_encode($this->response);
    }

    public function setId($_id) {
        $this->id = $_id;
    }

    public function extraLogin($email, $pass) {
        $this->email = $email;
        $this->pass = $pass;
        $this->usrlogin();
    }

}

?>