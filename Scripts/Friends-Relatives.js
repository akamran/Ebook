$(document).ready(function () {
    MyFriendsRelatives();
    $("#AddNew").html("All Friends & Relatives ");
});
function MyFriendsRelatives() {

    //debugger;

    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/MyFriends",
        data: '',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var arrMyExchanges = result.MyFriends;
                $("#tbl_MyFriends tbody tr").remove();

                if (arrMyExchanges != 0) {
                    var tRow;
                    tRow += '<thead>';
                    tRow += '<tr>';
                    //tRow += '<th></th>';
                    tRow += '<th>Friend/Relative</th>';
                    tRow += '<th>Email</th>';
                    tRow += '<th>Invite Date</th>';
                    tRow += '<th>Status</th>';
                    tRow += '<th></th>';
                    tRow += '</tr>';
                    tRow += '</thead>';
                    tRow += '<tbody class="border">';
                    for (var i = 0; i < arrMyExchanges.length; i++) {
                        var Status = arrMyExchanges[i].IsApproved
                        if (Status == "True") {
                            Status= "Approved"
                        }
                        else {
                            Status= "Pending for Approval"
                        }

                        tRow += '<tr>';
                        //tRow += '<td> <a href="#CreateExchange" onclick = "UpdateExchange(\'' + arrMyExchanges[i].GroupName + '\',\'' + arrMyExchanges[i].ID + '\')"  data-toggle="tab" ><i class="glyphicon glyphicon-edit"></i></a></td>';
                        tRow += '<td>' + arrMyExchanges[i].DisplayName + '</td>';
                        tRow += '<td><a>' + arrMyExchanges[i].Email + '</a></td>';
                        tRow += '<td><a>' + arrMyExchanges[i].CreatedDate + '</a></td>';
                        tRow += '<td>' + Status + '</td>';
                        tRow += '<td> <a style="cursor:pointer" class="link-black" onclick="DeleteFriend(\'' + arrMyExchanges[i].ID + '\')"><i class="glyphicon glyphicon-trash"></i></a></td>';
                        tRow += '</tr>';
                    }
                    tRow += '</tbody>';


                    $("#tbl_MyFriends").html(tRow);
                    $("#tbl_MyFriends").dataTable({
                        //    "bSort": false
                    });



                }
                $("#tbl_MyExchanges").empty().append(tRow);

            }
            else {
                $('#lblStatus').css("display", "block");
            }



            if (result.retCode == 0) {
                var NAME = document.getElementById("AddFriends");
                NAME.className = "tab-pane active";
            }
        },
        error: function () {
            alert("An error occured! Please try again");
        }
    });

}


function CreateExchange() {
    debugger;
    var ExchangeName = document.getElementById("txtExchangeName").value;

    var bValid = true;

    if (ExchangeName == "") {
        bValid = false;
        alert("Exchange Name cannot be blank");
        document.getElementById('txtExchangeName').focus();
        return false;
    }

    if (bValid == true) {

        debugger;
        if ($("#btnExchange").text() == "Add Exchange") {
            $.ajax({
                type: "POST",
                url: "Usertimeline.asmx/CreateExchange",
                data: '{"ExchangeName":"' + ExchangeName + '"}',
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {

                        alert("Exchange Created");

                        window.location.href = 'Exchange.aspx';


                    }


                    if (result.retCode == 0) {
                        alert("Something went wrong! Please try again.")
                    }
                },
                error: function () {
                    alert("An error occured while checking balance! Please try again");
                }
            });
        }

        else if ($("#btnExchange").text() == "Update Exchange") {

            ExchangeName = document.getElementById("txtExchangeName").value
            $.ajax({
                type: "POST",
                url: "Usertimeline.asmx/UpdateExchange",
                data: '{"ID":"' + hiddenID + '","ExchangeName":"' + ExchangeName + '"}',
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {

                        alert("Exchange Upadated...");

                        window.location.href = 'Exchange.aspx';


                    }


                    if (result.retCode == 0) {
                        alert("Something went wrong! Please try again.")
                    }
                },
                error: function () {
                    alert("An error occured while checking balance! Please try again");
                }
            });


        }



    }
}


function DeleteFriend(Id) {
    debugger;


    debugger;
    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/DeleteFriend",
        data: '{"Id":"' + Id + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {

                alert("Exchange Deleted");

                window.location.href = 'Friends-Relatives.aspx';


            }

            if (result.retCode == 0) {
                alert("Something went wrong! Please try again.")
            }
        },
        error: function () {
            alert("An error occured while checking balance! Please try again");
        }
    });

}


function GetQueryStringParamsForExchange(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}
function AddUser()
{
    var Email = document.getElementById("email").value;
    var FirstName = document.getElementById("FirstName").value;
    var LastName = document.getElementById("Last").value;
    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/AddUser",
        data: '{"Email":"' + Email + '","FirstName":"' + FirstName + '","LastName":"' + LastName + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {

                alert("Exchange Created");

                window.location.href = 'Friends-Relatives.aspx';


            }


            if (result.retCode == 0) {
                alert("Something went wrong! Please try again.")
            }
        },
        error: function () {
            alert("An error occured while checking balance! Please try again");
        }
    });
}
function change_autorefreshdiv() {
    var NAME = document.getElementById("AddFriends");
    var All = document.getElementById("MyFriends");
    var ADDHover = document.getElementById("Add");
    if (NAME.className === "tab-pane") {
        NAME.className = "tab-pane active";
        All.className = "tab-pane";
        document.getElementById("Add").style.background = "#F58234";
        $("#AddNew").html("Add Friends & Relatives");
    }
    else {
        NAME.className = "tab-pane";
        All.className = "tab-pane active";
        document.getElementById("Add").style.background = "#333";
        $("#AddNew").html("All Friends & Relatives ");
        MyFriendsRelatives();
    }
}