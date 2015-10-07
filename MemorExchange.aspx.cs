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

public partial class MemorExchange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int MemoryTypeId = 1;
        int MemReferId = 3;
        string MemoryTittle = "this is test";
        string Description = "";
        DateTime MemoryDate = DateTime.Now;

        GlobalDefault objGlobalDefault = (GlobalDefault)HttpContext.Current.Session["LoginUser"];
        string CreadtedBy = objGlobalDefault.ID;
        bool IsDeleted = false;
        bool IsAlbum = true;
        string SourceId = Request.QueryString["ID"];
        string filename = FileUpload1.FileName;
        FileUpload1.PostedFile.SaveAs(Server.MapPath(@"ImgUpload\" + filename.Trim()));
        string path = @"ImgUpload\" + filename.Trim();


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

        if (retCode == DefaultManager.DBReturnCode.SUCCESS)
        {
            Successlbl.Visible = true;

        }
        else
        {
            Unsuccesslbl.Visible = true;
        }
        //DefaultManager.DBReturnCode retCode = DefaultManager.ExecuteNonQuery("Proc_GroupsAddUpdate", out rowsAffected, SQLParams);



    }
}