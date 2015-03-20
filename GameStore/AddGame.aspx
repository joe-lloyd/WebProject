<%@ Page Title="Admin-Add Game" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddGame.aspx.cs" Inherits="GameStore.AddGame" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 form-vertical">
            <h1>Add New Game</h1>
            <hr />
            <div class="form-group">
                <p><asp:Label ID="lblTitle" runat="server" Text="Title"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtTitle" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblRating" runat="server" Text="Rating"></asp:Label></p>
                <asp:DropDownList CssClass="form-control" ID="cboRating" runat="server">
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label></p>
                <asp:DropDownList CssClass="form-control" ID="cboGenre" runat="server">
                    <asp:ListItem>FPS</asp:ListItem>
                    <asp:ListItem>RPG</asp:ListItem>
                    <asp:ListItem>Action</asp:ListItem>
                    <asp:ListItem>Fighter</asp:ListItem>
                    <asp:ListItem>Strategy</asp:ListItem>
                    <asp:ListItem>MMO</asp:ListItem>
                    <asp:ListItem>Racing</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblReleaseDate" runat="server" Text="Release Date"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtReleaseDate" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblImage" runat="server" Text="Upload Image"></asp:Label></p>
                <asp:FileUpload CssClass="form-control" ID="ImageUpload" runat="server" />
            </div>


            <asp:Button CssClass="btn btn-default" ID="btnSubmit"  runat="server" Text="Add Game" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
