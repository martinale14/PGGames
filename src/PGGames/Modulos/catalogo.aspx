<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="catalogo.aspx.cs" Inherits="PGGames.Modulos.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="row">
        <div class="col-sm-6" style="padding-top: 0;">
            <div class="d-flex justify-content-left align-content-center" style="width: 100%; height: 100%; padding: 0;">
                <img src="../Assets/imgs/Nombre.png" style="width: 100%" />
            </div>
        </div>
        <div class="col-sm-3">
        </div>
        <div class="col-sm-3" style="padding: 0;">
            <div class="conToCenter">
                <div class="objToCenter">
                    <a runat="server" onserverclick="Unnamed_ServerClick1"><img style="width: 25%" src="../Assets/imgs/carrito.png" /></a>
                </div>
            </div>
            <div class="conToCenter">
                <div class="cart objToCenter" style="padding: 0;">
                    <asp:Label runat="server" ID="lblCarrito" Text="0" Style="color: #191919; vertical-align: middle;"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="row" style="width: 100%">
        <div class="col-sm-1">

        </div>
        <div class="col-sm-3 col">
            <select name="usuarios" id="ddlOrden" runat="server" class="form-control" style="width: 100%">
                <option value="ORDER BY nJuego desc">Lanzamientos recientes</option>
                <option value="ORDER BY nJuego">Fecha de salida</option>
                <option value="ORDER BY CONVERT(decimal, Precio)">Precio Menor a Mayor</option>
                <option value="ORDER BY CONVERT(decimal, Precio) desc">Precio Mayor a Menor</option>
            </select>
        </div>
        <div class="col-sm-3">
            <asp:Button ID="filtrar" CssClass="btn btn-info btn-fill" runat="server" Style="width: 100%" OnClick="filtrar_Click" Text="Ordenar" />
        </div>
        <div class="col-sm-3">
            <div class="container-search" style=" position: center; padding: 0; margin:0; width: 100%;">
                <input runat="server" type="text" id="search" placeholder="Buscar..." />
                <button runat="server" onserverclick="Unnamed_ServerClick" class ="icon"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <div class="col-sm-1">

        </div>
    </div>
    <br />
    <div class="Juegos">
        <div class="card-group card-items-group justify-content-center">
            <asp:ListView runat="server" ID="Repeater1" OnItemCommand="Repeater1_ItemCommand" DataKeyNames="id_Juego">
                <ItemTemplate>
                    <div class="card item-card" style="padding: 0;">
                        <div class="back-card" style="overflow:hidden; width: 201.25px; height: 255.53px;">
                            <img id="topCard" class="card-img-top" src='<%# Eval("imgURL") %>' runat="server" style=""/>
                        </div>
                        <div class="card-body card-description align-items-center d-flex justify-content-center">
                            <div style="width: 90%;">
                                <h5 class="card-title" style="text-align: center; color: black; font-size: 90%;"><%# Eval("Nombre") %></h5>
                                <p style="text-align: center; color: black; margin-bottom: 0; font-size: 90%;"><%# Eval("Precio") %> COP</p>
                                <br />
                                <div class="conToCenter" style="width: 100%; padding: 0;">
                                    <div class="objToCenter" style="width: 80%">
                                        <asp:LinkButton ID="btnAddCarrito" class="btn btn-dark btn-card" runat="server" Style="width: 100%; font-size: 90%;" Text='<%#Eval("Estado_Lanzamiento") %>' CommandName='<%# Eval("nJuego")%>' CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <br />
    <div class="conToCenter">
        <div class="objToCenter">
            <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="Repeater1"
                PageSize="10" OnPreRender="DataPagerProducts_PreRender">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowNextPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ShowLastPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>

</asp:Content>
