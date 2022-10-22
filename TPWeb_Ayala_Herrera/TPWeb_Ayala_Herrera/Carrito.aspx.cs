using System;
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
        //public List<Articulo> ListaArticulo { get; set; }


        static public List<Articulo> ListaSeleccionada = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["ListaCarrito"] != null)
                {
                    List<Articulo> ListaSeleccionada = new List<Articulo>();
                    ListaSeleccionada = (List<Articulo>)Session["ListaCarrito"];

                    repArticulo.DataSource = ListaSeleccionada;
                    repArticulo.DataBind();
                    if (ListaSeleccionada.Count() == 0)
                    {
                        lblLista.Visible = true;
                    }
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

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            List<Articulo> ListaSeleccionada = new List<Articulo>();
            ListaSeleccionada = (List<Articulo>)Session["ListaCarrito"];

            foreach (Dominio.Articulo item in ListaSeleccionada)

            {
                if (item.Id.ToString() == id)
                {
                    ListaSeleccionada.Remove(item);
                    Session.Add("ListaCarrito", ListaSeleccionada);
                    Response.Redirect(Request.RawUrl);
                }

            }
            //Session.Add("ListaCarrito", ListaSeleccionada);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}