using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modelos
{
    public partial class principal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["Tipo"] != null) {

                if (Application["Tipo"].ToString().Equals("Invitado")) {

                    acount.Visible = false;
                    CompReal.Visible = false;
                    AdminUser.Visible = false;
                    RegClient.Visible = false;
                    moGame.Visible = false;
                    Close.Visible = false;

                }else if (Application["Tipo"].ToString().Equals("Cliente")) {

                    login.Visible = false;
                    AdminUser.Visible = false;
                    RegClient.Visible = false;
                    moGame.Visible = false;

                }
                else if (Application["Tipo"].ToString().Equals("Administrador"))
                {
                    login.Visible = false;
                }

            }

        }

        protected void ImageButtonLogo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Modulos/index.aspx");
        }

        protected void CerrarSesion(object sender, EventArgs e)
        {
            Application["Tipo"] = "Invitado";
            Application["Carrito"] = "";
            MessageBox("Sesión <strong>Cerrada</strong> correctamente", "/Modulos/index.aspx");
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

        
    }
}