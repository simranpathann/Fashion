using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void SubmitRecord()
    {
        try
        {

            SqlConnection con = new SqlConnection();
            string conString = ConfigurationManager.ConnectionStrings["connectionstring"].ConnectionString;
            con.ConnectionString = conString;
            con.Open();

            fuCategoryimage.SaveAs(Server.MapPath("~/CategoryImages/") + fuCategoryimage.FileName.ToString());  //directorynotfoundexp
            String url = ("~/images/") + fuCategoryimage.FileName.ToString();



            String SqlQuery = "INSERT INTO Category_Master(Category_Name,Category_Images)" + "VALUES (@Category_Name,@Category_Images)";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = SqlQuery;
            cmd.Connection = con;


            cmd.Parameters.Add("@Category_name", SqlDbType.VarChar).Value = txtCategoryname.Text;
            cmd.Parameters.Add("@Category_Images", SqlDbType.VarChar).Value = url;


            cmd.ExecuteNonQuery();
            lblmeassage.Text = "Successfully Saved...";
            con.Close();

        }
        catch (SqlException se)
        {
            lblmeassage.Text = se.Message;
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SubmitRecord();
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {

    }
}