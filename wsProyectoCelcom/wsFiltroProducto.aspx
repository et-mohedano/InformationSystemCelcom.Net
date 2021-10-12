<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wsFiltroProducto.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
     <p>
        Busqueda de productos
     </p> 
     <asp:TextBox ID="TextBox1" runat="server" ForeColor="Black"></asp:TextBox>   
     <asp:Button ID="Button1" runat="server" Text="Filtrar" style="background-color: #00A2B7" OnClick="Button1_Click" class="btn btn-primary" />
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="4" class="table table-hover">
            <HeaderStyle BackColor="#00A2B7" ForeColor="White" Font-Size="Small" />
            <PagerSettings FirstPageText="&amp;lt;&amp;lt;&amp;lt;" LastPageText="&amp;gt;&amp;lt;&amp;lt;" />
            <PagerStyle HorizontalAlign="Center" BackColor="#F5F9FC" ForeColor="Black"/>
            <RowStyle  Font-Size="Small" />
        </asp:GridView>
    <p>&nbsp;</p>
    </center>
    <br /><br />
</asp:Content>

