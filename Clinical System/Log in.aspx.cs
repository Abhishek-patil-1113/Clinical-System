using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
public partial class Log_in : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [Obsolete]
    protected void submit_Click(object sender, EventArgs e)
    {
        if (FormsAuthentication.Authenticate(username.Value, password.Value))
        {
            FormsAuthentication.RedirectFromLoginPage(username.Value, remember_me.Checked);
            
        }
        else { error.Text = "Invalid Username or Password."; }
    }

    protected void lnkbtnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("appoitmentHome.aspx");
    }
}