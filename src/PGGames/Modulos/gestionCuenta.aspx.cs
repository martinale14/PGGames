using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modulos
{
    public partial class gestionCuenta : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Nombre = "SELECT Nombre FROM [dbo].[tbUsuario] WHERE Correo ='" + Application["mail"].ToString() + "';";
                string Apellido = "SELECT Apellido FROM [dbo].[tbUsuario] WHERE Correo ='" + Application["mail"].ToString() + "';";
                string Telefono = "SELECT Telefono FROM [dbo].[tbUsuario] WHERE Correo ='" + Application["mail"].ToString() + "';";
                string Correo = "SELECT Correo FROM [dbo].[tbUsuario] WHERE Correo ='" + Application["mail"].ToString() + "';";

                tbNombre.Value = Select(Nombre);
                tbApellido.Value = Select(Apellido);
                tbTelefono.Value = Select(Telefono);
                tbCorreo.Value = Select(Correo);

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
            catch (Exception){

                sqlCon.Close();
            
            }

            return data;
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

        private void MessageBox(string msg)
        {

            msg = "'" + msg + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ")", true);
        }

        private void MessageBox(string msg, string url)
        {

            msg = "'" + msg + "'";
            url = "'" + url + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ");", true);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Asignar", "asigURL(" + url + ");", true);


        }

        protected void btnAcPerfil_ServerClick(object sender, EventArgs e)
        {
            string Nombre = tbNombre.Value;
            string Apellido = tbApellido.Value;
            string Telefono = tbTelefono.Value;
            string Correo = tbCorreo.Value.ToLower();

            string comprobar = "SELECT Correo FROM [dbo].[tbUsuario] WHERE Correo='" + Correo + "';";
            SqlCommand comando = new SqlCommand(comprobar, sqlCon);

            if (!(Correo.Equals(Application["mail"].ToString().ToLower())))
            {
                sqlCon.Open();
                try
                {
                    string falso = comando.ExecuteScalar().ToString();
                    sqlCon.Close();
                    MessageBox("Correo ya registrado");
                }
                catch (Exception)
                {
                    sqlCon.Close();
                    Otro("Update [dbo].[tbUsuario] SET Nombre='" + Nombre + "', Apellido='" + Apellido + "', Telefono='" + Telefono + "', Correo='" + Correo + "' WHERE Correo ='" + Application["mail"].ToString() + "';");

                    Application["mail"] = Correo;

                    MessageBox("Cuenta Actualizada Satisfactoriamente");
                }
            }
            else
            {
                Otro("Update [dbo].[tbUsuario] SET Nombre='" + Nombre + "', Apellido='" + Apellido + "', Telefono='" + Telefono + "', Correo='" + Correo + "' WHERE Correo ='" + Application["mail"].ToString() + "';");

                Application["mail"] = Correo;

                MessageBox("Cuenta Actualizada Satisfactoriamente");
            }

           
        }

        protected void btnAcContra_ServerClick(object sender, EventArgs e)
        {
            string viejaCon = tbOContraseña.Value;

            sqlCon.Open();
            try
            {
                string viejaConVer = new SqlCommand("SELECT Contraseña FROM [dbo].[tbUsuario] WHERE Correo='" + Application["mail"].ToString().ToLower() + "';",sqlCon).ExecuteScalar().ToString();
                sqlCon.Close();
                if (viejaCon.Equals(viejaConVer))
                {
                    string upCon = "UPDATE [dbo].[tbUsuario] SET Contraseña='" + tbNContraseña.Value + "' WHERE Correo='" + Application["mail"].ToString() + "';";
                    Otro(upCon);
                    MessageBox("Contraseña Actualizada Correctamente");
                }
                
                else
                {
                    MessageBox("La contraseña Actual es incorrecta");
                }

            }
            catch (Exception)
            {
                sqlCon.Close();
                MessageBox("Error");
            }
        }
    }
}