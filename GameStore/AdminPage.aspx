<%@ Page Title="Admin Panel" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="GameStore.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Admin Panel</h2>
    <hr />
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped" SelectMethod="GetGameDetails">
    </asp:GridView>
    <div class="row">
        <h2>Add/Update/Delete Game</h2>
        <p>Choose An Option</p>
        <div class="form-group">
            <asp:RadioButton GroupName="Admin" ID="rdoAdd" runat="server" AutoPostBack="True" Text="Add" OnCheckedChanged="rdoAdd_CheckedChanged"/>
            <asp:RadioButton GroupName="Admin" ID="rdoUpdate" runat="server" AutoPostBack="True" Text="Update" OnCheckedChanged="rdoUpdate_CheckedChanged"/>
            <asp:RadioButton GroupName="Admin" ID="rdoDelete" runat="server" AutoPostBack="True" Text="Delete" OnCheckedChanged="rdoDelete_CheckedChanged"/>
            <asp:RadioButton GroupName="Admin" ID="rdoSerialize" runat="server" AutoPostBack="True" Text="Serialize" OnCheckedChanged="rdoSerialize_CheckedChanged" />
        </div>
            <hr />
        <div class="col-md-6 form-vertical">
            <div class="form-group">
                <p><asp:Label ID="lblGameID" runat="server" Text="Game ID"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtGameID" runat="server"></asp:TextBox>
            </div>

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
       </div>

       <div class="col-md-6 form-vertical">
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

            <asp:Button runat="server" CssClass="btn btn-default" Text="Add Game" ID="btnAddGame" OnClick="btnAddGame_Click"/>
            <asp:Button runat="server" CssClass="btn btn-default" Text="Delete Game" ID="btnDeleteGame" OnClick="btnDeleteGame_Click"/>
            <asp:Button runat="server" CssClass="btn btn-default" Text="Update Game" ID="btnUpdateGame" OnClick="btnUpdateGame_Click"/>
            <asp:Button runat="server" CssClass="btn btn-default" Text="Serialize Game To XML" ID="btnSerialize" OnClick="btnSerialize_Click"/>
        </div>
    </div>
</asp:Content>
