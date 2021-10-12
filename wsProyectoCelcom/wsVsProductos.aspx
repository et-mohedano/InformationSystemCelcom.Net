<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wsVsProductos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Lista de productos</h3>
    <div class="table-responsive">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="5" class="table table-hover">
                <HeaderStyle BackColor="#00A2B7" ForeColor="White" Font-Size="Small" />
                <PagerSettings FirstPageText="&amp;lt;&amp;lt;&amp;lt;" LastPageText="&amp;gt;&amp;lt;&amp;lt;" />
                <PagerStyle HorizontalAlign="Center" BackColor="#F5F9FC" ForeColor="Black"/>
                <RowStyle  Font-Size="Small" />
            </asp:GridView>
     </div>
    <p>&nbsp;</p>
    <br /><br />
</asp:Content>