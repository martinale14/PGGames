<%@ Page Title="" Language="C#" MasterPageFile="~/Modulos/masters/principal.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PGGames.Modelos.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div id="demo" class="carousel slide" data-ride="carousel">

        <div class="msgIndex position-absolute" runat="server" id="mensaje">
            <div class="centrarNombre">
                <img src="/Assets/imgs/Nombre.png" style="width: 400px" />
                <label class="lblIndex" style="color: white">ENCUENTRA TUS JUEGOS FAVORITOS AQUÍ Y AHORA</label>
            </div>

            <div class="conToCenter" style="padding-top: .6em; height: 27%">
                <div class="objToCenter" style="height: 100%">
                    <div class="row">
                        <button runat="server" id="btnRegistro" class="btnIndex" style="margin: auto"
                        onserverclick="btnRegistro_ServerClick" formnovalidate="">
                        ZONA DE REGISTRO</button>
                    </div>
                    <div class="row conToCenter">
                        <div class="objToCenter" style="width: 100%">
                            <a href="/Modulos/login.aspx">Iniciar Sesión</a>
                        </div>
                        
                    </div>

                </div>
            </div>
        </div>

        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <div class="carousel-inner">
            <div class="carousel-item active imgCarousel">
                <img src="/Assets/imgs/slide/assasinsBanner.jpg" alt="Assasin's Creed" />
            </div>
            <div class="carousel-item imgCarousel">
                <img src="/Assets/imgs/slide/farcryBanner.jpg" alt="Far Cry 4" />
            </div>
            <div class="carousel-item imgCarousel">
                <img src="/Assets/imgs/slide/forzaBanner.jpg" alt="Forza" />
            </div>
        </div>

    </div>

    <div class="row" style="margin-bottom: 20px">
        <div class="col-sm-6 container">
            <div class="conToCenter" style="width: 100%; padding: 0px 0px 0px">
                <div class="objToCenter" style="background-color: #353535; text-align: center; width: 100%;">
                    <p style="color: white" class="lblIndex">NUESTRO JUEGO DEL MES</p>
                    <img src="/Assets/imgs/index/gameDes.jpg" class="gDescriptions"
                        style="width: 90%; margin-left: 5%; margin-bottom: 5%" />
                    <iframe width="90%" height="310" src="https://www.youtube-nocookie.com/embed/Q_v3ttvCVfA"
                        frameborder="0" allow="accelerometer; encrypted-media; 
                        gyroscope; picture-in-picture; fullscreen"
                        style="margin-bottom: 5%"></iframe>
                    <p style="color: white; margin-bottom:0px" class="lblIndex">¿QUÉ ESPERAS PARA DESCARGARLOS!?</p>
                    <asp:ImageButton runat="server" ID="imgGratis" ImageUrl="~/Assets/imgs/index/gratis.png"
                        OnClick="imgGratis_Click" CssClass="imgGratis" style="width: 90%; margin-bottom: 5%"/>
                </div>
            </div>
        </div>
        <div class="col-sm-6 container">
            <div style="background-color: #353535; text-align: center; width: 100%">
                <p style="color: white; margin-bottom: 0px;" class="lblIndex">NUESTROS ULTIMOS LANZAMIENTOS</p>
                <asp:GridView ID="GVindex" runat="server" AutoGenerateColumns="false"
                    Width="100%" AllowPaging="false" AllowSorting="True"
                    HorizontalAlign="Center" BorderStyle="None" BorderColor="transparent"
                    CssClass="grid" HeaderStyle-BorderColor="Transparent">
                    <Columns>
                        <asp:TemplateField HeaderStyle-Height="0px" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-BorderColor="Transparent">
                            <ItemTemplate>
                                <img id="lblImagen" runat="server" class="imgTop"
                                    src='<%# Eval("imgURL") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-BorderColor="Transparent">
                            <ItemTemplate>
                                <asp:Label ID="lblNombre" runat="server" ForeColor="White"
                                    Font-Size="24pt" CssClass="lblIndex"
                                    Text='<%# Eval("Nombre") %>'></asp:Label>
                                <br />
                                <label id="lblPrecio" runat="server" class="lblIndex"
                                    style="font-size: x-large">
                                    <%# Eval("Precio") %> COP</label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <div style="background-color: #080808">
        <div class="row" style="background-color: #080808">

            <div class="col-sm-3">
                <label class="lblIndex2" style="color: white">Desarrolladores</label>
                <br />
                <label class="lblIndex2">Activision</label>
                <br />
                <label class="lblIndex2">Ubisoft</label>
                <br />
                <label class="lblIndex2">Epic Games</label>
            </div>

            <div class="col-sm-3">
                <label class="lblIndex2" style="color: rgba(0,0,0,0); display:none">espacio</label>
                <br />
                <label class="lblIndex2">Ivory Tower</label>
                <br />
                <label class="lblIndex2">Rockstar Games</label>
                <br />
                <label class="lblIndex2">Insomniac Games</label>
            </div>

            <div class="col-sm-12">
                <hr style="width: 100%; border-color: white" />
            </div>

            <div class="col-sm-6">
                <p style="color: rgba(255,255,255,.3)">
                    ©️ 2020, PG Games, Inc. Todos los derechos 
                    reservados. PG, PG Games, el logotipo de PG Games. Tanto en Colombia como 
                    en el resto del mundo. Otras marcas o nombres de productos son marcas 
                    comerciales de sus respectivos propietarios.
                </p>
            </div>

        </div>

    </div>

</asp:Content>
