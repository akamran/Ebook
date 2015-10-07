 <%@ WebHandler Language="C#" Class="FileUploadHandler" %>
 
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


public class FileUploadHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState{
    string FileName = string.Empty;
    public void ProcessRequest (HttpContext context) {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                FileName = file.FileName;
                string fname = context.Server.MapPath(@"ImgUpload\" + FileName.Trim());
                //string fname = context.Server.MapPath(@"ImgUpload\" + file.FileName);

                string filename = file.FileName;
                file.SaveAs(context.Server.MapPath(@"ImgUpload\" + filename.Trim()));
                string path = @"ImgUpload\" + filename.Trim();

                
                int MemoryTypeId = 1;
                int MemReferId = 3;
                string MemoryTittle = "drag n drop test";
                string Description = "";
                DateTime MemoryDate = DateTime.Now;

                GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
                string CreadtedBy = objGlobalDefault.ID;
                //string CreadtedBy ="f22c3eac-e861-4366-b1cb-001be4927779";
                bool IsDeleted = false;
                bool IsAlbum = true;
                //string SourceId = Response.QueryString["ID"];
                string SourceId = context.Request["ID"];
                


                int rowsAffected = 0;
                SqlParameter[] SQLParams = new SqlParameter[10];


                SQLParams[0] = new SqlParameter("@MemoryTypeId", MemoryTypeId);
                SQLParams[1] = new SqlParameter("@MemReferId", MemReferId);
                SQLParams[2] = new SqlParameter("@SourceId", SourceId);
                SQLParams[3] = new SqlParameter("@MemoryTitle", MemoryTittle);
                SQLParams[4] = new SqlParameter("@Description", Description);
                SQLParams[5] = new SqlParameter("@MemoryDate", MemoryDate);
                SQLParams[6] = new SqlParameter("@IsAlbum", IsAlbum);
                SQLParams[7] = new SqlParameter("@ImageUrl", path);
                SQLParams[8] = new SqlParameter("@CreatedBy", CreadtedBy);
                SQLParams[9] = new SqlParameter("@IsDeleted", IsDeleted);


                DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_AddMemory", out rowsAffected, SQLParams);
                
                
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write(FileName + " Uploaded Successfully!");
        }
 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }
 
}