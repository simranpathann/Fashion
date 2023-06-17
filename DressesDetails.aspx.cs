using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class DressesDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Id"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
        if (!IsPostBack)
        {

            DdlDressesQuantity.Items.Add(new ListItem("Select Quantity", "0"));
            for (int i = 1; i <= 10; i++)
            {
                DdlDressesQuantity.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }

            viewRecoord();
            ViewModels();

            int stock = Convert.ToInt16(HfQuantity.Value);
            if (stock == 0)
            {
                Response.Write("<script>alert('Out of Stock !')</script>");
                DdlDressesQuantity.Enabled = false;
            }
        }
    }
    /************************************************/
    /***************To View Record***********/
    /************************************************/
    protected void viewRecoord()
    {
        try
        {
            SqlConnection Con = new SqlConnection();
            string ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            Con.ConnectionString = ConString;
            Con.Open();
            String url = "";
            String SqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_Id= @Dresses_Id";
            SqlCommand Cmd = new SqlCommand();
            Cmd.Parameters.Add("@Dresses_Id", SqlDbType.Int).Value = Session["Dresses_Id"].ToString();
            Cmd.CommandText = SqlQuery;
            Cmd.Connection = Con;
            SqlDataReader Dr = Cmd.ExecuteReader();


            while (Dr.Read())
            {
                TxtDressesName.Text = Dr["Dresses_Name"].ToString();

                TxtDressesBrand.Text = Dr["Dresses_Brand"].ToString();
                TxtDressesType.Text = Dr["Dresses_Type"].ToString();
                TxtDressesPrice.Text = Dr["Dresses_Brand"].ToString();
                TxtDressesDetails.Text = Dr["Dresses_Details"].ToString();
                TxtDressesMrp.Text = Dr["Dresses_MRP"].ToString();
                TxtDressesSellsPrice.Text = Dr["Dresses_SellsPrice"].ToString();
                TxtStock.Text = Dr["Dresses_Stock"].ToString();
                TxtDressesRating.Text = Dr["Dresses_Ratings"].ToString();
                HfQuantity.Value = Dr["Dresses_Stock"].ToString();
                TxtDressesCategory.Text = Dr["Dresses_Category"].ToString();

                url = Dr["Dresses_Image"].ToString();
                ImgPhoto.ImageUrl = url;
                Session["Dresses_Image"] = url;

            }
            double Mrp = Convert.ToDouble(TxtDressesMrp.Text);
            double SellsPrice = Convert.ToDouble(TxtDressesSellsPrice.Text);
            double YouSave = Mrp - SellsPrice;
            LblYouSave1.Text = YouSave.ToString();

            Con.Close();
        }
        catch (SqlException se)
        {
            LblMessage.Text = "View Record " + se.Message;
        }
    }

    /*********************** View Models******************/
    protected void ViewModels()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            String ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con.ConnectionString = ConString;
            con.Open();
            String sqlQuery = "SELECT * FROM Dresses_Master WHERE Dresses_Id=@Dresses_Id";
            SqlCommand cmd = new SqlCommand(sqlQuery);
            cmd.CommandText = sqlQuery;
            cmd.Connection = con;
            cmd.Parameters.Add("@Dresses_Id", SqlDbType.Int).Value = Session["Dresses_Id"].ToString();


            SqlDataReader dr = cmd.ExecuteReader();

            DtLstModel.DataSource = dr;
            DtLstModel.DataBind();


            con.Close();
        }
        catch (SqlException se)
        {
            Response.Write("<script> alert ('Error!'" + se.Message + ")</script>");


        }
    }

    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("DressesDetails.aspx");
    }




    /*****************************************/
    /**********Add to Cart*****************/
    /*****************************************/
    protected void AddToCart()
    {
        try
        {
            SqlConnection Con = new SqlConnection();
            string ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            Con.ConnectionString = ConString;
            Con.Open();


            String SqlQuery = "INSERT INTO Cart_Master(User_Id,Dresses_Id,Dresses_Name,Dresses_Image,Dresses_Quantity,Dresses_Price,Dresses_Total,Order_Date)VALUES(@User_Id,@Dresses_Id,@Dresses_Name,@Dresses_Image,@Dresses_Quantity,@Dresses_Price,@Dresses_Total,Order_Date)";
            SqlCommand Cmd = new SqlCommand();
            Cmd.Connection = Con;
            Cmd.CommandText = SqlQuery;
            Cmd.Parameters.Add("@User_Id", SqlDbType.Int).Value = Session["User_Id"].ToString();
            Cmd.Parameters.Add("@Dresses_Id", SqlDbType.Int).Value = Session["Dresses_Id"].ToString();
            Cmd.Parameters.Add("@Dresses_Name", SqlDbType.VarChar).Value = TxtDressesName.Text;
            Cmd.Parameters.Add("@Dresses_Image", SqlDbType.VarChar).Value = Session["Dresses_Image"].ToString();
            Cmd.Parameters.Add("@Dresses_Quantity", SqlDbType.Int).Value = DdlDressesQuantity.SelectedItem.ToString();
            Cmd.Parameters.Add("@Dresses_Price", SqlDbType.VarChar).Value = TxtDressesSellsPrice.Text;
            Cmd.Parameters.Add("@Dresses_Total", SqlDbType.VarChar).Value = LblSubTotalAmountValue.Text;
            Cmd.Parameters.Add("@Order_Date", SqlDbType.SmallDateTime).Value = DateTime.Today.Date.ToShortDateString();
            Cmd.ExecuteNonQuery();
            LblMessage.Text = "Succesfully Submitted Record";
        }
        catch (SqlException Se)
        {
            LblMessage.Text = "Submit Record" + Se.Message;
        }
    }

    public Boolean isPresent()
    {
        string ConString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection Con = new SqlConnection();
        Con = new SqlConnection(ConString);
        Con.Open();
        SqlCommand Cmd = Con.CreateCommand();
        Cmd.CommandText = "SELECT Count (*) FROM Cart_Master WHERE Dresses_Id=@Dresses_Id AND User_Id=@User_Id";
        Cmd.Parameters.Add("@User_Id", SqlDbType.Int).Value = Session["User_Id"].ToString();
        Cmd.Parameters.Add("@Dresses_Id", SqlDbType.Int).Value = Session["Dresses_Id"].ToString();
        int i = Int16.Parse(Cmd.ExecuteScalar().ToString());
        if (i > 0)
            return true;
        else
            return false;
    }

    protected void ImgbtnAddToCart_Click(object sender, ImageClickEventArgs e)
    {

        if (!isPresent())
        {
            AddToCart();
            Response.Redirect("Home.aspx");
        }
        else
        {
            Response.Write("<Script>alert/'This Dresses is Already Added !Plese Select Another Dresses'/</Script>");
        }

    }


    protected void DdlDressesQuantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        int Quantity = Convert.ToInt16(DdlDressesQuantity.SelectedItem.ToString());
        double SalesPrice = Convert.ToDouble(TxtDressesSellsPrice.Text);
        double SubTotal = Quantity * SalesPrice;
        LblSubTotalAmountValue.Text = SubTotal.ToString();
        Session["Quantity"] = Quantity;
        int stock = int.Parse(HfQuantity.Value);
        if (Quantity > stock)
        {
            Response.Write("<script>alert('Out of Stock !')</script>");
        }
        else
        {
            stock = stock - Quantity;
            TxtStock.Text = stock.ToString();
            Session["Stock"] = stock;

        }
    }
}