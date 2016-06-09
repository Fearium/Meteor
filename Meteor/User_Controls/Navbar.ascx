<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="Meteor.Navbar" %>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><img src="images/logo.png" alt="Meteor Logo" width="20" height="30"/></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li id="home" runat="server"><a class="navbar-brand" href="Default.aspx"><i class="fa fa-home fa-lg"></i> Home</a></li>
                <li id="games" runat="server"><a class="navbar-brand" href="GameList.aspx"><i class="fa fa-trophy fa-lg"></i> Games</a></li>
                <li id="register" runat="server"><a class="navbar-brand" href="Register.aspx"><i class="fa fa-sign-in fa-lg"></i> Register/Login</a></li>
                <li id="contact" runat="server"><a class="navbar-brand" href="Contact.aspx"><i class="fa fa-phone fa-lg"></i> Contact</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
