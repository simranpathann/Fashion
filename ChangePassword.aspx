<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%">


        <tr>
            <td><asp:Label ID="Lblchangepassword" runat="server" Text="Change Password" Font-Bold="true"></asp:Label></td>
            <td></td>
            <td></td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Lbloldpassword" Text="Old Password" runat="server"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txtoldpassword" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
              

            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblnewpassword" runat="server" Text="New Password"></asp:Label>

            </td>
            <td>

                <asp:TextBox ID="Txtnewpassword" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td></td>
        </tr>


        <tr>
            <td>
                <asp:Label ID="Lblconfirmpassword" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="Txtconfirmpassword" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>


            <td>&nbsp</td>
            <td>
                <asp:Button ID="btnchange" runat="server" Text="Change Password" OnClick="btnchange_Click" />
            </td>
            <td></td>
        </tr>

        <tr>
            <td>
<asp:Label ID="lblmessage" Text="LblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td></td>
            <td></td>
        </tr>

    </table>
</asp:Content>

