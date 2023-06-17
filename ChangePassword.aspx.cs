using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User_Id"] == null)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }

    //**********************************************************************
    //                 CHANGE PASSWORD
    //**********************************************************************


    protected void Changepassword()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
            con.ConnectionString = conString;
            con.Open();


            String SqlQuery = "UPDATE User_MASTER SET User_Password=@User_Password WHERE User_Id=@User_Id;";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = SqlQuery;
            cmd.Connection = con;



            cmd.Parameters.AddWithValue("@user_password", SqlDbType.VarChar).Value = Txtnewpassword.Text;
            cmd.Parameters.AddWithValue("@User_Id", Session["User_Id"].ToString());

            cmd.ExecuteNonQuery();
            lblmessage.Text = "Successfully Changed Password...";
            con.Close();

        }
        catch (SqlException se)
        {
            lblmessage.Text = se.Message;
        }

    }
    protected void btnchange_Click(object sender, EventArgs e)
    {
        Changepassword();
    }
}