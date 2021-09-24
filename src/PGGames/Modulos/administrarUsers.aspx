<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="administrarUsers.aspx.cs" Inherits="PGGames.Modulos.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="/Js/gestionCuenta.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="infoCuenta" class="card">
        <div class="conToCenter" id="informacion" style="width: 100%; background-color: #303030;">
            <div class="objToCenter" style="padding-bottom: 3em">

                <div class="container-search" style="padding-bottom: 1.5em; padding-top: 1.5em; position: center">
                    <input runat="server" class="form-control" type="text" id="search" placeholder="Buscar..." />
                    <button class="icon" runat="server" onserverclick="Unnamed_ServerClick"><i class="fa fa-search"></i></button>
                </div>

                <asp:GridView ID="GVeliminar" runat="server" AutoGenerateColumns="false"
                    Width="100%" AllowPaging="True" AllowSorting="True"
                    HorizontalAlign="Center" PageSize="10" BorderStyle="Solid" BorderColor="Black"
                    OnPageIndexChanging="GVeliminar_PageIndexChanging" CssClass="grid" OnRowCommand="GVeliminar_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Correo" HeaderStyle-BackColor="#9d221e"
                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black"
                            HeaderStyle-Height="40px">
                            <ItemTemplate>
                                <asp:Label ID="lblNombreJuego" runat="server" CssClass="lblLogin"
                                    Text='<%# Eval("Correo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Nombre" HeaderStyle-BackColor="#9d221e"
                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                            <ItemTemplate>
                                <asp:Label ID="lblGenero" runat="server" CssClass="lblLogin"
                                    Text='<%# Eval("Nombre") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cedula" HeaderStyle-BackColor="#9d221e"
                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server" CssClass="lblLogin"
                                    Text='<%# Eval("Cedula") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Modificar" HeaderStyle-BackColor="#9d221e"
                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                            <ItemTemplate>
                                <asp:Button ID="btnModificar" runat="server" CssClass="btn btn-info btnJuegos"
                                    Text="Modificar" ForeColor="Black" Font-Bold="true" CommandName="Modificar" CommandArgument='<%# Eval("id_Usuario") %>'></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Eliminar" HeaderStyle-BackColor="#9d221e"
                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                            <ItemTemplate>
                                <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-info btnJuegos"
                                    Text="Eliminar" ForeColor="Black" Font-Bold="true" CommandName="Eliminar" CommandArgument='<%# Eval("id_Usuario") %>'></asp:Button>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <PagerSettings Mode="numeric"
                        Position="Bottom"
                        PageButtonCount="10" />

                    <PagerStyle BackColor="#9d221e"
                        Height="30px"
                        VerticalAlign="Bottom"
                        HorizontalAlign="Center"
                        ForeColor="Black" />

                </asp:GridView>
            </div>
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
                            <asp:TextBox runat="server" type="text" class="form-control" ID="tbApellido"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row" style="padding: 0px">
                    <div class="col-md-4">
                        <div class="form-group" style="padding: 0px">
                            <label class="lblLogin">Telefono:</label>
                            <asp:TextBox runat="server" type="text" class="form-control" ID="tbTelefono"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row" style="padding: 0px">
                    <div class="col-md-8">
                        <div class="form-group" style="padding: 0px">
                            <label class="lblLogin">Correo(*):</label>
                            <asp:TextBox runat="server" type="text" class="form-control" ID="tbCorreo"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row" style="padding: 0px">
                    <div class="col-md-5">
                        <div class="form-group" style="padding: 0px">
                            <button runat="server" id="btnAcUser" class="btn btn-info btn-fill btn-registro" onserverclick="btnAcUser_ServerClick">Actualizar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var validations = [false, false, false, false];
        var validated = false;
       
        window.addEventListener("load", function () {



            this.setInterval(() => {

                for (let i = 0; i < 4; i++) {

                    if (validations[i]) {
                        validated = true;
                    } else {
                        validated = false;
                        break;
                    }
                    
                }

                if (validated) {
                    $('#ContentPlaceHolder1_btnAcUser').attr("disabled", false);
                } else {
                    $('#ContentPlaceHolder1_btnAcUser').attr("disabled", true);
                }

            }, 200);

        });

        function modify() {
            validations = [true, true, true, true];
        }

        bootstrapValidate('#ContentPlaceHolder1_tbNombre', 'regex:[a-zA-ZñÑ\s]{2,50}: Por favor solo ingresar letras', (isValid) => isValid ? validations[0] = true : validations[0] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbApellido', 'regex:[a-zA-ZñÑ\s]{2,50}: Por favor solo ingresar letras', (isValid) => isValid ? validations[1] = true : validations[1] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbTelefono', 'regex:^[0-9]{0,}$: Por favor solo ingresar Números', (isValid) => isValid ? validations[2] = true : validations[2] = false);
        bootstrapValidate('#ContentPlaceHolder1_tbCorreo', 'email: Por favor ingrese un correo válido', (isValid) => isValid ? validations[3] = true : validations[3] = false);

    </script>
</asp:Content>
