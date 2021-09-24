using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modelos
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Application["PP"] = "login.aspx";
            Application["id_Usuario"] = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string mail = tbMail.Value.ToString().Trim();
            string pass = tbPassword.Value.ToString();
            var verPass = "";

            var sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);

            var sqlString = "SELECT Contraseña FROM [dbo].[tbUsuario] WHERE Correo = '" + mail + "';";

            var cmd = new SqlCommand(sqlString, sqlCon);

            sqlCon.Open();
            try
            {
                verPass = cmd.ExecuteScalar().ToString();
            }
            catch (System.Exception)
            {
                MessageBox("No existe Usuario");
                sqlCon.Close();
                return;
            }
            sqlCon.Close();

            if(pass == verPass)
            {
                sqlString = "SELECT Tipo FROM [dbo].[tbUsuario] WHERE Correo ='" + mail + "';";
                cmd = new SqlCommand(sqlString, sqlCon);
                sqlCon.Open();
                var tipo = cmd.ExecuteScalar().ToString();
                sqlCon.Close();
                if (tipo == "0") 
                {
                    Application["Tipo"] = "Administrador";
                }
                else
                {
                    Application["Tipo"] = "Cliente";
                }
                sqlString = "UPDATE [dbo].[tbUsuario] SET OlvidoCon = 'no' WHERE Correo = '" + mail + "';";
                cmd = new SqlCommand(sqlString, sqlCon);
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                sqlString = "SELECT id_Usuario FRom [dbo].[tbUsuario] WHERE Correo ='" + mail + "';";
                Application["id_Usuario"] = new SqlCommand(sqlString, sqlCon).ExecuteScalar().ToString();
                sqlCon.Close();
                Application["mail"] = tbMail.Value.ToString().Trim().ToLower();
                MessageBox("Bienvenido " + Application["Tipo"].ToString(), "/Modulos/index.aspx");
                }
            else
            {
                MessageBox("Contraseña Incorrecta");
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

        protected void olvidoContraseña(object sender, EventArgs e)
        {
            var mail = tbMail.Value.ToString();

            if (mail == "") {

                MessageBox("Por favor ingresar un correo en el campo email antes de solicitar cambio de contraseña");
                return;

            }

            var sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
            var sqlString = "SELECT Correo FROM [dbo].[tbUsuario] WHERE Correo = '" + mail + "';";
            var cmd = new SqlCommand(sqlString, sqlCon);
            sqlCon.Open();
            try
            {
                var user = cmd.ExecuteScalar().ToString();
            }
            catch (Exception)
            {
                sqlCon.Close();
                MessageBox("Usuario no encontrado");
                return;
            }
            sqlCon.Close();

            sqlString = "UPDATE [dbo].[tbUsuario] SET OlvidoCon = 'si' WHERE Correo = '" + mail + "';";
            cmd = new SqlCommand(sqlString, sqlCon);
            sqlCon.Open();
            cmd.ExecuteNonQuery();
            sqlCon.Close();

            MailMessage email = new MailMessage();
            email.To.Add(new MailAddress(mail));
            email.From = new MailAddress("martin.escobar.e14@gmail.com");
            email.Subject = "Asunto (" + DateTime.Now.ToString("dd / MM / yyy hh:mm:ss") + ")";
            email.Body = "<a href='https://localhost:44392/Modulos/Cambiar-Con.aspx'>Cambiar contraseña aquí</a>";
            email.IsBodyHtml = true;
            email.Priority = MailPriority.Normal;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("martin.escobar.e14@gmail.com", "13enero2002");

            try
            {
                smtp.Send(email);
                email.Dispose();
                MessageBox("Por favor revise la bandeja de entrada de su correo electrónico");
            }
            catch (Exception ex)
            {
                MessageBox("Error: " + ex);
            }
        }
    }
}