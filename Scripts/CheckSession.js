function CheckSession() {
    $.ajax({
        url: "Usertimeline.asmx/CheckSession",
        type: "post",
        data: {},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            var result = (typeof data.d) == 'string' ? eval('(' + data.d + ')') : data.d;
            if (result.retCode != 1 || result.retCode == 0) {
                window.location.href = "Default.aspx";
//                                window.location.href = "../CUT/Default.aspx";
            }
        },
    });
}