<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GameStore._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome to GMC Games</h2>
    <div class="jumbotron">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
    

            <div class="item active">
                <img src="/Img/crysis.jpg" alt="Flower">
            </div>

            <div class="item">
                <img src="/Img/madmax.jpg" alt="Flower">
            </div>

            <div class="item">
                <img src="/Img/wow.jpg" alt="Flower">
            </div>

            <div class="item">
                <img src="/Img/darksouls.jpg" alt="Flower">
            </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h2>What We Do</h2>
            <p>
                GMC Games is an internet-based digital distribution platform developed by GMC Corporation. 
                We provide our users with installation and automatic updating of games on multiple computers.
                GMC Games is an internet-based digital distribution platform developed by GMC Corporation. 
                We provide our users with installation and automatic updating of games on multiple computers.
                GMC Games is an internet-based digital distribution platform developed by GMC Corporation. 
                We provide our users with installation and automatic updating of games on multiple computers.
                GMC Games is an internet-based digital distribution platform developed by GMC Corporation. 
                We provide our users with installation and automatic updating of games on multiple computers.
            </p>
            
        </div>
    </div>

</asp:Content>
