<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="Meteor.GameDetails1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-4 col-md-8">
                <img src="../Images/LogoMeteor.png" class="img-responsive" alt="Responsive image">
            </div>
            <div class="col-md-offset-3 col-md-6">
                <h1>Game details</h1>
                <h5>All fields are required</h5>
                <br />
                <div class="form-group">
                    <label class="control-label" for="Player1TextBox">Player One:</label>
                    <asp:TextBox runat="server" type="text" CssClass="form-control" id="Player1TextBox" placeholder="BattleTag" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="Player2TextBox">Player Two:</label>
                    <asp:TextBox runat="server" type="text" CssClass="form-control" id="Player2TextBox" placeholder="BattleTag" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="SpectatorsTextBox">Spectators:</label>
                    <asp:TextBox runat="server" type="text" CssClass="form-control" id="SpectatorsTextBox" placeholder="How many spectators?" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="DescriptionTextArea">Play of the Game:</label>
                    <asp:TextBox runat="server" TextMode="MultiLine" Columns="5" Rows="6" CssClass="form-control" ID="DescriptionTextArea" placeholder="Most interesting play?" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="WinningPlayerTextBox">Winner:</label>
                    <asp:TextBox runat="server" type="text" CssClass="form-control" id="WinningPlayerTextBox" placeholder="Winner's BattleTag" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="DuelDateTextBox">Date of Duel:</label>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="DuelDateTextBox" placeholder="Duel Date" required="true"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy" ControlToValidate="DuelDateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999" 
                        Type="Date" Display="Dynamic" BackColor="Wheat" ForeColor="WindowFrame" Font-Size="Large"></asp:RangeValidator>
                </div>
                <div class="text-right">
                    <asp:Button Text="Cancel" ID="CancelButton" CssClass="btn btn-warning btn-lg" runat="server" UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                    <asp:Button Text="Save" ID="SaveButton" CssClass="btn btn-primary btn-lg" runat="server" Onclick="SaveButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
