﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Members.aspx.cs" Inherits="MemorEbook.Members" %>

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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
         <%-- <ul class="nav navbar-nav cusome-black">
          	<li>
                <a href="#" class="active">My Exchanges</a>
            </li>
          	<li>
                <a href="#">Create Exchange</a>
            </li>
          </ul>--%>
           
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
        	<ul class="breadcrmul">
             <li class="active"> <a href="#">My Exchanges </a></li> >
             <li class="active"> <a href="#">Austin Creek 6th Grade Exchange</a></li> >
             <li class="active"> Members</li>
            </ul>
            
            <div class="table-responsive">
            	<table class="table stmTbl">
                 	<thead>
                    	<tr>
                        	<th>Member</th>
                        	<th>Email</th>
                        	<th>Invite Date</th>
                        	<th>Status	</th>
                        	<th></th>
                        </tr>
                    </thead>
                    <tbody class="border">
                    	<tr>       
                        	<td> Elizabeth Miler</td>
                        	<td><a href="#">Elizabeth@gmail.com</a></td>
                        	<td>May 21, 2015</td>
                        	<td><a href="#">Accepted</a></td>        	
                        	<td> <a href="#">Resend Invitation</a></td>
                        </tr>
                        
                        <tr>                        	
                        	<td> </td>
                        	<td><a href="#">jullie@gmail.com</a></td>
                        	<td>May 21, 2015</td>
                        	<td><a href="#">Accepted</a></td>        	
                        	<td> <a href="#">Resend Invitation</a></td>
                        </tr>
                        
                        <tr>                        	
                        	<td> </td>
                        	<td><a href="#"> kelly@gmail.com</a></td>
                        	<td>May 21, 2015</td>
                        	<td><a href="#">Accepted</a></td>        	
                        	<td> <a href="#">Resend Invitation</a></td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/typeahead.min.js"></script>
    <script>
		$('#arrowheader').on('click', function() {
			$('#mainheader').addClass('hide-h').removeClass('visible-h');
			$('#mainheader-small').addClass('visible-h').removeClass('hide-h');
			$('body').addClass('bodytop');
		});
		$('#arrowheader-small').on('click', function() {
			$('#mainheader-small').addClass('hide-h').removeClass('visible-h');
			$('#mainheader').addClass('visible-h').removeClass('hide-h');
			$('body').removeClass('bodytop');
		});
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
		
		
		
		$(document).ready(function(){

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