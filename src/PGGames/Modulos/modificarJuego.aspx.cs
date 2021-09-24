using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Diagnostics;
using System.Drawing;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace PGGames.Modulos
{
    public partial class modificarJuego : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        DataTable ds = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["Tipo"].Equals("Invitado") || Application["Tipo"].Equals("Cliente"))
            {
                Response.Redirect("/Modulos/index.aspx");
            }

            if (!IsPostBack)
            {
                updateGV();
                ViewState["nJuego"] = "";
            }

        }

        public void updateGV()
        {

            cmd = new SqlCommand("SELECT * FROM tbJuego ORDER BY nJuego desc", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVeliminar.DataSource = ds;
            GVeliminar.DataBind();
            sqlCon.Close();

        }

        public void filtrar(string like)
        {
            cmd = new SqlCommand("SELECT * FROM tbJuego WHERE Nombre LIKE '%" + like + "%' ORDER BY nJuego desc", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVeliminar.DataSource = ds;
            GVeliminar.DataBind();
            sqlCon.Close();
        }

        protected void GVeliminar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVeliminar.PageIndex = e.NewPageIndex;
            updateGV();
        }

        protected void GVeliminar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString().Equals("Eliminar"))
            {

                Eliminar(e.CommandArgument.ToString());

            }

            if (e.CommandName.ToString().Equals("Modificar"))
            {

                tbNombre.Value = Select("SELECT Nombre FROM [dbo].[tbJuego] WHERE nJuego = '" + e.CommandArgument + "';");
                tbPrecio.Text = Select("SELECT Precio FROM [dbo].[tbJuego] WHERE nJuego = '" + e.CommandArgument + "';");
                ddlEstado.Value = Select("SELECT Estado_Lanzamiento FROM [dbo].[tbJuego] WHERE nJuego = '" + e.CommandArgument + "';");
                ddlGenero.Value = Select("SELECT Genero FROM [dbo].[tbJuego] WHERE nJuego = '" + e.CommandArgument + "';");

                Page.ClientScript.RegisterStartupScript(this.GetType(), "modify", "modify();", true);

                ViewState["nJuego"] = e.CommandArgument.ToString();
            }
        }

        private void Eliminar(string nJuego)
        {
            string delete = "DELETE FROM [dbo].[tbJuego] WHERE nJuego = '" + nJuego + "';";
            SqlCommand comando = new SqlCommand(delete, sqlCon);
            sqlCon.Open();
            try
            {
                comando.ExecuteNonQuery();
                sqlCon.Close();
                MessageBox("Juego Eliminado Satisfactoriamente");
                updateGV();
            }
            catch (Exception)
            {
                sqlCon.Close();
            }
        }

        private void MessageBox(string msg)
        {
            msg = "'" + msg + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ");", true);
        }

        private void MessageBox(string msg, string url)
        {

            msg = "'" + msg + "'";
            url = "'" + url + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ");", true);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Asignar", "asigURL(" + url + ");", true);

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            filtrar(search.Value.ToString());
        }

        private String Select(string comandSql)
        {
            string data = "";
            cmd = new SqlCommand(comandSql, sqlCon);

            sqlCon.Open();
            try
            {
                data = cmd.ExecuteScalar().ToString();
                sqlCon.Close();
            }
            catch (Exception)
            {

                sqlCon.Close();

            }

            return data;
        }

        protected void btnAcJuego_ServerClick(object sender, EventArgs e)
        {
            if (tbPrecio.Text.Equals("") || ddlEstado.Value.ToString().Equals("") || ddlGenero.Value.Equals(""))
            {
                MessageBox("El precio no puede estar vacio");
            }
            else
            {
                string genero = ddlGenero.Value.ToString();
                string estado = ddlEstado.Value.ToString();
                string precio = tbPrecio.Text.Replace(',', '.');
                string Nombre = tbNombre.Value.ToString();

                update(Nombre, precio, estado, genero);
            }
        }

        private void update(string nombre, string precio, string estado, string genero)
        {

            string upCon = "UPDATE [dbo].[tbJuego] SET Nombre='" + nombre + "', Genero='" + genero + "', Estado_Lanzamiento='" + estado + "', Precio='" + precio + "' WHERE nJuego='" + ViewState["nJuego"].ToString() + "';";
            Otro(upCon);
            MessageBox("Juego Actualizado Correctamente");
            updateGV();

            MessageBox("Error aqui");

        }

        private void Otro(string comandSql)
        {
            cmd = new SqlCommand(comandSql, sqlCon);

            sqlCon.Open();
            try
            {
                cmd.ExecuteNonQuery();
                sqlCon.Close();
            }
            catch (Exception)
            {
                sqlCon.Close();
                MessageBox("Error");
            }

        }

        protected void btnAgregar_ServerClick(object sender, EventArgs e)
        {
            if (img.HasFile)
            {

                string ext = System.IO.Path.GetExtension(img.FileName);
                ext = ext.ToLower();

                if (ext.Equals(".png") || ext.Equals(".jpg"))
                {

                    img.SaveAs(Server.MapPath("/Assets/imgs/Catalogo/" + img.FileName)); ;
                    string imgUrl = "/Assets/imgs/Catalogo/" + img.FileName;
                    string nomJuego = tbNombreJuego.Value;
                    string genero = ddlGeneroJuego.Value;
                    string estado = ddlEstadoJuego.Value;
                    string precio = tbPrecioJuego.Text.Replace(',','.');

                    string Sql = "INSERT INTO [dbo].[tbJuego] VALUES (NEWID(), '" + nomJuego + "','" + genero + "','" + precio + "','" + estado + "','" + imgUrl + "');";
                    Otro(Sql);

                    MessageBox("Juego Agregado Correctamente");

                    updateGV();
                }
                else
                {
                    MessageBox("Formato de imagen no valido Solo .jpg o .png");
                }
            }
            else
            {
                MessageBox("Por Favor suba un archivo");
            }
        }
    }
}
