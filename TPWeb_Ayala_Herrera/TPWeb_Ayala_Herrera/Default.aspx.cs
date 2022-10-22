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
    public partial class Default : System.Web.UI.Page
    {
        static public int i = 0;
        public List<Articulo> ListaArticulo { get; set; }

        static public List<Articulo> ListaSeleccionada = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            ListaArticulo = articuloNegocio.listar();
            //ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            //articuloNegocio.listar();
            if (!IsPostBack)
            {
                //ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                //ListaArticulo = articuloNegocio.listar();
                repArticulo.DataSource = ListaArticulo;
                repArticulo.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            lblFiltro.Visible = false;
            List<Articulo> listaFiltrada;

            if (txtFiltro.Text != "")
            {
                listaFiltrada = ListaArticulo.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()) || x.MarcaArticulo.Descripcion.ToUpper().Contains(txtFiltro.Text.ToUpper()) || x.Descripcion.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                ListaArticulo = listaFiltrada;
            }

            if (ListaArticulo.Count == 0)
            {
                //txtFiltro.Text = "No se han encontrado articulos";
                lblFiltro.Visible = true;
            }
            repArticulo.DataSource = ListaArticulo;
            repArticulo.DataBind();
        }

        protected void ibtnBorrarFiltro_Click(object sender, ImageClickEventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            ListaArticulo = articuloNegocio.listar();
            txtFiltro.Text = "";
            repArticulo.DataSource = ListaArticulo;
            repArticulo.DataBind();
            lblFiltro.Visible = false;
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            //List<Articulo> ListaSeleccionada = new List<Articulo>();

            foreach (Dominio.Articulo item in ListaArticulo)
            {
                if (item.Id.ToString() == id)
                {
                    ListaSeleccionada.Add(item);
                    Session.Add("ListaCarrito", ListaSeleccionada);
                }

            }
            //Session.Add("ListaCarrito", ListaSeleccionada);
            i = ListaSeleccionada.Count();
        }

        protected void btnCarrito_Click(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx", false);
        }
    }
}