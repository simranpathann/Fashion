using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//This three are the imported for database connection and configuration
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
     //***********************************************************************************************
     //To Submit the record
     //***********************************************************************************************
    public void SubmitRecord()
    {
        try
        {

            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
            con.ConnectionString = conString;
            con.Open();
            String SqlQuery = "INSERT INTO CITY_MASTER(city_name,city_pincode) VALUES (@city_name,@city_pincode)";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = SqlQuery;
            cmd.Connection = con;
            cmd.Parameters.Add("@city_name", SqlDbType.VarChar).Value = txtcityname.Text;
            cmd.Parameters.Add("@city_pincode", SqlDbType.VarChar).Value = txtcode.Text;
            cmd.ExecuteNonQuery();
            lblmessage.Text = "One City is Added..";
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
}