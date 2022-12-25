<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab7._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<asp:Label ID="GridViewLabel" runat="server" Text="Logistic" Font-Bold="true" />

<asp:GridView ID="GridViewFuel" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceFuel">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Код" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Название" SortExpression="Name" />
    </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceFuel" runat="server" ConnectionString="<%$ ConnectionStrings:logisticConnectionString %>"
        SelectCommand="SELECT * FROM [Organizations]">
    </asp:SqlDataSource>

    </asp:Content>