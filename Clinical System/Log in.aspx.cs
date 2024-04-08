using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Log_in : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void submit_Click (object sender, EventArgs e)
    {
        

        //TextBox t1 = this.FindControl("inputusername");


    }

    protected void submit_Click1(object sender, EventArgs e)
    {
        if (inputusername.Value == "admin" && inputuserpassword.Value == "admin")
        {
            Response.Redirect("Dashboard.aspx");
        }
        else { error.Text = "Invalid username or password."; }
    }
}