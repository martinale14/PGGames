<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="modificarJuego.aspx.cs" Inherits="PGGames.Modulos.modificarJuego" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
    <script src="/Js/gestionCuenta.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav class="navbar navbar-expand-lg navbar-dark nav-bar">
        <div class="navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active" id="info">
                    <a class="nav-link" href="#" onclick="showInfo()">Modificar Juego</a>
                </li>
                <li class="nav-item" id="seg">
                    <a class="nav-link" href="#" onclick="showSeguridad()">Agregar Juego</a>
                </li>
            </ul>
        </div>
    </nav>

    <div style="height: 100vh; width: 100%; background-color: #303030; left: 20%">

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12" style="margin: auto;">

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
                                        <asp:TemplateField HeaderText="Nombre" HeaderStyle-BackColor="#9d221e"
                                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black"
                                            HeaderStyle-Height="40px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNombreJuego" runat="server" CssClass="lblLogin"
                                                    Text='<%# Eval("Nombre") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Género" HeaderStyle-BackColor="#9d221e"
                                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGenero" runat="server" CssClass="lblLogin"
                                                    Text='<%# Eval("Genero") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Estado" HeaderStyle-BackColor="#9d221e"
                                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEstado" runat="server" CssClass="lblLogin"
                                                    Text='<%# Eval("Estado_Lanzamiento") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Modificar" HeaderStyle-BackColor="#9d221e"
                                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                                            <ItemTemplate>
                                                <asp:Button ID="btnModificar" runat="server" CssClass="btn btn-info btnJuegos"
                                                    Text="Modificar" ForeColor="Black" Font-Bold="true" CommandName="Modificar" CommandArgument='<%# Eval("nJuego") %>'></asp:Button>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Eliminar" HeaderStyle-BackColor="#9d221e"
                                            ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                                            <ItemTemplate>
                                                <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-info btnJuegos"
                                                    Text="Eliminar" ForeColor="Black" Font-Bold="true" CommandName="Eliminar" CommandArgument='<%# Eval("nJuego") %>'></asp:Button>
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
                                            <label class="lblLogin">Precio(*):</label>
                                            <asp:TextBox runat="server" type="number" class="form-control" ID="tbPrecio"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Genero(*):</label>
                                            <select runat="server" type="text" class="form-control" id="ddlGenero">
                                                <option value=""></option>
                                                <option value="Acción">Acción</option>
                                                <option value="Aventura">Aventura</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="padding: 0px">
                                    <div class="col-md-4">
                                        <div class="form-group" style="padding: 0px">
                                            <label class="lblLogin">Estado(*):</label>
                                            <select runat="server" type="text" class="form-control" id="ddlEstado">
                                                <option value=""></option>
                                                <option value="Comprar">Comprar</option>
                                                <option value="Reservar">Reservar</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="padding: 0px">
                                    <div class="col-md-5">
                                        <div class="form-group" style="padding: 0px">
                                            <button runat="server" id="btnAcJuego" class="btn btn-info btn-fill btn-registro" onserverclick="btnAcJuego_ServerClick">Actualizar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Seguridad -->

                    <div id="seguridad" class="card">
                        <div id="agregarJuego" style="height: 100vh; width: 100%; background-color: #303030; left: 20%">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12" style="margin: auto">
                                        <div class="card">
                                            <div class="card card-header" style="border-style: none; background-color: rgba(0,0,0,0); color: rgb(214,50,45)">
                                                <h4 class="card-title">Agregue nuevos juegos</h4>
                                            </div>
                                            <div class="card-body">
                                                <div>
                                                    <div class="row" style="padding: 0px">
                                                        <div class="col-md-4">
                                                            <div class="form-group" style="padding: 0px">
                                                                <label class="lblLogin" style="float: left">Nombre(*):</label>
                                                                <input runat="server" type="text" class="form-control" id="tbNombreJuego" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group" style="padding: 0px">
                                                                <label class="lblLogin" style="float: left">Precio(*):</label>
                                                                <asp:TextBox runat="server" type="number" class="form-control" ID="tbPrecioJuego"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="padding: 0px">
                                                        <div class="col-md-4">
                                                            <div class="form-group" style="padding: 0px">
                                                                <label class="lblLogin" style="float: left">Genero(*):</label>
                                                                <select name="genero" class="form-control" runat="server" id="ddlGeneroJuego">
                                                                    <option value=""></option>
                                                                    <option value="Acción">Acción</option>
                                                                    <option value="Aventura">Aventura</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group" style="padding: 0px">
                                                                <label class="lblLogin" style="float: left">Estado(*):</label>
                                                                <select name="estado" class="form-control" runat="server" id="ddlEstadoJuego">
                                                                    <option value=""></option>
                                                                    <option value="Comprar">Comprar</option>
                                                                    <option value="Reservar">Reservar</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="padding: 0px">
                                                        <div class="col-md-5">
                                                            <div class="form-group" style="padding: 0px">
                                                                <label class="lblLogin" style="float: left">Portada del juego(*):</label>
                                                                <div class="custom-file">
                                                                    <asp:FileUpload ID="img" runat="server" CssClass="subir btn btn-fill"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="padding: 0px">
                                                        <div class="col-md-5">
                                                            <div class="form-group" style="padding: 0px">
                                                                <div class="image-preview" id="imagePreview">
                                                                    <img src="" alt="Image Preview" class="image-preview__image" />
                                                                    <span class="image-preview__default-text">Image preview</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="row" style="padding: 0px">
                                                        <div class="col-md-5">
                                                            <div class="form-group" style="padding: 0px">
                                                                <button runat="server" id="btnAgregar" class="btn btn-info btn-focus btn-registro" onserverclick="btnAgregar_ServerClick">Agregar</button>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>

        var validated1 = false;
        var validated2 = false;

        window.addEventListener("load", function () {

            this.setInterval(() => {

                if (document.getElementById("ContentPlaceHolder1_ddlGenero").value == "" || document.getElementById("ContentPlaceHolder1_ddlEstado").value == "") {
                    validated2 = false;

                } else {
                    validated2 = true;
                }

                if (document.getElementById("ContentPlaceHolder1_tbNombre").value == "") {

                    validated1 = false;

                } else {
                    validated1 = true;
                }

                if (validated1 && validated2) {
                    $('#ContentPlaceHolder1_btnAcJuego').attr("disabled", false);
                } else {
                    $('#ContentPlaceHolder1_btnAcJuego').attr("disabled", true);
                }


            }, 200);

        });

        $("#ContentPlaceHolder1_tbPrecio").on({
            "focus": function (event) {
                $(event.target).select();
            },
            "keyup": function (event) {
                $(event.target).val(function (index, value) {
                    return value.replace(/\D/g, "")
                        //   .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
                });
            }
        });

        $("#ContentPlaceHolder1_tbPrecioJuego").on({
            "focus": function (event) {
                $(event.target).select();
            },
            "keyup": function (event) {
                $(event.target).val(function (index, value) {
                    return value.replace(/\D/g, "")
                        //   .replace(/([0-9])([0-9]{2})$/, '$1.$2')
                        .replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
                });
            }
        });

        function modify() {
            validated1 = true;
            validated2 = true;
        }

    </script>
    <script>
        $(".custom-file-input").on("change", function () {

            var filename = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(filename);

        });
    </script>

    <script>

        const img = document.getElementById("ContentPlaceHolder1_img");
        const previewContainer = document.getElementById("imagePreview");
        const previewImage = previewContainer.querySelector(".image-preview__image");
        const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");

        img.addEventListener("change", function () {

            const file = this.files[0];

            if (file) {

                const reader = new FileReader();
                previewDefaultText.style.display = "none";
                previewImage.style.display = "block";

                reader.addEventListener("load", function () {

                    previewImage.setAttribute("src", this.result);

                }
                );

                reader.readAsDataURL(file);

            }

        });

    </script>
    <script>

        var validated = [false, false, false, false];

        window.addEventListener("load", function () {

            this.setInterval(() => {

                if (document.getElementById("ContentPlaceHolder1_tbNombreJuego").value == "") {
                    validated[0] = false;
                } else {
                    validated[0] = true;
                } 

                if (document.getElementById("ContentPlaceHolder1_tbPrecioJuego").value == "") {
                    validated[1] = false;
                } else {
                    validated[1] = true;
                }
                
                if (document.getElementById("ContentPlaceHolder1_ddlGeneroJuego").value == "") {
                    validated[2] = false;
                } else {
                    validated[2] = true;
                }
                
                if (document.getElementById("ContentPlaceHolder1_ddlEstadoJuego").value == "") {
                    validated[3] = false;
                } else {
                    validated[3] = true;
                }

                if (validated[0] && validated[1] && validated[2] && validated[3]) {
                    $('#ContentPlaceHolder1_btnAgregar').attr("disabled", false);
                } else {
                    $('#ContentPlaceHolder1_btnAgregar').attr("disabled", true);
                }
            }, 200);

        });
    </script>
</asp:Content>
