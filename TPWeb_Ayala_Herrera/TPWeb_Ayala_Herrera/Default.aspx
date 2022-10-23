<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Ayala_Herrera.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TPWeb_Carrito</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            
            <div class="card-header text-bg-success text-center">
                <div class="btn-group"><h1>Carrito de compras</h1></div>
                <div class="btn-group"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC0AAAAtCAYAAAA6GuKaAAAAAXNSR0IArs4c6QAAAhxJREFUaEPtmL0vBEEYh5+r1Dqdj0StI0JBlBJaoUDUEqWSUilRSqiIQiNR+ij8AQqdgkZ04j8gv2T3sje7ezO7NzPr5Ka55HZ35tln39+7Hy36cLT6kJkBdKyr9m9MbxnG3oHHWBZd1jFNLwAPBQcK/Bw4dJk09D6u0OIQ+PZfsF4FOgUfD23SNr8JPQaoRLJj0/hvsWnbLt1DwTzLnIVCKfDGhgu07L9lCFXbgtZvI8MFWmAynW2FB012ElfoItuxLOdarSu0ANW/zZDGAu8IfxXoshtPDHC12XaGqkCrRFTbsW3nulUVaBk1218My7oLq67boyq0GcgY0B2loQWrQscOpAzLdMeoAx0zkLnSqGs6pu1CqXVMxwpkYWn0YjpGIHMBTAu7rumi5xGfnaTrk2Qv0CFtFwbQh+mQgSwtjV5qOj3pEO2vNIC+TId4HulaGj5Mh2h/1pxZd3BoCT4DaS0NX6ZT23pr1wnUHc4fg3yYrgtZ+zif0EPADPAJvFYgmge+gRfXY3xBryQP6sPJwsfAngViGrgEJpL9LoANF3Bf0Hp/GzUWXAVuukA8AXPG9l3gxAbuA7qse9i+jfwUwEXtHl9AWhopy3py+cvEPQNTxsZ94CiGaa2xA5xmFrsC1iyLLwPXgAKscQ8s2YB99mnNNQnMAh/AncviwEgCqu5x63hMrRdb17mD7ecjiMHgyiYeQMdS3pemfwHdSlQugFyXrwAAAABJRU5ErkJggg==" />
                    <p><%: i %></p>
                </div>
            </div>

            
            <div class="card-body text-center">
                <div class="card-title">
                    <h1>Listado de Artículos</h1>
                </div>

                <div>
                    <hr />
                    <div>
                        <asp:TextBox ID="txtFiltro" runat="server" CssClass="form-text m-2 p-1 shadow align-middle pe-5"></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-primary m-2" />
                        <asp:ImageButton ID="ibtnBorrarFiltro" CssClass="align-middle m-1 btn" ImageUrl="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAAAXNSR0IArs4c6QAAAdxJREFUSEvFlo1Nw0AMhV8nASYBJilMAkxCmQSYBJgE9NA5enm1L3eIqpaitLnEn3/vvMOZZHcmLv4CvgRwA+ACwFcz/BPA24wTo2DC9gAeO8oD/jJixBZ4BOi2hAFPAPg7lR6Y0FcAvIcwnLze213DzvDzCiH0toJXYCr8MCX3AyF0Y0t4BaanYT3zyrCNiqcnhWfgZwB3jTILVeMepBgPABixRRxML+kthZZemZv0pioYX+N/OkGd/GaVKgertywM7U0q4Dqt99BXa1or1EWdv+JgFhRf9tCoAlqvcI+SV3LUyyqCClYFWW6Zd3ocaSCcbRWp4XOPEp9prpd1Bati5oOKXRyuPZ5B+b06tOitwCyqqogUHoZVUK5rmpZIKlhD0gOrBxr2Xq9/NwtTj1XhSNg0DV5wupamcKa43FMaF73a8zyNpILLnrM8efV6wXk76d6w8LyPtef8UAhAloZqTaO02hsc7BuFb5lJh3Uf6WGzMnjrkDja3CfIU4dE9F0MAL1q7dmg0OywKYe9/xoEqm20O2Vm0wSt5xWjT0Toum2NPvqUU8sphj0aszlAbIEjj/SeeYvJJMtv1APH23K6jA9HwWoAjYhTKYb6kw30E1009uqsx2NaB976AZMmmh/4QY5AAAAAAElFTkSuQmCC" runat="server" OnClick="ibtnBorrarFiltro_Click" />
                    </div>
                    <hr />
                    <asp:Label ID="lblFiltro" runat="server" Text="No se han encontrado articulos" Visible="false"></asp:Label>
                    <hr />
                    <asp:Button ID="btnCarrito" runat="server" Text="Ver Carrito" CssClass=" btn btn-lg text-bg-success" OnClick="btnCarrito_Click" />
                    <hr />
                </div>
                <hr />
                <div class="row row-cols-1 row-cols-md-3 g-4 p-md-5">

                    <%-- 
                    <% foreach (Dominio.Articulo item in ListaArticulo)
                        {%>
                            <div class="card" style="width: 18rem;">
                                <img src="<%:item.ImagenUrl %>" class="card-img-top" alt="ImgArt" width="200" height="250"/>
                                <div class="card-body">
                                    <h5 class="card-title"><%: item.Nombre %></h5>
                                    <h6 class="card-subtitle"><%: item.MarcaArticulo.Descripcion %> </h6>
                                    <p class="card-text"><%: item.Descripcion %>.</p>
                                    <p class="card-text"><%: item.Precio %></p>
                                    <a href="#" class="btn btn-primary">Comprar</a>
                                </div>
                            </div>
                        <%} %>
                    --%>
                    <asp:Repeater ID="repArticulo" runat="server">
                        <ItemTemplate>
                            <div class="card" style="width: 18rem;">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="ImgArt" width="200" height="250" />
                                <div class="card-body">
                                    <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                    <h6 class="card-subtitle"><%#Eval("MarcaArticulo.Descripcion") %> </h6>
                                    <p class="card-text"><%#Eval("Descripcion") %>.</p>
                                    <p class="card-text"><%#Eval("Precio") %>.</p>
                                    <asp:Button ID="btnComprar" CssClass="btn btn-primary" runat="server" Text="Comprar" CommandArgument='<%#Eval("Id")%>' CommandName="IdArticulo" OnClick="btnComprar_Click" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
