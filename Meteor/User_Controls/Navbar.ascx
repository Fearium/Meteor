<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="Meteor.Navbar" %>

<div class="head">
    <div id="nav-position" class="nav-position"></div>
    <div id="navigation-wrapper" class="navigation-wrapper">
        <div id="navigation-container" class="navigation-container">
            <div class="navigation navigation--menu">
                <ul class="menu" id="menu">

                    <li class="menu-blog menu__item" runat="server"><a id="home" runat="server" href="~/Default.aspx" class="menu__link"><span>Home</span></a></li>
                    <li class="menu-blog menu__item" runat="server"><a id="games" runat="server" href="~/GameList.aspx" class="menu__link"><span>Games</span></a></li>
                    <li class="menu-blog menu__item" runat="server"><a id="contact" runat="server" href="~/Contact.aspx" class="menu__link"><span>Contact</span></a></li>

                    <asp:PlaceHolder ID="PublicPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="register" runat="server" href="/Login.aspx" class="menu__link"><span>Login/Register</span></a></li>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder ID="UserPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="users" runat="server" href="/Admin/Users.aspx" class="menu__link"><span>Users</span></a></li>
                    </asp:PlaceHolder>

                    <asp:PlaceHolder ID="MeteorTrackingPlaceHolder" runat="server">
                        <li class="menu-blog menu__item" runat="server"><a id="logout" runat="server" href="/Logout.aspx" class="menu__link"><span>Logout</span></a></li>
                    </asp:PlaceHolder>

                    
 

                    <!--
                    <li class="menu-esports menu__item7 menu__item has-dropdown" itemscope="itemscope" itemtype="http://schema.org/SiteNavigationElement">
                        <a itemprop="url" href="/hearthstone/en/blog/19968666" data-analytics="primary-nav-link" data-analytics-placement="Esports" class="menu__link">
                            <span itemprop="name">Esports</span>
                            <i class="icon-font icon-caret-down icon-caret-down--menu"></i>
                        </a>
                        <div class="menu-wrapper">
                            <ul class="menu-dropdown">
                                <li class="menu-dropdown-list">
                                    <a class="menu-dropdown__link" href="/hearthstone/en/esports/schedule/" data-analytics="primary-nav-link" data-analytics-placement="Esports - Schedule">Esports Schedule
                                    </a>
                                </li>
                                <li class="menu-dropdown-list">
                                    <a class="menu-dropdown__link" href="/hearthstone/en/standings/" data-analytics="primary-nav-link" data-analytics-placement="Esports - Standings">Standings
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    -->

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
