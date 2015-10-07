using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;
using System.Data;
using System.Configuration;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for MemoryHandler
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class MemoryHandler : System.Web.Services.WebService {

    public MemoryHandler () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    private string escapejosndata(string data)
    {
        return data.Replace("\\", "\\\\").Replace("\"", "\\\"");
    }

    [WebMethod(EnableSession = true)]
    public string GetActivityMemory(string ActivityID)
    {

        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.GetActivityMemory(ActivityID, out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyMemories\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    // Get Number Of Photo& Video //
    [WebMethod(EnableSession = true)]
    public string GetPhoto(string ActivityId)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.GetPhoto(ActivityId, out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyPhoto\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    [WebMethod(EnableSession = true)]
    public string GetVideo(string ActivityId)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.GetVideo(ActivityId, out dtResult); ;
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
            jsonString = "{\"Session\":\"1\",\"retCode\":\"1\",\"MyVideo\":[" + jsonString.Trim(',') + "]}";
            dtResult.Dispose();
            return jsonString;
        }
        else
            return "{\"Session\":\"1\",\"retCode\":\"0\"}";


    }
    #region Group Name By Avtivity
    [WebMethod(EnableSession = true)]
    public string GroupNameLoadByActivity(string ActivityId)
    {
        string jsonString = "";
        DataTable dtResult;
        DefaultManager.DBReturnCode retCode = DefaultManager.GroupNameLoadByActivity(ActivityId, out dtResult); ;
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
    #endregion Group Name
}
