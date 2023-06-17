using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewDresses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            String category = Request.QueryString["Category"];

            viewDresses(category);

        }
    }
    /***********************************************************************************************/
    /*****************************************View Dresses ****************************************/
    /***********************************************************************************************/
    protected void viewDresses(String category)
    {
        try
        {

            SqlConnection Con = new SqlConnection();
            string ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            Con.ConnectionString = ConString;
            Con.Open();
            string SqlQuery = "";
            if (category.Equals("Female") || category.Equals("Male") || category.Equals("Kids"))
                SqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_Gender = @Dresses_Category; ";

             else if (category.Equals("Georgette") || category.Equals("Cotton") || category.Equals("Polyster") || category.Equals("Silk") || category.Equals("Leather") || category.Equals("Jeans"))
               SqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_Type = @Dresses_Category; ";

           else if (category.Equals("All"))
               SqlQuery = "SELECT * FROM Dresses_Master";

             if (category.Equals("ZARA") || category.Equals("BIBA") || category.Equals("Roadster") || category.Equals("PUMA"))
                SqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_Brand = @Dresses_Category; ";
            else
                SqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_Category = @Dresses_Category; ";

            SqlCommand Cmd = new SqlCommand();
            Cmd.Parameters.AddWithValue("@Dresses_Category", category);
            Cmd.Connection = Con;
            Cmd.CommandText = SqlQuery;
            SqlDataReader dr = Cmd.ExecuteReader();

            DtLstDresses.DataSource = dr;
            DtLstDresses.DataBind();
            if (dr.HasRows)
            {
                PnlNoProductFound.Visible = false;
            }
            else
            {
                PnlNoProductFound.Visible = true;
            }
            Con.Close();
        }

        catch (SqlException Se)
        {
            lblmessage.Text = Se.Message;   
           // Response.Write("<script> alert ('Error!'" + Se.Message + ")</script>");
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

            Label LblPrice = (Label)e.Item.FindControl("lblDressessellsPrice");
            Session["Dresses_Price"] = LblPrice.Text;

            if (!IsPresent())
            {
                SubmitCart();
                Response.Redirect("~/Home.aspx");
            }
            else
            {
                //LblMessage.Text = "Dresses Already Added";
                Response.Write("<script> alert ('this Dresses already added ! please select another Dresses.')</script>");
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
        else if ((string)e.CommandArgument == ("BuyNow"))
        {
            if (Session["User_Id"] == null)
            {
                Response.Redirect("UserLogin.aspx");
            }
            Label LblDressesName = (Label)e.Item.FindControl("lblDressesName");
            Session["Dresses_Name"] = LblDressesName.Text;
            Label LblDressesPrice = (Label)e.Item.FindControl("lblDressesPrice");
            Session["Amount_Value"] = LblDressesPrice.Text;
            Response.Redirect("Payment.aspx");
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
               //lblmessage.Text = se.Message;
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
    
}
