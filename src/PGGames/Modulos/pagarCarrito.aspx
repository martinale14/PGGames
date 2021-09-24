<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="pagarCarrito.aspx.cs" Inherits="PGGames.Modulos.pagarCarrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

                    <asp:TemplateField HeaderText="Precio" HeaderStyle-BackColor="#9d221e"
                        ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                        <ItemTemplate>
                            <asp:Label ID="lblGenero" runat="server" CssClass="lblLogin"
                                Text='<%# Eval("Precio") %>'></asp:Label>
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
            <asp:Button ID="btnComprar" runat="server" CssClass="btn btn-info btnJuegos"
                Text="Comprar" ForeColor="Black" Font-Bold="true" OnClick="btnComprar_Click"></asp:Button>
        </div>
        
    </div>

</asp:Content>
