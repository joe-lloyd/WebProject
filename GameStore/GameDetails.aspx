<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="GameStore.GameDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <asp:ListView ID="GamesList"  
                ItemType="GameStore.Models.Game" 
                runat="server"
                >
            
        <ItemTemplate>
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header"><%#: Item.Title %></h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <img class="img-responsive" src="http://web-vassets.ea.com/Assets/Resources/www/ea.com/Image/Crysis3_Screenshot_TheHunter.jpg?cb=1412974356" />
                </div>
                <div class="col-md-4">
                    <h2><%#: Item.Title %></h2>
                    <p><%#: Item.Description %></p>
                </div>
            </div>
        </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
