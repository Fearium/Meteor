<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="Meteor.GameList" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>HearthStone Duels</h1>
                <a href="GameDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i> Add Game</a>
                <asp:GridView ID="GamesGridView" CssClass="table table-bordered table-striped table-hover" AutoGenerateColumns="false" runat="server"
                     DataKeyNames="GameID" OnRowDeleting="GamesGridView_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Player1" HeaderText="Player One" Visible="true" />
                        <asp:BoundField DataField="Player2" HeaderText="Player Two" Visible="true" />
                        <asp:BoundField DataField="Spectators" HeaderText="Spectators" Visible="true" />
                        <asp:BoundField DataField="Description" HeaderText="Highlights" Visible="true" />
                        <asp:BoundField DataField="WinningPlayer" HeaderText="Player Two" Visible="true" />
                        <asp:BoundField DataField="Created" HeaderText="Duel Date" Visible="true" DataFormatString="{0:MMM dd, yyyy}" />

                        <asp:HyperLinkField HeaderText="Edit" Text="<i calss='fa fa-encil-square-o fa-lg'></i> Edit"
                            NavigateUrl="GameDetails.aspx"  ControlStyle-CssClass="btn btn-primary btn-sm" DataNavigateUrlFields="GameID"
                            runat="server" DataNavigateUrlFormatString="GameDetails.aspx?GameID={0}" />
                        <asp:CommandField HeaderText="Delete" DeleteText="<i class='fa fa-trash-o fa-lg'></i> Delete" ShowDeleteButton="true" ButtonType="Link"
                            ControlStyle-CssClass="btn btn-danger btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
