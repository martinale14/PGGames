using System;
using System.Collections;
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
    public partial class WebForm1 : System.Web.UI.Page
    {

        ArrayList carrito = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            Application["PP"] = "catalogo.aspx";

            if (!IsPostBack)
            {
                ViewState["Filtro"] = "";
                ViewState["Orden"] = "ORDER BY nJuego desc";

                GetData();

                if (Application["Carrito"] == null || Application["Carrito"].ToString().Equals("")) {

                    Application["Carrito"] = carrito;
                    lblCarrito.Text = carrito.Count.ToString();

                }
                else
                {
                    carrito = (ArrayList)Application["Carrito"];
                    lblCarrito.Text = carrito.Count.ToString();
                }
            }
            else
            {
                carrito = (ArrayList)Application["Carrito"];
                lblCarrito.Text = carrito.Count.ToString();
            }
        }

        private void GetData()
        {
            String CS = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
            using(SqlConnection con = new SqlConnection(CS))
            {
                string sqlComand = "SELECT * FROM [dbo].[tbJuego] ORDER BY nJuego desc";
                SqlDataAdapter da = new SqlDataAdapter(sqlComand, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
        }

        private void GetData(string orden, string condition)
        {
            String CS = ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                string sqlComand = "SELECT * FROM [dbo].[tbJuego] " + condition + orden;
                SqlDataAdapter da = new SqlDataAdapter(sqlComand, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
            }
        }

        protected void DataPagerProducts_PreRender(object sender, EventArgs e)
        {

                GetData(ViewState["Orden"].ToString(), ViewState["Filtro"].ToString());
            
        }

        private void MessageBox(string msg)
        {

            msg = "'" + msg + "'";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alerta", "showalert(" + msg + ")", true);
        }

        protected void Repeater1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (Application["Tipo"].ToString().Equals("Invitado"))
            {
                MessageBox("Por favor inicie sesión para poder realizar la compra");
                return;
            }

            carrito.Add(e.CommandName);

            Application["Carrito"] = carrito;
            lblCarrito.Text = carrito.Count.ToString();
        }

        protected void filtrar_Click(object sender, EventArgs e)
        {
            DataPagerProducts.SetPageProperties(0, DataPagerProducts.MaximumRows, true);
            ViewState["Orden"] = ddlOrden.Value.ToString();
        }

        protected void btBuscar_Click(object sender, ImageClickEventArgs e)
        {
            
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            DataPagerProducts.SetPageProperties(0, DataPagerProducts.MaximumRows, true);
            if (search.Value.Equals(""))
            {
                ViewState["Filtro"] = "";
            }
            else
            {
                ViewState["Filtro"] = "WHERE Nombre LIKE '%" + search.Value + "%' ";
            }
        }

        protected void Unnamed_ServerClick1(object sender, EventArgs e)
        {
            Response.Redirect("/Modulos/pagarCarrito.aspx");
        }
    }
}