<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="GameStore.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h2>Contact Form</h2>
    </div>
    <div class="col-md-6">
        <h2>Office Hours</h2>
        <ul>
            <li>Monday: 9am - 6pm</li>
            <li>Tuesday: 9am - 7pm</li>
            <li>Wednesday: 9am - 6.30pm</li>
            <li>Thursday: 9am - 6pm</li>
            <li>Friday: 9am - 5pm</li>
            <li>Saturday: 12pm - 4pm</li>
            <li>Sunday: Closed</li>
        </ul>
    </div>
    <div class="col-md-6 form-vertical">
        <h2>Contact Us</h2>
        <div class="form-group">
                <p><asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <p><asp:Label ID="lblQuestion" runat="server" Text="Question"></asp:Label></p>
                <asp:TextBox CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <asp:Button runat="server" CssClass="btn btn-default" Text="Submit" ID="btnSubmit" OnClick="btnSubmit_Click"/>
        </div>
</asp:Content>
