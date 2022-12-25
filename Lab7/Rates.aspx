<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="Lab7.Rates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Поиск по наименованию:<asp:TextBox ID="TextBoxTank" runat="server" Width="15%" Text=""></asp:TextBox>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSourceTanks">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            Наименование:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Цена за м3:
            <asp:TextBox ID="VolumeRateTextBox" runat="server" Text='<%# Bind("VolumeRate") %>' />
            <br />
            Цена за т:
            <asp:TextBox ID="TankWeightTextBox" runat="server" Text='<%# Bind("CarryingRate") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Вставка" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить" />
        </ItemTemplate>
    </asp:FormView>
                <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="Тарифы" Font-Bold="true"></asp:Label>

<asp:GridView ID="GridViewTank" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceTanks">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Код" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Наименование" SortExpression="Name" />
        <asp:BoundField DataField="VolumeRate" HeaderText="Цена за м3" SortExpression="VolumeRate" />
        <asp:BoundField DataField="CarryingRate" HeaderText="Цена за т" SortExpression="CarryingRate" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceTanks" runat="server" 
    ConnectionString="<%$ ConnectionStrings:logisticConnectionString %>"
    SelectCommand="SELECT * FROM [Rates] WHERE ((Name LIKE '%'+ ISNULL(@Name,'')+'%'))"
    DeleteCommand="DELETE FROM [Rates] WHERE [Id] = @Id"
    UpdateCommand="UPDATE [Rates] SET [Name] = @Name, [VolumeRate] = @VolumeRate, [CarryingRate] = @CarryingRate WHERE [Id] = @Id"
    InsertCommand="INSERT INTO [Rates] ([Name], [VolumeRate], [CarryingRate]) VALUES (@Name, @VolumeRate, @CarryingRate)">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="VolumeRate" Type="Int32" />
        <asp:Parameter Name="CarryingRate" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBoxTank" Name="Name" PropertyName="Text" DefaultValue="" ConvertEmptyStringToNull="False" DbType="String"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="VolumeRate" Type="Int32" />
        <asp:Parameter Name="CarryingRate" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>