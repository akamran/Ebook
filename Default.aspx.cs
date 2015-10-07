using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sUserName = txt_Email.Text;
        string sPassword = txt_Password.Text;

        DefaultManager.DBReturnCode retCode = DefaultManager.UserLogin(sUserName, sPassword);

        if (retCode == DefaultManager.DBReturnCode.SUCCESS)
        {
            Response.Redirect("Timeline.aspx");
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
}