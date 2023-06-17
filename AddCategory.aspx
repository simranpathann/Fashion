<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
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
                <asp:Label ID="lblCategoryname" runat="server" Text="Category Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCategoryname" runat="server" Width="200px" ValidationGroup="VgSubmit"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCategoryname" runat="server" ControlToValidate="txtCategoryname" ErrorMessage="Please Enter Category Name" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lblCategoryimage" runat="server" Text="Category Image"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fuCategoryimage" runat="server" Width="200px" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCategoryimage" runat="server" ControlToValidate="fuCategoryimage" ErrorMessage="Please Select Image" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblmeassage" runat="server" ForeColor="Black" Text="LblMessage"></asp:Label>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" Width="100px" ValidationGroup="VgSubmit" />
&nbsp;
                <asp:Button ID="btncancel" runat="server"  Text="Cancel" Width="100px" ValidationGroup="VgSumit" OnClick="btncancel_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

