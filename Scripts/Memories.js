var ActivityID;
ActivityID = GetQueryStringParamsForAgentRegistrationUpdate('ID');

function GetActivityMemory() {
    document.getElementById("Add").style.background = "#333";
    debugger;
    
    $.ajax({
        type: "POST",
        url: "MemoryHandler.asmx/GetActivityMemory",
        data: '{"ActivityID":"' + ActivityID + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var MyActivities = result.MyMemories;
              

                if (MyActivities != 0) {
                   
                    var tRow = '';
                    
                    for (var i = 0; i < MyActivities.length; i++) {
                        var url = (MyActivities[i].ImageUrl);
                        var ImageURL = url.replace("'\'", "/");
                        tRow += '<div class="grid-item" style="float:left">';
                        tRow += '<div class="img-galry">';
                        tRow += '<a href="' + ImageURL + '" class="img-glrybox">';
                        tRow += '<img src="' + ImageURL + '" alt=""  width="200" height="200" class="img-responsive" />';
                        tRow += '<span class="imghover"></span>';
                        tRow += '</a>';
                        tRow += '<div class="footer-info">';
                        tRow += '<span  class="pull-right plusIcon" style="cursor:pointer"><a  onclick="Salectimg(this.id)" id="img' + (i + 1) + '" style="color:#777472" style="cursor:pointer" class="glyphicon glyphicon-plus-sign"  title="Select Image"></a></span>';
                        tRow += '</div>';
                        tRow += '</div>';
                        tRow += '</div>';
                        

                    }
                    //$("#img-galry").append(tRow);
                    $("#img-galry").html(tRow)

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

function Salectimg(id)
{
    //document.getElementById(id).className = '.book-info a';
    
    var Name = document.getElementById(id);
    if (Name.className === "glyphicon glyphicon-plus-sign") {
        document.getElementById(id).className = 'glyphicon glyphicon-plus-sign book-info a';
        $("#" + id).css("color", "rgb(130, 214, 34)");
        document.getElementById('make-image').src = "images/iconplus-hover.png";
        $("#add").css("color", "#82d622");
    }
    else if (Name.className === "glyphicon glyphicon-plus-sign book-info a") {
        document.getElementById(id).className = 'glyphicon glyphicon-plus-sign';
        $("#" + id).css("color", "#777472");
    }
    var arr = document.getElementsByClassName("glyphicon glyphicon-plus-sign book-info a")
    arr.length;
    if (arr.length ==0)
    {
        document.getElementById('make-image').src = "images/iconplus-hover1.png";
        $("#add").css("color", "#777472");
    }
}
function GroupNameLoadByActivity() {
    debugger;
    $.ajax({
        type: "POST",
        url: "MemoryHandler.asmx/GroupNameLoadByActivity",
        data: '{"ActivityId":"' + ActivityID + '"}',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var MyGroup = result.MyGroup;
                
                if (MyGroup != 0) {
                    var li ;
                    li = '<li class="active"><a href="Exchange.aspx">My Exchanges </a></li>';
                    li += ' > ';
                    li += ' <li class="active"><a href="Activity.aspx?GroupId=' + MyGroup[0].ID1 + '" >' + MyGroup[0].GroupName + '</a></li>';
                    li += ' > ';
                    li += ' <li><a >' + MyGroup[0].ActivityName + '</a></li>'
                    li += '<li><a id="AddNew"></a></li>';
                    var a = '<a href="Activity.aspx?GroupId=' + MyGroup[0].ID1 + '">' + MyGroup[0].GroupName + '</a>'
                    var Activity = '<a href="MemorExchange.aspx?ID=' + MyGroup[0].ID + '">' + MyGroup[0].ActivityName + '</a>';
                    $("#Activity").html(Activity);
                    $("#Gname").html(a);
                    $("#Group").html(li);
                    $("#Group").empty().append(li);
                }

            }
            else {
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
function change_autorefreshdiv() {
    var NAME = document.getElementById("MyExchnanges");
    var All = document.getElementById("CreateExchange");
    if (NAME.className === "tab-pane") {
        NAME.className = "tab-pane active";
        All.className = "tab-pane";
        document.getElementById("Add").style.background = "#F58234";
        document.getElementById("Add1").style.background = "#333";

    }
    else {
        NAME.className = "tab-pane";
        All.className = "tab-pane active";
        document.getElementById("Add").style.background = "#333";
        document.getElementById("Add1").style.background = "#F58234";
        GetActivityMemory();
    }
}