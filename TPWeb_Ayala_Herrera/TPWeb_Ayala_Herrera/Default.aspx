﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Ayala_Herrera.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TPWeb_Carrito</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>TPWeb...En proceso</h1>
            <button type="button" class="btn btn-primary">Primary</button>
        </div>
        <hr />
        <div class="row row-cols-1 row-cols-md-3 g-4">

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
        </div>
    </form>
</body>
</html>