function LoginAgent() {
    debugger;
    var sUserEmail = document.getElementById("txt_UserId").value;
    var sPassword = document.getElementById("txt_UserPassword").value;
    var bValid = true;

    if (sUserEmail == "") {
        bValid = false;
        alert("User Name/email cannot be blank");
        document.getElementById('txt_UserId').focus();
        return false;
    }
    else if (!emailReg.test(sUserEmail)) {
        bValid = false;
        alert("The email address you have entered is invalid");
        document.getElementById('txt_UserId').focus();
        return false;
    }
    if (sPassword == "") {
        bValid = false;
        alert("Password cannot be blank");
        document.getElementById('txt_UserPassword').focus();
        // $("#txt_UserPassword").focus();
        return false;
    }
    if (bValid == true) {
        debugger;
        $.ajax({
            cache: false,
            type: "POST",
            
            url: "DefaultHandler.asmx/UserLogin",
            data: '{"sUserName":"' + sUserEmail + '","sPassword":"' + sPassword + '"}',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
              
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;

              

                if (result.Session == 1 && result.retCode == 1) {

                    dashboardlanding();
                    
                    //window.location("HI_Login.html");

                    //$(location).attr('href', 'Exchange.aspx');
                    //window.location = "Exchange.html";
                    //window.open("Exchange.html");
                    return false;

                }

                if (result.Session == 1 && result.retCode == 0) {
                    alert("Please Check Conectivity");
                    window.location = "../Default.aspx";
                    return false;

                }
                

                else {
                    alert("Please Check Conectivity");
                    alert('Username/Password did not match.');
                }
            },
            error: function () {
            }

        });
    }
}
function dashboardlanding() {
    debugger;
    window.location = ("Timeline.aspx");
    window.location = "Exchange.html";
}

//................Validation.......................//
var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
