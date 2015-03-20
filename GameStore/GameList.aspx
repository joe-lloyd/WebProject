<%@ Page Title="Games" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameList.aspx.cs" Inherits="GameStore.GameList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Games</h1>
    </div>
    <div id="GameMenu" class="row" style="text-align: center">  
        <asp:ListView ID="GamesList"  
                ItemType="GameStore.Models.Game"
                runat="server"
                SelectMethod="GetGames">
                <ItemTemplate>
                    <div class="col-md-3 col-sm-6 hero-feature">
                        <div class="thumbnail">
                            <img src="http://downloads.info/wp-content/uploads/2013/04/World-of-Warcraft-Cataclysm.jpeg" alt=""/>
                            <div class="caption">
                                <a href="/GameDetails.aspx?id=<%#: Item.GameID %>">

                                <b><p><%#: Item.Title %></a></b></p>
                                    
                                <p><b>Price: </b><%#:String.Format("{0:c}", Item.Price)%></p>
                                    <a href="#" class="btn btn-primary">Buy Now!</a> 
                                    <a href="/GameDetails.aspx?id=<%#: Item.GameID %>" class="btn btn-default">More Info</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
</asp:Content>
