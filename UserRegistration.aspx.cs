using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            FillddlCity();
        }
    }
  
    //***********************************************************************
    // Submit Records of user
    //*********************************************************************
    protected void SubmitRecord()
    {

        try
        {

            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
            con.ConnectionString = conString;
            con.Open();
            String SqlQuery = "INSERT INTO User_MASTER(user_name,user_address,user_email,user_city,user_password,user_pin,user_mobile,Created_Date) VALUES (@user_name,@user_address,@user_email,@user_city,@user_password,@user_pin,@user_mobile,@Created_Date);";
           
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = SqlQuery;
            cmd.Connection = con;
            cmd.Parameters.Add("@user_name", SqlDbType.VarChar).Value = txtname.Text;
            cmd.Parameters.Add("@user_address", SqlDbType.VarChar).Value = txtaddress.Text;
            cmd.Parameters.Add("@user_email", SqlDbType.VarChar).Value = txtemail.Text;
            cmd.Parameters.Add("@user_city", SqlDbType.VarChar).Value = ddl.Text;
            cmd.Parameters.Add("@user_pin", SqlDbType.VarChar).Value = txtpin.Text;
            cmd.Parameters.Add("@user_password", SqlDbType.VarChar).Value = txtpassword.Text;
            cmd.Parameters.Add("@user_mobile", SqlDbType.VarChar).Value = txtmobile.Text;
            cmd.Parameters.Add("@Created_date", SqlDbType.SmallDateTime).Value = DateTime.Now.ToShortDateString();

            cmd.ExecuteNonQuery();
            lblmessage.Text = "Successfully Submitted...";
            con.Close();



        }
        catch (SqlException se)
        {
            lblmessage.Text = se.Message;

        }
    }
    
     //****************************************************************************************************
    /////Fill DDLCity
    //****************************************************************************************************
    public void FillddlCity()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
            con.ConnectionString = conString;
            con.Open();
            String SqlQuery = "SELECT * FROM City_Master ORDER BY City_Name";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = SqlQuery;

            SqlDataReader Dr = cmd.ExecuteReader();
            ddl.Items.Add(new ListItem("--SELECT--", "0"));
            while (Dr.Read())
            {
                ddl.Items.Add(new ListItem(Dr[1].ToString(), Dr[0].ToString()));
            }

            con.Close();

        }catch (SqlException se)
        {
            lblmessage.Text = se.Message;
        }

    }

    //*******************************************************************************************
    //Get Pincode
    //*******************************************************************************************
    public void getPincode()
    {
        try
        {
            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
            con.ConnectionString = conString;
            con.Open();
            String sqlQuery = "SELECT * FROM City_Master where City_Id=@City_Id ;";

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = sqlQuery;

            cmd.Parameters.Add("@City_Id", SqlDbType.Int).Value = ddl.SelectedValue.ToString();
            SqlDataReader Dr = cmd.ExecuteReader();

            while (Dr.Read())
            {
                txtpin.Text = Dr["City_Pincode"].ToString();      
            }


            con.Close();
        }

        catch (SqlException se)
        {

            lblmessage.Text = se.Message;
        }


    }



    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SubmitRecord();
    }


    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        getPincode();
    }
    
}