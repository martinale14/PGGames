<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="PGGames.Modulos.registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>PG Games</title>
    <style type="text/css">
        .body{
            display: flex;
            justify-content: center;
            background-color: rgba(0, 0, 0, 0.9);
            vertical-align:auto
        }
    </style>

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="/Assets/imgs/index/game.ico" /> 
    <link rel="stylesheet" href="/Assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/Assets/css/masterStyle.css"/>
    <link rel="stylesheet" href="/Assets/css/estilos.css" />
    <script src="/Assets/libs/popper.min.js"></script>
    <script src="/Assets/libs/jquery.min.js"></script>
    <script src="/Assets/libs/bootstrap.min.js"></script>
    <script src="/Assets/libs/bootstrap-validate.js"></script>
    <script type="text/javascript" src="/Js/alert.js"></script>

</head>
<body class="body">
    <div id="alertbox" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div  class="modal-body" style="color:#fff">
                    <p id="mensajePer" style="text-align: center;"></p>
                </div>
                <div class="modal-footer" style="margin:auto">
                    <button type="button" class="btn btn-info btn-fill" id="btAceptar" data-dismiss="modal">ACEPTAR</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container" runat="server" id="formTodo">
        <div class="row align-items-center" style="height: 100%">
            <div class="col-lg-12" style="margin-bottom: 20px">
                <form id="form1" runat="server" style="padding: 0; top: 0;">

                    <div class="card cardShadow main-card" style=" width: 50%; margin: 0 auto; padding: 0; top:0;">
                        <div class="card-body" style="background-color: rgba(255, 255, 255, 0.1); width: 100%;">
                            <div class="conToCenter">
                                <div class="objToCenter" style="width: 70%;">
                                    <img src="/Assets/imgs/Nombre.png" style="width: 100%" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="loginText">Crea tu cuenta PG GAMES</p>
                                    
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-6 conToCenter" style="padding:0px">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Nombre(*):</label>
                                        <input runat="server" type="text" class="form-control" required="" id="tbNombre" />
                                    </div>
                                </div>
                                <div class="col-md-6 conToCenter" style="padding:0px">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Apellido(*):</label>
                                        <input runat="server" type="text" class="form-control" required="" id="tbApellido" />
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-6 conToCenter" style="padding:0px">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Cédula(*):</label>
                                        <input runat="server" type="text" class="form-control" required="" id="tbCedula"/>
                                    </div>
                                </div>
                                <div class="col-md-6 conToCenter" style="padding:0px">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Télefono/Celular:</label>
                                        <input runat="server" type="text" class="form-control" id="tbTelefono"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-8 conToCenter" style="padding:0;" id="adaptable">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float:left">Email(*):</label>
                                        <input runat="server" type="text" class="form-control" required="" id="tbCorreo"/>
                                    </div>
                                </div>
                                <div runat="server" class="col-md-4 conToCenter" style="padding:0;" id="esconder">
                                    <div class="form-group txtBox objToCenter">
                                        <label for="usuarios" class="lblLogin" style="float: left">Tipo(*):</label>
                                        <select name="usuarios" id="ddlTipo" runat="server" class="form-control" required="">
                                            <option></option>
                                            <option value="0">Admin</option>
                                            <option value="1">User</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="width: 100%; padding:0; margin:0;">
                                <div class="col-md-6 conToCenter" style="padding:0px">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Contraseña(*):</label>
                                        <input runat="server" type="password" class="form-control" required="" id="tbContraseña"/>
                                    </div>
                                </div>
                                <div class="col-md-6 conToCenter"  style="padding:0px">
                                    <div class="form-group objToCenter txtBox">
                                        <label class="lblLogin" style="float: left">Confirmar Contraseña(*):</label>
                                        <input runat="server" type="password" class="form-control" required="" id="tbCContraseña"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin: auto; padding: 0;">
                            <div class="col-md-12" style="padding: 0">
                                <div class="form-group" style="margin: auto; padding: 10px 0;">
                                    <asp:Button Runat="server" ID="btnRegistrar" CssClass="btn btn-info btn-fill btn-registro" style="width: 100%" OnClick="BtnRegistrar" Text="Registrar"></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        var validations = new Array(6);

        window.onload = function () {

            this.validations = [false, false, true, false, false, false];

            var values = [$("#tbNombre").val(), $("#tbApellido").val(), $("#tbCedula").val(), $("#tbCorreo").val()];

            for (let i = 0; i < 4; i++) {

                if ('True' == '<%= Page.IsPostBack.ToString()%>' && values[i] != "") {
                    this.postback();
                    
                }

            }

            this.setInterval(() => {

                validated = false;

                for (let i = 0; i < 6; i++) {

                    if (this.validations[i] == true) {

                        validated = true;

                    } else {
                        validated = false;
                        break
                    }

                }

                if (validated) {
                    $('#btnRegistrar').attr("disabled", false);
                } else {
                    $('#btnRegistrar').attr("disabled", true);
                }

                

            }, 200);

        }

        function postback() {
            console.log("entro");
            validations = [true, true, true, true, false, false];
        }

        bootstrapValidate(['#tbNombre', '#tbApellido'], 'regex:[a-zA-ZñÑ\s]{2,50}: Por favor solo ingresar letras', (isValid) => isValid ? validations[0] = true : validations[0] = false);
        bootstrapValidate('#tbCedula', 'regex:^[0-9]{0,}$: Por favor solo ingresar Números', (isValid) => isValid ? validations[1] = true : validations[1] = false);
        bootstrapValidate('#tbTelefono', 'regex:^[0-9]{0,}$: Por favor solo ingrese Números', (isValid) => isValid ? validations[2] = true : validations[2] = false);
        bootstrapValidate('#tbCorreo', 'email: Por favor ingrese un correo válido', (isValid) => isValid ? validations[3] = true : validations[3] = false);
        bootstrapValidate('#tbContraseña', 'regex:^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{5,15}): -Mínimo 5 y Máximo 15 caracteres -Un número -Una letra Mayúscula ', (isValid) => isValid ? validations[4] = true : validations[4] = false);
        bootstrapValidate('#tbCContraseña', 'matches:#tbContraseña: Las contraseñas no coinciden', (isValid) => isValid ? validations[5] = true : validations[5] = false);

    </script>
</body>
</html>