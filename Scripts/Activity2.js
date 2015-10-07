var GroupID;
GroupID = GetQueryStringParamsForAgentRegistrationUpdate('GroupId');

var hiddenID;
var hiddenGrpName;
var group;
var Photos;
var Video;
$(document).ready(function () {
    debugger;
    document.getElementById("Add").style.background = "#F58234";
    GroupName();
    MyActivities();
    
});


function UpdateActivity(GroupName, ID) {
    debugger;
    //window.location.href = "#CreateActivity?GroupName=" + GroupName;
    location.href = "#CreateActivity?GroupName=" + GroupName;
    debugger;
    if (location.href.indexOf('?') != -1) {

        hiddenID = ID;
        hiddenGrpName = GroupName;
        $("#txtActivityName").val(GroupName);
        $("#btnActivity").text('Update Activity');
        $("#AddNew").html(" > "  + GroupName);
        document.getElementById("Add").style.background = "#333";
        document.getElementById("Add1").style.background = "#F58234";   

    }
    else if (location.href.indexOf('?') == -1) {
        $("#AddNew").html(" > Create New ");
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
               

                if (MyActivities != 0) {
                    $('#lblStatus').css("display", "none");
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
                        var UpdateAvail = MyActivities[i].ModifiedDate;
                        if (UpdateAvail == "")
                            UpdateAvail = "Not Yet Updated";
                        tRow += '<tr>';
                        tRow += '<td><a href="#CreateActivity" onclick="UpdateActivity(\'' + MyActivities[i].ActivityName + '\',\'' + MyActivities[i].ID + '\')" data-toggle="tab"><i class="glyphicon glyphicon-edit"></i></td>';
                        tRow += '<td> <a href="MemorExchange.aspx?ID=' + MyActivities[i].ID +'">' + MyActivities[i].ActivityName + '</a></td>';
                        tRow += '<td>Elizabeth Miler</td>';
                        tRow += '<td>' + UpdateAvail + '</td>';
                        tRow += '<td><a href="#" id="Photo' + (i + 1) + '">0</a></td>';
                        tRow += '<td><a href="#" id="Video' + (i + 1) + '">0</a></td>';
                        tRow += '<td> <a style="cursor:pointer" onclick="DeleteActivity(\'' + MyActivities[i].ID + '\',\'' + MyActivities[i].ActivityName + '\')"><img src="images/Untitled-2.png" alt="" /></a></td>';
                        tRow += '</tr>';
                        GetPhoto(MyActivities[i].ID, (i));
                        var refreshId = setTimeout(GetVideo(MyActivities[i].ID, (i)), 4000);;
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
                var tRow;

                tRow += '<thead>';
                tRow += '<tr>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th></th>';
                tRow += '<th align="center">" No Activity Found !!! Create Some Activity First "</th>';
               
               
                
                tRow += '</tr>';
                tRow += '</thead>';
                //tRow += '<tbody class="border">';
                tRow += '</tr>';
                //tRow += '</tbody>';
                $("#tbl_MyActivity").html(tRow);
            }
        },
        error: function () {
            alert("An error occured while checking balance! Please try again");
        }
    });
}
function GetPhoto(ActivityId, i) {
    $.ajax({
        type: "POST",
        url: "MemoryHandler.asmx/GetPhoto",
        data: '{"ActivityId":"' + ActivityId + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var MyPhoto = result.MyPhoto;
                if (MyPhoto != 0) {
                    Photos = MyPhoto.length
                    if (MyPhoto != "") {
                        $('#Photo' + (i + 1)).text(Photos);
                    }
                    else if (MyPhoto = "") {
                        var count = 0;
                        $('#Photo' + (i + 1)).text(count);
                    }

                }

            }
            else {
                $('#lblstatus').css("display", "block");
            }
            if (result.retcode == 0) {
                var count = 0;
                $('#Photo' + (i + 1)).text(count);
            }
        },
        //error: function () {
        //    alert("An error occured while checking balance! Please try again");
        //}
    });
}
function GetVideo(ActivityId, i) {
    $.ajax({
        type: "POST",
        url: "MemoryHandler.asmx/GetVideo",
        data: '{"ActivityId":"' + ActivityId + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var MyVideo = result.MyVideo;
                if (MyVideo != 0) {
                    alert(Video)
                    if (MyVideo != "") {
                        $('#Video' + (i + 1)).text(Video);
                    }
                    else if (MyVideo = "") {
                        var count = 0;
                        $('#Video' + (i + 1)).text(count);
                    }

                }

            }
            else {
                $('#lblstatus').css("display", "block");
            }
            if (result.retcode == 0) {
                var count = 0;
                $('#Video' + (i + 1)).text(count);
            }
        },
        //error: function () {
        //    alert("An error occured while checking balance! Please try again");
        //}
    });
}
function GroupName() {

    debugger;

    $.ajax({
        type: "POST",
        url: "DefaultHandler.asmx/GroupName",
        data: '{"GroupID":"' + GroupID + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var MyGroup = result.MyGroup;
                $("#GroupName").text(MyGroup[0].GroupName)
                $("#Created").text(MyGroup[0].FirstName + " " + MyGroup[0].LastName)
                $("#Date").text(MyGroup[0].CreatedDate)
                if (MyGroup != 0) {
                    $('#lblStatus').css("display", "none");
                    group = $("#GroupName").text();
                }
              
            }
            else {
                $('#lblStatus').css("display", "block");
            }
            if (result.retCode == 0) {
                //alert("Something went wrong! Please try again.")
            }
        },
        //error: function () {
        //    alert("An error occured while checking balance! Please try again");
        //}
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
                        location.href = "Activity.aspx?GroupId=" + GroupID;
                        alert("Activity Created");
                        return false;

                    }

                    if (result.retCode == 0) {
                        alert("Something went wrong! Please try again.")
                    }
                },
               
            });
        }
        else if ($("#btnActivity").text() == "Update Activity") {
            $.ajax({
                type: "POST",
                url: "DefaultHandler.asmx/UpdateActivity",
                data: '{"ID":"' + hiddenID + '","GroupID":"' + GroupID + '","ActivityName":"' + ActivityName + '"}',
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {
                        location.href = "Activity.aspx?GroupId=" + GroupID;
                        alert("Activity Updated");
                        return false;
                    }

                    if (result.retCode == 0) {
                        alert("Something went wrong! Please try again.")
                    }
                },
            });

        }
    }
    
}


function DeleteActivity(ID,Name) {
    debugger;

    if (confirm("Are you sure you want to delete Exchange " + Name + "?") == true) {
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

                    window.location.href = 'Activity.aspx?GroupId=' + GroupID;


                }

                if (result.retCode == 0) {
                    alert("Something went wrong! Please try again.")
                }
            },
            //error: function () {
            //    alert("An error occured while checking balance! Please try again");
            //}
        });
    }

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
function change_autorefreshdiv() {
    var NAME = document.getElementById("MyActivities");
    var All = document.getElementById("CreateActivity");
    if (NAME.className === "tab-pane") {
        NAME.className = "tab-pane active";
        All.className = "tab-pane";
        document.getElementById("Add").style.background = "#F58234";
        document.getElementById("Add1").style.background = "#333";
        $("#AddNew").html("");
    }
    else {
        NAME.className = "tab-pane";
        All.className = "tab-pane active";
        document.getElementById("Add").style.background = "#333";
        document.getElementById("Add1").style.background = "#F58234";
        $("#AddNew").html(" > Create New ");
    }
}