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
        </div>

        <div class="col-md-6 form vertical">
            <h2>Register</h2>
            <hr />
            <div class="form-group">
                <p><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valEmail" ValidationGroup="ValidateReg" ControlToValidate="txtEmail" ForeColor="Red" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexEmail" runat="server" ValidationGroup="ValidateReg" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" ErrorMessage="Invalid Email" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblRegUserName" runat="server" Text="Choose A User Name"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtRegUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valRegUserName" ValidationGroup="ValidateReg" ControlToValidate="txtRegUserName" ForeColor="Red" runat="server" ErrorMessage="User Name is Required"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblRegPassword" runat="server" Text="Choose A Password"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtRegPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valRegPassword" ValidationGroup="ValidateReg" ControlToValidate="txtRegPassword" runat="server" ForeColor="Red" ErrorMessage="Password is Required"></asp:RequiredFieldValidator>
            </div>

            <asp:Button CssClass="btn btn-default" ID="btnRegister" ValidationGroup="ValidateReg" runat="server" Text="Register" OnClick="btnRegister_Click"/>
        </div>
    </div>
</asp:Content>
