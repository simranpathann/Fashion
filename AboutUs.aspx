<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 70%; margin: 0 auto; text-align:center;  ">
        <tr>
            <td>
                <asp:Label ID="LblCollageName" runat="server" ForeColor="#000099" Text="JSPM's BHAGWANT INSTITUE TECHNOLOGY, BARSHI" Font-Bold="False" Font-Italic="False" Font-Size="Large" Font-Names="Times New Roman"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Lblprjby" runat="server" ForeColor="#660033" Text="Project By : " Font-Bold="True" Font-Italic="False" Font-Size="Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Lbl1" runat="server" ForeColor="Black" Text="1. SIMRAN PATHAN" Font-Bold="False" Font-Italic="False" Font-Size="Small" Font-Names="Times New Roman"></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="BtnOk" runat="server" Text="Ok" BackColor="#FF6699" Height="30px" OnClick="BtnOk_Click" Width="60px" PostBackUrl="~/Home.aspx" ForeColor="Black" />
            </td>
        </tr>
    </table>
</asp:Content>

