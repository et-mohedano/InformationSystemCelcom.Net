<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wsAdminProductos.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     	 
	<center>
    	<h3><asp:Label ID="Label1" runat="server" Text="Administración de Productos:" CssClass="fontTrabajoTitulo" ></asp:Label></h3>
    	<br />
    <div class="">
         <table width="70%" border="0"> 
            <tr>
                <td align="left">
                    <asp:Label ID="Label2" runat="server" Text="Clave:"  CssClass="fontTrabajoTitulo"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="TextBox1" runat="server"  ForeColor="Black" Width="120pt"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:Label ID="Label8" runat="server" Text="&nbsp;&nbsp;Marca:" CssClass="fontTrabajoTitulo"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="TextBox7" runat="server"  Width="120pt"  ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label3" runat="server" Text="Nombre:" CssClass="fontTrabajoTitulo"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="TextBox2" runat="server"  Width="120pt" ForeColor="Black"></asp:TextBox>
                </td>
                <td align="left">
                    <asp:Label ID="Label9" runat="server" Text="&nbsp;&nbsp;Precio:" CssClass="fontTrabajoTitulo"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="TextBox8" runat="server"  Width="120pt"  ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label5" runat="server" Text="Modelo:" CssClass="fontTrabajoTitulo"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="TextBox3" runat="server" Width="120pt"  ForeColor="Black"></asp:TextBox>
                </td>
                <td align="left">
                   
                </td>
                <td align="left">
                    
                </td>
            </tr>
            <tr>
                <td colspan="4" aling="center">
                    <div class="options-table">
                        <span class="options-icon">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/multimedia/iconos/insert.png" OnClick="ImageButton1_Click" />
                        </span>
                        <span class="options-icon">
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/multimedia/iconos/delete.png"  OnClick="ImageButton2_Click" />
                        </span>
                        <span class="options-icon">
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/multimedia/iconos/update.png" OnClick="ImageButton3_Click"/>
                        </span>
                        <span class="options-icon">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/multimedia/iconos/clean.png" OnClick="ImageButton4_Click"/>
                        </span>
                        <span class="options-icon">
                            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/multimedia/iconos/refresh.png" />
                        </span>
                       </div>
                </td>
            </tr>
        </table>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br />
    
</asp:Content>

