using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class DealOfTheDay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //String category = Request.QueryString["Category"];

            viewDresses();

        }
    }
    protected void DtLstDressess_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (Session["User_Id"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
        Label LblDressesName = (Label)e.Item.FindControl("lblDressesName");
        Image imgDresses = (Image)e.Item.FindControl("ImgBtnDressesImage");
        Session["Dresses_Id"] = imgDresses.AlternateText;
        Session["Dresses_Name"] = LblDressesName.Text;
        Response.Redirect("DressesDetails.aspx");
    }
    /***********************************************************************************************/
    /*****************************************View Dresses ****************************************/
    /***********************************************************************************************/
    protected void viewDresses()
    {
        try
        {

            SqlConnection Con = new SqlConnection();
            string ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            Con.ConnectionString = ConString;
            Con.Open();


            String SqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_DealOfTheDay = 'true' ; ";
            SqlCommand Cmd = new SqlCommand();

            Cmd.Connection = Con;
            Cmd.CommandText = SqlQuery;
            SqlDataReader dr = Cmd.ExecuteReader();
            DtLstDresses.DataSource = dr;
            DtLstDresses.DataBind();
            Con.Close();
        }

        catch (SqlException Se)
        {
            Response.Write("<script> alert ('Error!'" + Se.Message + ")</script>");
        }
    }

}