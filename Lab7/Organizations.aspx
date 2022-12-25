<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="Lab7.Organizations" %>
   <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceFuels">
       <InsertItemTemplate>
            <h4>Добавить:</h4>
            Наименование:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Вставка" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить" />
        </ItemTemplate>
    </asp:FormView>
        
    <asp:Label ID="GridViewLabel" runat="server" Text="Организации" Font-Bold="true" />
    <asp:GridView ID="GridViewFuel" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id"
        DataSourceID="SqlDataSourceFuels">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Код" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Наименование" SortExpression="Name" />
    </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceFuels" runat="server" 
        ConnectionString="<%$ ConnectionStrings:logisticConnectionString %>"
        DeleteCommand="DELETE FROM [Organizations] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [Organizations] ([Name]) VALUES (@Name)"
        SelectCommand="SELECT * FROM [Organizations]"
        UpdateCommand="UPDATE [Organizations] SET [Name] = @Name WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    </asp:Content>