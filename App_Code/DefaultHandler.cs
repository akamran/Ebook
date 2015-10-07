using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
//using MemorEbook.DataLayer;
using System.Data;


/// <summary>
/// Summary description for DefaultHandler
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class DefaultHandler : System.Web.Services.WebService
{

    public DefaultHandler()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    private string escapejosndata(string data)
    {
        return data.Replace("\\", "\\\\").Replace("\"", "\\\"");
    }

    [WebMethod(EnableSession = true)]
    public string UserLogin(string sUserName, string sPassword)
    {
        DefaultManager.DBReturnCode retCode = DefaultManager.UserLogin(sUserName, sPassword);
        if (retCode == DefaultManager.DBReturnCode.SUCCESS)
        {
            GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
            if (objGlobalDefault.IsUser == true)
            {
                //return "{\"Session\":\"1\",\"retCode\":\"1\",\"roleID\":\"Admin\"}";
                return "{\"Session\":\"1\",\"retCode\":\"1\"}";
            }

            else
                //return "{\"Session\":\"1\",\"retCode\":\"0\",\"roleID\":\"Null\"}";
                return "{\"Session\":\"1\",\"retCode\":\"0\"}";

        }
        else
        {
            //return "{\"Session\":\"1\",\"retCode\":\"0\",\"roleID\":\"Null\"}";
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";
        }
    }
    //  My Exchange Start  //
    [WebMethod(EnableSession = true)]
    public string MyExchanges()
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyExchanges(UserId, out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyExchanges\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }


    [WebMethod(EnableSession = true)]
    public string CreateExchange(string ExchangeName)
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];


        string ID = objGlobalDefault.ID;
        Guid UserId = new Guid(ID);
        //string ID = "";

        //Guid UserId = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");
        //Guid UserId = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        //string UserId = "B8D585D0-B012-4A0C-824A-DE129243AAB7";
        DateTime CreatedDate = DateTime.Now;
        bool IsDeleted = false;

        //Guid ModifiedBy = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");
        Guid ModifiedBy = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        DateTime ModifiedDate = DateTime.Now;


        string jsonString = "";

        DefaultManager.DBReturnCode retCode = DefaultManager.CreateExchange(ExchangeName, UserId, CreatedDate, IsDeleted, ModifiedBy, ModifiedDate);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }


    [WebMethod(EnableSession = true)]
    public string UpdateExchange(string ID, string ExchangeName)
    {
        //GlobalDefault objGlobalDefault=new GlobalDefault();
        //string UserId = objGlobalDefault.ID;
        //Guid ID = new Guid("");
        //string ID = "";

        //Guid UserId = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");
        Guid UserId = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        //string UserId = "B8D585D0-B012-4A0C-824A-DE129243AAB7";
        DateTime CreatedDate = DateTime.Now;
        bool IsDeleted = false;

        //Guid ModifiedBy = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");
        Guid ModifiedBy = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        DateTime ModifiedDate = DateTime.Now;


        string jsonString = "";

        DefaultManager.DBReturnCode retCode = DefaultManager.UpdateExchange(ID, ExchangeName, UserId, CreatedDate, IsDeleted, ModifiedBy, ModifiedDate);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }



    [WebMethod(EnableSession = true)]
    public string DeleteExchange(string GroupID)
    {
        //Guid UserId = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");

        DefaultManager.DBReturnCode retCode = DefaultManager.DeleteExchange(GroupID);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    // My Exchange End //

    //My Friend & Relatives : By Kadhif  //
    [WebMethod(EnableSession = true)]
    public string MyFriends()
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyFriends(UserId, out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyFriends\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string GetCurrentUsers()
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyFriends(UserId, out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyFriends\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string DeleteFriend(string Id)
    {
        //Guid UserId = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");

        DefaultManager.DBReturnCode retCode = DefaultManager.DeleteFriend(Id);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string SendFriendRequest(string ExchangeName)
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];


        string ID = objGlobalDefault.ID;
        Guid UserId = new Guid(ID);
        //string ID = "";

        //Guid UserId = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");
        //Guid UserId = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        //string UserId = "B8D585D0-B012-4A0C-824A-DE129243AAB7";
        DateTime CreatedDate = DateTime.Now;
        bool IsDeleted = false;

        //Guid ModifiedBy = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");
        Guid ModifiedBy = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        DateTime ModifiedDate = DateTime.Now;


        string jsonString = "";

        DefaultManager.DBReturnCode retCode = DefaultManager.CreateExchange(ExchangeName, UserId, CreatedDate, IsDeleted, ModifiedBy, ModifiedDate);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }

    public string MyUser()
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyUser(out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyUser\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string MyActivities(string GroupID)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyActivities(GroupID, out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyActivities\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string GroupMembers(string GroupID)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.GroupMembers(GroupID, out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"GroupMembers\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }

    //Group Name Load By Id//
    [WebMethod(EnableSession = true)]
    public string GroupName(string GroupID)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyGroup(GroupID, out dtResult); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            jsonString = "";
            foreach (DataRow dr in dtResult.Rows)
            {
                jsonString += "{";
                foreach (DataColumn dc in dtResult.Columns)
                {
                    jsonString += "\"" + dc.ColumnName + "\":\"" + escapejosndata(dr[dc].ToString().Replace("\r\n", " ")) + "\",";
                }
                jsonString = jsonString.Trim(',') + "},";
            }
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyGroup\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }


    [WebMethod(EnableSession = true)]
    public string CreateActivity(Guid GroupID, string ActivityName)
    {


        DateTime ActivityDate = DateTime.Now;
        Guid CreatedBy = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        bool IsDeleted = false;




        DefaultManager.DBReturnCode retCode = DefaultManager.CreateActivity(GroupID, ActivityName, ActivityDate, CreatedBy, IsDeleted);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }

    [WebMethod(EnableSession = true)]
    public string UpdateActivity(string ID, Guid GroupID, string ActivityName)
    {


        DateTime ActivityDate = DateTime.Now;
        Guid CreatedBy = new Guid("f22c3eac-e861-4366-b1cb-001be4927779");
        bool IsDeleted = false;




        DefaultManager.DBReturnCode retCode = DefaultManager.UpdateActivity(ID, GroupID, ActivityName, ActivityDate, CreatedBy, IsDeleted);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }


    [WebMethod(EnableSession = true)]
    public string DeleteActivity(string ID)
    {
        //Guid UserId = new Guid("B8D585D0-B012-4A0C-824A-DE129243AAB7");

        DefaultManager.DBReturnCode retCode = DefaultManager.DeleteActivity(ID);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }



    [WebMethod(EnableSession = true)]
    public string Logout()
    {

        Session["LoginUser"] = null;
        //Session.Remove("AGENTUSER");
        Session.Abandon();
        //Admin.sUserName = string.Empty;
        return "{\"Session\":\"1\",\"retCode\":\"1\"}";
    }

    [WebMethod(EnableSession = true)]
    public string CheckSession()
    {
        if (Session["LoginUser"] != null)
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";
    }
    #region Random
    [WebMethod(EnableSession = true)]
    public string GetRandomString(string RandomNumber)
    {
        string sResumeCode = RandomNumber + "-" + GenerateRandomNumber();
        string logoFileName = sResumeCode;
        return logoFileName;

    }
    public static int GenerateRandomNumber()
    {
        int rndnumber = 0;
        Random rnd = new Random((int)DateTime.Now.Ticks);
        rndnumber = rnd.Next();
        return rndnumber;
    }
    #endregion
    #region Emailsending
    [WebMethod(true)]
    public string EmailSending(string arrEmail, string arrName, string Url, string GroupName)
        {
           
           
            string sJsonString = "{\"retCode\":\"0\"}";
            if (EmailManager.SendEmail(arrEmail, arrName, Url, GroupName) == true)//info@tmauto.in
            {
                sJsonString = "{\"retCode\":\"1\",}";
            }
            return sJsonString;
        
        }
    #endregion
}

