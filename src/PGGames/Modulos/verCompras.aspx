<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="verCompras.aspx.cs" Inherits="PGGames.Modulos.verCompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="misCompras" style="height: 100vh; width: 100%; background-color: #303030; left: 20%">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12" style="margin: auto">
                    <div class="card">
                        <div class="card card-header" style="border-style: none; background-color: rgba(0,0,0,0); color: rgb(214,50,45)">
                            <h4 class="card-title">Mis compras</h4>
                        </div>
                        <div class="card-body">
                            <div class="container-search" style="padding-bottom: 1.5em; padding-top: 1.5em; position: center">
                                <input runat="server" class="form-control" type="text" id="search" placeholder="Buscar..." />
                                <button class="icon" runat="server" onserverclick="Unnamed_ServerClick"><i class="fa fa-search"></i></button>
                            </div>
                            <div class="row" style="padding: 0px">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GVfacturas" runat="server" AutoGenerateColumns="false"
                                        Width="100%" AllowPaging="True" AllowSorting="True"
                                        HorizontalAlign="Center" PageSize="10" BorderStyle="Solid" BorderColor="Black"
                                        OnPageIndexChanging="GVfacturas_PageIndexChanging" CssClass="grid" HeaderStyle-HorizontalAlign="Center">
                                        <Columns>

                                            <asp:TemplateField HeaderText="Fecha de compra / #Factura" HeaderStyle-BackColor="#9d221e"
                                                ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black"
                                                HeaderStyle-Height="40px">
                                                <ItemTemplate>
                                                    <div class="row conToCenter">
                                                        <div class="col-sm-12 objToCenter">
                                                            <asp:Label ID="lblFecha" runat="server" CssClass="lblIndex centrar"
                                                            Text='<%# Eval("Fecha") %>'></asp:Label>
                                                        </div>
                                                        <br />
                                                        <div class="col-sm-12 objToCenter">
                                                            <asp:Label ID="lblidFactura" runat="server" CssClass="lblIndex centrar"
                                                            Text='<%# Eval("id_Factura") %>'></asp:Label>
                                                        </div>
                                                        
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Juegos comprados" HeaderStyle-BackColor="#9d221e"
                                                ItemStyle-BackColor="#191919" HeaderStyle-ForeColor="Black">
                                                <ItemTemplate>
                                                    <asp:ListView runat="server" ID="listDetalle">
                                                        <ItemTemplate>
                                                            <div class="card item-card" style="margin:auto; margin-top:10px">
                                                                <asp:Label ID="lblJuegos" runat="server" CssClass="lblLogin centrar"
                                                                    Text='<%# Eval("Nombre") %>'>                                                                        
                                                                </asp:Label>
                                                                <asp:Label ID="Label1" runat="server" CssClass="lblLogin centrar"
                                                                    Text='<%# Eval("Precio") %>'>                                                                        
                                                                </asp:Label>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                    <br />

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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
