using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Label = System.Web.UI.WebControls.Label;

namespace PGGames.Modelos
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        DataTable ds = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            Application["PP"] = "index.aspx";
            if (!IsPostBack)
            {
                if (Application["Tipo"] == null)
                {
                    Application["Tipo"] = "Invitado";
                }

                updateGV();

            }

            if (!Application["Tipo"].Equals("Invitado")) {

                mensaje.Visible = false;
            
            }
  
        }

        public void updateGV()
        {

            var sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT TOP 5 * FROM [dbo].[tbJuego] ORDER BY nJuego desc", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVindex.DataSource = ds;
            GVindex.DataBind();
            sqlCon.Close();

        }

        private void MessageBox(string msg)
        {
            msg = "'" + msg + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ")", true);
        }

        protected void btnRegistro_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("/Modulos/registro.aspx");
        }

        protected void imgGratis_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Modulos/catalogo.aspx");
        }
    }
}