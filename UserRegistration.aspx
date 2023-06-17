<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:60%; margin: 0 auto">
        <tr>
            <td class="auto-style15">
                <asp:Label ID="lblregistraion" runat="server" Font-Bold="True" Text="UserRegistration"></asp:Label>
            </td>
            <td class="auto-style68"></td>
            <td class="auto-style16"></td>
        </tr>
        <tr>
            <td class="auto-style28"></td>
            <td class="auto-style69"></td>
            <td class="auto-style30"></td>
        </tr>
        <tr>
            <td class="auto-style33">
                <asp:Label ID="lblname" runat="server" Font-Bold="False" Text="User Name : "></asp:Label>
            </td>
            <td class="auto-style70">
                <asp:TextBox ID="txtname" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style34">
                <asp:RequiredFieldValidator ID="revusername" runat="server" ControlToValidate="txtname" ErrorMessage="Please Enter User Name" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style28">
                <asp:Label ID="lblcity" runat="server" Text="User City"></asp:Label>
            </td>
            <td class="auto-style69">
                <asp:DropDownList ID="ddl" runat="server" Width="200px" OnSelectedIndexChanged="ddl_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td class="auto-style30">
                <asp:RequiredFieldValidator ID="revusercity" runat="server" ControlToValidate="ddl" ErrorMessage="Please Select City" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style35">
                <asp:Label ID="lbladdress" runat="server" Text="User Addresss"></asp:Label>
            </td>
            <td class="auto-style71">
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style37">
                <asp:RequiredFieldValidator ID="revuseraddress" runat="server" ControlToValidate="txtaddress" ErrorMessage="Please Enter Valid Address" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style47">
                <asp:Label ID="lblpin" runat="server" Text="User pin"></asp:Label>
            </td>
            <td class="auto-style72">
                <asp:TextBox ID="txtpin" runat="server" Width="200px" AutoPostBack="True"></asp:TextBox>
            </td>
            <td class="auto-style49">
                <asp:RequiredFieldValidator ID="revuserpincode" runat="server" ControlToValidate="txtpin" ErrorMessage="Please Enter Valid Code" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revinvalidpin" runat="server" ControlToValidate="txtpin" ErrorMessage="Invalid Pin" ForeColor="#FF3300" ValidationGroup="VgSubmit" Width="100px" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style50">
                <asp:Label ID="lblmobile" runat="server" Text="User Mobile"></asp:Label>
            </td>
            <td class="auto-style73">
                <asp:TextBox ID="txtmobile" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style52">
                <asp:RequiredFieldValidator ID="revusermobile" runat="server" ErrorMessage="Please Enter Valid Mobile Number" ForeColor="#FF3300" ValidationGroup="VgSubmit" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revinvalidmobile" runat="server" ControlToValidate="txtmobile" ErrorMessage="Invalid Mobile Number" ForeColor="#FF3300" ValidationGroup="VgSubmit" ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style53">
                <asp:Label ID="lblemail" runat="server" Text="User Email"></asp:Label>
            </td>
            <td class="auto-style74">
                <asp:TextBox ID="txtemail" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style55">
                <asp:RequiredFieldValidator ID="revuseremail" runat="server" ControlToValidate="txtemail" ErrorMessage="Please Enter Valid Email " ForeColor="#FF3300" ValidationGroup="VgSubmit" Width="100px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revinvalidemail" runat="server" ControlToValidate="txtemail" ErrorMessage="Invalid Email" ForeColor="#FF3300" ValidationGroup="VgSubmit" Width="100px" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style62">
                <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="auto-style75">
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style64">
                <asp:RequiredFieldValidator ID="rfvuserpassword" runat="server" ControlToValidate="txtpassword" ErrorMessage="Please Enter Your Password" ForeColor="#FF3300" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="lblconfirmpass" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td class="auto-style76">
                <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style61">
                <asp:RequiredFieldValidator ID="revconfirmpassword" runat="server" ControlToValidate="txtpassword" ErrorMessage="Enter Password" ForeColor="#FF3300" ValidationGroup="VgSubmit" Width="100px"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="Cvconfirmpassword" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirm" ErrorMessage="Miss Match" ForeColor="#FF3300"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style15">
                </td>
            <td class="auto-style68">
                </td>
            <td class="auto-style16">
                </td>
        </tr>
        <tr>
            <td class="auto-style19">
                <asp:Label ID="lblmessage" runat="server" ForeColor="#FF3300" Text="LblMessage"></asp:Label>
            </td>
            <td class="auto-style77"></td>
            <td class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style21"></td>
            <td class="auto-style78"></td>
            <td class="auto-style22"></td>
        </tr>
        <tr>
            <td class="auto-style65"></td>
            <td class="auto-style79">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" Width="100px" ValidationGroup="VgSubmit" OnClick="btnsubmit_Click" />
&nbsp;&nbsp;&nbsp;<asp:Button ID="btncancel" runat="server" Text="Cancel" Width="100px"  />
            &nbsp;</td>
            <td class="auto-style67"></td>
        </tr>
    </table>
</asp:Content>

