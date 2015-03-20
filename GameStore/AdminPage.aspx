<%@ Page Title="Admin Panel" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="GameStore.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-striped" SelectMethod="GetGameDetails">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" CssClass="btn btn-default" runat="server" Text="Edit Game"/>
                    <asp:Button ID="btnDelete" CssClass="btn btn-default" runat="server" Text="Delete Game"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
</asp:Content>
