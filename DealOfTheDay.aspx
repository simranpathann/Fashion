<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="DealOfTheDay.aspx.cs" Inherits="DealOfTheDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/bootstrap.bundle.min.js"></script>
       
    <style> /*css*/
        .zoom {
         padding:10px;
         transition:transform .2s;
         width:150px;
         height:300px;
         margin:0 auto;
        
        }
        .zoom:hover {
         transform:scale(1.5);
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Dressess">

        <table class="dlTable" style="text-align: center; margin: 0 auto;">
            <tr>
                <td>
                    <asp:DataList ID="DtLstDresses" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" OnItemCommand="DtLstDressess_ItemCommand">
                        <ItemTemplate>
                            <table class="dlTable" style="text-align: center; margin: 0 auto; border: 1px solid #ff6a00;">
                                <tr>
                                    <td style="background-color: black; height:30px">
                                        <asp:Label ID="lblDressesName" runat="server" Font-Bold="True" ForeColor="White" Text='<%# Eval("Dresses_Name") %>'></asp:Label>
                                    </td>
                                    <td style="width: 50%; background-color: black;">
                                        <asp:Label ID="lblDealoftheDay" runat="server" Font-Bold="True" ForeColor="White" Text="Deal of The Day"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="zoom">
                                        <asp:ImageButton ID="ImgBtnDressesImage" runat="server" ImageUrl='<%# Eval("Dresses_Image") %>' AlternateText='<%# Eval("Dresses_Id") %>' CommandArgument="ViewDressesDetails" BorderWidth="1px" Height="200px" />
                                    </td>
                                    <td>
                                        <table style="width: 100%; text-align: left;">
                                            <tr>
                                                <td>Discount :</td>
                                                <td>
                                                    <asp:Label ID="lblDiscount" runat="server" Font-Bold="True" ForeColor="#003300" Text="30%"></asp:Label>
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
                                                    <asp:ImageButton ID="ImgBtnBuyNow" runat="server" CommandArgument="BuyNow" Height="30px" ImageUrl="~/Images/BuyNowYellow.png" Width="100px" /></td>
                                                <td>
                                                    <asp:ImageButton ID="ImgBtnAddToCart" runat="server" CommandArgument="AddToCart" Height="30px" ImageUrl="~/Images/AddToCart.png" Width="100px" />
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
        </table>
    </div>
</asp:Content>

