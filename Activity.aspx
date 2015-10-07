<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Activity.aspx.cs" Inherits="MemorEbook.Activity" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>MemorEbook</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/styles-responsive.css" rel="stylesheet">
       <script type="text/javascript" src="js2/jquery.min.js"></script>
      <script src="Scripts/Activity2.js"></script>
      <script type="text/javascript" src="Scripts/Logout.js"></script>
      
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
          
          <a class="navbar-brand" href="#"><img src="images/logo.png" alt="Memorebook"></a>
        </div>
          
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav cusome-black">
              <li onclick="MyActivities();">
                  <a href="#MyActivities" aria-controls="home" role="tab" data-toggle="tab" class="active" onclick="change_autorefreshdiv()" id="Add">My Activities</a>
              </li>
              <li onclick="clearActivity();">
                  <a href="#CreateActivity" aria-controls="CreateActivity" role="tab" data-toggle="tab" onclick="change_autorefreshdiv()" id="Add1">Create Activity</a>
              </li>
          </ul>
           
      <ul  class="nav navbar-nav navbar-right custom-tommenu">

                   <li href="Timeline.aspx" class="dropdown ">
                         <a href="Timeline.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEhome"><i>
                            <img src="images/icon-memorebook.png" alt=""></i></span></a>
                    </li>

                    <li href="Exchange.aspx" class="dropdown active">
                        <a href="Exchange.aspx" ><span data-toggle="tooltip" data-placement="bottom" title="memorExchange"><i><img src="images/icon-memorexchange.png" alt=""></i></span></a>
                    </li>

                    <li href="UserTimeLine.aspx" class="dropdown">
                        <a  href="UserTimeLine.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEmingle"><i><img src="images/icon-memoremingle.png" alt=""></i></span></a>
                    </li>
                   
                     <li class="dropdown">
                        <a class="dropdown-toggle" aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" href="#"><span data-toggle="tooltip" data-placement="bottom" title="Settings"><i><img src="images/icon-memoresetting.png" alt=""></i></span></a>
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
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    <nav id="mainheader-small" class="navbar navbar-default navbar-fixed-top hide-h">
      <div class="container">
        <div class="navbar-header">
          
          
          <a class="navbar-brand" href="#"><img src="images/logo.png" alt="Memorebook"></a>
        </div>
        <div>
          <ul class="nav navbar-nav navbar-right custom-tommenu">
            <li class="arrowHeader">
        	<a href="#" id="arrowheader-small"><i class="glyphicon glyphicon-chevron-down"></i></a>
            	
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <!-- HEADER END-->
    
    <div class="container">
    	<div class="row">
        	<ul class="breadcrmul mrg-btm">
             <li class="active"> <a href="Exchange.aspx"> My Exchanges </a></li>
             >
             <li> <a id="GroupName" title="Group Name"></a></li>
                 <li> <a id="AddNew" title="Group Name"></a></li>
            </ul>
            

            <div class="tab-content">


                <div role="tabpanel" class="tab-pane active" id="MyActivities">
                    <div class="create-by">
                        <span> Created by <a id="Created"></a></span>
                        <strong> Created on : <label id="Date"></label></strong>
                    </div>

                    <div class="table-responsive">
                        <table class="table stmTbl" id="tbl_MyActivity">
                        </table>
                    </div>
                </div>


                <div role="tabpanel" class="tab-pane" id="CreateActivity" >
                    <form class="form-horizontal clearfix">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Activity Name</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="txtActivityName" placeholder="name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label">Activity Date</label>
                            <div class="col-sm-4">
                                <input type="date" class="form-control" id="txtActivityDate" placeholder="name">
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <hr class="doted" />
                        </div>

                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label" style="cursor:pointer" onclick=" change_autorefreshdiv()">Cancel</label>
                                <div class="col-sm-4">
                                    <div class="link mrg-zero"> 
                                        <%--<input type="submit" class="btn btn-primary btn-black mrg-zero" value="Next" />--%>
                                        <button type="submit" class="btn btn-primary btn-black mrg-zero" id="btnActivity" onclick="CreateActivity();">Add Activity</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>


            </div>

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