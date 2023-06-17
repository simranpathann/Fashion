<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <link href="slider/js-image-slider.css" rel="stylesheet" />
    <script src="slider/js-image-slider.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" /> 
    


    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="font-weight: 700">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="clear" style="height: 10px;"></div>
        <div class="addrotator">
            <div id="sliderFrame">
                <div id="slider">
                    <img src="slide%20images/fotor_2023-4-5_8_24_51.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_12_44.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_20_53.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_26_35.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_25_39.jpg" />
                    <img src="slide%20images/s11.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_39_40.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_41_39.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_42_20.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_50_49.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_55_2.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_55_48.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_56_31.jpg" />
                    <img src="slide%20images/s1.jpg" />
                    <img src="slide%20images/fotor_2023-4-5_8_57_25.jpg" />
                </div>
                <div id="htmlcaption" style="display: none">
                    <em>HTML</em> caption. Link To <a href="#">1] Simran</a>
                </div>
            </div>
        </div>
    </div>

    <div class="clear" style="height: 30px;"></div>
    <div class="Dressess">

        <table class="dlTable" style="text-align: center; margin: 0 auto;">
            <tr>
                <td>
                    <asp:DataList ID="DtLstDresses" runat="server" OnItemCommand="DtLstDressess_ItemCommand" RepeatColumns="2" RepeatDirection="Horizontal" >
                        <ItemTemplate>
                            <table class="dlTable" style="text-align: center; margin: 0 auto; ">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblDressesName" runat="server" Font-Bold="true" ForeColor="Black" Text='<%# Eval("Dresses_Name") %>'></asp:Label>
                                    </td>
                                    <td style="width: 50%;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="zoom">
                                        <asp:ImageButton ID="ImgBtnDressesImage" runat="server" AlternateText='<%# Eval("Dresses_Id") %>' BorderWidth="1px" CommandArgument="ViewDressesDetails" Height="200px" ImageUrl='<%# Eval("Dresses_Image") %>' />
                                    </td>
                                    <td>
                                        <table style="width: 100%; text-align:left;">
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
                                                    <asp:Label ID="lblAvailableOnly" runat="server" Font-Bold="true" Font-Size="Medium" ForeColor="Black" Text='<%# Eval("Dresses_Stock") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="ImgBtnBuyNow" runat="server" AlternateText='<%# Eval("Dresses_Id") %>' CommandArgument="BuyNow" Height="30px" ImageUrl="~/Images/BuyNowYellow.png" Width="100px" />
                                                </td>
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
        </table>

    </div>

    <div class="clear" style="height: 20px;">
        <asp:Label ID="Lblmessage" runat="server" ForeColor="Red" Text="Lblmessage"></asp:Label>
    </div>    
    <p style="font-size:x-large; text-align:center; color:orange;">Shop by Category</p>
    <div class="category">
         <asp:DataList ID="DtLstCategory" runat="server" RepeatColumns="6" RepeatDirection="Horizontal" OnItemCommand="DtLstCategory_ItemCommand" HorizontalAlign="Center" Width="80%">
            <ItemTemplate>
                <table class="border-warning rounded-top table"  style="width: auto; margin: 0 auto; text-align: center; border:solid thin; border-radius:10px 10px;">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImgBtnCatImage" CommandArgument="Category" runat="server" CssClass="rounded" ImageUrl='<%# Eval("Category_Images") %>' Width="150px"   />
                       
                            <asp:Label ID="LblCategoryName" runat="server" Text='<%# Eval("Category_Name") %>' Font-Size="Smaller" > </asp:Label>

                        </td>
                    </tr>
                </table>

            </ItemTemplate>
        </asp:DataList>
    </div>
     <div class="clear" style="height: 20px; margin:0 auto; text-align:center;"></div>    
    <div>
         <p style="font-size:x-large; text-align:center;  color:dodgerBlack;">Shop by Gender</p>
        <table class="table" style="width:60%; margin:0 auto; text-align:center; ">
            <tr>
                <td>
                    <asp:ImageButton runat="server" ID="ImgBtnWomen" Height="300px" PostBackUrl="~/ViewDresses.aspx?category=Female" ImageUrl="~/images/purple dress.jpg" CssClass="rounded" Width="300px" />
                    <br />
                    <asp:Label ID="lblWomen" runat="server" Text="Women" Font-Size="Smaller" Font-Bold="True" Font-Italic="True" ForeColor="Black"></asp:Label>
                </td>
                <td>
                    <asp:ImageButton runat="server" ID="ImgBtnMen" ImageUrl="~/images/m1.jpg" CssClass="rounded" Width="300px" PostBackUrl="~/ViewDresses.aspx?category=Male" Height="300px" />
                            <br />
                      <asp:Label ID="lblMen" runat="server" Text="Men" Font-Size="Smaller" Font-Bold="True" Font-Italic="True" ForeColor="Black"></asp:Label>
                </td>
                <td>
                    <asp:ImageButton runat="server" ID="ImgBtnKids" ImageUrl="~/images/kid1.jpg" CssClass="rounded" Width="300px" Height="300px" PostBackUrl="~/ViewDresses.aspx?category=Kids"/>
                            <br />
                      <asp:Label ID="lblKids" runat="server" Text="Kids" Font-Size="Smaller" Font-Bold="True" Font-Italic="True" ForeColor="Black"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
     <div class="clear" style="height: 20px;"></div>    
    <p style="font-size:x-large; text-align:center; color:rosybrown;">Shop by Brand</p>
    <div class="category">
         <asp:DataList ID="DtLstBrand" runat="server" RepeatColumns="6" RepeatDirection="Horizontal"  HorizontalAlign="Center" Width="80%" OnItemCommand="DtLstBrand_ItemCommand"  >
            <ItemTemplate>
                <table class="border-warning rounded-top table"  style="width: auto; margin: 0 auto; text-align: center; border:solid thin; border-radius:10px 10px;">
                    <tr>
                        <td>
                            <asp:ImageButton ID="ImgBtnBrandImage" CommandArgument="Brand" runat="server" CssClass="rounded" ImageUrl='<%# Eval("Brand_Images") %>' Height="200px" Width="190px"   />
                        <br />
                            <asp:Label ID="LblBrandName" runat="server" Text='<%# Eval("Brand_Name") %>' Font-Size="Smaller" > </asp:Label></td>
                    </tr>
                </table>

            </ItemTemplate>
        </asp:DataList>
    </div>
      <div class="clear" style="height: 20px;"></div>   








   
    </asp:Content>

