using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PGGames.Modulos
{
    public partial class verCompras : System.Web.UI.Page
    {

        DataTable ds = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                updateGV();
            }
        }

        public void updateGV()
        {

            var sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[tbFactura] WHERE id_Usuario='" + Application["id_Usuario"] + "'", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVfacturas.DataSource = ds;
            GVfacturas.DataBind();
            sqlCon.Close();

            for (int i = 0; i < GVfacturas.Rows.Count; i++)
            {

                ListView listDetalle = GVfacturas.Rows[i].Cells[1].FindControl("listDetalle") as ListView;
                Label lblidFac = GVfacturas.Rows[i].Cells[0].FindControl("lblidFactura") as Label;

                String CS = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sqlComand = "SELECT O.Nombre, O.Precio FROM tbDetalle D, tbJuego O WHERE D.id_Juego = O.id_Juego AND D.id_Factura = '" + lblidFac.Text + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sqlComand, con);
                    DataSet ds2 = new DataSet();
                    da.Fill(ds2);
                    listDetalle.DataSource = ds2;
                    listDetalle.DataBind();

                }


            }

        }

        protected void GVfacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVfacturas.PageIndex = e.NewPageIndex;
            updateGV();
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            var sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[tbFactura] WHERE id_Usuario='" + Application["id_Usuario"] + "' AND id_Factura LIKE '%" + search.Value.ToString() + "%'", sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVfacturas.DataSource = ds;
            GVfacturas.DataBind();
            sqlCon.Close();

            for (int i = 0; i < GVfacturas.Rows.Count; i++)
            {

                ListView listDetalle = GVfacturas.Rows[i].Cells[1].FindControl("listDetalle") as ListView;
                Label lblidFac = GVfacturas.Rows[i].Cells[0].FindControl("lblidFactura") as Label;

                String CS = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    string sqlComand = "SELECT O.Nombre, O.Precio FROM tbDetalle D, tbJuego O WHERE D.id_Juego = O.id_Juego AND D.id_Factura = '" + lblidFac.Text + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sqlComand, con);
                    DataSet ds2 = new DataSet();
                    da.Fill(ds2);
                    listDetalle.DataSource = ds2;
                    listDetalle.DataBind();

                }


            }
        }
    }
}