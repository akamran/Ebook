$(document).ready(function () {
    $("#copylink").css("display", "none")
    $("#sendemail").css("display", "none")
    $("#Invite").css("display", "none")
    document.getElementById("Add").style.background = "#F58234";
        $("#trFriendsDetails2 tr").remove();
        var regex = /^(.*)(\d)+$/i;
        var cloneCount = 2;
        $("#appendTR").click(function () {
            $("#td").css("display","")
            bvalid = true;
           
            $("#trFriendsDetails1").clone().appendTo("#trFriendsDetails2 tbody").attr("id", cloneCount).find("*").each(function () {
                var id = this.id || "";

                var match = id.match(regex) || [];
                if (match.length == 3) {
                    this.id = match[1] + (cloneCount);
                }
            });
            cloneCount++;
            $("#td").css("display", "none")
        });
        $('table').on('click', 'tr td i', function (e) {
            e.preventDefault();
            $(this).parents('tr').remove();
        });
    });
   
    var hiddenID;
    var hiddenGrpName;
    var RandomNumber
    var Activities;
    var arrMyExchanges;
    var tRow
    function UpdateExchange(GroupName, ID) {
        window.location.href = "#CreateExchange?GroupName=" + GroupName;
        if (location.href.indexOf('?') != -1) {

            hiddenID = ID;
            hiddenGrpName = GroupName;
            $("#txtExchangeName").val(GroupName);
            $("#AddNew").html("> Update Exchange ");
            $("#btnExchange").text('Update Exchange');
            $("#Invite").css("display", "")
            document.getElementById("Add").style.background = "#333";
            document.getElementById("Add1").style.background = "#F58234";
            GetRandomString()
        }
        else if (location.href.indexOf('?') == -1) {
            $("#btnExchange").text('Add Exchange');
        }
    };

    function clearExchange() {
       
        $("#btnExchange").text('Add Exchange');
        $("#txtExchangeName").val('');
    };


    //var GroupID;
    function MyExchanges() {

        //debugger;
        $("#tbl_MyExchanges tbody tr").remove();
        $.ajax({
            type: "POST",
            url: "DefaultHandler.asmx/MyExchanges",
            data: '',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                if (result.retCode == 1) {
                    arrMyExchanges = result.MyExchanges;
                    $("#tbl_AgencyStatement tbody tr").remove();

                    if (arrMyExchanges != 0) {
                        $('#lblStatus').css("display", "none");
                        tRow += '<thead>';
                        tRow += '<tr>';
                        tRow += '<th></th>';
                        tRow += '<th>Exchange</th>';
                        tRow += '<th>Exchange Owner</th>';
                        tRow += '<th>Create Date</th>';
                        tRow += '<th>Activities	</th>';
                        tRow += '<th>Members</th>';
                        tRow += '<th></th>';
                        tRow += '</tr>';
                        tRow += '</thead>';
                        tRow += '<tbody class="border">';
                        for (var i = 0; i < arrMyExchanges.length; i++) {
                                tRow += '<tr>';
                                tRow += '<td> <a href="#CreateExchange" onclick = "UpdateExchange(\'' + arrMyExchanges[i].GroupName + '\',\'' + arrMyExchanges[i].ID + '\')"  data-toggle="tab" ><span class="glyphicon glyphicon-edit"></span></a></td>';
                                tRow += '<td> <a href="Activity.aspx?GroupId=' + arrMyExchanges[i].ID + '">' + arrMyExchanges[i].GroupName + '</a></td>';
                                tRow += '<td><a href="#" id="CreatedBy' + (i + 1) + '">' + arrMyExchanges[i].FirstName + " " + arrMyExchanges[i].LastName + '</a></td>';
                                tRow += '<td>' + arrMyExchanges[i].CreatedDate + '</td>';
                                tRow += '<td><a href="#" id="activity' + (i + 1) + '">0</a></td>';
                                tRow += '<td><a href="Members.aspx" id="Member' + (i + 1) + '">0</a></td>';
                                tRow += '<td> <a style="cursor:pointer" onclick="DeleteExchange(\'' + arrMyExchanges[i].ID + '\',\'' + arrMyExchanges[i].GroupName + '\')"><span class="glyphicon glyphicon-trash"></span></a></td>';
                                tRow += '</tr>';
                                GroupName(arrMyExchanges[i].ID, (i));
                                var refreshId = setTimeout(GroupMembers(arrMyExchanges[i].ID, (i)), 3000);;
                        }
                        tRow += '</tbody>';
                        $("#tbl_MyExchanges").html(tRow);
                        $("#tbl_MyExchanges").dataTable({
                            //    "bSort": false
                        });



                    }
                    $("#tbl_MyExchanges").empty().append(tRow);

                }
                else {
                    $('#lblStatus').css("display", "block");
                }



                if (result.retCode == 0) {
                    //alert("Something went wrong! Please try again.")
                }
            },
           
        });

    }


    function CreateExchange() {
       
        var ExchangeName = document.getElementById("txtExchangeName").value;
        var i = 0
        var bValid = true;

        if (ExchangeName == "") {
            bValid = false;
            alert("Exchange Name cannot be blank");
            document.getElementById('txtExchangeName').focus();
            return false;
        }
        for (i; i < arrMyExchanges.length; i++) {
            if (ExchangeName == arrMyExchanges[i].GroupName)
            {
                alert("Exchange Already created");
                window.location.href = 'Exchange.aspx';
                    return false;
            }
        }

        if (bValid == true) {

           
            if ($("#btnExchange").text() == "Add Exchange") {
                $.ajax({
                    type: "POST",
                    url: "DefaultHandler.asmx/CreateExchange",
                    data: '{"ExchangeName":"' + ExchangeName + '"}',
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    success: function (response) {
                        var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                        if (result.retCode == 1) {
                            alert("Exchange Created");
                            SentMail();
                        }


                        if (result.retCode == 0) {
                            alert("Something went wrong! Please try again.")
                        }
                    },
                });
            }

            else if ($("#btnExchange").text() == "Update Exchange") {

                ExchangeName = document.getElementById("txtExchangeName").value
                $.ajax({
                    type: "POST",
                    url: "DefaultHandler.asmx/UpdateExchange",
                    data: '{"ID":"' + hiddenID + '","ExchangeName":"' + ExchangeName + '"}',
                    contentType: "application/json; charset=utf-8",
                    datatype: "json",
                    success: function (response) {
                        var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                        if (result.retCode == 1) {
                            alert("Exchange Upadated...");
                            SentMail();


                        }
                        if (result.retCode == 0) {
                            alert("Something went wrong! Please try again.")
                        }
                    },
                });

            }
        }
    }


    function DeleteExchange(GroupID, Name) {
       

        if (confirm("Are you sure you want to delete " + Name + "?") == true) {
           
            $.ajax({
                type: "POST",
                url: "DefaultHandler.asmx/DeleteExchange",
                data: '{"GroupID":"' + GroupID + '"}',
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {
                        window.location.href = 'Exchange.aspx';
                    }

                    
                },
               
            });
        }
    }
    function GetRandomString() {

        RandomNumber = $("#txtExchangeName").val();
        debugger
        $.ajax({
            type: "POST",
            url: "DefaultHandler.asmx/GetRandomString",
            data: '{"RandomNumber":"' + RandomNumber + '"}',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var Imagecode = response.d;
                var Url = "http://43.254.40.205/mem/Exchange.aspx?" + Imagecode
                $('#RandomString').val(Url);
            },
            
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
//// Email Sending Method ////
    function SentMail()
    {
        var TotaleMAIL = new Array();
        var TotalName = new Array();
        var ExchangeName = document.getElementById("txtExchangeName").value;
        var arrEmail = new Array();
        var Name = new Array();
        var Url = $('#RandomString').val();
        var j = 0;
        for (var i = 0; i < 4 ; i++) {
            arrEmail[j] = $('#Email1' + (i)).val();
            Name[j] = $('#First1' + (i)).val() +" "+ $('#Last1' + (i)).val();
            j++;
        }
        var arrMoreEmail = new Array();
        var arrName = new Array();
        
        var x = document.getElementById("trFriendsDetails2").rows.length;
        for (var i = 0; i < (x+1) ; i++) {
            arrMoreEmail[i] = $('#Email' + (i + 1)).val();
            arrName[i] = $('#First' + (i + 1)).val() + $('#Last' + (i + 1)).val();
        }
        if (arrMoreEmail != "" && arrName != "") {
            TotaleMAIL = arrayUnique(arrEmail.concat(arrMoreEmail));
            TotalName = arrayUnique(Name.concat(arrName));
        }
        else
        {
            TotaleMAIL = arrEmail;
            TotalName = Name;
        }
        var length = TotalName.length;
        for (var i = 0; i < length ; i++) {
            var dataToPass = {
                arrEmail: TotaleMAIL[i],
                arrName: TotalName[i],
                Url: Url,
                GroupName: ExchangeName,
            };
            var jsonText = JSON.stringify(dataToPass);
            $.ajax({
                type: "POST",
                url: "DefaultHandler.asmx/EmailSending",
                data: jsonText,
                contentType: "application/json; charset=utf-8",
                datatype: "json",
                success: function (response) {
                    var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                    if (result.retCode == 1) {
                        alert("Exchange Created @ Invitations are  Sent to the friends!!")
                        window.location.href = 'Exchange.aspx';

                    }
                    if (result.retCode == 0) {
                        window.location.href = 'Exchange.aspx';
                    }
                },
                
            });
        }
    }


    function copyToClipboard(element) {
        var $temp = $("<input>");
       // $("body").append($temp);
        $temp.val($(element).val()).select();
        document.execCommand("copy");
    }
    function arrayUnique(array) {
        var a = array.concat();
        for (var i = 0; i < a.length; ++i) {
            for (var j = i + 1; j < a.length; ++j) {
                if (a[i] === a[j])
                    a.splice(j--, 1);
            }
        }

        return a;
    };
    function GroupName(GroupID,i) {
        $.ajax({
            type: "POST",
            url: "DefaultHandler.asmx/MyActivities",
            data: '{"GroupID":"' + GroupID + '"}',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                if (result.retCode == 1) {
                    var MyGroup = result.MyActivities;
                    if (MyGroup != 0) {
                        Activities = MyGroup.length
                        if (Activities != "")
                        {
                            $('#activity' + (i + 1)).text(Activities);
                        }
                        else if (Activities = "") {
                            var count = 0;
                            $('#activity' + (i + 1)).text(count);
                        }
                       
                    }

                }
                else {
                    $('#lblstatus').css("display", "block");
                }
                if (result.retcode == 0) {
                    var count = 0;
                    $('#activity' + (i + 1)).text(count);
                }
            },
           
        });
    }
    function GroupMembers(GroupID, i) {
        var NumberofMember
        $.ajax({
            type: "POST",
            url: "DefaultHandler.asmx/GroupMembers",
            data: '{"GroupID":"' + GroupID + '"}',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                if (result.retCode == 1) {
                    var MyMembers = result.GroupMembers;
                    if (MyMembers != 0) {
                        NumberofMember = MyMembers.length
                        if (NumberofMember != "") {
                            $('#Member' + (i + 1)).text(NumberofMember);
                        }
                        else if (NumberofMember = "") {
                            var count = 0;
                            $('#Member' + (i + 1)).text(count);
                        }

                    }

                }
                else {
                    $('#lblstatus').css("display", "block");
                }
                if (result.retcode == 0) {
                    var count = 0;
                    $('#Member' + (i + 1)).text(count);
                }
            },

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
            $("#AddNew").html("");
            window.location.href = "Exchange.aspx";
        }
        else {
            NAME.className = "tab-pane";
            All.className = "tab-pane active";
            document.getElementById("Add").style.background = "#333";
            document.getElementById("Add1").style.background = "#F58234";
            $("#AddNew").html("> Add Exchange ");
            $("#copylink").css("display", "")
            $("#sendemail").css("display", "")
            //MyExchanges();
        }
    }

    function InviteFriends()
    {
        $("#copylink").css("display", "")
        $("#sendemail").css("display", "")
        $("#Invite").css("display", "none")
        $("#NotInvite").css("display", "")
    }
    function UpdateOnly() {
        $("#copylink").css("display", "none")
        $("#sendemail").css("display", "none")
        $("#Invite").css("display", "")
        $("#NotInvite").css("display", "none")
    }

    function InvitedUser()
    {
        $.ajax({
            type: "POST",
            url: "DefaultHandler.asmx/GroupMembers",
            data: '{"GroupID":"' + GroupID + '"}',
            contentType: "application/json; charset=utf-8",
            datatype: "json",
            success: function (response) {
                var result = (typeof response.d) == 'string' ? eval('(' + response.d + ')') : response.d;
                if (result.retCode == 1) {
                    var MyMembers = result.GroupMembers;
                    if (MyMembers != 0) {
                        NumberofMember = MyMembers.length
                        if (NumberofMember != "") {
                            $('#Member' + (i + 1)).text(NumberofMember);
                        }
                        else if (NumberofMember = "") {
                            var count = 0;
                            $('#Member' + (i + 1)).text(count);
                        }

                    }

                }
                else {
                    $('#lblstatus').css("display", "block");
                }
                if (result.retcode == 0) {
                    var count = 0;
                    $('#Member' + (i + 1)).text(count);
                }
            },

        });
    }