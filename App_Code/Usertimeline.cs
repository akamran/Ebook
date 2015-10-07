using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;

/// <summary>
/// Summary description for Usertimeline
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class Usertimeline : System.Web.Services.WebService
{

    public Usertimeline () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }
    private string escapejosndata(string data)
    {
        return data.Replace("\\", "\\\\").Replace("\"", "\\\"");
    }
    //Start My Friend & Relatives : By Kashif  //
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
    #region MyHouseholds
    [WebMethod(EnableSession = true)]
    public string MyHouseHold()
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyHousehold(UserId, out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyHouseHold\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    #endregion
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

    // End  My Friend & Relatives : By Kashif  //

    // Start Household Members:: By Kashif//
      [WebMethod(EnableSession = true)]
    public string MyHouseMember()
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
      string UserId = objGlobalDefault.ID;
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.MyHouseHoldMember(UserId, out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyHousehold\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
      public string AllRoles()
      {
          string jsonString = "";
          DataTable dtResult;
          DefaultManager.DBReturnCode retCode = DefaultManager.AllRoles(out dtResult); ;
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
              jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"AllRoles\":[" + jsonString.Trim(',') + "]}";
              dtResult.Dispose();
              return jsonString;
          }
          else
              return "{\"Session\":\"1\",\"retCode\":\"0\"}";


      }
    // All State //
    [WebMethod(EnableSession = true)]
    public string AllState()
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.AllState(out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"AllState\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    // End  All State //
    [WebMethod(EnableSession = true)]
    public string AddHouseMember(int Role, string AC, string email, string firstName, string lastName, string Birth, string city, string State, string Time, string Weight, string Weight1, string Length, string Head)
    {
        DefaultManager.DBReturnCode retCode = DefaultManager.AddHouseholdMember(Role,AC,email,firstName,lastName,Birth,city,State,Time,Weight,Weight1,Length, Head); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";
    }
    [WebMethod(EnableSession = true)]
    public string AddDauhther(int Role, string firstName, string Birth, string city, string State, string Time, string Weight, string Weight1, string Length, string Head)
    {
        DefaultManager.DBReturnCode retCode = DefaultManager.AddDauhtherPet(Role, firstName, Birth, city, State, Time, Weight, Weight1, Length, Head); ;
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";
    }
    [WebMethod(EnableSession = true)]
    public string GetChildId(string email)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.GetChildId(email, out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"ChildId\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string DeleteHousehold(string Id)
    {

        DefaultManager.DBReturnCode retCode = DefaultManager.DeleteHousehold(Id);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";

    }
    // End Household Members:: By Kashif//
    // Check Session //
    [WebMethod(EnableSession = true)]
    public string CheckSession()
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        if (UserId != null)
            return "{\"Session\":\"1\",\"retCode\":\"1\"}";
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";
    }
    // End Session //
}
