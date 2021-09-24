using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modulos
{
    public partial class registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Application["Tipo"] != null) {

                if (Application["Tipo"].ToString().Equals("Invitado")) {

                    if (esconder.Visible == true)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "hide", "hide();", true);
                        esconder.Visible = false;
                    }
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "resize", "resize();", true);

                }
            
            }
        }

        protected void BtnRegistrar(object sender, EventArgs e)
        {

            string nombre = tbNombre.Value.ToString();
            string apellido = tbApellido.Value.ToString();
            string cedula = tbCedula.Value.ToString();
            string correo = tbCorreo.Value.ToString().ToLower();
            string contraseña = tbContraseña.Value.ToString();
            string tipo = "1";
            string telefono = tbTelefono.Value.ToString();

            if(Application["Tipo"] != null)
            {
                if (Application["Tipo"].ToString().Equals("Administrador"))
                {

                    tipo = ddlTipo.Value.ToString();
                    
                }
            }

            var sqlcon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);

            var sqlString = "SELECT Correo FROM [dbo].[tbUsuario] WHERE Correo = '" + correo + "';";

            var cmd = new SqlCommand(sqlString, sqlcon);

            sqlcon.Open();

            try
            {

                string prueba = cmd.ExecuteScalar().ToString().ToLower();
                if (prueba.Equals(correo.ToLower()))
                {
                    sqlcon.Close();
                    MessageBox("Email ya registrado");
                    return;
                }
            }
            catch (Exception)
            {

                sqlcon.Close();
                sqlString = "INSERT INTO [dbo].[tbUsuario] VALUES (NEWID(),'" + nombre + "','" + apellido + "','" + cedula + "','" + correo + "','" + telefono + "','" + tipo + "','" + contraseña + "', 'no');";
                cmd = new SqlCommand(sqlString, sqlcon);
                sqlcon.Open();

                try
                {
                    cmd.ExecuteNonQuery();
                    sqlcon.Close();
                    if (Application["Tipo"].ToString().Equals("Administrador")) 
                    {
                        MessageBox("Su cuenta <strong>PG GAMES</strong> ha sido creada satisfactoriamente", "/Modulos/" + Application["PP"].ToString());
                    }
                    else if (Application["Tipo"].ToString().Equals("Invitado"))
                    {
                        MessageBox("Su cuenta <strong>PG GAMES</strong> ha sido creada satisfactoriamente", Application["PP"].ToString());
                    }
                    
                }
                catch (Exception)
                {
                    sqlcon.Close();
                    MessageBox("Hubo un error");
                }

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


    }
}