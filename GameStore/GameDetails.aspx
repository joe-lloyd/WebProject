<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="GameStore.GameDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <asp:ListView ID="GamesList"  
                ItemType="GameStore.Models.GamesWithImages" 
                runat="server"
                SelectMethod="JoinGamesImage">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"><%#: Item.currentGame.Title %></h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <img class="img-responsive" src="/GameImages/<%#: Item.currentImage.Name %>" />
                </div>
                <div class="col-md-4">
                    <h2><%#: Item.currentGame.Title %></h2>
                    <p><%#: Item.currentGame.Description %></p>
                </div>
            </div>
        </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
