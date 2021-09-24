using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modulos
{
    public partial class cambiar_con : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCContraseña_Click(object sender, EventArgs e)
        {
            var mail = tbMail.Value.ToString();

            var sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);

            var sqlString = "SELECT OlvidoCon FROM [dbo].[tbUsuario] WHERE Correo = '" + mail + "';";

            var cmd = new SqlCommand(sqlString, sqlCon);

            var olvidada = "";

            sqlCon.Open();
            try
            {
                olvidada = cmd.ExecuteScalar().ToString();
            }catch (Exception)
            {
                MessageBox("Usuario no encontrado");
                sqlCon.Close();
                return;
            }
            sqlCon.Close();

            if(olvidada == "si") {

                var nContraseña = nPassword.Value.ToString();

                sqlString = "UPDATE [dbo].[tbUsuario] SET Contraseña = '" + nContraseña + "' WHERE Correo = '" + mail + "'";

                cmd = new SqlCommand(sqlString, sqlCon);

                sqlCon.Open();

                cmd.ExecuteNonQuery();

                sqlString = "UPDATE [dbo].[tbUsuario] SET OlvidoCon = 'no' WHERE Correo = '" + mail + "'";

                cmd = new SqlCommand(sqlString, sqlCon);

                cmd.ExecuteNonQuery();

                sqlCon.Close();

                MessageBox("Contraseña cambiada exitosamente");

                Response.Redirect("/Modulos/Login.aspx");

            }
            else
            {
                MessageBox("Error cambio de contraseña no solicitado");

                Response.Redirect("/Modulos/Login.aspx");
            }

        }

        private void MessageBox(string msg)
        {
            msg = "'" + msg + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ")", true);
        }


    }
}