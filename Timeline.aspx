<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Timeline.aspx.cs" Inherits="Timeline" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>MemorEbook: MemorMingle </title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/styles-responsive.css" rel="stylesheet" />
    <link href="css/jquery.bxslider.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />

    <script type="text/javascript" src="Scripts/Logout.js"></script>
    <script type="text/javascript" src="js2/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/Timeline.js"></script>
    <script type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="Scripts/CheckSession.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider.js"></script>
    <script  type="text/javascript" src="js/jquery.slimscroll.min.js"></script>
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
            CheckSession();
            GetCurrentUser();
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
                height: '140px'
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('.bxslider').bxSlider({
                pager: false
            });
        });
    </script>


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
            <div class="pull-left">
                <div class="dropdown greenbottonholder">
                    <button id="dLabel" type="button" class="navbar-toggle navbar-green-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dLabel" id="ul_MyFriendsList">
                       <li class="dropdown-header" style="cursor:pointer"><i><img src="images/user-icon.png" alt="My Household"/></i>  My Household </li>
                        <ul id="namescroll">

                            <li><a href="#">"No Friends Found"</a></li>
                        </ul>
                        <li class="dropdown-footer"><a href="Household-Members.aspx"><i></i><u>Add more</u></a></li>
                    </ul>

                </div>
            </div>
            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav cusome-black">
                    <li>
                        <a href="#">Add memories</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right custom-tommenu">
                    
                    <li href="Timeline.aspx" class="dropdown active ">
                        <a href="Timeline.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEhome"><i>
                            <img src="images/icon-memorebook.png" alt=""></i></span></a>
                    </li>

                    <li href="Exchange.aspx">
                        <a href="Exchange.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorExchange"><i>
                            <img src="images/icon-memorexchange.png" alt=""></i></span></a>
                    </li>

                   <li href="UserTimeLine.aspx" class="dropdown">
                         <a href="UserTimeLine.aspx"><span data-toggle="tooltip" data-placement="bottom" title="memorEmingle"><i><img src="images/icon-memoremingle.png" alt=""></i></span></a>
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
            <div class="col-sm-12">

                <div class="bx-wrapper" style="max-width: 100%; margin: 0px auto;">
                    <div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 1257px;">
                        <ul class="bxslider" style="width: 415%; position: relative; transition-duration: 0s; transform: translate3d(-2320px, 0px, 0px);">
                            <li style="float: left; list-style: none; position: relative; width: 1140px;" class="bx-clone">
                                <div class="gallery-grid" style="position: relative; height: 1219px;">


                                    <!-- .grid-sizer empty element, only used for element sizing -->
                                    <div class="gallery-grid-sizer"></div>
                                    <div class="gallery-gutter-sizer"></div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 0%; top: 0px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/2.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 40.8182%; top: 0px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-10.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 77.6364%; top: 0px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-users.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/video.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 40.8182%; top: 317px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-imguser.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-09.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width2" style="position: absolute; left: 0%; top: 408px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail" src="images/1.jpg" alt="">
                                            </div>
                                            <div class="photocount">11/23</div>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 39.8182%; top: 699px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail " src="images/img-spncr-1.jpg" alt="">
                                            </div>
                                            <div class="photocount">Sponsored</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 0%; top: 1037px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' One year checkup!</div>
                                            <div class="framecontent">
                                                <ul>
                                                    <li>First Steps!</li>
                                                    <li>Second Steps!</li>
                                                    <li>third Steps!</li>
                                                </ul>
                                            </div>

                                            <div class="photocount">10/25 John Smith</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="float: left; list-style: none; position: relative; width: 1140px;">
                                <div class="gallery-grid" style="position: relative; height: 1184px;">


                                    <!-- .grid-sizer empty element, only used for element sizing -->
                                    <div class="gallery-grid-sizer"></div>
                                    <div class="gallery-gutter-sizer"></div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 0%; top: 0px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-users.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/video.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width2" style="position: absolute; left: 36.7544%; top: 0px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail" src="images/1.jpg" alt="">
                                            </div>
                                            <div class="photocount">11/23</div>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 0%; top: 582px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail " src="images/img-spncr-1.jpg" alt="">
                                            </div>
                                            <div class="photocount">Sponsored</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 40.7018%; top: 582px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' One year checkup!</div>
                                            <div class="framecontent">
                                                <ul>
                                                    <li>First Steps!</li>
                                                    <li>Second Steps!</li>
                                                    <li>third Steps!</li>
                                                </ul>
                                            </div>

                                            <div class="photocount">10/25 John Smith</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 76.4912%; top: 0px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-imguser.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-09.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 0%; top: 929px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-10.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 36.7544%; top: 935px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/2.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="float: left; list-style: none; position: relative; width: 1140px;">
                                <div class="gallery-grid" style="position: relative; height: 1247px;">


                                    <!-- .grid-sizer empty element, only used for element sizing -->
                                    <div class="gallery-grid-sizer"></div>
                                    <div class="gallery-gutter-sizer"></div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 0%; top: 0px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/2.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 40.7018%; top: 0px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-10.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 77.4561%; top: 0px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-users.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/video.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 40.7018%; top: 325px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-imguser.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-09.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width2" style="position: absolute; left: 0%; top: 420px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail" src="images/1.jpg" alt="">
                                            </div>
                                            <div class="photocount">11/23</div>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 39.7368%; top: 718px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail " src="images/img-spncr-1.jpg" alt="">
                                            </div>
                                            <div class="photocount">Sponsored</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 0%; top: 1065px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' One year checkup!</div>
                                            <div class="framecontent">
                                                <ul>
                                                    <li>First Steps!</li>
                                                    <li>Second Steps!</li>
                                                    <li>third Steps!</li>
                                                </ul>
                                            </div>

                                            <div class="photocount">10/25 John Smith</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li style="float: left; list-style: none; position: relative; width: 1140px;" class="bx-clone">
                                <div class="gallery-grid" style="position: relative; height: 1152px;">


                                    <!-- .grid-sizer empty element, only used for element sizing -->
                                    <div class="gallery-grid-sizer"></div>
                                    <div class="gallery-gutter-sizer"></div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 0%; top: 0px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-users.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/video.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width2" style="position: absolute; left: 36.8182%; top: 0px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail" src="images/1.jpg" alt="">
                                            </div>
                                            <div class="photocount">11/23</div>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 0%; top: 562px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img class="thumbnail " src="images/img-spncr-1.jpg" alt="">
                                            </div>
                                            <div class="photocount">Sponsored</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 40.8182%; top: 562px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' One year checkup!</div>
                                            <div class="framecontent">
                                                <ul>
                                                    <li>First Steps!</li>
                                                    <li>Second Steps!</li>
                                                    <li>third Steps!</li>
                                                </ul>
                                            </div>

                                            <div class="photocount">10/25 John Smith</div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 76.6364%; top: 0px;">
                                        <div class="framebox">
                                            <span class="green-user">
                                                <img src="images/green-imguser.png" alt="">
                                            </span>
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-09.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item" style="position: absolute; left: 0%; top: 900px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/img-10.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                    <div class="gallery-grid-item gallery-grid-item-width3" style="position: absolute; left: 36.8182%; top: 909px;">
                                        <div class="framebox">
                                            <div class="title">Marcus' First Steps!</div>
                                            <div class="framecontent">
                                                <img src="images/2.jpg" alt="">
                                            </div>
                                            <span class="plus-infobox">2 <i class=" glyphicon glyphicon-heart"></i></span>
                                            <span class="heart-infobox">2 <i class="glyphicon glyphicon-option-horizontal"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="footer-timeline">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">

                    <div class="timelinediv">
                        <div class="carousel-inner" id="MemoryListDates">
                            <div class="thumbnail-carouselyear">
                                <div class="carousel slide" id="myCarouselYear">
                                    <div class="carousel-inner" id="timelineslider">
                                        <div class="item">
                                            <div class="row-fluid active">
                                                <ul class="dateUL">
                                                    <li><a year="1999" month="1" class="year"></a><span>JAN 1999</span></li>
                                                    <li><a year="1999" month="2" class="year"></a><span>FEB 1999</span></li>
                                                    <li><a year="1999" month="3" class="year"></a><span>MAR 1999</span></li>
                                                    <li><a year="1999" month="4" class="year"></a><span>APL 1999</span></li>
                                                    <li><a year="1999" month="5" class="year"></a><span>MAY 1999</span></li>
                                                    <li><a year="1999" month="6" class="year"></a><span>JUN 1999</span></li>
                                                    <li><a year="1999" month="7" class="year"></a><span>JUL 1999</span></li>
                                                    <li><a year="1999" month="8" class="year"></a><span>AUG 1999</span></li>
                                                    <li><a year="1999" month="9" class="year"></a><span>SEP 1999</span></li>
                                                    <li><a year="1999" month="10" class="year"></a><span>OCT 1999</span></li>
                                                    <li><a year="1999" month="11" class="year"></a><span>NOV 1999</span></li>
                                                    <li><a year="1999" month="12" class="year"></a><span>DEC 1999</span></li>
                                                    <li><a year="2000" month="1" class="year"></a><span>JAN 2000</span></li>
                                                    <li><a year="2000" month="2" class="year"></a><span>FEB 2000</span></li>
                                                    <li><a year="2000" month="3" class="year"></a><span>MAR 2000</span></li>
                                                    <li><a year="2000" month="4" class="year"></a><span>APL 2000</span></li>
                                                    <li><a year="2000" month="5" class="year"></a><span>MAY 2000</span></li>
                                                    <li><a year="2000" month="6" class="year"></a><span>JUN 2000</span></li>
                                                    <li><a year="2000" month="7" class="year"></a><span>JUL 2000</span></li>
                                                    <li><a year="2000" month="8" class="year"></a><span>AUG 2000</span></li>
                                                    <li><a year="2000" month="9" class="year"></a><span>SEP 2000</span></li>
                                                    <li><a year="2000" month="10" class="year"></a><span>OCT 2000</span></li>
                                                    <li><a year="2000" month="11" class="year"></a><span>NOV 2000</span></li>
                                                    <li><a year="2000" month="12" class="year"></a><span>DEC 2000</span></li>
                                                    <li><a year="2001" month="1" class="year"></a><span>JAN 2001</span></li>
                                                    <li><a year="2001" month="2" class="year"></a><span>FEB 2001</span></li>
                                                    <li><a year="2001" month="3" class="year"></a><span>MAR 2001</span></li>
                                                    <li><a year="2001" month="4" class="year"></a><span>APL 2001</span></li>
                                                    <li><a year="2001" month="5" class="year"></a><span>MAY 2001</span></li>
                                                    <li><a year="2001" month="6" class="year"></a><span>JUN 2001</span></li>
                                                    <li><a year="2001" month="7" class="year"></a><span>JUL 2001</span></li>
                                                    <li><a year="2001" month="8" class="year"></a><span>AUG 2001</span></li>
                                                    <li><a year="2001" month="9" class="year"></a><span>SEP 2001</span></li>
                                                    <li><a year="2001" month="10" class="year"></a><span>OCT 2001</span></li>
                                                    <li><a year="2001" month="11" class="year"></a><span>NOV 2001</span></li>
                                                    <li><a year="2001" month="12" class="year"></a><span>DEC 2001</span></li>
                                                    <li><a year="2002" month="1" class="year"></a><span>JAN 2002</span></li>
                                                    <li><a year="2002" month="2" class="year"></a><span>FEB 2002</span></li>
                                                    <li><a year="2002" month="3" class="year"></a><span>MAR 2002</span></li>
                                                    <li><a year="2002" month="4" class="year"></a><span>APL 2002</span></li>
                                                    <li><a year="2002" month="5" class="year"></a><span>MAY 2002</span></li>
                                                    <li><a year="2002" month="6" class="year"></a><span>JUN 2002</span></li>
                                                    <li><a year="2002" month="7" class="year"></a><span>JUL 2002</span></li>
                                                    <li><a year="2002" month="8" class="year"></a><span>AUG 2002</span></li>
                                                    <li><a year="2002" month="9" class="year"></a><span>SEP 2002</span></li>
                                                    <li><a year="2002" month="10" class="year"></a><span>OCT 2002</span></li>
                                                    <li><a year="2002" month="11" class="year"></a><span>NOV 2002</span></li>
                                                    <li><a year="2002" month="12" class="year"></a><span>DEC 2002</span></li>
                                                    <li><a year="2003" month="1" class="year"></a><span>JAN 2003</span></li>
                                                    <li><a year="2003" month="2" class="year"></a><span>FEB 2003</span></li>
                                                    <li><a year="2003" month="3" class="year"></a><span>MAR 2003</span></li>
                                                    <li><a year="2003" month="4" class="year"></a><span>APL 2003</span></li>
                                                    <li><a year="2003" month="5" class="year"></a><span>MAY 2003</span></li>
                                                    <li><a year="2003" month="6" class="year"></a><span>JUN 2003</span></li>
                                                    <li><a year="2003" month="7" class="year"></a><span>JUL 2003</span></li>
                                                    <li><a year="2003" month="8" class="year"></a><span>AUG 2003</span></li>
                                                    <li><a year="2003" month="9" class="year"></a><span>SEP 2003</span></li>
                                                    <li><a year="2003" month="10" class="year"></a><span>OCT 2003</span></li>
                                                    <li><a year="2003" month="11" class="year"></a><span>NOV 2003</span></li>
                                                    <li><a year="2003" month="12" class="year"></a><span>DEC 2003</span></li>
                                                    <li><a year="2004" month="1" class="year"></a><span>JAN 2004</span></li>
                                                    <li><a year="2004" month="2" class="year"></a><span>FEB 2004</span></li>
                                                    <li><a year="2004" month="3" class="year"></a><span>MAR 2004</span></li>
                                                    <li><a year="2004" month="4" class="year"></a><span>APL 2004</span></li>
                                                    <li><a year="2004" month="5" class="year"></a><span>MAY 2004</span></li>
                                                    <li><a year="2004" month="6" class="year"></a><span>JUN 2004</span></li>
                                                    <li><a year="2004" month="7" class="year"></a><span>JUL 2004</span></li>
                                                    <li><a year="2004" month="8" class="year"></a><span>AUG 2004</span></li>
                                                    <li><a year="2004" month="9" class="year"></a><span>SEP 2004</span></li>
                                                    <li><a year="2004" month="10" class="year"></a><span>OCT 2004</span></li>
                                                    <li><a year="2004" month="11" class="year"></a><span>NOV 2004</span></li>
                                                    <li><a year="2004" month="12" class="year"></a><span>DEC 2004</span></li>
                                                </ul>
                                                <div class="clearfix"><span class="startYear">1999</span><span class="endYear">2004</span></div>
                                            </div>
                                        </div>
                                        <div class="item active">
                                            <div class="row-fluid active">
                                                <ul class="dateUL">
                                                    <li><a year="2005" month="1" class="year"></a><span>JAN 2005</span></li>
                                                    <li><a year="2005" month="2" class="year"></a><span>FEB 2005</span></li>
                                                    <li><a year="2005" month="3" class="year"></a><span>MAR 2005</span></li>
                                                    <li><a year="2005" month="4" class="year"></a><span>APL 2005</span></li>
                                                    <li><a year="2005" month="5" class="year"></a><span>MAY 2005</span></li>
                                                    <li><a year="2005" month="6" class="year"></a><span>JUN 2005</span></li>
                                                    <li><a year="2005" month="7" class="year"></a><span>JUL 2005</span></li>
                                                    <li><a year="2005" month="8" class="year"></a><span>AUG 2005</span></li>
                                                    <li><a year="2005" month="9" class="year"></a><span>SEP 2005</span></li>
                                                    <li><a year="2005" month="10" class="year"></a><span>OCT 2005</span></li>
                                                    <li><a year="2005" month="11" class="year"></a><span>NOV 2005</span></li>
                                                    <li><a year="2005" month="12" class="year"></a><span>DEC 2005</span></li>
                                                    <li><a year="2006" month="1" class="year"></a><span>JAN 2006</span></li>
                                                    <li><a year="2006" month="2" class="year"></a><span>FEB 2006</span></li>
                                                    <li><a year="2006" month="3" class="year"></a><span>MAR 2006</span></li>
                                                    <li><a year="2006" month="4" class="year"></a><span>APL 2006</span></li>
                                                    <li><a year="2006" month="5" class="year"></a><span>MAY 2006</span></li>
                                                    <li><a year="2006" month="6" class="year"></a><span>JUN 2006</span></li>
                                                    <li><a year="2006" month="7" class="year"></a><span>JUL 2006</span></li>
                                                    <li><a year="2006" month="8" class="year"></a><span>AUG 2006</span></li>
                                                    <li><a year="2006" month="9" class="year"></a><span>SEP 2006</span></li>
                                                    <li><a year="2006" month="10" class="year"></a><span>OCT 2006</span></li>
                                                    <li><a year="2006" month="11" class="year"></a><span>NOV 2006</span></li>
                                                    <li><a year="2006" month="12" class="year"></a><span>DEC 2006</span></li>
                                                    <li><a year="2007" month="1" class="year"></a><span>JAN 2007</span></li>
                                                    <li><a year="2007" month="2" class="year"></a><span>FEB 2007</span></li>
                                                    <li><a year="2007" month="3" class="year"></a><span>MAR 2007</span></li>
                                                    <li><a year="2007" month="4" class="year"></a><span>APL 2007</span></li>
                                                    <li><a year="2007" month="5" class="year"></a><span>MAY 2007</span></li>
                                                    <li><a year="2007" month="6" class="year"></a><span>JUN 2007</span></li>
                                                    <li><a year="2007" month="7" class="year"></a><span>JUL 2007</span></li>
                                                    <li><a year="2007" month="8" class="year"></a><span>AUG 2007</span></li>
                                                    <li><a year="2007" month="9" class="year"></a><span>SEP 2007</span></li>
                                                    <li><a year="2007" month="10" class="year"></a><span>OCT 2007</span></li>
                                                    <li><a year="2007" month="11" class="year"></a><span>NOV 2007</span></li>
                                                    <li><a year="2007" month="12" class="year"></a><span>DEC 2007</span></li>
                                                    <li><a year="2008" month="1" class="year"></a><span>JAN 2008</span></li>
                                                    <li><a year="2008" month="2" class="year"></a><span>FEB 2008</span></li>
                                                    <li><a year="2008" month="3" class="year"></a><span>MAR 2008</span></li>
                                                    <li><a year="2008" month="4" class="year"></a><span>APL 2008</span></li>
                                                    <li><a year="2008" month="5" class="year"></a><span>MAY 2008</span></li>
                                                    <li><a year="2008" month="6" class="year"></a><span>JUN 2008</span></li>
                                                    <li><a year="2008" month="7" class="year"></a><span>JUL 2008</span></li>
                                                    <li><a year="2008" month="8" class="year"></a><span>AUG 2008</span></li>
                                                    <li><a year="2008" month="9" class="year"></a><span>SEP 2008</span></li>
                                                    <li><a year="2008" month="10" class="year"></a><span>OCT 2008</span></li>
                                                    <li><a year="2008" month="11" class="year"></a><span>NOV 2008</span></li>
                                                    <li><a year="2008" month="12" class="year"></a><span>DEC 2008</span></li>
                                                    <li><a year="2009" month="1" class="year"></a><span>JAN 2009</span></li>
                                                    <li><a year="2009" month="2" class="year"></a><span>FEB 2009</span></li>
                                                    <li><a year="2009" month="3" class="year"></a><span>MAR 2009</span></li>
                                                    <li><a year="2009" month="4" class="year"></a><span>APL 2009</span></li>
                                                    <li><a year="2009" month="5" class="year"></a><span>MAY 2009</span></li>
                                                    <li><a year="2009" month="6" class="year"></a><span>JUN 2009</span></li>
                                                    <li><a year="2009" month="7" class="year"></a><span>JUL 2009</span></li>
                                                    <li><a year="2009" month="8" class="year"></a><span>AUG 2009</span></li>
                                                    <li><a year="2009" month="9" class="year"></a><span>SEP 2009</span></li>
                                                    <li><a year="2009" month="10" class="year"></a><span>OCT 2009</span></li>
                                                    <li><a year="2009" month="11" class="year"></a><span>NOV 2009</span></li>
                                                    <li><a year="2009" month="12" class="year"></a><span>DEC 2009</span></li>
                                                    <li><a year="2010" month="1" class="year"></a><span>JAN 2010</span></li>
                                                    <li><a year="2010" month="2" class="year"></a><span>FEB 2010</span></li>
                                                    <li><a year="2010" month="3" class="year"></a><span>MAR 2010</span></li>
                                                    <li><a year="2010" month="4" class="year"></a><span>APL 2010</span></li>
                                                    <li><a year="2010" month="5" class="year"></a><span>MAY 2010</span></li>
                                                    <li><a year="2010" month="6" class="year"></a><span>JUN 2010</span></li>
                                                    <li><a year="2010" month="7" class="year"></a><span>JUL 2010</span></li>
                                                    <li><a year="2010" month="8" class="year"></a><span>AUG 2010</span></li>
                                                    <li><a year="2010" month="9" class="year"></a><span>SEP 2010</span></li>
                                                    <li><a year="2010" month="10" class="year"></a><span>OCT 2010</span></li>
                                                    <li><a year="2010" month="11" class="year"></a><span>NOV 2010</span></li>
                                                    <li><a year="2010" month="12" class="year"></a><span>DEC 2010</span></li>
                                                </ul>
                                                <div class="clearfix"><span class="startYear">2005</span><span class="endYear">2010</span></div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="row-fluid active">
                                                <ul class="dateUL">
                                                    <li><a year="2011" month="1" class="year"></a><span>JAN 2011</span></li>
                                                    <li><a year="2011" month="2" class="year"></a><span>FEB 2011</span></li>
                                                    <li><a year="2011" month="3" class="year"></a><span>MAR 2011</span></li>
                                                    <li><a year="2011" month="4" class="year"></a><span>APL 2011</span></li>
                                                    <li><a year="2011" month="5" class="year"></a><span>MAY 2011</span></li>
                                                    <li><a year="2011" month="6" class="year"></a><span>JUN 2011</span></li>
                                                    <li><a year="2011" month="7" class="year"></a><span>JUL 2011</span></li>
                                                    <li><a year="2011" month="8" class="year"></a><span>AUG 2011</span></li>
                                                    <li><a year="2011" month="9" class="year"></a><span>SEP 2011</span></li>
                                                    <li><a year="2011" month="10" class="year"></a><span>OCT 2011</span></li>
                                                    <li><a year="2011" month="11" class="year"></a><span>NOV 2011</span></li>
                                                    <li><a year="2011" month="12" class="year"></a><span>DEC 2011</span></li>
                                                    <li><a year="2012" month="1" class="year"></a><span>JAN 2012</span></li>
                                                    <li><a year="2012" month="2" class="year"></a><span>FEB 2012</span></li>
                                                    <li><a year="2012" month="3" class="year"></a><span>MAR 2012</span></li>
                                                    <li><a year="2012" month="4" class="year"></a><span>APL 2012</span></li>
                                                    <li><a year="2012" month="5" class="year"></a><span>MAY 2012</span></li>
                                                    <li><a year="2012" month="6" class="year"></a><span>JUN 2012</span></li>
                                                    <li><a year="2012" month="7" class="year"></a><span>JUL 2012</span></li>
                                                    <li><a year="2012" month="8" class="year"></a><span>AUG 2012</span></li>
                                                    <li><a year="2012" month="9" class="year"></a><span>SEP 2012</span></li>
                                                    <li><a year="2012" month="10" class="year"></a><span>OCT 2012</span></li>
                                                    <li><a year="2012" month="11" class="year"></a><span>NOV 2012</span></li>
                                                    <li><a year="2012" month="12" class="year"></a><span>DEC 2012</span></li>
                                                    <li><a year="2013" month="1" class="year"></a><span>JAN 2013</span></li>
                                                    <li><a year="2013" month="2" class="year"></a><span>FEB 2013</span></li>
                                                    <li><a year="2013" month="3" class="year"></a><span>MAR 2013</span></li>
                                                    <li><a year="2013" month="4" class="year"></a><span>APL 2013</span></li>
                                                    <li><a year="2013" month="5" class="year"></a><span>MAY 2013</span></li>
                                                    <li><a year="2013" month="6" class="year"></a><span>JUN 2013</span></li>
                                                    <li><a year="2013" month="7" class="year"></a><span>JUL 2013</span></li>
                                                    <li><a year="2013" month="8" class="year"></a><span>AUG 2013</span></li>
                                                    <li><a year="2013" month="9" class="year"></a><span>SEP 2013</span></li>
                                                    <li><a year="2013" month="10" class="year"></a><span>OCT 2013</span></li>
                                                    <li><a year="2013" month="11" class="year"></a><span>NOV 2013</span></li>
                                                    <li><a year="2013" month="12" class="year"></a><span>DEC 2013</span></li>
                                                    <li><a year="2014" month="1" class="year"></a><span>JAN 2014</span></li>
                                                    <li><a year="2014" month="2" class="year"></a><span>FEB 2014</span></li>
                                                    <li><a year="2014" month="3" class="year"></a><span>MAR 2014</span></li>
                                                    <li><a year="2014" month="4" class="year"></a><span>APL 2014</span></li>
                                                    <li><a year="2014" month="5" class="year"></a><span>MAY 2014</span></li>
                                                    <li><a year="2014" month="6" class="year"></a><span>JUN 2014</span></li>
                                                    <li><a year="2014" month="7" class="year"></a><span>JUL 2014</span></li>
                                                    <li><a year="2014" month="8" class="year"></a><span>AUG 2014</span></li>
                                                    <li><a year="2014" month="9" class="year"></a><span>SEP 2014</span></li>
                                                    <li><a year="2014" month="10" class="year"></a><span>OCT 2014</span></li>
                                                    <li><a year="2014" month="11" class="year"></a><span>NOV 2014</span></li>
                                                    <li><a year="2014" month="12" class="year"></a><span>DEC 2014</span></li>
                                                    <li><a year="2015" month="1" class="year"></a><span>JAN 2015</span></li>
                                                    <li><a year="2015" month="2" class="year"></a><span>FEB 2015</span></li>
                                                    <li><a year="2015" month="3" class="year"></a><span>MAR 2015</span></li>
                                                    <li><a year="2015" month="4" class="year"></a><span>APL 2015</span></li>
                                                    <li><a year="2015" month="5" class="year"></a><span>MAY 2015</span></li>
                                                    <li><a year="2015" month="6" class="year"></a><span>JUN 2015</span></li>
                                                    <li><a year="2015" month="7" class="year"></a><span>JUL 2015</span></li>
                                                    <li><a year="2015" month="8" class="year"></a><span>AUG 2015</span></li>
                                                    <li><a year="2015" month="9" class="year"></a><span>SEP 2015</span></li>
                                                    <li><a year="2015" month="10" class="year"></a><span>OCT 2015</span></li>
                                                    <li><a year="2015" month="11" class="year"></a><span>NOV 2015</span></li>
                                                    <li><a year="2015" month="12" class="year"></a><span>DEC 2015</span></li>
                                                    <li><a year="2016" month="1" class="year"></a><span>JAN 2016</span></li>
                                                    <li><a year="2016" month="2" class="year"></a><span>FEB 2016</span></li>
                                                    <li><a year="2016" month="3" class="year"></a><span>MAR 2016</span></li>
                                                    <li><a year="2016" month="4" class="year"></a><span>APL 2016</span></li>
                                                    <li><a year="2016" month="5" class="year"></a><span>MAY 2016</span></li>
                                                    <li><a year="2016" month="6" class="year"></a><span>JUN 2016</span></li>
                                                    <li><a year="2016" month="7" class="year"></a><span>JUL 2016</span></li>
                                                    <li><a year="2016" month="8" class="year"></a><span>AUG 2016</span></li>
                                                    <li><a year="2016" month="9" class="year"></a><span>SEP 2016</span></li>
                                                    <li><a year="2016" month="10" class="year"></a><span>OCT 2016</span></li>
                                                    <li><a year="2016" month="11" class="year"></a><span>NOV 2016</span></li>
                                                    <li><a year="2016" month="12" class="year"></a><span>DEC 2016</span></li>
                                                </ul>
                                                <div class="clearfix"><span class="startYear">2011</span><span class="endYear">2016</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <a data-slide="prev" href="http://memorebook.com/smemore/EBook/TimeLine#myCarouselYear" class="left carousel-control">‹</a><a data-slide="next" href="http://memorebook.com/smemore/EBook/TimeLine#myCarouselYear" class="right carousel-control">›</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
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
            CheckSession();
            $('input.typeahead').typeahead({

                name: 'accounts',

                local: ['Audi', 'BMW', 'Bugatti', 'car', 'Ferrari', 'Ford', 'Great', 'Lamborghini', 'Mercedes Benz', 'Porsche', 'Rolls-Royce', 'Volkswagen', 'user', 'memories ', '2013', '2012 Family', 'acme', 'all', 'arrow']

            });

        });


	</script>
</body>

</html>
