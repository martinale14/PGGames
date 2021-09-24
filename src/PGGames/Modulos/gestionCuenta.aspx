<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="gestionCuenta.aspx.cs" Inherits="PGGames.Modulos.gestionCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Js/gestionCuenta.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav class="navbar navbar-expand-lg navbar-dark nav-bar">
        <div class="navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active" id="info">
                    <a class="nav-link" href="#" onclick="showInfo()">Información de cuenta</a>
                </li>
                <li class="nav-item" id="seg">
                    <a class="nav-link" href="#" onclick="showSeguridad()">Seguridad</a>
                </li>
            </ul>
        </div>
    </nav>

    <div style="height: 100vh; width: 100%; background-color: #303030; left: 20%">

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12" style="margin: auto;">

                    <!-- Informacion de cuenta -->
                    <div id="infoCuenta" class="card">
                        <div class="card card-header" style="border-style: none; background-color: rgba(0,0,0,0); color: rgb(214,50,45)">
                            <h4 class="card-title">Información de usuario</h4>
                        </div>
                        <div class="card-body">
                            <div>
                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Nombre(*):</label>
                                            <input runat="server" type="text" class="form-control" id="tbNombre" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Apellido(*):</label>
                                            <input runat="server" type="text" class="form-control" id="tbApellido" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Telefono:</label>
                                            <input runat="server" type="text" class="form-control" id="tbTelefono" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="padding: 0px">
                                    <div class="col-md-5">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Correo(*):</label>
                                            <input runat="server" type="text" class="form-control" id="tbCorreo" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="padding: 0px">
                                    <div class="col-md-5">
                                        <div class="form-group" style="padding: 0px">
                                            <button runat="server" id= "btnAcPerfil" class="btn btn-info btn-fill btn-registro" onserverclick="btnAcPerfil_ServerClick">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Seguridad -->

                    <div id="seguridad" class="card">
                        <div class="card card-header" style="border: 0px; background-color: rgba(0,0,0,0); color: rgb(214,50,45)">
                            <h3 class="card-title">Seguridad de la cuenta</h3>
                        </div>
                        <div class="card-body">
                            <h5 style="color: #fff">Cambie su contraseña</h5>
                            <div>
                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Contraseña actual(*):</label>
                                            <input runat="server" type="password" class="form-control" id="tbOContraseña" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Contraseña nueva(*):</label>
                                            <input runat="server" type="password" class="form-control" id="tbNContraseña" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Confirme su nueva contraseña(*):</label>
                                            <input runat="server" type="password" class="form-control" id="tbCContraseña" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="padding: 0px">
                                    <div class="col-md-5">
                                        <div class="form-group" style="padding: 0px">
                                            <button runat="server" id="btnAcContra" class="btn btn-info btn-fill btn-registro" onserverclick="btnAcContra_ServerClick">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script>
        var validations = [true, true, true, true];
        var validationsSeg = [false, false];
        var validated1 = false;
        var validated2 = false;

        window.addEventListener("load", function () {

            this.setInterval(() => {

                for (let i = 0; i < 4; i++) {

                    if (this.validations[i] == true) {

                        validated1 = true;

                    } else {
                        validated1 = false;
                        break;
                    }

                }

                if (validated1) {
                    $('#ContentPlaceHolder1_btnAcPerfil').attr("disabled", false);
                } else {
                    $('#ContentPlaceHolder1_btnAcPerfil').attr("disabled", true);
                }

            }, 200);

        });

        window.addEventListener("load", function () {

            this.setInterval(() => {

                for (let i = 0; i < 2; i++) {

                    if (this.validationsSeg[i] == true) {

                        validated2 = true;

                    } else {
                        validated2 = false;
                        break;
                    }

                }

                if (validated2) {
                    $('#ContentPlaceHolder1_btnAcContra').attr("disabled", false);
                } else {
                    $('#ContentPlaceHolder1_btnAcContra').attr("disabled", true);
                }

            }, 200);

        });

        bootstrapValidate('#ContentPlaceHolder1_tbNombre', 'regex:^[a-zA-ZñÑ\s]{2,50}$: Por favor solo ingresar letras', (isValid) => isValid ? validations[0] = true : validations[0] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbApellido', 'regex:^[a-zA-ZñÑ\s]{2,50}$: Por favor solo ingresar letras', (isValid) => isValid ? validations[1] = true : validations[1] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbTelefono', 'regex:^[0-9]{0,}$: Por favor solo ingrese Números', (isValid) => isValid ? validations[2] = true : validations[2] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbCorreo', 'email: Por favor ingrese un correo válido', (isValid) => isValid ? validations[3] = true : validations[3] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbNContraseña', 'regex:^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{5,15}): -Mínimo 5 y Máximo 15 caracteres -Un número -Una letra Mayúscula ', (isValid) => isValid ? validationsSeg[0] = true : validationsSeg[0] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbCContraseña', 'matches:#ContentPlaceHolder1_tbNContraseña: Las contraseñas no coinciden', (isValid) => isValid ? validationsSeg[1] = true : validationsSeg[1] = false);

    </script>
</asp:Content>
