<%@ Page Title="Games (Admin)" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminGameList.aspx.cs" Inherits="Meteor.Admin.AdminGameList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-1 col-md-10">
                <h3><asp:Label ID="TrackingDateLabel" runat="server"></asp:Label></h3>
                <h1>HearthStone Duels</h1>
                <a href="MeteorTracking/GameDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Add Game</a>
                <asp:GridView ID="GamesGridView" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="false" runat="server"
                    DataKeyNames="GameID" OnRowDeleting="GamesGridView_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Player1" HeaderText="Player One" Visible="true" />
                        <asp:BoundField DataField="Player2" HeaderText="Player Two" Visible="true" />
                        <asp:BoundField DataField="Spectators" HeaderText="Spectators" Visible="true" />
                        <asp:BoundField DataField="Description" HeaderText="Highlights" Visible="true" />
                        <asp:BoundField DataField="WinningPlayer" HeaderText="Winner" Visible="true" />
                        <asp:BoundField DataField="Created" HeaderText="Duel Date" Visible="true" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:HyperLinkField HeaderText="Edit" Text="<i calss='fa fa-encil-square-o fa-lg'></i> Edit"
                            NavigateUrl="~/MeteorTracking/GameDetails.aspx" ControlStyle-CssClass="btn btn-primary btn-sm" DataNavigateUrlFields="GameID"
                            runat="server" DataNavigateUrlFormatString="~/MeteorTracking/GameDetails.aspx?GameID={0}" />
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true" ButtonType="Link"
                            ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
                <label for="PageSizeDropDownList"></label>
                <asp:DropDownList runat="server" ID="TrackingWeekDropDown" AutoPostBack="true"
                    CssClass="btn btn-default bt-sm dropdown-toggle" OnSelectedIndexChanged="TrackingWeekDropDown_SelectedIndexChanged">
                    <asp:ListItem Text="June 5th - June 11th" Value="2016-06-05" />
                    <asp:ListItem Text="June 12th - June 18th" Value="2016-06-12" />
                    <asp:ListItem Text="June 19th - June 25th" Value="2016-06-19" />
                    <asp:ListItem Text="June 26th - July 2nd" Value="2016-06-26" />
                    <asp:ListItem Text="Placeholder" Value="2016-07-03" Enabled="False" />
                </asp:DropDownList>
            </div>
        </div>
    </div>
</asp:Content>
