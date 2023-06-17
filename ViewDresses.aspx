<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ViewDresses.aspx.cs" Inherits="ViewDresses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Dressess">
        <script src="js/bootstrap.min.js"></script>
        <table class="dlTable" style="text-align: center; margin: 0 auto;">
            <tr>
                <td>
                    <asp:DataList ID="DtLstDresses" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="DtLstDressess_ItemCommand" >
                        <ItemTemplate>
                            <table class="dlTable" style="text-align: center; margin: 0 auto; border: 1px solid #ff6a00;">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDressesName" runat="server" Font-Bold="true" ForeColor="Blue" Text='<%# Eval("Dresses_Name") %>'></asp:Label>
                                    </td>
                                    <td style="width: 50%;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImgBtnDressesImage" runat="server" ImageUrl='<%# Eval("Dresses_Image") %>' AlternateText='<%# Eval("Dresses_Id") %>' CommandArgument="ViewDressesDetails" BorderWidth="1px" Height="200px" />
                                    </td>
                                    <td>
                                        <table style="width: 100%; text-align: left;">
                                            <tr>
                                                <td>Brand Name:</td>
                                                <td>
                                                    <asp:Label ID="LblBrandName" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Red" Text='<%# Eval("Dresses_Brand") %>'></asp:Label>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>MRP : Rs.</td>
                                                <td>
                                                    <asp:Label ID="LblDressesMRP" runat="server" Font-Bold="true" Font-Size="Medium" Font-Strikeout="true" ForeColor="Red" Text='<%# Eval("Dresses_MRP") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>New Price : Rs.</td>
                                                <td>
                                                    <asp:Label ID="lblDressesPrice" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Red" Text='<%# Eval("Dresses_OldPrice") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Available Only:</td>
                                                <td>
                                                    <asp:Label ID="lblAvailableOnly" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Blue" Text='<%# Eval("Dresses_Stock") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="ImgBtnBuyNow" runat="server" AlternateText='<%# Eval("Dresses_Id") %>' CommandArgument="BuyNow" Height="30px" ImageUrl="~/Images/BuyNowYellow.png" Width="100px" /></td>
                                                <td>
                                                    <asp:ImageButton ID="ImgBtnAddToCart" runat="server" AlternateText='<%# Eval("Dresses_Id") %>' CommandArgument="AddToCart" Height="30px" ImageUrl="~/Images/AddToCart.png" Width="100px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>

                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblmessage" runat="server" ForeColor="Red" Text="LblMessage"></asp:Label>
                </td>
            </tr>
        </table>

    </div>
    <div>
        <asp:Panel ID="PnlNoProductFound" runat="server" Visible="false" HorizontalAlign="Center">
            <asp:Image ID="ImgNoProductFound" runat="server" ImageUrl="~/Assets/no_product_found.png" />
        </asp:Panel>
    </div>
</asp:Content>

