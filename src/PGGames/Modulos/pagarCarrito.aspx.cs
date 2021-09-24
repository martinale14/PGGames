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
    public partial class pagarCarrito : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["conexionBD"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        DataTable ds = new DataTable();

        ArrayList carrito = new ArrayList();
        string[] car;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["Tipo"].Equals("Invitado"))
            {
                Response.Redirect("/Modulos/Login.aspx");
            }
           
            carrito = (ArrayList)Application["Carrito"];
            car = (string[])carrito.ToArray(typeof(string));

            if (!IsPostBack && car.Length != 0)
            {

                
                updateGV();

            }

            if (car.Length == 0)
            {
                MessageBox("No se han seleccionado artículos", "/Modulos/catalogo.aspx");
            }
        }

        public void updateGV()
        {
            string str = "SELECT * FROM [dbo].[tbJuego] WHERE";
            for (int i = 0; i < car.Length; i++)
            {

                if (i == 0)
                {
                    str = str + " nJuego='" + car[i] + "'";
                }
                else
                {
                    str = str + " OR nJuego = '" + car[i] + "'";
                }

                if (i == (car.Length - 1))
                {
                    str = str + " OR nJuego = '" + car[i] + "';";
                }
            }
            cmd = new SqlCommand(str, sqlCon);
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

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            string str = "SELECT * FROM [dbo].[tbJuego] WHERE";
            for (int i = 0; i < car.Length; i++)
            {

                if (i == 0)
                {
                    str = str + "( nJuego='" + car[i] + "'";
                }
                else
                {
                    str = str + " OR nJuego = '" + car[i] + "'";
                }

                if (i == (car.Length - 1))
                {
                    str = str + " OR nJuego = '" + car[i] + "') AND Nombre LIKE '%" + search.Value.ToString() + "%';";
                }
            }
            cmd = new SqlCommand(str, sqlCon);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            ad.Fill(ds);
            GVeliminar.DataSource = ds;
            GVeliminar.DataBind();
            sqlCon.Close();
        }

        protected void GVeliminar_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            updateGV();
        }

        protected void GVeliminar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string nJuego = e.CommandArgument.ToString();
            carrito.Remove(nJuego);
            car = (string[])carrito.ToArray(typeof(string));
            if (car.Length == 0)
            {
                Response.Redirect("/Modulos/catalogo.aspx");
            }
            updateGV();
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if (car.Length == 0)
            {
                MessageBox("No se han seleccionado artículos");
                return;
            }
            string today = DateTime.Today.ToString("dd/MM/yyyy");
            string sqlString= "INSERT INTO [dbo].[tbFactura] VALUES ('" + Application["id_Usuario"] + "','" + today + "');";
            cmd = new SqlCommand(sqlString, sqlCon);
            string seleccionarFac = "SELECT TOP 1 id_Factura FROM [dbo].[tbFactura] WHERE id_Usuario='" + Application["id_Usuario"] + "' ORDER BY id_Factura desc;";
            string fac = "";
            sqlCon.Open();
            cmd.ExecuteNonQuery();
            fac = new SqlCommand(seleccionarFac, sqlCon).ExecuteScalar().ToString();
            sqlCon.Close();
            for (int i = 0; i < car.Length; i++)
            {
                sqlCon.Open();
                string id_Juego = new SqlCommand("SELECT id_Juego FROM [dbo].[tbJuego] WHERE nJuego = '" + car[i] + "';", sqlCon).ExecuteScalar().ToString();
                string precio = new SqlCommand("SELECT Precio FROM [dbo].[tbJuego] WHERE nJuego = '" + car[i] + "';", sqlCon).ExecuteScalar().ToString(); ;
                string insertarDet = "INSERT INTO [dbo].[tbDetalle] VALUES (NEWID(), '" + fac + "','" + id_Juego + "','" + precio + "');";
                new SqlCommand(insertarDet, sqlCon).ExecuteNonQuery();
                sqlCon.Close();
            }
            Application["Carrito"] = new ArrayList();
            car = (string[])carrito.ToArray(typeof(string));
            updateGV();
            MessageBox("Su compra fue realizada con exito", "/Modulos/Catalogo.aspx");

        }
    }
}