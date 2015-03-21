<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="GameStore.GameList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Games</h1>
    </div>
    <div id="GameMenu" class="row" style="text-align: center">  
        <asp:ListView ID="GamesList"  
                ItemType="GameStore.Models.GamesWithImages"
                runat="server"
                SelectMethod="JoinGamesImage">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 hero-feature">
                        <div class="thumbnail">
                            <img src="~/GameImages/<%#:Item.currentImage.Name %>>" alt=""/>
                            <div class="caption">
                                <a href="/GameDetails.aspx?id=<%#: Item.currentGame.GameID %>">

                                <b><p><%#: Item.currentGame.Title %></a></b></p>
                                    
                                <p><b>Price: </b><%#:String.Format("{0:c}", Item.currentGame.Price)%></p>
                                    <a href="#" class="btn btn-primary">Buy Now!</a> 
                                    <a href="/GameDetails.aspx?id=<%#: Item.currentGame.GameID %>" class="btn btn-default">More Info</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
</asp:Content>
