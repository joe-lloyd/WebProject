<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="GameStore.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <h1>Your Cart</h1>
        <asp:ListView ID="ListView1"  
            ItemType="GameStore.Models.UsersCartItems" 
            runat="server"
            SelectMethod="ItemsInCart">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-4">
                                <img class="img-responsive" src="/GameImages/<%#: Item.currentImg.Name %>" />
                            </div>
                            <div class="col-md-8">
                                <h4 class="pull-right">€<%#: Item.currentGames.Price %></h4>
                                <h4><%#: Item.currentGames.Title %></h4>
                                <p><%#: Item.currentGames.Description %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        </asp:ListView>
    
    </div>

</asp:Content>
