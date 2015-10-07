$(document).ready(function () {
    MyHousehold();
    AllRoles();
    AllState();
    $("#Account").css("display", "");
    $("#mail").css("display", "");
    $("#First").css("display", "");
    $("#Last").css("display", "");
    $("#Birthday").css("display", "");
});
function MyHousehold() {
  
    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/MyHouseMember",
        data: '',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var arrMyHouseMember = result.MyHousehold;
                $("#tbl_MyHousehold tbody tr").remove();

                if (arrMyHouseMember != 0) {
                    var tRow;
                    tRow += '<thead>';
                    tRow += '<tr>';
                    tRow += '<th></th>';
                    tRow += '<th>Family</th>';
                    tRow += '<th>Role</th>';
                    tRow += '<th></th>';
                    tRow += '</tr>';
                    tRow += '</thead>';
                    tRow += '<tbody class="border">';
                    for (var i = 0; i < arrMyHouseMember.length; i++) {
                        var Roles = arrMyHouseMember[i].ID1
                        if (Roles == "1") {
                            Roles = "color-user"
                        }
                        else if (Roles == "2") {
                            Roles = "user-icon"
                        }
                        else if (Roles == "3") {
                            Roles = "user-icon"
                        }
                        else if (Roles == "4") {
                            Roles = "user-icon"
                        }
                        else if (Roles == "5") {
                            Roles = "paw"
                        }
                        else if (Roles == "6") {
                            Roles = "paw"
                        }
                        tRow += '<tr>';
                        tRow += '<td ><img  src="img/' + Roles + '.png" alt=""  class="img-responsive" alt="Memorebook" /></td>';
                        tRow += '<td><a>' + arrMyHouseMember[i].DisplayName + '</a></td>';
                        tRow += '<td>' + arrMyHouseMember[i].RoleName + '</td>';
                        tRow += '<td> <a style="cursor:pointer" onclick="DeleteHousehold(\'' + arrMyHouseMember[i].ID + '\',\'' + arrMyHouseMember[i].DisplayName + '\')"><i class="glyphicon glyphicon-trash"  title="Remove \'' + arrMyHouseMember[i].DisplayName + '\'"></i></a></td>';
                        tRow += '</tr>';
                    }
                    tRow += '</tbody>';
                  

                    $("#tbl_MyHousehold").html(tRow);
                    $("#tbl_MyHousehold").dataTable({
                        //    "bSort": false
                    });



                }
                $("#tbl_MyHousehold").empty().append(tRow);

            }
            else {
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
function AllRoles() {

    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/AllRoles",
        data: '',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var arrMyHouseMember = result.AllRoles;
                if (arrMyHouseMember != 0) {
                    $("#sel_Role").empty();
                   
                    var ddlRequest;
                    for (i = 0; i < arrMyHouseMember.length; i++) {
                        ddlRequest += '<option selected="selected" value="' + arrMyHouseMember[i].ID + '">' + arrMyHouseMember[i].RoleName + '</option>';
                    }
                    $("#sel_Role").append(ddlRequest);
                    $("#sel_Role").append('<option selected="selected" value="-">--Select--</option>');


                }
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
function change_autorefreshdiv() {
    var NAME = document.getElementById("MyHousehold");
    var All = document.getElementById("AddHouserhold");
    if (NAME.className === "tab-pane") {
        NAME.className = "tab-pane active";
        All.className = "tab-pane";
        document.getElementById("Add").style.background = "#333";
        $("#AddNew").html("");
    }
    else {
        NAME.className = "tab-pane";
        All.className = "tab-pane active";
        document.getElementById("Add").style.background = "#F58234";
        $("#AddNew").html(" > <li><a >Add Household Member </a></li>");
        
        MyHousehold();
    }
}

function SelectRole()
{
    var Roles = $('#sel_Role').val()
    $("#E-mail").val('');
    $("#FirstName").val('');
    $("#LastName").val('');
    $("#Birth").val('');
    $("#City").val('');
    $("#sel_State").val('');
    $("#Time").val('');
    $("#Time1").val('');
    $("#Weight").val('');
    $("#Weight1").val('');
    $("#Length").val('');
    $("#Head").val('');
    
    if (Roles == "2")
    {
        $("#Account").css("display", "");
        $("#mail").css("display", "");
        $("#First").css("display", "");
        $("#Last").css("display", "");
        $("#Birthday").css("display", "");
    }
    else if (Roles == "-") {
        $("#Account").css("display", "");
        $("#mail").css("display", "");
        $("#First").css("display", "");
        $("#Last").css("display", "");
        $("#Birthday").css("display", "");
    }
    else if (Roles == "1")
    {
        $("#Account").css("display", "");
        $("#mail").css("display", "");
        $("#First").css("display", "");
        $("#Last").css("display", "");
        $("#Birthday").css("display", "");
    }
    else if (Roles == "3") {
        $("#Account").css("display", "none");
        $("#mail").css("display", "none");
        $("#First").css("display", "");
        $("#Last").css("display", "none");
        $("#Birthday").css("display", "");
    }
    else if (Roles == "5") {
        $("#Account").css("display", "none");
        $("#mail").css("display", "none");
        $("#First").css("display", "");
        $("#Last").css("display", "none");
        $("#Birthday").css("display", "");
    }
    if (Roles == "6") {
        $("#Account").css("display", "");
        $("#mail").css("display", "");
        $("#First").css("display", "");
        $("#Last").css("display", "");
        $("#Birthday").css("display", "");
    }
    if (Roles == "4") {
        $("#Account").css("display", "");
        $("#mail").css("display", "");
        $("#First").css("display", "");
        $("#Last").css("display", "");
        $("#Birthday").css("display", "");
    }
    
}
function AddBirthDetails()
{
    $("#birthaDetails").css("display", ""); 
    $("#add").css("display", "");
    if ($("#birthaDetails").style.display == " ")
    {
        $("#birthaDetails").css("display", "");
        $("#add").css("display", "");
    }
    else
    {
        $("#birthaDetails").css("display", "none");
        $("#add").css("display", "none");
    }
}
function AllState() {

    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/AllState",
        data: '',
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.retCode == 1) {
                var arrState = result.AllState;
                if (arrState != 0) {
                    $("#sel_State").empty();

                    var ddlRequest;
                    for (i = 0; i < arrState.length; i++) {
                        ddlRequest += '<option selected="selected" value="' + arrState[i].StateID + '">' + arrState[i].StateName + '</option>';
                    }
                    $("#sel_State").append(ddlRequest);
                    $("#sel_State").append('<option selected="selected" value="-">--Select--</option>');


                }
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

function AddHouseMember()
{
    var Role = $("#sel_Role").val();
    var AC = $("#sel_Role").val();
    var email = $("#E-mail").val();
    var firstName= $("#FirstName").val();
    var lastName = $("#LastName").val();
    var Birth = $("#Birth").val();
    var city = $("#City").val();
    var State = $("#sel_State").val();
    var Time = $("#Time").val();
    var Time1 = $("#Time1").val();
    var Weight = $("#Weight").val();
    var Weight1 = $("#Weight1").val();
    var Length = $("#Length").val();
    var Head = $("#Head").val();
    if (Role == "1" || Role == "2" || Role == "4" || Role == "6")
    {
     
    var dataToPass = {
        Role: Role,
        AC: AC,
        email: email,
        firstName: firstName,
        lastName: lastName,
        Birth: Birth,
        city: city,
        State: State,
        Time: Time,
        Weight: Weight,
        Weight1:Weight1,
        Length: Length,
        Head: Head
    };
    var jsonText = JSON.stringify(dataToPass);
    $.ajax({
        type: "POST",
        url: "Usertimeline.asmx/AddHouseMember",
        data: jsonText,
        contentType: "application/json; charset=utf-8",
        datatype: "json",
        success: function (response) {
            var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
            if (result.Session == 0) {
                alert("Something went wrong!");
                return false;
            }
            if (result.retCode == 1) {
              
               
            }
            else {
                alert("Email Already Exist!!")
            }
        },
        error: function () {
        }
    });

    }
    else {
        var dataToPass = {
            Role: Role,
            firstName: firstName,
            Birth: Birth,
            city: city,
            State: State,
            Time: Time,
            Weight: Weight,
            Weight1: Weight1,
            Length: Length,
            Head: Head
        };
        var jsonText = JSON.stringify(dataToPass);
        $.ajax({
            type: "POST",
            url: "Usertimeline.asmx/AddDauhther",
            data: jsonText,
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                if (result.Session == 0) {
                    alert("Something went wrong!");
                    return false;
                }
                if (result.retCode == 1) {


                }
                else {
                }
            },
            error: function () {
            }
        });

    }
    
}
function DeleteHousehold(Id, Name) {
    if (confirm("Are you sure you want to delete " + Name + "?") == true) {
        $.ajax({
            type: "POST",
            url: "Usertimeline.asmx/DeleteHousehold",
            data: '{"Id":"' + Id + '"}',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                if (result.retCode == 1) {
                    window.location.href = 'Household-Members.aspx';
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