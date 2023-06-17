<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="DressesDetails.aspx.cs" Inherits="DressesDetails" %>

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
    <table style="width: 100%; margin: 0 auto;">
        <tr>

            <td>
                <table style="width: 100%; text-align:center" >
                    <tr>
                        <td class="zoom">
                            <asp:ImageButton ID="ImgPhoto" runat="server" Height="200px" CssClass="rounded" />
                        </td>
                    </tr>
                    <tr style="height: 200px;">
                        <td>
                            <asp:Panel ID="pnlModels" runat="server" Width="300px">
                                <asp:DataList ID="DtLstModel" runat="server" RepeatColumns="1" RepeatDirection="Horizontal"  HorizontalAlign="Center" Width="80%" >
                                    <ItemTemplate>
                                        <table ">

                                            <tr>

                                                <td class="zoom">
                                                      <asp:ImageButton ID="ImageBtnModel1" CommandArgument="Category" runat="server" CssClass="rounded" ImageUrl='<%# Eval("Dresses_Model1") %>' Width="150px" />

                                                </td>

                                                 <td class="zoom">
                                                      <asp:ImageButton ID="ImageBtnModel2" CommandArgument="Category" runat="server" CssClass="rounded" ImageUrl='<%# Eval("Dresses_Model2") %>' Width="150px" />

                                                </td>

                                                 <td class="zoom">
                                                      <asp:ImageButton ID="ImageBtnModel3" CommandArgument="Category" runat="server" CssClass="rounded" ImageUrl='<%# Eval("Dresses_Model3") %>' Width="150px" />

                                                </td>
                                            </tr>
                                        </table>
                                        <table class="border-warning rounded-top table" style="width: auto; margin: 0 auto; text-align: center; border: solid thin; border-radius: 10px 10px;">
                                            <tr>
                                                <td>


                                                </td>
                                            </tr>
                                        </table>

                                    </ItemTemplate>
                                </asp:DataList>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesName" runat="server" Text="Dresses Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesName" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            <asp:Label ID="LblDressesType" runat="server" Text="Dresses Type:"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="TxtDressesType" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="LblDressesPrice" runat="server" Text="Dresses Price:"></asp:Label>
                        </td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxtDressesPrice" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesSellsPrice" runat="server" Text="Dresses Sells Price:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesSellsPrice" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesMRP" runat="server" Text="Dresses MRP:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesMrp" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesBrand" runat="server" Text="Dresses Brand:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesBrand" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesDetails" runat="server" Text="Dresses Details:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesDetails" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesRaging" runat="server" Text="Dresses Rating:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesRating" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblDressesCategory" runat="server" Text="Dresses Category:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtDressesCategory" runat="server" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblYouSave" runat="server" Text="You Save:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LblYouSave1" runat="server" Text="00"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblMessage" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="LblQuantity" runat="server" Text="Dresses Quantity:"></asp:Label>
                        </td>
                        <td class="auto-style5">
                            <asp:DropDownList ID="DdlDressesQuantity" runat="server" Width="200px" OnSelectedIndexChanged="DdlDressesQuantity_SelectedIndexChanged" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:TextBox ID="TxtStock" runat="server" Width="50px"></asp:TextBox>
                        </td>
                        <td class="auto-style5"></td>
                    </tr>
                    <tr>
                        <td class="auto-style6"></td>
                        <td class="auto-style6">
                            <asp:HiddenField ID="HfQuantity" runat="server" />
                        </td>
                        <td class="auto-style6"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LblTotalAmount" runat="server" Text="Sub Total Amount:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LblSubTotalAmountValue" runat="server" ForeColor="Red" Style="font-weight: 700; font-size: medium"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:ImageButton ID="ImgbtnAddToCart" runat="server" ImageUrl="~/images/AddToCart.png" OnClick="ImgbtnAddToCart_Click" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="LblMessage2" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

            </td>
        </tr>

    </table>




    <asp:Panel ID="PnlPayment" runat="server" Visible="False">
    </asp:Panel>
</asp:Content>

