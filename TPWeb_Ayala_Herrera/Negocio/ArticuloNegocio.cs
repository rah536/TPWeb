using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                //datos.setearConsulta("Select A.Id, A.Codigo, A.Nombre, A.Descripcion, A.ImagenUrl, A.Precio, C.Id, C.Descripcion, c.id, c.descripcion as CatDescripcion, M.Id, M.Descripcion as MarDescripcion from Articulos as A Inner Join CATEGORIAS as C On A.IdCategoria = C.Id Inner Join MARCAS as M On M.Id = C.Id");
                datos.setearConsulta("Select A.Id, A.Codigo, A.Nombre, A.Descripcion, A.ImagenUrl, A.Precio, A.IdCategoria as CatId, C.Descripcion as CatDescripcion, A.IdMarca as MarId, M.Descripcion as MarDescripcion from Articulos as A Inner Join CATEGORIAS as C On A.IdCategoria = C.Id Inner Join MARCAS as M On M.Id = C.Id");
                datos.ejecutarLectura();

                while(datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    //aux.Precio = (float)datos.Lector["Precio"];
                    aux.Precio = (float)Convert.ToDecimal(datos.Lector["Precio"]);

                    //por composicion hay que instanciar Marca aparte
                    //ya que al instanciar Articulo no se instancia ni Marca ni Categoria
                    
                    aux.CategoriaArticulo = new Categoria();
                    aux.CategoriaArticulo.Id = (int)datos.Lector["CatId"];
                    aux.CategoriaArticulo.Descripcion = (string)datos.Lector["CatDescripcion"];

                    aux.MarcaArticulo = new Marca();
                    aux.MarcaArticulo.Id = (int)datos.Lector["MarId"];
                    aux.MarcaArticulo.Descripcion = (string)datos.Lector["MarDescripcion"];
                    //aca lo mismo pero con categoria


                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }



            
        }
        public void modificar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
               
                datos.setearConsulta("update ARTICULOS set Codigo = @codigo, Nombre = @nombre, Descripcion = @descripcion, IdMarca = @idMarca, IdCategoria = @idCategoria, ImagenUrl = @imagen where Id = @id");
                datos.setearParametro("@codigo", articulo.Codigo);
                datos.setearParametro("@nombre", articulo.Nombre);
                datos.setearParametro("@descripcion", articulo.Descripcion);
                datos.setearParametro("@idMarca", articulo.MarcaArticulo.Id);
                datos.setearParametro("@idCategoria", articulo.CategoriaArticulo.Id);
                datos.setearParametro("@imagen", articulo.ImagenUrl);
                datos.setearParametro("@id", articulo.Id);


                datos.ejecutarAccion();
               

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

                datos.cerrarConexion();
            }

        }
        public void agregar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Insert into ARTICULOS(Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio, ImagenUrl) values('"+articulo.Codigo+"', '"+articulo.Nombre+"', '"+articulo.Descripcion+"', "+articulo.MarcaArticulo.Id+", "+articulo.CategoriaArticulo.Id+", "+articulo.Precio+", '"+articulo.ImagenUrl+"')");
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally 
            {
                datos.cerrarConexion();
            }
        }

        public void eliminar (int id)
        {

            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("delete from articulos where id =@id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
