<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exchange.aspx.cs" Inherits="MemorEbook.Exchange" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>MemorEbook : Exchanges</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/styles-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
      <script type="text/javascript" src="js2/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/Exchange.js"></script>
    <script type="text/javascript" src="Scripts/Logout.js"></script>
    <script type="text/javascript" src="Scripts/CheckSession.js"></script>
    <style>
        tr {
            height: 45px;
        }
    </style>
</head>
<body>
    <nav id="mainheader" class="navbar navbar-default navbar-fixed-top visible-h">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="#">
                    <img src="images/logo.png" alt="Memorebook"></a>
            </div>

            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav cusome-black">
                    <li>
                        <a href="#MyExchnanges" aria-controls="home" role="tab" data-toggle="tab" class="active" id="Add" onclick="change_autorefreshdiv()">My Exchanges</a>
                    </li>
                    <li onclick="clearExchange();">
                        <a href="#CreateExchange" aria-controls="CreateExchange" role="tab" data-toggle="tab" id="Add1" onclick="change_autorefreshdiv()">Create Exchange</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right custom-tommenu">

                    <li href="Timeline.aspx" class="dropdown ">
                        <a href="Timeline.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEhome"><i>
                            <img src="images/icon-memorebook.png" alt=""></i></span></a>
                    </li>

                    <li href="Exchange.aspx" class="dropdown active">
                        <a href="Exchange.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorExchange"><i>
                            <img src="images/icon-memorexchange.png" alt=""></i></span></a>
                    </li>

                    <li href="UserTimeLine.aspx" class="dropdown">
                        <a href="UserTimeLine.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEmingle"><i>
                            <img src="images/icon-memoremingle.png" alt=""></i></span></a>
                    </li>

                    <li class="dropdown">
                        <a class="dropdown-toggle" aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" href="#"><span data-toggle="tooltip" data-placement="bottom" title="Settings"><i>
                            <img src="images/icon-memoresetting.png" alt=""></i></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="Household-Members.aspx">My Household</a></li>
                            <li><a href="Friends-Relatives.aspx">Friends &amp; relatives</a></li>
                            <li><a href="#">Notifications</a></li>
                            <li><a href="#">Subscriptions</a></li>
                            <li><a href="#">Special offers</a></li>
                            <li><a href="#" onclick="btnLogout_Click();">Sign Out</a></li>
                        </ul>
                    </li>
                    <li class="arrowHeader">
                        <a href="#" id="arrowheader"><i class="glyphicon glyphicon-chevron-down"></i></a>

                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>

    <nav id="mainheader-small" class="navbar navbar-default navbar-fixed-top hide-h">
        <div class="container">
            <div class="navbar-header">


                <a class="navbar-brand" href="#">
                    <img src="images/logo.png" alt="Memorebook"></a>
            </div>
            <div>
                <ul class="nav navbar-nav navbar-right custom-tommenu">
                    <li class="arrowHeader">
                        <a href="#" id="arrowheader-small"><i class="glyphicon glyphicon-chevron-down"></i></a>

                    </li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- HEADER END-->

    <div class="container">
        <div class="row">
            <ul class="breadcrmul">
                <li class="active"><a href="Exchange.aspx">My Exchanges </a></li>
                 <li class="active" id="AddNew"><a href="#"></a></li>
            </ul>
            <div class="tab-content">


                <div role="tabpanel" class="tab-pane active" id="MyExchnanges">
                    <div class="table-responsive">
                        <table class="table stmTbl" id="tbl_MyExchanges">
                        </table>
                    </div>
                </div>

                <label style="display:none" id="lblactivity"></label>
                <div role="tabpanel" class="tab-pane" id="CreateExchange">
                    <form class="form-horizontal clearfix">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Exchange Name</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="txtExchangeName" placeholder="name" onchange="GetRandomString()">
                            </div>
                        </div>

                        <div class="form-group">
                           
                            <div class="col-sm-10">
                                &nbsp;
                            </div>
                            <div class="row" >
                                 <div class="gridbrd-botm" >
                                    <div class="pull-right book-info" style="display:none" id="Invite">
                                        <a  style="cursor: pointer" onclick="InviteFriends()">
                                            <h4 class="">
                                               <i class="glyphicon glyphicon-chevron-down"></i>
                                                Send Mail to Friends </h4>
                                        </a>
                                    </div>
                                     <div class="pull-right book-info" style="display:none" id="NotInvite">
                                        <a  style="cursor: pointer" onclick="UpdateOnly()">
                                            <h4 class="">
                                               <i class="glyphicon glyphicon-chevron-up"></i>
                                                Send Mail to Friends </h4>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div style="display:none" id="copylink">
                        <div class="col-sm-11 col-sm-offset-1">
                        </div>
                            <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label"> Member Invitations</label>
                            <div class="col-sm-10">
                                &nbsp;
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">&nbsp; </label>
                            <div class="col-sm-10">
                                 <p>Invite your friend to join your Exchange! If ypu are not ready to send invites just create your exchange and come back later copy the link and send them an email.</p>
                            </div>
                        </div>
                        
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label lbl-pad">&nbsp; </label>
                                <div class="col-sm-4">
                                    <span class="span-info"> <br /> </span>
                                    <input type="text" class="form-control" id="RandomString" placeholder="name">
                                </div>
                                <div class="col-sm-2">
                                    <div class="link">
                                        <input type="button" class="btn btn-primary btn-black" value="Copy Link"  onclick="copyToClipboard('#RandomString')"/>
                                    </div>
                                </div>
                            </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">OR</label>
                            <div class="col-sm-10">
                                &nbsp;
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">&nbsp; </label>
                            <div class="col-sm-10">
                                <p>Let us send the email for you! just enter in the email and we will do rest.</p>
                            </div>
                        </div>
                            </div>
                        <div class="col-sm-12"  style="display:none" id="sendemail" >
                            <div class="row">
                                  <table style="width: 100%;" id="tbl_Main">
                                    <thead></thead>
                                    <tbody class="form-group" style="width: 100%" >
                                        <tr class="row"  style="width: 100%">
                                            <td style="float:left"  >
                                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25% ">
                                                <input type="email" class="form-control" id="Email10" placeholder="Email">
                                            </td>
                                            <td style="float:left">
                                                <label for="inputEmail3" class="col-sm-2 control-label">First</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="First10" placeholder="not required">
                                            </td>
                                            <td style="float:right">
                                                <label for="inputEmail3" class="col-sm-2 control-label">Last</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="Last10" placeholder="not required">
                                            </td>
                                          <td><br /></td>

                                        </tr>
                                        <tr class="row"  style="width: 100%">
                                            <td style="float:left"  >
                                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25% ">
                                                <input  class="form-control" id="Email11" placeholder="Email">
                                            </td>
                                            <td style="float:left">
                                                <label for="inputEmail3" class="col-sm-2 control-label">First</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="First11" placeholder="not required">
                                            </td>
                                            <td style="float:right">
                                                <label for="inputEmail3" class="col-sm-2 control-label">Last</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input class="form-control" id="Last11" placeholder="not required">
                                            </td>
                                          <td><br /></td>

                                        </tr>
                                        <tr style="width: 100%">
                                            <td style="float:left"  >
                                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25% ">
                                                <input type="email" class="form-control" id="Email12" placeholder="Email">
                                            </td>
                                            <td style="float:left">
                                                <label for="inputEmail3" class="col-sm-2 control-label">First</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="First12" placeholder="not required">
                                            </td>
                                            <td style="float:right">
                                                <label for="inputEmail3" class="col-sm-2 control-label">Last</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input class="form-control" id="Last12" placeholder="not required">
                                            </td>
                                            <td><br /></td>

                                        </tr>
                                        <tr style="width: 100%">
                                            <td style="float:left"  >
                                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25% ">
                                                <input  type="email" class="form-control" id="Email13" placeholder="Email">
                                            </td>
                                            <td style="float:left">
                                                <label for="inputEmail3" class="col-sm-2 control-label">First</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="First13" placeholder="not required">
                                            </td>
                                            <td style="float:right">
                                                <label for="inputEmail3" class="col-sm-2 control-label">Last</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="Last13" placeholder="not required">
                                            </td>
                                            <td><br /></td>

                                        </tr>
                                        <tr class="row" id="trFriendsDetails1" style="width: 100%" >
                                            <td style="float:left"  >
                                                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25% ">
                                                <input type="email" class="form-control" id="Email1" placeholder="Email">
                                            </td>
                                            <td style="float:left">
                                                <label for="inputEmail3" class="col-sm-2 control-label">First</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input  class="form-control" id="First1" placeholder="not required">
                                            </td>
                                            <td style="float:right">
                                                <label for="inputEmail3" class="col-sm-2 control-label">Last</label>
                                            </td>
                                            <td class="col-sm-4" style="width: 25%">
                                                <input class="form-control" id="Last1" placeholder="not required">
                                            </td>
                                            <td style="display:none" id="td"><a style="cursor:pointer"><i class="glyphicon glyphicon-trash" href="#"></i></a></td>

                                        </tr>
                                    </tbody>

                                </table>

                            </div>
                            <div class="row">
                                <table id="trFriendsDetails2"  style="width: 102.1%">
                                    <thead style="width: 100%"></thead>
                                    <tbody style="width: 100%"></tbody>
                                </table>
                                 <br />
                                 <div class="gridbrd-botm">
                                    <div class="pull-right book-info">
                                        <a id="appendTR" style="cursor: pointer">
                                            <h4 class="">
                                                <img src="images/iconplus-hover.png" alt="">
                                                Add More Friends </h4>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <hr class="doted" />
                        </div>

                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label" onclick="change_autorefreshdiv()" style="cursor:pointer">Cancel</label>
                                <div class="col-sm-4">
                                    <div class="link mrg-zero">
                                        <%--<input type="submit" class="btn btn-primary btn-black mrg-zero" id="btnExchange" onclick="CreateExchange();" value="Create Exchnanges" />--%>
                                        <button type="button" class="btn btn-primary btn-black mrg-zero" id="btnExchange" onclick="CreateExchange()">Add Exchange</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>


            </div>
            <!-- tab-content -->

        </div>
    </div>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/typeahead.min.js"></script>
    <script>
        $('#arrowheader').on('click', function () {
            $('#mainheader').addClass('hide-h').removeClass('visible-h');
            $('#mainheader-small').addClass('visible-h').removeClass('hide-h');
            $('body').addClass('bodytop');
        });
        $('#arrowheader-small').on('click', function () {
            $('#mainheader-small').addClass('hide-h').removeClass('visible-h');
            $('#mainheader').addClass('visible-h').removeClass('hide-h');
            $('body').removeClass('bodytop');
        });
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })



        $(document).ready(function () {
            debugger;
            CheckSession();
            MyExchanges();
            $('input.typeahead').typeahead({

                name: 'accounts',

                local: ['Audi', 'BMW', 'Bugatti', 'car', 'Ferrari', 'Ford', 'Great', 'Lamborghini', 'Mercedes Benz', 'Porsche', 'Rolls-Royce', 'Volkswagen', 'user', 'memories ', '2013', '2012 Family', 'acme', 'all', 'arrow']

            });

        });

        $('.grid').isotope({
            // options
            itemSelector: '.grid-item',
            layoutMode: 'fitRows',
            masonry: {
                gutter: 20
            }
        });
    </script>
</body>
</html>
