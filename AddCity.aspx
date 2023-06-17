<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="AddCity.aspx.cs" Inherits="AddCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:60%; margin: 0 auto">
        <tr>
            <td>
                <asp:Label ID="lblcity" runat="server" Font-Bold="True" Text="City"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblcityname" runat="server" Text="City Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcityname" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvcityname" runat="server" ControlToValidate="txtcityname" ErrorMessage="Enter Your City Name" ValidationGroup="vgsubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblpincode" runat="server" Text="Pin Code"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtcode" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvpincode" runat="server" ControlToValidate="txtcode" ErrorMessage="Enter Pincode" ValidationGroup="vgsubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmessage" runat="server" ForeColor="#FF3300" Text="LblMessage"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="100px" OnClick="btnsubmit_Click" ValidationGroup="vdsubmit" />
&nbsp;&nbsp;
                <asp:Button ID="btncancel" runat="server" Text="Cancel" Width="100px" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

