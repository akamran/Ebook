<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MemorExchange.aspx.cs" Inherits="MemorExchange" %>


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
    <link href="css/FileUpload.css" rel="stylesheet" />
    <link href="css/DragDrop.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- include jQuery -->
    <script type="text/javascript" src="Scripts/Memories.js"></script>
    <script type="text/javascript" src="Scripts/Logout.js"></script>
    <script src="js2/jquery.1.11.1.js"></script>
    <script src="Scripts/DragDrop.js"></script>
    <style type="text/css">
        input[type='file'] {
            color: transparent; /* Hides your "No File Selected" */
            /*direction: rtl;*/ /* Sets the Control to Right-To-Left */
            margin-left: 85px;
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
                    <img src="images/logo.png" alt="Memorebook">
                </a>
            </div>

            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav cusome-black">
                    <li>
                        <a href="#MyExchnanges" aria-controls="home" role="tab" data-toggle="tab" class="active" id="Add" onclick="change_autorefreshdiv()">View Memory</a>
                    </li>
                    <li onclick="clearExchange();">
                        <a href="#CreateExchange" aria-controls="CreateExchange" role="tab" data-toggle="tab" id="Add1" onclick="change_autorefreshdiv()">Add More</a>
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
                            <div class="pull-right book-info">
                           <%--   <span class="pull-right plusIcon"> <a id="add" style="color:#777472" href="#" class="glyphicon glyphicon-plus-sign ">add to my memoorEbook</a> </span>--%>
                               <a id="add" style="color:#777472;cursor:pointer">
                                <h4 class="">
                                    <img id="make-image" src="images/iconplus-hover1.png" alt="" >
                                    add to my memoorEbook </h4>
                            </a>   
                                                                </div>
                            <ul class="breadcrmul mrg-btm" id="Group">
                                
                            </ul>
                        </div>


                        <div class="row">
                            <div class="col-sm-12">
                                <div id="img-galry" class="grid albumHolder ">
                                    
                                    
                                </div>
                                <!--albumHolder end-->
                            </div>
                        </div>
                    </div>
                </div>


                <div role="tabpanel" class="tab-pane" id="CreateExchange">
                    <div class="col-sm-12">
                          <ul class="breadcrmul mrg-btm">
                            <li class="active"><a href="Exchange.aspx">My Exchanges </a></li>
                            >
                            <li class="active" id="Gname" ></li>
                            >
                            <li class="active" id="Activity" ></li>
                            >
                            <li><a href="#">Add New</a></li>
                        </ul>

                        <form id="form1" runat="server" class="form-horizontal cutum-search clearfix">
                           
                                <div class="status"></div>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div id="dragandrop" class="horizontal-imgbox">
                                            <figure>
                                                <img src="images/drag-img.png" alt="" />
                                            </figure>

                                            <h4>Drag Photo and videos here </h4>

                                            <div align="center" class="pad">
                                                <asp:FileUpload class="custom-file-input" ID="FileUpload1" runat="server" type="file" />
                                            </div>
                                            <label style="font-size: 15px; padding: 0; color: #f58137; margin-right: 18px; font-family: inherit; font-weight: 500;">Select File and Click on Finish</label>





                                        </div>
                                    </div>
                                </div>
                          
                            <div class="col-sm-12">
                                <hr class="doted" />
                            </div>

                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label" style="cursor:pointer" onclick="change_autorefreshdiv()">Cancel</label>
                                    <div class="col-sm-4">
                                        <div class="link mrg-zero">
                                            <%--<input type="submit" class="btn btn-primary btn-black mrg-zero" value="Finish" />--%>
                                            <asp:Button ID="Button1" class="btn btn-primary btn-black mrg-zero" runat="server" Text="Finish" OnClick="Button1_Click" />
                                            <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                                        </div>
                                    </div>
                                    <asp:Label ID="Successlbl" runat="server" Text="Successfully Uploaded" Visible="false"></asp:Label>
                                    <asp:Label ID="Unsuccesslbl" runat="server" Text="Problem In Uploading" Visible="false"></asp:Label>
                                   
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
            GetActivityMemory();
            GroupNameLoadByActivity();
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
