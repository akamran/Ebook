function btnLogout_Click() {
    $.ajax({
        url: "DefaultHandler.asmx/Logout",
        type: "post",
        data: '',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var result = (typeof data.d) == 'string' ? eval('(' + data.d + ')') : data.d;
            if (result.retCode == 1) {
                window.location.href = "Default.aspx";
                //                window.location.href = "../CUT/Default.aspx";
            }
        },
        error: function () {
            alert('Error occured while logging out!');
        }
    });
}