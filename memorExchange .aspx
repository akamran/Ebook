<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="memorExchange .aspx.cs" Inherits="MemorEbook.memorExchange" %>


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
    <link href="css/simplelightbox.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- include jQuery -->

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

                <a class="navbar-brand" href="#">
                    <img src="images/logo.png" alt="Memorebook">
                </a>
            </div>

            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav cusome-black">
                    <li>
                        <a href="#MyExchnanges" aria-controls="home" role="tab" data-toggle="tab" class="active">View Memory</a>
                    </li>
                    <li onclick="clearExchange();">
                        <a href="#CreateExchange" aria-controls="CreateExchange" role="tab" data-toggle="tab">Add More</a>
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
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>

    <nav id="mainheader-small" class="navbar navbar-default navbar-fixed-top hide-h">
        <div class="container">
            <div class="navbar-header">


                <a class="navbar-brand" href="#">
                    <img src="images/logo.png" alt="Memorebook">
                </a>
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
           
            <div class="tab-content">


                <div role="tabpanel" class="tab-pane active" id="MyExchnanges">
                    <div class="col-sm-12">
                        <div class="gridbrd-botm">
                            <div class="pull-right book-info"> <a href="#"> <h4 class=""> <img src="images/iconplus-hover.png" alt="" /> add to my memoorEbook </h4> </a></div>
                            <ul class="breadcrmul mrg-btm">
                                <li class="active"> <a href="#"> My Exchanges </a></li>
                                >
                                <li class="active"> <a href="#">Aquarium Field Trip</a></li>
                                >
                                <li> <a href="#"> Add Activity </a></li>
                            </ul>
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <div id="img-galry" class="grid albumHolder ">
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-03-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-03-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-04.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-04.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-03-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-03-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-07.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-07.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-08.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-08.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-03-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-03-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-04.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-04.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-03-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-03-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-07.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-07.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-08.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-08.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-02.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-02.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-03-05.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-03-05.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-item">
                                        <div class="img-galry">
                                            <a href="images/large/img-04.jpg" class="img-glrybox">
                                                <img src="images/thumbs/img-04.jpg" alt="" class="img-responsive" />
                                                <span class="imghover"></span>
                                            </a>
                                            <div class="footer-info">
                                                <span class="pull-right plusIcon"><a href="#" class="glyphicon glyphicon-plus-sign "></a></span>
                                            </div>
                                        </div>
                                    </div>

                                </div>   <!--albumHolder end-->







                            </div>
                        </div>



                    </div>
                </div>


                <div role="tabpanel" class="tab-pane" id="CreateExchange">
                    <div class="col-sm-12">
                        <ul class="breadcrmul mrg-btm">
                            <li class="active"> <a href="#"> My Exchanges </a></li>
                            >
                            <li class="active"> <a href="#">Aquarium Field Trip</a></li>
                            >
                            <li> <a href="#"> Peter pan</a></li>
                        </ul>

                        <form class="form-horizontal cutum-search clearfix">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="horizontal-imgbox">
                                        <figure> <img src="images/drag-img.png" alt="" /> </figure>

                                        <h4> Drag Photo and videos here </h4>
                                        <div class="pad"><a href="#" class="btn btn-primary btn-black"> Select Photo and Video </a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <hr class="doted" />
                            </div>

                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Cancel</label>
                                    <div class="col-sm-4">
                                        <div class="link mrg-zero"> <input type="submit" class="btn btn-primary btn-black mrg-zero" value="Finish" /></div>
                                    </div>

                                    <div class="col-sm-6">
                                        <table class="table table-uploading">
                                            <tr>
                                                <td colspan="4">
                                                    <div class="cutum-dropbox ">
                                                        <a href="#"><h4> <i class="glyphicon glyphicon-menu-up"></i>  Uploading </h4> </a>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>AustinCreek1.jpg</td>
                                                <td>34kb</td>
                                                <td>uploaded</td>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td> AustinCreek1.jpg </td>
                                                <td> 0b/67k </td>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                                            <span class="sr-only">60% Complete (warning)</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td> <a href="#">Cancel</a> </td>
                                            </tr>

                                            <tr>
                                                <td> AustinCreek1.jpg </td>
                                                <td> 0b/67k </td>
                                                <td>&nbsp;</td>
                                                <td> <a href="#">Cancel</a> </td>
                                            </tr>

                                            <tr>
                                                <td> AustinCreek1.jpg </td>
                                                <td> 0b/67k </td>
                                                <td>&nbsp;</td>
                                                <td> <a href="#">Cancel</a> </td>
                                            </tr>

                                            <tr>
                                                <td> AustinCreek1.jpg </td>
                                                <td> 0b/67k </td>
                                                <td>&nbsp;</td>
                                                <td> <a href="#">Cancel</a> </td>
                                            </tr>

                                        </table>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>   
                </div>


            </div>
            <!-- tab-content -->

        </div>
    </div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/typeahead.min.js"></script>

    <script src="js/simple-lightbox.js"></script>
    <script>
        $(function () {
            var gallery = $('.albumHolder .img-glrybox').simpleLightbox({
                showCounter: false
            });
        });
    </script>


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

        $('.grid').isotope({
            // options
            itemSelector: '.grid-item',
            layoutMode: 'fitRows',
            masonry: {
                gutter: 20
            }
        });

        $('.albumHolder').isotope({
            // options
            itemSelector: '.grid-item',
            layoutMode: 'fitRows',
            masonry: {
                gutter: 2
            }
        });
    </script>
</body>
</html>
