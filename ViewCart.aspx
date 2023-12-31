﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PnlCartDetails" runat="server">
        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="gvCart_RowCancelingEdit" OnRowDeleting="gvCart_RowDeleting" OnRowEditing="gvCart_RowEditing" OnRowUpdating="gvCart_RowUpdating" Width="100%" OnSelectedIndexChanged="gvCart_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="LblDressesName" runat="server" Text="Dresses Name"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblDressesName" runat="server" Text='<%# Bind("Dresses_Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="LblImage" runat="server" Text="Image"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Image ID="ImgDressesImage" runat="server" Height="50px" ImageUrl='<%# Bind("Dresses_Image") %>' AlternateText='<%# Bind ("Cart_Id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="LblDressesPrice" runat="server" Text="Dresses Price"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblDressesPrice" runat="server" Text='<%# Bind("Dresses_Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtDressesQuantity" runat="server" Text='<%# Bind("Dresses_Quantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="LblQuantity" runat="server" Text="Quantity"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblDressesQuatity" runat="server" Text='<%# Bind("Dresses_Quantity") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:Label ID="LblDressesTotal" runat="server" Text="Dresses Total"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblDressesTotal" runat="server" Text='<%# Bind("Dresses_Total") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <table style="width: 100%; text-align: center">
            <tr>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style5">

                    <asp:Label ID="LblSubTotal1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text=" SUBTOTAL : RS. "></asp:Label>
                    <asp:Label ID="LblSubTotal" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" Text="00"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style4">

                    <asp:Label ID="LblShipment" runat="server" Text="+ SHIPMENT : RS." Font-Size="Medium"></asp:Label>

                    <asp:Label ID="LblShipmentValue" runat="server" Font-Bold="False" Text="00" Font-Size="Medium"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="LblTotalToPay1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Red" Text="TOTAL TO PAY : RS . "></asp:Label>
                    <asp:Label ID="LblTotalToPayValue" runat="server" Font-Size="X-Large" ForeColor="Red" Text="00"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style6">

                    <asp:Label ID="LblMessage" runat="server" ForeColor="Red"></asp:Label>

                </td>
            </tr>
            <tr>
                <td>

                    <asp:Button ID="BtnFinalizeAndPay" runat="server" BackColor="#0000CC" Font-Bold="True" Font-Size="Larger" ForeColor="White" Text="FINALIZE AND PAY" OnClick="BtnFinalizeAndPay_Click" />

                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PnlEmptyCart" runat="server" Visible="false">
        <table style="margin:0 auto;text-align:center">
            <tr>
                <td class="auto-style1">

                    <asp:Image ID="ImgEmptyCart" runat="server" ImageUrl="~/Images/cartmt.png" />

                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LblOopsYourCartIsEmpty" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red" Text="OOPS ! YOUR CART IS EMPTY !"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">

                    <asp:Button ID="BtnBackToHome" runat="server" BackColor="#0000CC" Font-Bold="True" Font-Size="Larger" ForeColor="White" Text="BACK TO HOME" PostBackUrl="~/Home.aspx" />

                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

