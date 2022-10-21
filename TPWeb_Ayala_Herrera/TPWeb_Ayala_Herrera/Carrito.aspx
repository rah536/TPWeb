<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPWeb_Ayala_Herrera.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Carrito de Compras</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>CARRITO</h1>
            <asp:GridView ID="gvCarrito" runat="server" CssClass="table"></asp:GridView>

               <div class="row row-cols-1 row-cols-md-3 g-4">

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
                               
                                    <asp:Button ID="btnEliminar"  CssClass="btn btn-primary" runat="server" Text="Eliminar" CommandArgument='<%#Eval("Id")%>' CommandName="IdArticulo" OnClick="btnEliminar_Click" />
                                    

                                    </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
        </div>
    </form>
</body>
</html>
