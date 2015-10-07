$(document).ready(function () {
    MyFriendsRelatives();
    $(function () {
        $('#namescroll').slimScroll({
            height: '150px'
        });
    });
});

function GetCurrentUser()
{
    debugger;
    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/GetCurrentUsers",
        data: '',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var arrMyExchanges = result.MyFriends;
                $("#namescroll ul tr").remove();

                if (arrMyExchanges != 0) {
                    $('#lblStatus').css("display", "none");
                    var li;
                    li = '<li id="id_here" >'
                    for (var i = 0; i < arrMyExchanges.length; i++) {
                        li += '<li>';
                        li += '<a style="cursor:pointer" onclick="GetSalectedUser(\'' + arrMyExchanges[i].DisplayName + '\')"><i><img src="images/user-icon.png" alt=""></i>' + " " + arrMyExchanges[i].DisplayName + " " + '</a>';
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
function GetSalectedUser(ChieldUserId) {
    $("#CurrentUser label").remove();
        $('#lblStatus').css("display", "none");
        $("#CurrentUser").html(ChieldUserId);
}
function AllFriends()
{
    var Friends= $('#AllFriends').text();
    $("#CurrentUser").html(Friends)
}