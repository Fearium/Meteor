<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="Meteor.Navbar" %>

<div class="head">
    <div id="nav-position" class="nav-position"></div>
    <div id="navigation-wrapper" class="navigation-wrapper">
        <div id="navigation-container" class="navigation-container">
            <div class="navigation navigation--menu">
                <ul class="menu" id="menu">

                    <!-- Anonymous, admin and user see this -->
                    <li class="menu-blog menu__item" runat="server"><a id="home" runat="server" href="~/Default.aspx" class="menu__link"><span>Home</span></a></li>

                    <asp:PlaceHolder ID="GamesPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="games" runat="server" href="~/GameList.aspx" class="menu__link"><span>Games</span></a></li>
                    </asp:PlaceHolder>
                    <!-- Anonymous, admin and user see this END -->

                    <!-- Admin see this -->
                    <asp:PlaceHolder ID="AdminPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="users" runat="server" href="/Admin/Users.aspx" class="menu__link"><span>Users</span></a></li>
                        <li class="menu-blog menu__item" runat="server"><a id="adminGames" runat="server" href="/Admin/AdminGameList.aspx" class="menu__link"><span>Games</span></a></li>
                    </asp:PlaceHolder>
                    <!-- Admin see this END -->

                    <!-- Anonymous, admin and user see this -->
                    <asp:PlaceHolder ID="ProfilePlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="profile" runat="server" href="~/Profile.aspx" class="menu__link"><span>Profile</span></a></li>
                    </asp:PlaceHolder>
                    <!-- Anonymous, admin and user see this END -->

                    <!-- Anonymous, admin and user see this -->
                    <asp:PlaceHolder ID="ContactPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="contact" runat="server" href="~/Contact.aspx" class="menu__link"><span>Contact</span></a></li>
                    </asp:PlaceHolder>
                    <!-- Anonymous, admin and user see this END -->

                    <!-- Anonymous see this -->
                    <asp:PlaceHolder ID="LoginPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="register" runat="server" href="/Login.aspx" class="menu__link"><span>Login/Register</span></a></li>
                    </asp:PlaceHolder>
                    <!-- Anonymous see this END -->

                    <!-- Regular users and admin see this -->
                    <asp:PlaceHolder ID="LogoutPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="logout" runat="server" href="/Logout.aspx" class="menu__link"><span>Logout</span></a></li>
                    </asp:PlaceHolder>
                    <!-- Regular users and admin see this END -->

                </ul>
                <div id="right-menu" class="show--lg">
                    <div id="right-arrow-container">
                        <div id="right-screw"></div>
                        <div id="right-arrow"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
