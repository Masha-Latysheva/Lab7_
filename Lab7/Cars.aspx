<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="Lab7.Cars" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormViewInsert" runat="server" DataSourceID="SqlDataSourceOperations" DataKeyNames="Id">
        <InsertItemTemplate>
            <h4>Добавить:</h4>
            Организация:
            <asp:DropDownList ID="OrganizationIdDropDownList" runat="server"  DataSourceID="SqlDataSourceFuel" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("OrganizationId") %>'>
            </asp:DropDownList>
            <br />
            Марка:
            <asp:TextBox ID="MarkTextBox" runat="server" Text='<%# Bind("Mark") %>' />
            <br />
            Грузоподъемность (т):
            <asp:TextBox ID="CarryingWeightTextBox" runat="server" Text='<%# Bind("CarryingWeight") %>' />
            <br />
            Объем кузова (м3):
            <asp:TextBox ID="CarryingVolumeTextBox" runat="server" Text='<%# Bind("CarryingVolume") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Вставка" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
           <ItemTemplate>
           <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить" />
        </ItemTemplate>
</asp:FormView>

    <asp:Label ID="GridViewLabel" runat="server" Text="Машины" Font-Bold="true"/>

    <asp:GridView ID="GridViewOperations" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceOperations">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:TemplateField HeaderText="Организация" SortExpression="Organization">
                <EditItemTemplate>
                    <asp:DropDownList ID="OrganizationId" runat="server" DataSourceID="SqlDataSourceFuel" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("OrganizationId") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>                
                <ItemTemplate>
                 <asp:Label ID="OrganizationId" runat="server"  Text='<%# Eval("Organization") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Mark" HeaderText="Марка" SortExpression="Mark" />
            <asp:BoundField DataField="CarryingVolume" HeaderText="Максимальный объем" SortExpression="CarryingVolume" />
            <asp:BoundField DataField="CarryingWeight" HeaderText="Максимальный вес" SortExpression="CarryingWeight" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceFuel" runat="server" 
        ConnectionString="<%$ ConnectionStrings:logisticConnectionString %>"
        SelectCommand="SELECT [Id], [Name] FROM [Organizations]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceOperations" runat="server" 
        ConnectionString="<%$ ConnectionStrings:logisticConnectionString %>"
        DeleteCommand="DELETE FROM [Cars] WHERE [Id] = @Id"
        InsertCommand="INSERT INTO [Cars] ([OrganizationId], [Mark], [CarryingVolume], [CarryingWeight]) VALUES (@OrganizationId, @Mark, @CarryingVolume, @CarryingWeight)"
        SelectCommand="SELECT Cars.Id, Cars.Mark, Cars.CarryingWeight, Cars.CarryingVolume, Cars.OrganizationId, Organizations.Name as Organization FROM Cars LEFT JOIN Organizations on Organizations.Id = Cars.OrganizationId"
        UpdateCommand="UPDATE [Cars] SET [OrganizationId] = @OrganizationId, [Mark] = @Mark, [CarryingVolume] = @CarryingVolume, [CarryingWeight] = @CarryingWeight WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrganizationId" Type="Int32" />
            <asp:Parameter Name="Mark" Type="String" />
            <asp:Parameter Name="CarryingWeight" Type="Int32" />
            <asp:Parameter Name="CarryingVolume" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="OrganizationId" Type="Int32" />
            <asp:Parameter Name="Mark" Type="String" />
            <asp:Parameter Name="CarryingVolume" Type="Int32" />
            <asp:Parameter Name="CarryingWeight" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>