using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modulos
{
    public partial class WebForm2 : System.Web.UI.Page
   {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        DataTable ds = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Application["Tipo"].Equals("Invitado") || Application["Tipo"].Equals("Cliente"))
            {
                Response.Redirect("/Modulos/index.aspx");
            }

            if (!IsPostBack)
            {
                updateGV();
                ViewState["idUser"] = "";
            }

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            filtrar(search.Value.ToString());
        }

        protected void GVeliminar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString().Equals("Eliminar"))
            {

                Eliminar(e.CommandArgument.ToString());

            }

            if (e.CommandName.ToString().Equals("Modificar"))
            {

                tbNombre.Value = Select("SELECT Nombre FROM [dbo].[tbUsuario] WHERE id_Usuario = '" + e.CommandArgument + "';");
                tbApellido.Text = Select("SELECT Apellido FROM [dbo].[tbUsuario] WHERE id_Usuario = '" + e.CommandArgument + "';");
                tbCorreo.Text = Select("SELECT Correo FROM [dbo].[tbUsuario] WHERE id_Usuario = '" + e.CommandArgument + "';");
                tbTelefono.Text = Select("SELECT Telefono FROM [dbo].[tbUsuario] WHERE id_Usuario = '" + e.CommandArgument + "';");

                Page.ClientScript.RegisterStartupScript(this.GetType(), "modify", "modify();", true);

                ViewState["idUser"] = e.CommandArgument.ToString();
            }
        }

        private void Eliminar(string nJuego)
        {
            string delete = "DELETE FROM [dbo].[tbUsuario] WHERE id_Usuario = '" + nJuego + "';";
            SqlCommand comando = new SqlCommand(delete, sqlCon);
            sqlCon.Open();
            try
            {
                comando.ExecuteNonQuery();
                sqlCon.Close();
                MessageBox("Usuario Eliminado Satisfactoriamente");
                updateGV();
            }
            catch (Exception)
            {
                sqlCon.Close();
            }
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

        protected void GVeliminar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVeliminar.PageIndex = e.NewPageIndex;
            updateGV();
        }
        public void updateGV()
        {

            cmd = new SqlCommand("SELECT * FROM [dbo].[tbUsuario]", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVeliminar.DataSource = ds;
            GVeliminar.DataBind();
            sqlCon.Close();

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

        protected void btnAcUser_ServerClick(object sender, EventArgs e)
        {
            var sqlcon2 = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);

            var sqlString2 = "SELECT Correo FROM [dbo].[tbUsuario] WHERE Correo = '" + tbCorreo.Text + "';";
            var sqlString3 = "SELECT Correo FROM [dbo].[tbUsuario] WHERE id_Usuario = '" + ViewState["idUser"].ToString() + "';";

            var cmd2 = new SqlCommand(sqlString2, sqlcon2);
            var cmd3 = new SqlCommand(sqlString3, sqlcon2);

            sqlcon2.Open();
            try
            {
                string thing2 = cmd3.ExecuteScalar().ToString().ToLower();
                string thing = cmd2.ExecuteScalar().ToString().ToLower();
                sqlcon2.Close();
                if (thing.ToLower().Equals(thing2.ToLower()))
                {
                    string nombre = tbNombre.Value.ToString().ToLower();
                    string telefono = tbTelefono.Text.ToString().ToLower();
                    string correo = tbCorreo.Text.ToString().ToLower();
                    string apellido = tbApellido.Text.ToString().ToLower();

                    try
                    {
                        Otro("UPDATE [dbo].[tbUsuario] SET Nombre='" + nombre + "', Telefono='" + telefono + "', Correo='" + correo + "', Apellido='" + apellido + "' WHERE id_Usuario='" + ViewState["idUser"].ToString() + "';");
                        MessageBox("Usuario Actualizado correctamente");
                        updateGV();
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "modify", "modify();", true);
                    }
                    catch (Exception)
                    {
                        MessageBox("Algo ha salido mal");
                    }
                }
                else
                {
                    MessageBox("El Correo ya esta registrado");
                }

            }
            catch
            {
                sqlcon2.Close();
                string nombre = tbNombre.Value.ToString().ToLower();
                string telefono = tbTelefono.Text.ToString().ToLower();
                string correo = tbCorreo.Text.ToString().ToLower();
                string apellido = tbApellido.Text.ToString().ToLower();

                try
                {
                    Otro("UPDATE [dbo].[tbUsuario] SET Nombre='" + nombre + "', Telefono='" + telefono + "', Correo='" + correo + "', Apellido='" + apellido + "' WHERE id_Usuario='" + ViewState["idUser"].ToString() + "';");
                    MessageBox("Usuario Actualizado correctamente");
                    updateGV();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "modify", "modify();", true);
                }
                catch (Exception)
                {
                    MessageBox("Algo ha salido mal");
                }
            }
            
        }

        public void filtrar(string like)
        {
            cmd = new SqlCommand("SELECT * FROM [dbo].[tbUsuario] WHERE Nombre LIKE '%" + like + "%' OR Cedula LIKE '%" + like +"%' OR Correo LIKE '%" + like + "%';", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVeliminar.DataSource = ds;
            GVeliminar.DataBind();
            sqlCon.Close();
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

    }
}