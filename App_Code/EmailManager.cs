using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.Net;
using System.Collections;

/// <summary>
/// Summary description for EmailManager
/// </summary>
public class EmailManager
{
    public EmailManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    const string SERVER = "EvidentNet";
    const string URL = "http://www.evidentnet.com";
    const string EmailTemplate = "  <html><body>" +

      "<div align=\"center\" style=\"border: 2px solid #fff; border-color: #fff; background-color: #f1f1f1; box-shadow: 1px 0px 7px; width: 100%; height: auto\">" +
          "<div style=\"padding-left: 5%; width: 100%\">" +
          "<div style=\"width: 100%\"><a style=\"margin-left: -15px; padding: 15px 15px;\"><img src=\"http://www.centuryconsultant.com/memorebook/memorEbook%20MemorExchange_files/logo.png\" alt=\"Memorebook\" style=\"float: left; padding-left: 100px; padding: 15px 15px;\"></a></div>" +
            "<div style=\"color: #404040;font-size: 14px; line-height: 150%; text-align: left; padding: 40px; width:80%;\" align=\"center\">" +
                  "<br />" +
                  "<p style=\"margin-top:0;margin-bottom:1em;line-height:100%;font-family:'Arial Rounded MT'\">Hello,</p>" +
                  "<p style=\"margin-top:0;margin-bottom:1em;line-height:100%;font-family:'Arial Rounded MT'\">#name# ,  #title# <br /><br /> Please press accept to joining the exchange</p>" +
                  "<p align=\"center\" style=\"margin-top:0;margin-bottom:1em;line-height:50%;\"><a href=\"#URL#\" target=\"_blank\"><img src=\"http://www.centuryconsultant.com/memorebook/images/accept.png\" alt=\"reset password\" class=\"CToWUd\" style=\"width:20%\"></a></p>" +
              "</div>" +
          "</div>" +
      "</div>" +
                            "</body></html>";
    public static bool SendEmail(string arrEmail,string arrName, string Url, string GroupName)
    {
        string sMessageTitle = "Salman invited you for the exchange " + " " + GroupName;
        try
        {
                string sMailMessage = EmailTemplate.Replace("#title#", sMessageTitle);
                sMailMessage = sMailMessage.Replace("#name#", arrName);
                sMailMessage = sMailMessage.Replace("#URL#", Url);
                System.Net.Mail.MailMessage mailMsg = new System.Net.Mail.MailMessage();
                mailMsg.From = new MailAddress("support@anasenterprises.in");
                mailMsg.To.Add(arrEmail);
                mailMsg.Subject = GroupName;
                mailMsg.IsBodyHtml = true;
                mailMsg.Body = sMailMessage;
                SmtpClient mailObj = new SmtpClient("smtp.gmail.com", 587);
                mailObj.Credentials = new NetworkCredential("testing2547@gmail.com", "17112547");
                mailObj.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                mailObj.EnableSsl = true;
                mailObj.Send(mailMsg);
                mailMsg.Dispose();
            return true;

        }
        catch
        {
            return false;
        }

    }
}