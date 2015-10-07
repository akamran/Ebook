using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System.Transactions;


public class DefaultManager
{
    public DefaultManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region core ***********************************************
    public enum DBReturnCode
    {
        SUCCESS = 0,
        CONNECTIONFAILURE = -1,
        SUCCESSNORESULT = -2,
        SUCCESSNOAFFECT = -3,
        DUPLICATEENTRY = -4,
        EXCEPTION = -5,
        INPUTPARAMETEREMPTY = -6
    }
    protected static SqlConnection OpenConnection()
    {
        SqlConnection conn = null;
        try
        {
            string pwd = ConfigurationManager.AppSettings["DBPassword"].ToString();
            string conStr = String.Format(ConfigurationManager.ConnectionStrings["MemorEbookCS"].ConnectionString, pwd);
            conn = new SqlConnection(conStr);
            conn.Open();
        }
        catch
        {
            conn = null;
        }
        return conn;
    }
    protected static void CloseConnection(SqlConnection conn)
    {
        try
        {
            conn.Close();
            conn.Dispose();
        }
        catch { }
    }
    public static DBReturnCode GetDataTable(string cmdTxt, out DataTable dtResult, params SqlParameter[] commandParameters)
    {
        dtResult = null;
        SqlConnection connection = OpenConnection();
        DBReturnCode retcode;
        if (connection == null)
        { retcode = DBReturnCode.CONNECTIONFAILURE; }
        else
        {
            try
            {
                SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                SqlDataReader dr = command.ExecuteReader(CommandBehavior.CloseConnection);
                dtResult = new DataTable();
                dtResult.Load(dr);
                if (dtResult.Rows.Count > 0)
                { retcode = DBReturnCode.SUCCESS; }
                else
                { retcode = DBReturnCode.SUCCESSNORESULT; }
            }
            catch
            { retcode = DBReturnCode.EXCEPTION; }
            finally
            { CloseConnection(connection); }
        }
        return retcode;

    }
    public static DBReturnCode GetDataSet(string cmdTxt, out DataSet ds, params SqlParameter[] commandParameters)
    {
        ds = null;
        SqlConnection connection = OpenConnection();
        DBReturnCode retcode;
        if (connection == null)
        { retcode = DBReturnCode.CONNECTIONFAILURE; }
        else
        {
            try
            {
                SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                command.CommandTimeout = 180;
                SqlDataAdapter da = new SqlDataAdapter(command);
                ds = new DataSet(command.CommandText);
                da.Fill(ds);
                if (ds.Tables.Count > 0)
                { retcode = DBReturnCode.SUCCESS; }
                else
                { retcode = DBReturnCode.SUCCESSNORESULT; }
            }
            catch
            { retcode = DBReturnCode.EXCEPTION; }
            finally
            { CloseConnection(connection); }
        }
        return retcode;
    }
    public static DBReturnCode ExecuteNonQuery(string cmdTxt, out int rows, params SqlParameter[] commandParameters)
    {
        SqlConnection connection = OpenConnection();
        DBReturnCode retcode;
        rows = 0;
        if (connection == null)
        { retcode = DBReturnCode.CONNECTIONFAILURE; }
        else
        {
            try
            {
                SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                rows = command.ExecuteNonQuery();
                if (rows < 1)
                { retcode = DBReturnCode.SUCCESSNOAFFECT; }
                else
                { retcode = DBReturnCode.SUCCESS; }
            }
            catch
            { retcode = DBReturnCode.EXCEPTION; }
            finally
            { CloseConnection(connection); }
        }
        return retcode;
    }
    public static DBReturnCode ExecuteScalar(string cmdTxt, out object obj, params SqlParameter[] commandParameters)
    {
        SqlConnection connection = OpenConnection();
        DBReturnCode retcode;
        obj = null;
        if (connection == null)
        { retcode = DBReturnCode.CONNECTIONFAILURE; }
        else
        {
            try
            {
                SqlCommand command = GetCommand(cmdTxt, connection, commandParameters);
                obj = command.ExecuteScalar();
                connection.Close();
                retcode = DBReturnCode.SUCCESS;
            }
            catch
            { retcode = DBReturnCode.EXCEPTION; }
            finally
            { CloseConnection(connection); }
        }
        return retcode;
    }
    private static SqlCommand GetCommand(string cmdTxt, SqlConnection connection, params SqlParameter[] commandParameters)
    {
        SqlCommand command = new SqlCommand(cmdTxt, connection);
        if (cmdTxt.ToLower().StartsWith("usp_") || cmdTxt.ToLower().StartsWith("pr"))
            command.CommandType = CommandType.StoredProcedure;
        if (commandParameters != null)
            AttachParameters(command, commandParameters);
        return command;
    }
    private static void AttachParameters(SqlCommand command, SqlParameter[] commandParameters)
    {
        if (command == null) throw new ArgumentNullException("command");
        if (commandParameters != null)
        {
            foreach (SqlParameter p in commandParameters)
            {
                if (p != null)
                {
                    // Check for derived output value with no value assigned
                    if ((p.Direction == ParameterDirection.InputOutput ||
                        p.Direction == ParameterDirection.Input) &&
                        (p.Value == null))
                    {
                        p.Value = DBNull.Value;
                    }
                    command.Parameters.Add(p);
                }
            }
        }
    }

    #endregion core

    #region Variable
    const string SERVER = "EvidentNet";
    const string URL = "http://www.evidentnet.com";
    const string EmailTemplate = "<html><body>" +
                                "<div align=\"center\">" +
                                "<table style=\"width:602px;border:silver 1px solid\" cellspacing=\"0\" cellpadding=\"0\">" +
                                "<tr>" +
                                "<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;color:White; FONT-SIZE: 14px;background-color:Black\"><span>#title#</span></td>" +
                                "</tr>" +

                                "<tr>" +
                                "<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">Name: #name#</td>" +
                                "</tr>" +

                                //"<tr>" +
        //"<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">Company Name: #CompanyName#</td>" +
        //"</tr>" +

                                //"<tr>" +
        //"<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">Company Address: #CompanyAddress#</td>" +
        //"</tr>" +

                                //"<tr>" +
        //"<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">City: #City#</td>" +
        //"</tr>" +

                                //"<tr>" +
        //"<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">State: #State#</td>" +
        //"</tr>" +

                                "<tr>" +
                                "<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">Mobile No: #phone#</td>" +
                                "</tr>" +

                                "<tr>" +
                                "<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">Email: #email#</td>" +
                                "</tr>" +

                                "<tr>" +
                                "<td width=\"100%\" style=\"vertical-align:top;text-align:left;padding:6px 5px 6px 5px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\">Your Password: #text#</td>" +
                                "</tr>" +

                                "<tr>" +
                                "<td width=\"100%\" style=\"vertical-align:middle;text-align:left;padding:20px 15px 20px 15px;height:50px;FONT-FAMILY: Verdana;FONT-SIZE: 14px\"><b>Thank You</b><br/>Adminstrator</td>" +
                                "</tr>" +

                                "<tr>" +
                                "<td width=\"100%\" style=\"padding:8px 5px 8px 5px;text-align:center;FONT-SIZE: 8pt;color:#007CC2;FONT-FAMILY: Tahoma;background-color:Silver\">  © 2014 - 2015 www.cloud9fashion.in/</td>" +
                                "</tr>" +

                                "</table>" +
                                "</div>" +
                                "</html></body>";
    #endregion
    public static DBReturnCode UserLogin(string sUserName, string sPassword)
    {
        HttpContext.Current.Session["LoginUser"] = null;
        DataTable dtResult;
        GlobalDefault objGlobalDefault;
        SqlParameter[] sqlParams = new SqlParameter[2];
        sqlParams[0] = new SqlParameter("@Email", sUserName);
        sqlParams[1] = new SqlParameter("@Password", sPassword);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserMasterLoadByKey", out dtResult, sqlParams);
        if (DefaultManager.DBReturnCode.SUCCESS == retCode)
        {
            objGlobalDefault = new GlobalDefault();
            objGlobalDefault.ID = (dtResult.Rows[0]["ID"].ToString());
            objGlobalDefault.MemorEbookName = dtResult.Rows[0]["MemorEbookName"].ToString();
            objGlobalDefault.Password = dtResult.Rows[0]["Password"].ToString();
            objGlobalDefault.FirstName = dtResult.Rows[0]["FirstName"].ToString();
            objGlobalDefault.LastName = dtResult.Rows[0]["LastName"].ToString();
            objGlobalDefault.Birthday = Convert.ToDateTime(dtResult.Rows[0]["Birthday"]);
            objGlobalDefault.MyImageUrl = dtResult.Rows[0]["MyImageUrl"].ToString();
            objGlobalDefault.IsLocationSeriveActivated = Convert.ToBoolean(dtResult.Rows[0]["IsLocationSeriveActivated"]);
            objGlobalDefault.IsUser = Convert.ToBoolean(dtResult.Rows[0]["IsUser"]);
            objGlobalDefault.City = dtResult.Rows[0]["City"].ToString();
            objGlobalDefault.StateId = Convert.ToInt64(dtResult.Rows[0]["StateId"]);
            objGlobalDefault.MyRole = Convert.ToInt64(dtResult.Rows[0]["MyRole"]);
            objGlobalDefault.CreatedBy = dtResult.Rows[0]["CreatedBy"].ToString();
            objGlobalDefault.CreatedDate = Convert.ToDateTime(dtResult.Rows[0]["CreatedDate"]);
            objGlobalDefault.ModifiedBy = dtResult.Rows[0]["ModifiedBy"].ToString();
            //objGlobalDefault.ModifiedDate = Convert.ToDateTime(dtResult.Rows[0]["ModifiedDate"]);
            objGlobalDefault.IsDeleted = Convert.ToBoolean(dtResult.Rows[0]["IsDeleted"]);
            objGlobalDefault.DeletedBy = dtResult.Rows[0]["DeletedBy"].ToString();
            //objGlobalDefault.DeletedDate = Convert.ToDateTime(dtResult.Rows[0]["DeletedDate"]);
            objGlobalDefault.PhoneNo = dtResult.Rows[0]["PhoneNo"].ToString();
            objGlobalDefault.UserName = dtResult.Rows[0]["UserName"].ToString();

            HttpContext.Current.Session["LoginUser"] = objGlobalDefault;

            //if (objGlobalDefault.UserType == "Admin")
            //    GetAuthorizedFormList();
        }
        return retCode;
    }


    public static DBReturnCode MyExchanges(string UserId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@UserId", UserId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_ExchangesLoadByKey", out dtResult, SQLParams);
        return retCode;
    }


    public static DBReturnCode CreateExchange(string ExchangeName, Guid UserId, DateTime CreatedDate, bool IsDeleted, Guid ModifiedBy, DateTime ModifiedDate)
    {
        int rowsAffected = 0;
        //string DeletedBy = "";
        String ID = "0";

        SqlParameter[] SQLParams = new SqlParameter[10];
        SQLParams[0] = new SqlParameter("@DeletedDate", ModifiedDate);
        SQLParams[1] = new SqlParameter("@UserId", UserId);
        SQLParams[2] = new SqlParameter("@GroupName", ExchangeName);
        SQLParams[3] = new SqlParameter("@CreatedBy", UserId);
        SQLParams[4] = new SqlParameter("@CreatedDate", CreatedDate);
        SQLParams[5] = new SqlParameter("@ModifiedBy", ModifiedBy);
        SQLParams[6] = new SqlParameter("@ModifiedDate", ModifiedDate);
        SQLParams[7] = new SqlParameter("@IsDeleted", IsDeleted);
        SQLParams[8] = new SqlParameter("@DeletedBy", ModifiedBy);
        SQLParams[9] = new SqlParameter("@ID", ID);



        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_GroupsAddUpdate", out rowsAffected, SQLParams);
        return retCode;
    }


    public static DBReturnCode UpdateExchange(string ID, string ExchangeName, Guid UserId, DateTime CreatedDate, bool IsDeleted, Guid ModifiedBy, DateTime ModifiedDate)
    {
        int rowsAffected = 0;
        string DeletedBy = "";


        SqlParameter[] SQLParams = new SqlParameter[10];
        SQLParams[0] = new SqlParameter("@DeletedDate", ModifiedDate);
        SQLParams[1] = new SqlParameter("@UserId", UserId);
        SQLParams[2] = new SqlParameter("@GroupName", ExchangeName);
        SQLParams[3] = new SqlParameter("@CreatedBy", UserId);
        SQLParams[4] = new SqlParameter("@CreatedDate", CreatedDate);
        SQLParams[5] = new SqlParameter("@ModifiedBy", ModifiedBy);
        SQLParams[6] = new SqlParameter("@ModifiedDate", ModifiedDate);
        SQLParams[7] = new SqlParameter("@IsDeleted", IsDeleted);
        SQLParams[8] = new SqlParameter("@DeletedBy", ModifiedBy);
        SQLParams[9] = new SqlParameter("@ID", ID);



        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_GroupsAddUpdate", out rowsAffected, SQLParams);
        return retCode;
    }

    public static DBReturnCode DeleteExchange(string GroupID)
    {
        int rowsAffected = 0;
        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@GroupID", GroupID);

        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_DeleteGroup", out rowsAffected, SQLParams);
        return retCode;
    }



    public static DBReturnCode MyActivities(string GroupID, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@GroupID", GroupID);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_ActivityLoadByKey", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode GroupMembers(string GroupID, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@GroupID", GroupID);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_InvitationLoadByGroupId", out dtResult, SQLParams);
        return retCode;
    }

    /// <Get Activity Photo & Videos>
    /// 
    /// </summary>
    /// <param name="ActivityId"></param>
    /// <param name="dtResult"></param>
   
    public static DBReturnCode GetPhoto(string ActivityId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@SourceId", ActivityId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_ActivityLoadByPhoto", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode GetVideo(string ActivityId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@SourceId", ActivityId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_ActivityLoadByVideo", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode GroupNameLoadByActivity(string ActivityId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@ID", ActivityId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_GroupNameLoadByActivity", out dtResult, SQLParams);
        return retCode;
    }
    /// <returns>Photo & Videos</returns>
    public static DBReturnCode MyGroup(string GroupID, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@GroupID", GroupID);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_GroupNameLoadByGroupId", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode MyUser(out DataTable dtResult)
    {
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserMasterLoadByEmail", out dtResult);
        return retCode;
    }
    public static DBReturnCode AddUser(string ExchangeName, Guid UserId, DateTime CreatedDate, bool IsDeleted, Guid ModifiedBy, DateTime ModifiedDate)
    {
        int rowsAffected = 0;
        //string DeletedBy = "";
        String ID = "0";

        SqlParameter[] SQLParams = new SqlParameter[10];
        SQLParams[0] = new SqlParameter("@DeletedDate", ModifiedDate);
        SQLParams[1] = new SqlParameter("@UserId", UserId);
        SQLParams[2] = new SqlParameter("@GroupName", ExchangeName);
        SQLParams[3] = new SqlParameter("@CreatedBy", UserId);
        SQLParams[4] = new SqlParameter("@CreatedDate", CreatedDate);
        SQLParams[5] = new SqlParameter("@ModifiedBy", ModifiedBy);
        SQLParams[6] = new SqlParameter("@ModifiedDate", ModifiedDate);
        SQLParams[7] = new SqlParameter("@IsDeleted", IsDeleted);
        SQLParams[8] = new SqlParameter("@DeletedBy", ModifiedBy);
        SQLParams[9] = new SqlParameter("@ID", ID);



        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_GroupsAddUpdate", out rowsAffected, SQLParams);
        return retCode;
    }
    public static DBReturnCode CreateActivity(Guid GroupID, string ActivityName, DateTime ActivityDate, Guid CreatedBy, bool IsDeleted)
    {

        int rowsAffected = 0;
        string ID = "0";

        SqlParameter[] SQLParams = new SqlParameter[6];
        SQLParams[0] = new SqlParameter("@GroupID", GroupID);
        SQLParams[1] = new SqlParameter("@ActivityName", ActivityName);
        SQLParams[2] = new SqlParameter("@ActivityDate", ActivityDate);
        SQLParams[3] = new SqlParameter("@CreatedBy", CreatedBy);
        SQLParams[4] = new SqlParameter("@IsDeleted", IsDeleted);
        SQLParams[5] = new SqlParameter("@ID", ID);



        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_ActivityAddUpdate", out rowsAffected, SQLParams);
        return retCode;
    }


    public static DBReturnCode UpdateActivity(string ID, Guid GroupID, string ActivityName, DateTime ActivityDate, Guid CreatedBy, bool IsDeleted)
    {

        int rowsAffected = 0;


        SqlParameter[] SQLParams = new SqlParameter[6];
        SQLParams[0] = new SqlParameter("@GroupID", GroupID);
        SQLParams[1] = new SqlParameter("@ActivityName", ActivityName);
        SQLParams[2] = new SqlParameter("@ActivityDate", ActivityDate);
        SQLParams[3] = new SqlParameter("@CreatedBy", CreatedBy);
        SQLParams[4] = new SqlParameter("@IsDeleted", IsDeleted);
        SQLParams[5] = new SqlParameter("@ID", ID);



        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_ActivityAddUpdate", out rowsAffected, SQLParams);
        return retCode;
    }

    public static DBReturnCode DeleteActivity(string ID)
    {
        int rowsAffected = 0;
        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@ID", ID);

        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_DeleteActivity", out rowsAffected, SQLParams);
        return retCode;
    }

    // My Friends Start //
    public static DBReturnCode MyFriends(string UserId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@UserId", UserId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserRelationLoadByKey", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode MyHousehold(string UserId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@UserId", UserId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserRelationLoadByHouseHold", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode GetCurrentUsers(string UserId, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@UserId", UserId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserMasterLoadByKey", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode DeleteFriend(string Id)
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        int rowsAffected = 0;
        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@Id", Id);
        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_DeleteUserRelation", out rowsAffected, SQLParams);
        return retCode;
    }
    //My Friends End//

    public static DBReturnCode GetActivityMemory(string ActivityID, out DataTable dtResult)
    {

        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@ActivityID", ActivityID);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_MemoryLoadByActivity", out dtResult, SQLParams);
        return retCode;
    }

    // Household Members :: Kashif ///
    public static DBReturnCode MyHouseHoldMember(string UserId, out DataTable dtResult)
    {
        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@UserId", UserId);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserRelationLoadByRoles", out dtResult, SQLParams);
        return retCode;
    }
    public static DBReturnCode AllRoles(out DataTable dtResult)
    {
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserRolesLoadAll", out dtResult);
        return retCode;
    }
    public static DBReturnCode AllState(out DataTable dtResult)
    {
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_StatesLoadAll", out dtResult);
        return retCode;
    }
    //Add Household Member //
    public static DBReturnCode AddHouseholdMember(int Role, string AC, string email, string firstName, string lastName, string Birth, string city, string State, string Time, string Weight, string Weight1, string Length, string Head)
    {
        DefaultManager.DBReturnCode retCode;
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string ID = objGlobalDefault.ID;
        Guid UserId = new Guid(ID);
        string Password = "";
        using (TransactionScope objTransactionScope = new TransactionScope())
        {
            string PhoneNo ="";
            int rowsAffected = 0;
            int IsUser = 0;
            int @IsDeleted = 0;
            int IsApproved = 0;
            SqlParameter[] SQLParams = new SqlParameter[25];
            SQLParams[0] = new SqlParameter("@Email", email);
            SQLParams[1] = new SqlParameter("@Password", Password);
            SQLParams[2] = new SqlParameter("@FirstName", firstName);
            SQLParams[3] = new SqlParameter("@LastName", lastName);
            SQLParams[4] = new SqlParameter("@IsUser", IsUser);
            SQLParams[5] = new SqlParameter("@City", city);
            SQLParams[6] = new SqlParameter("@StateId", State);
            SQLParams[7] = new SqlParameter("@userWeight1", Weight);
            SQLParams[8] = new SqlParameter("@userWeight2", Weight1);
            SQLParams[9] = new SqlParameter("@userLength", Length);
            SQLParams[10] = new SqlParameter("@Head", Head);
            SQLParams[11] = new SqlParameter("@MyRole", Role);
            SQLParams[12] = new SqlParameter("@CreatedBy", UserId);
            SQLParams[13] = new SqlParameter("@CreatedDate", DateTime.Now);
            SQLParams[14] = new SqlParameter("@PhoneNo", PhoneNo);
            SQLParams[15] = new SqlParameter("@UserName", UserId);
            SQLParams[16] = new SqlParameter("@Birthday", Birth);
            SQLParams[17] = new SqlParameter("@AlarmTime", DateTime.Now);
            SQLParams[18] = new SqlParameter("@ParentUserId", UserId);
            SQLParams[19] = new SqlParameter("@ChieldUserId", UserId);
            SQLParams[20] = new SqlParameter("@UserRoleId", Role);
            SQLParams[21] = new SqlParameter("@IsAccountContributor", AC);
            SQLParams[22] = new SqlParameter("@IsApproved", IsApproved);
            SQLParams[23] = new SqlParameter("@DisplayName", firstName + " " + lastName);
            SQLParams[24] = new SqlParameter("@IsDeleted", IsDeleted);
            retCode = DefaultManager.ExecuteNonQuery("Proc_UserMasterInsertByHouseholdMember", out rowsAffected, SQLParams);
                if (retCode == DefaultManager.DBReturnCode.SUCCESS)
                    objTransactionScope.Complete();
                else
                    objTransactionScope.Dispose();
            
        }
        return retCode;
    }

    public static DBReturnCode AddDauhtherPet(int Role, string firstName, string Birth, string city, string State, string Time, string Weight, string Weight1, string Length, string Head)
    {
        DefaultManager.DBReturnCode retCode;
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string ID = objGlobalDefault.ID;
        Guid UserId = new Guid(ID);
        using (TransactionScope objTransactionScope = new TransactionScope())
        {
            string PhoneNo = "";
            int rowsAffected = 0;
            int IsUser = 0;
            int @IsDeleted = 0;
            int AC = 0;
            int IsApproved = 0;
            string LastName = "";
            SqlParameter[] SQLParams = new SqlParameter[23];
            SQLParams[0] = new SqlParameter("@FirstName", firstName);
            SQLParams[1] = new SqlParameter("@LastName", LastName);
            SQLParams[2] = new SqlParameter("@Birthday", Convert.ToDateTime( Birth));
            SQLParams[3] = new SqlParameter("@IsUser", IsUser);
            SQLParams[4] = new SqlParameter("@City", city);
            SQLParams[5] = new SqlParameter("@StateId", State);
            SQLParams[6] = new SqlParameter("@AlarmTime", DateTime.Now);
            SQLParams[7] = new SqlParameter("@userWeight1", Weight);
            SQLParams[8] = new SqlParameter("@userWeight2", Weight1);
            SQLParams[9] = new SqlParameter("@userLength", Length);
            SQLParams[10] = new SqlParameter("@Head", Head);
            SQLParams[11] = new SqlParameter("@MyRole", Role);
            SQLParams[12] = new SqlParameter("@CreatedBy", UserId);
            SQLParams[13] = new SqlParameter("@CreatedDate", DateTime.Now);
            SQLParams[14] = new SqlParameter("@PhoneNo", PhoneNo);
            SQLParams[15] = new SqlParameter("@UserName", UserId);
            SQLParams[16] = new SqlParameter("@ParentUserId", UserId);
            SQLParams[17] = new SqlParameter("@ChieldUserId", UserId);
            SQLParams[18] = new SqlParameter("@UserRoleId", Role);
            SQLParams[19] = new SqlParameter("@IsAccountContributor", AC);
            SQLParams[20] = new SqlParameter("@IsApproved", IsApproved);
            SQLParams[21] = new SqlParameter("@DisplayName", firstName);
            SQLParams[22] = new SqlParameter("@IsDeleted", IsDeleted);
            retCode = DefaultManager.ExecuteNonQuery("Proc_UserMasterInsertByDauhtherPet", out rowsAffected, SQLParams);
            if (retCode == DefaultManager.DBReturnCode.SUCCESS)
                objTransactionScope.Complete();
            else
                objTransactionScope.Dispose();

        }
        return retCode;
    }
    public static DBReturnCode GetChildId(string email,out DataTable dtResult)
    {
        SqlParameter[] sqlParams = new SqlParameter[1];
        sqlParams[0] = new SqlParameter("@email", email);
        DefaultManager.DBReturnCode retCode = DefaultManager.GetDataTable("Proc_UserMaserLoadByEmail", out dtResult, sqlParams);
        return retCode;
    }
    public static DBReturnCode DeleteHousehold(string Id)
    {
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string UserId = objGlobalDefault.ID;
        int rowsAffected = 0;
        SqlParameter[] SQLParams = new SqlParameter[1];
        SQLParams[0] = new SqlParameter("@Id", Id);
        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_DeleteUserRelation", out rowsAffected, SQLParams);
        return retCode;
    }
    // Household Members :: Kashif ///

    // Invitation Send For Group Membership //

    public static DBReturnCode ExchangeInvitation(string ExchangeName, Guid UserId, DateTime CreatedDate, bool IsDeleted, Guid ModifiedBy, DateTime ModifiedDate)
    {
        int rowsAffected = 0;
        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string Id = objGlobalDefault.ID;
        SqlParameter[] SQLParams = new SqlParameter[10];
        SQLParams[0] = new SqlParameter("@DeletedDate", ModifiedDate);
        SQLParams[1] = new SqlParameter("@UserId", UserId);
        SQLParams[2] = new SqlParameter("@GroupName", ExchangeName);
        SQLParams[3] = new SqlParameter("@CreatedBy", UserId);
        SQLParams[4] = new SqlParameter("@CreatedDate", CreatedDate);
        SQLParams[5] = new SqlParameter("@ModifiedBy", ModifiedBy);
        SQLParams[6] = new SqlParameter("@ModifiedDate", ModifiedDate);
        SQLParams[7] = new SqlParameter("@IsDeleted", IsDeleted);
        SQLParams[8] = new SqlParameter("@DeletedBy", ModifiedBy);
        SQLParams[9] = new SqlParameter("@ID", Id);



        DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_GroupsAddUpdate", out rowsAffected, SQLParams);
        return retCode;
    }
}




