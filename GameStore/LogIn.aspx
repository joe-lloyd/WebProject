<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="GameStore.LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6 form vertical">
            <h2>Log In</h2>
            <hr />
            <div class="form-group">
                <p><asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtUsrName" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button CssClass="btn btn-default" ID="btnLogIn"  runat="server" Text="Log In" OnClick="btnLogIn_Click"/>
            <asp:Label ID="lblLoginMessage" runat="server"></asp:Label>
        </div>

        <div class="col-md-6 form vertical">
            <h2>Register</h2>
            <hr />
            <div class="form-group">
                <p><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblRegUserName" runat="server" Text="Choose A User Name"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtRegUserName" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblRegPassword" runat="server" Text="Choose A Password"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtRegPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button CssClass="btn btn-default" ID="btnRegister"  runat="server" Text="Register" OnClick="btnRegister_Click"/>
        </div>
    </div>
</asp:Content>
