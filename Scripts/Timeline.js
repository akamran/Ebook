$(document).ready(function () {
    GetCurrentUser();
});
function GetCurrentUser() {
    debugger;
    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/MyHouseHold",
        data: '',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var arrMyHouseHold = result.MyHouseHold;
                $("#namescroll ul tr").remove();

                if (arrMyHouseHold != 0) {
                    $('#lblStatus').css("display", "none");
                    var li;
                    li = '<li id="id_here" >'
                    for (var i = 0; i < arrMyHouseHold.length; i++) {
                        li += '<li>';
                        li += '<a style="cursor:pointer" onclick="GetSalectedUser(\'' + arrMyHouseHold[i].DisplayName + '\')"><i><img src="images/user-icon.png" alt="\'' + arrMyHouseHold[i].DisplayName + '\'"></i>' + "    " + arrMyHouseHold[i].DisplayName + '</a>';
                        li += '</li>';
                    }
                    li += '</li>';
                    $("#namescroll").html(li);
                    $("#id_here").remove();
                }
            }
            else {
                $('#lblStatus').css("display", "block");
            }



            if (result.retCode == 0) {
                //alert("Something went wrong! Please try again.")
            }
        },
        error: function () {
            alert("An error occured! Please try again");
        }
    });
}
