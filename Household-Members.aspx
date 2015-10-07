<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Household-Members.aspx.cs" Inherits="Household_Members" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>MemorEbook – Household Members</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/styles-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="Scripts/Logout.js"></script>
    <script type="text/javascript" src="js2/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/Household-Members.js"></script>
    
    <%--<script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>--%>

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
                    <img src="images/logo.png" alt="Memorebook" /></a>
            </div>

            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav cusome-black">
                    <li>
                        <a style="cursor: pointer" onclick="change_autorefreshdiv()" id="Add">Add Household Members</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right custom-tommenu">
                   <li href="Timeline.aspx" class="dropdown active">
                        <a href="Timeline.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEhome"><i>
                            <img src="images/icon-memorebook.png" alt=""></i></span></a>
                    </li>

                    <li href="Exchange.aspx">
                        <a href="Exchange.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorExchange"><i>
                            <img src="images/icon-memorexchange.png" alt=""></i></span></a>
                    </li>

                    <li href="UserTimeLine.aspx" class="dropdown ">
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
    <div class="container">
        <div class="row">
            <ul class="breadcrmul">
                <li style="cursor: pointer" onclick="change_autorefreshdiv()" class="active"><a href="Timeline.aspx">MemorEbook </a></li>
                >
           <li style="cursor: pointer" class="active"><a href="Household-Members.aspx">My Household Member </a></li>
                 <li id="AddNew"><a href="#"></a></li>
            </ul>
            <div class="tab-content">


                <div role="tabpanel" class="tab-pane active" id="MyHousehold" >
                    <div class="table-responsive">
                        <table class="table stmTbl" id="tbl_MyHousehold" style="width:50%">
                        </table>
                    </div>
                </div>


                <div role="tabpanel" class="tab-pane" id="AddHouserhold">
                    <form class="form-horizontal clearfix">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Role</label>
                                                <div class="col-sm-8">
                                                    <select class="form-control" name="select" id="sel_Role" onclick="SelectRole()">
                                                        <option value="">Select</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="display: none" id="Account">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Account Contributor</label>
                                                <div class="col-sm-8">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="yes">
                                                        Yes
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="no">
                                                        No
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="display: none" id="mail">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">E-mail</label>
                                                <div class="col-sm-8">
                                                    <input type="email" class="form-control" id="E-mail" placeholder="email">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="display: none" id="First">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">First Name</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="FirstName" placeholder="First-Name">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="display: none" id="Last">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Last-Name</label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="form-control" id="LastName" placeholder="Last-Name">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row" style="display: none" id="Birthday">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="inputEmail3" class="col-sm-4 control-label">Birthday</label>
                                                <div class="col-sm-5">
                                                    <input type="date" class="form-control" size="12" id="Birth" />
                                                </div>
                                                <div class="col-sm-3">
                                                    <span class="question">
                                                        <img src="images/questiong.png" alt="" /></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div>&nbsp;</div>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-sm-3">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div>&nbsp;</div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <hr class="doted" />
                        </div>
                        <div class="col-sm-12">
                            <ul class="breadcrmul">
                                <li class="active"><a style="cursor: pointer" onclick="AddBirthDetails()">Add birth stats now </a></li>

                            </ul>
                           <div class="row">
               <div class="col-sm-6" style="display:none" id="birthaDetails">
                <div class="row">
                 <div class="col-sm-12">
                   <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label">City</label>
                    <div class="col-sm-4">
                      <input type="text" class="form-control" id="City" placeholder="city">
                    </div>
                    
                    <label for="inputEmail3" class="col-sm-1 control-label">State</label>
                    <div class="col-sm-3">
                      <select class="form-control" name="select" id="sel_State">
                       <option value="">Select</option>
                      </select>
                    </div>
                  </div>
                  
                   <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label">Time</label>
                    <div class="col-sm-2">
                      <input type="text" class="form-control" id="Time" placeholder="">
                    </div>
                    
                    <div class="col-sm-2">
                      <input type="text" class="form-control" id="Time1" placeholder="">
                    </div>
                    
                  </div>
                  
                   <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label"> Weight </label>
                    
                    <div class="col-sm-2">
                      <input type="text" class="form-control" id="Weight" placeholder="">
                    </div>
                    <span class="list-inline-lable">lbs</span>
                    
                    <div class="col-sm-2">
                      <input type="text" class="form-control" id="Weight1" placeholder="">
                    </div>
                    <span class="list-inline-lable">oz</span>
                  </div>
                  
                   <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label"> Length </label>
                    
                    <div class="col-sm-2">
                      <input type="text" class="form-control" id="Length" placeholder=""/>
                    </div>
                    
                  </div>
                  
                   <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label"> Head </label>
                    
                    <div class="col-sm-2">
                      <input type="text" class="form-control" id="Head" placeholder=""/>
                    </div>
                    
                  </div>
                 </div>
                </div>
                
                
                
                
               </div><!--col-sm-6-->
                <div class="col-sm-12" style="display:none" id="add">
              <hr class="doted" />
             </div>
             
             <div class="col-sm-12">
              
              <div class="form-group">
                <label class="col-sm-2 control-label" style="cursor: pointer" onclick="change_autorefreshdiv()">Cancel</label>
                <div class="col-sm-4">
                  <div class="link mrg-zero"> <input type="submit" class="btn btn-primary btn-black mrg-zero" value="Save" onclick="AddHouseMember()" /></div>
                </div>
              </div>
               <div class="col-sm-3">
                <div class="row">
                 <div class="col-sm-12">
                   <div>&nbsp;</div>
                 </div>
                </div>
             
               </div>
               
               <div class="col-sm-3">
                <div class="row">
                 <div class="col-sm-12">
                   <div>&nbsp;</div>
                 </div>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/packery-mode.pkgd.js"></script>
    <script>
        /*$('.grid').isotope({
			//layoutMode: 'packery',
		  itemSelector: '.grid-item',
		  percentPosition: true,
		  masonry: {
			// use outer width of grid-sizer for columnWidth
			columnWidth: '.grid-sizer',
			columnWidth: 50,
  			gutter: 63
		  }
		})*/
        $(document).ready(function () {

            $('.gallery-grid').isotope({
                layoutMode: 'packery',
                itemSelector: '.gallery-grid-item',
                percentPosition: true,
                packery: {
                    gutter: '.gallery-gutter-sizer'
                }
            })

        });
    </script>
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

            $('input.typeahead').typeahead({

                name: 'accounts',

                local: ['Audi', 'BMW', 'Bugatti', 'car', 'Ferrari', 'Ford', 'Great', 'Lamborghini', 'Mercedes Benz', 'Porsche', 'Rolls-Royce', 'Volkswagen', 'user', 'memories ', '2013', '2012 Family', 'acme', 'all', 'arrow']

            });

        });

    </script>
    <script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
    <script>
        $(function () {
            $('#namescroll').slimScroll({
                height: '150px'
            });
        });
    </script>
</body>
</html>
