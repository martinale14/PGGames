<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cambiar-con.aspx.cs" Inherits="PGGames.Modulos.cambiar_con" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>PG Games</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="/Assets/imgs/index/game.ico" />
    <link rel="stylesheet" href="/Assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/Assets/css/masterStyle.css" />
    <script src="/Assets/libs/popper.min.js"></script>
    <script src="/Assets/libs/jquery.min.js"></script>
    <script src="/Assets/libs/bootstrap.min.js"></script>
    <script src="/Assets/libs/bootstrap-validate.js"></script>
    <script type="text/javascript" src="../Js/alert.js"></script>
</head>
<body class="body">
    <div id="alertbox" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" style="width:2%; height:2%; margin-left:95%">&times;</button>
                <div  class="modal-body" style="color:#fff">
                    <p id="mensajePer" style="text-align: center;"></p>
                </div>
                <div class="modal-footer" style="margin:auto">
                    <button type="button" class="btn btn-info btn-fill" data-dismiss="modal">ACEPTAR</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container" runat="server" id="formTodo">
        <div class="row align-items-center" style="height: 100%">
            <div class="col-lg-12">
                <form id="form1" runat="server" style="padding: 0; top: 0;">

                    <div class="card cardShadow" style=" width: 50%; margin: 0 auto; padding: 0; top:0;">
                        <div class="card-body" style="background-color: rgba(255, 255, 255, 0.1); width: 100%;">
                            <div class="conToCenter">
                                <div class="objToCenter" style="width: 70%;">
                                    <img src="/Assets/imgs/Nombre.png" style="width: 100%" />
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-12 conToCenter">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Email(*):</label>
                                        <input runat="server" type="text" class="form-control" required="" id="tbMail" />
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-12 conToCenter">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Nueva Contraseña(*):</label>
                                        <input runat="server" type="password" class="form-control" required="" id="nPassword" />
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-12 conToCenter">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Confirmar Contraseña(*):</label>
                                        <input runat="server" type="password" class="form-control" required="" id="cPassword" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 conToCenter">
                                    <div class="form-group objToCenter" style="width: 50%">
                                        <button runat="server" id="btnCContraseña" class="btn btn-info btn-fill" onserverclick="btnCContraseña_Click" style="width: 100%">Cambiar Contraseña</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin: auto">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="lblLogin">¿No eres miembro? <a href="index.aspx" class="lblLogin2">Registrate aquí</a></label>

                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
    <script>
        bootstrapValidate('#tbMail', 'email: Por favor ingrese un correo válido');
    </script>
</body>
</html>
