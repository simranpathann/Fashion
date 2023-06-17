using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewCategory();
            ViewBrand();
            viewDresses();
        }
    }
    protected void DtLstProducts_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    /*********************** View Category******************/
    protected void ViewCategory()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            String ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.ConnectionString = ConString;
            con.Open();
            String sqlQuery = "SELECT * FROM Category_Master";
            SqlCommand cmd = new SqlCommand(sqlQuery);
            cmd.CommandText = sqlQuery;
            cmd.Connection = con;


            SqlDataReader dr = cmd.ExecuteReader();

            DtLstCategory.DataSource = dr;
            DtLstCategory.DataBind();


            con.Close();
        }
        catch (SqlException se)
        {
            Lblmessage.Text = se.Message;


        }
    }
    /*********************** View Brand*****************/
    protected void ViewBrand()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            String ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.ConnectionString = ConString;
            con.Open();
            String sqlQuery = "SELECT * FROM Brand";
            SqlCommand cmd = new SqlCommand(sqlQuery);
            cmd.CommandText = sqlQuery;
            cmd.Connection = con;


            SqlDataReader dr = cmd.ExecuteReader();

            DtLstBrand.DataSource = dr;
            DtLstBrand.DataBind();


            con.Close();
        }
        catch (SqlException se)
        {
            Lblmessage.Text = se.Message;


        }
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
            string SqlQuery = " SELECT * FROM Dresses_Master ";
            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = Con;
            Cmd.CommandText = SqlQuery;
            SqlDataReader dr = Cmd.ExecuteReader();
            DtLstDresses.DataSource = dr;
            DtLstDresses.DataBind();
            Con.Close();
        }

        catch (SqlException se)
        {
            Lblmessage.Text = se.Message;

        }
    }
    protected void DtLstDressess_ItemCommand(object source, DataListCommandEventArgs e)
    {
        ImageButton ib = (ImageButton)e.Item.FindControl("ImgBtnAddToCart");
        string Dresses_Id = ib.AlternateText;
        Session["Dresses_Id"] = Dresses_Id;
        ImageButton ibd = (ImageButton)e.Item.FindControl("ImgBtnDetails");

        if ((string)e.CommandArgument == ("AddToCart"))
        {

            if (Session["User_Id"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
            Label LblDressesName = (Label)e.Item.FindControl("lblDressesName");
            Session["Dresses_Name"] = LblDressesName.Text;

            Image ImgDressesImage = (Image)e.Item.FindControl("ImgBtnDressesImage");
            Session["Dresses_Image"] = ImgDressesImage.ImageUrl;

            Label LblPrice1 = (Label)e.Item.FindControl("lblDressesoldPrice");
            Session["Dresses_Price"] = LblPrice1.Text;

            Label LblPrice = (Label)e.Item.FindControl("lblDressessellsPrice");
            Session["Dresses_Price"] = LblPrice.Text;

            if (!IsPresent())
            {
                SubmitCart();
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                Lblmessage.Text = "Dresses Already Added";
                //Response.Write("<script> alert ('this Dresses already added ! please select another Dresses.')</script>");
            }
        }
        else if ((string)e.CommandArgument == ("ViewDressesDetails"))
        {
            if (Session["User_Id"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
            Label LblDressesName = (Label)e.Item.FindControl("lblDressesName");
            Session["Dresses_Name"] = LblDressesName.Text;
            Response.Redirect("DressesDetails.aspx");
        }

    }
    public bool IsPresent()
    {
        try
        {
            String ConString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConString);
            Con.Open();
            SqlCommand cmd = Con.CreateCommand();
            cmd.CommandText = "SELECT COUNT(*) as cnt FROM Cart_Master WHERE Dresses_Id=@Dresses_Id AND User_Id=@User_Id";
            cmd.Parameters.Add("@User_Id", SqlDbType.Int).Value = Session["User_Id"].ToString();
            cmd.Parameters.Add("@Dresses_Id ", SqlDbType.Int).Value = Session["Dresses_Id"].ToString();
            int i = Int16.Parse(cmd.ExecuteScalar().ToString());

            if (i > 0)
                return true;
            else
                return false;
        }
        catch (SqlException se)
        {
            //   LblMessage.Text = se.Message;
            return false;
        }
    }
    /**************************************************************************************************************/
    /***************************************Submit Cart************************************************************/
    /**************************************************************************************************************/
    protected void SubmitCart()
    {
        try
        {
            SqlConnection Con = new SqlConnection();
            String ConString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
            Con.ConnectionString = ConString;
            Con.Open();
            String SqlQuery = "INSERT INTO Cart_Master(User_Id,Dresses_Id,Dresses_Name,Dresses_Image,Dresses_Quantity,Dresses_Price,Dresses_Total,Order_Date)VALUES" +
                "(@User_Id,@Dresses_Id,@Dresses_Name,@Dresses_Image,@Dresses_Quantity,@Dresses_Price,@Dresses_Total,@Order_Date)";
            SqlCommand Cmd = new SqlCommand();
            Cmd.CommandText = SqlQuery;
            Cmd.Connection = Con;
            Cmd.Parameters.Add("@User_Id", SqlDbType.Int).Value = Session["User_Id"].ToString();
            Cmd.Parameters.Add("@Dresses_Id", SqlDbType.Int).Value = Session["Dresses_Id"].ToString();
            Cmd.Parameters.Add("@Dresses_Name", SqlDbType.VarChar).Value = Session["Dresses_Name"].ToString();
            Cmd.Parameters.Add("@Dresses_Image", SqlDbType.VarChar).Value = Session["Dresses_Image"].ToString();
            Cmd.Parameters.Add("@Dresses_Quantity", SqlDbType.Int).Value = "1";
            Cmd.Parameters.Add("@Dresses_Price", SqlDbType.Float).Value = Session["Dresses_Price"].ToString();
            Cmd.Parameters.Add("@Dresses_Total", SqlDbType.Float).Value = Session["Dresses_Price"].ToString();
            Cmd.Parameters.Add("@Order_Date", SqlDbType.SmallDateTime).Value = DateTime.Today.Date.ToShortDateString();

            Cmd.ExecuteNonQuery();

            Con.Close();
            Response.Redirect("Home.aspx");
        }
        catch (SqlException Se)
        {
            // LblMessage.Text = Se.Message;
        }
    }
    protected void DtLstCategory_ItemCommand(object source, DataListCommandEventArgs e)
    {

        Label LblCategoryName = (Label)e.Item.FindControl("lblCategoryName");
        Session["Category_Name"] = LblCategoryName.Text;
        Response.Redirect("~/ViewDresses.aspx?category=" + LblCategoryName.Text);

    }

    protected void DtLstBrand_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label LblBrandName = (Label)e.Item.FindControl("lblBrandName");
        Session["Brand_Name"] = LblBrandName.Text;
        Response.Redirect("~/ViewDresses.aspx?category=" + LblBrandName.Text);

    }


   
}
