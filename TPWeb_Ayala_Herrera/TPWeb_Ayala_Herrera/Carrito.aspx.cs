﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPWeb_Ayala_Herrera
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ListaCarrito"] != null)
                {
                    List<Articulo> ListaSeleccionada = new List<Articulo>();
                    //Articulo ListaSeleccionada = new Articulo();
                    ListaSeleccionada = (List<Articulo>)Session["ListaCarrito"];
                    //ListaSeleccionada = (Articulo)Session["ListaCarrito"];
                    gvCarrito.DataSource = ListaSeleccionada;
                    gvCarrito.DataBind();

                    repArticulo.DataSource = ListaSeleccionada;
                    repArticulo.DataBind();
                }
                /*
                ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                ListaArticulo = articuloNegocio.listar();
                //ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                //articuloNegocio.listar();
                if (!IsPostBack)
                {
                    //ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                    //ListaArticulo = articuloNegocio.listar();
                    repArticulo.DataSource = ListaSleccionada;
                    repArticulo.DataBind();
                }*/
            }
        }
        
    }
}