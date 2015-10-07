<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<!-- saved from url=(0029)http://memorebook.com/smemore -->
<html lang="en" class=" js no-touch cssanimations csstransitions">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memorEbook MemorExchange</title>
    <link href="./memorEbook MemorExchange_files/bootstrap.css" rel="stylesheet">
    <link href="./memorEbook MemorExchange_files/component.css" rel="stylesheet">
    <link href="./memorEbook MemorExchange_files/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="Scripts/Login.js"></script>
</head>
<body>
    <!--menu start here-->
    <header class="main group">
        <div class="container">
            <nav role="navigation" class="navbar navbar-default">
                <div class="navbar-header">
                    <button data-target="#toc" data-toggle="collapse" class="navbar-toggle" type="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a href="http://memorebook.com/smemore/EBook/TimeLine" class="brand">
                        <img alt="memorEbook the smart scrapbook" src="./memorEbook MemorExchange_files/logo.png">
                    </a>
                </div>
                <div id="toc" class="collapse navbar-collapse toc">
                    <div style="display: none">
                        <div class="loader navbar-left">
                            <div class="progress progress-striped active page-progress-bar">
                                <div style="width: 100px;" class="progress-bar">loading</div>
                            </div>
                        </div>
                    </div>
                    <div style="display: none;"></div>
                    <div style="">
                    </div>
                </div>
            </nav>
        </div>

    </header>
    <div class="container">



        <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4">
            <div class="tab-content">
            <form runat="server">
                <input name="__RequestVerificationToken" type="hidden" value="Xe-1rXfaGYvRbKg4aMBreIgl5M4-ff3G0DwvvUbbzGm29J9wc-YpYh05B8d_FkQLzREHAyjOXR2hIEqgEXqwjV8BFnFpKQMSXRuhh6W2fKI1">
                <h2 class="form-signin-heading">sign in</h2>
                <div>
                    <asp:TextBox ID="txt_Email" placeholder="Email" required="" type="text" class="form-control" runat="server"></asp:TextBox>

                    <span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span>
                    <br>
                    <asp:TextBox ID="txt_Password" class="form-control" runat="server" placeholder="Password" required="" type="password"></asp:TextBox>
                    <span class="field-validation-valid" data-valmsg-for="Password" data-valmsg-replace="true"></span>
                    <div class="checkbox">

                        <label>
                        </label>

                        <asp:Button ID="Button1" runat="server" class="black-btn btn login-btn pull-right" Text="Login" OnClick="Button1_Click" />
                                            </div>

                </div>
                <div>
                </div>
            </form>
                <div role="tabpanel" class="tab-pane active" id="CreateExchange">
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
        </div>
    </div>
    <footer class="main group">
        <nav class="navbar navbar-fixed-bottom">
            <div class="bg">
                <ul class="nav nav-pills">
                    <li><a href="http://memorebook.com/smemore#">Register</a></li>
                    <li><a href="http://memorebook.com/smemore#">About Us</a></li>
                    <li><a href="http://memorebook.com/smemore#">Our Vision</a></li>
                    <li><a href="http://memorebook.com/smemore#">Press</a></li>
                    <li><a href="http://memorebook.com/smemore#">Our Blog</a></li>
                    <li><a href="http://memorebook.com/smemore#">FAQs</a></li>
                    <li><a href="http://memorebook.com/smemore#">Terms and Conditions</a></li>
                    <li><a href="http://memorebook.com/smemore#">Privacy</a></li>
                    <li><a href="http://memorebook.com/smemore#">Contact Us</a></li>
                </ul>
            </div>
        </nav>
    </footer>
    <div id="divLoading" class="loading" style="display: none;"><span>Please Wait...Loading...</span></div>
    <script src="./memorEbook MemorExchange_files/jquery-2.1.1.min.js"></script>
    <script src="./memorEbook MemorExchange_files/jquery-migrate-1.2.1.min.js"></script>
    .
   
    <script src="./memorEbook MemorExchange_files/jquery.unobtrusive-ajax.min.js"></script>
    <script src="./memorEbook MemorExchange_files/jquery.validate.min.js"></script>
    <script src="./memorEbook MemorExchange_files/jquery.validate.unobtrusive.min.js"></script>

    <script src="./memorEbook MemorExchange_files/bootstrap.min.js"></script>
    <script src="./memorEbook MemorExchange_files/modernizr.custom.js"></script>
    <script src="./memorEbook MemorExchange_files/jquery.dlmenu.js"></script>
    <script src="./memorEbook MemorExchange_files/masterController.js"></script>
    <script>
        $(function () {
            $('#dl-menu').dlmenu();
        });
    </script>




</body>
</html>
