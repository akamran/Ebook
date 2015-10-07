var GroupID;
GroupID = GetQueryStringParamsForAgentRegistrationUpdate('GroupId');

var hiddenID;
var hiddenGrpName;

$(document).ready(function () {
    debugger;
    MyActivities();
});


function UpdateActivity(GroupName, ID) {
    debugger;
    window.location.href = "#view2?GroupName=" + GroupName;
    debugger;
    if (location.href.indexOf('?') != -1) {

        hiddenID = ID;
        hiddenGrpName = GroupName;
        $("#txtActivityName").val(GroupName);
        $("#btnActivity").text('Update Activity');


    }
    else if (location.href.indexOf('?') == -1) {
        $("#btnActivity").text('Add Activity');
    }
};

function clearActivity() {
    debugger;
    $("#btnActivity").text('Add Activity');
    $("#txtActivityName").val('');
};



function MyActivities() {

    debugger;
    //$("#tbl_MyExchanges").dataTable();
    //$("#tbl_MyExchanges").dataTable().fnDestroy();
    //$("#tbl_MyExchanges").dataTables({
    //    "bJQueryUI": true,
    //    "bSort": false,
    //    "bPaginate": true,
    //    "sPaginationType": "full_numbers",
    //    "iDisplayLength": 10
    //});
    $.ajax({
        type: "POST",
        url: "DefaultHandler.asmx/MyActivities",
        data: '{"GroupID":"' + GroupID + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var MyActivities = result.MyActivities;
                //$("#tbl_AgencyStatement tbody tr").remove();

                if (MyActivities != 0) {
                    $('#lblStatus').css("display", "none");
                    //GroupId = arrMyExchanges[i].ID;
                    var tRow;
                  
                    tRow += '<thead>';
                    tRow += '<tr>';
                    tRow += '<th></th>';
                    tRow += '<th>Activity</th>';
                    tRow += '<th>Shared By</th>';
                    tRow += '<th>Last Updated</th>';
                    tRow += '<th>Photos</th>';
                    tRow += '<th>Videos</th>';
                    tRow += '<th></th>';
                    tRow += '</tr>';
                    tRow += '</thead>';
                    tRow += '<tbody class="border">';
                        for (var i = 0; i < MyActivities.length; i++) {
                            tRow += '<tr>';
                            tRow += '<td> <i class="glyphicon glyphicon-edit"></i></td>';
                            tRow += '<td> <a href="#">' + MyActivities[i].ActivityName + '</a></td>';
                            tRow += '<td>Elizabeth Miler</td>';
                            tRow += '<td>' + MyActivities[i].CreatedDate + '</td>';
                            tRow += '<td><a href="#">4</a></td>';
                            tRow += '<td><a href="#">3</a></td>';
                            tRow += '<td> <a onclick="DeleteActivity(\'' + MyActivities[i].ID + '\')"><img src="images/Untitled-2.png" alt="" /></a></td>';
                            tRow += '</tr>';
                        }
                        tRow += '</tr>';
                        tRow += '</tbody>';



                        $("#tbl_MyActivity").html(tRow);
                        $("#tbl_MyActivity").dataTable({
                        //    "bSort": false
                    });

                }
                $("#tbl_MyActivity").empty().append(tRow);
                //$("#tbl_MyExchanges tbody").append(tRow);
                //$("#results").html(myHtml)
            }
            else {
                $('#lblStatus').css("display", "block");
            }



            if (result.retCode == 0) {
                //alert("Something went wrong! Please try again.")
            }
        },
        error: function () {
            alert("An error occured while checking balance! Please try again");
        }
    });
}

function CreateActivity() {
    debugger;
    var ActivityName = document.getElementById("txtActivityName").value;

    var bValid = true;

    if (ActivityName == "") {
        bValid = false;
        alert("Activity Name cannot be blank");
        document.getElementById('txtActivityName').focus();
        return false;
    }

    if (bValid == true) {
        if ($("#btnActivity").text() == "Add Activity") {
            debugger;
            $.ajax({
                type: "POST",
                url: "DefaultHandler.asmx/CreateActivity",
                data: '{"GroupID":"' + GroupID + '","ActivityName":"' + ActivityName + '"}',
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {

                        alert("Activity Created");
                        MyActivities();
                        //window.location.href = 'Activity.html?GroupId=' + GroupID;


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
        else if ($("#btnActivity").text() == "Update Activity") {
            alert('yes this is update')
            //ActivityName = document.getElementById("txtActivityName").value

            $.ajax({
                type: "POST",
                url: "DefaultHandler.asmx/UpdateActivity",
                data: '{"ID":"' + hiddenID + '","GroupID":"' + GroupID + '","ActivityName":"' + ActivityName + '"}',
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {

                        alert("Activity Updated");

                        //window.location.href = 'Activity.aspx?GroupId=' + GroupID;


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


function DeleteActivity(ID) {
    debugger;


    debugger;
    $.ajax({
        type: "POST",
        url: "DefaultHandler.asmx/DeleteActivity",
        data: '{"ID":"' + ID + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {

                alert("Exchange Deleted");

                window.location.href = 'Activity.aspx?GroupId=' + GroupID;


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



function GetQueryStringParamsForAgentRegistrationUpdate(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == sParam) {
            return sParameterName[1];
        }
    }
}