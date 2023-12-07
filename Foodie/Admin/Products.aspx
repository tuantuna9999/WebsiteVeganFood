﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Foodie.Admin.Products" %>

<%@ Import Namespace="Foodie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = funtion(); {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID%>').prop('src', e.target.result).width(200).height(200);

                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Sản phẩm</h4>
                                            <div>

                                                <div class="form-group">
                                                    <label>Tên món</label>
                                                    <div>
                                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Vui lòng nhập tên món!">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="rfvName" runat="server"
                                                          ErrorMessage="Vui lòng điền vào đây!" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnError="true" ControlToValidate="txtName">
                                                        </asp:RequiredFieldValidator>--%>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Mô tả</label>
                                                    <div>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" placeholder="Vui lòng nhập mô tả!" TextMode="MultiLine">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="rfvDes" runat="server" ErrorMessage="Vui lòng điền vào đây!" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnErrror="true" ControlToValidate="txtDescription">
                                                        </asp:RequiredFieldValidator>--%>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label>
                                                        Giá (đ)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Vui lòng nhập giá!">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng điền vào đây!"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice">
                                                        </asp:RequiredFieldValidator>--%>
                                                        <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server" ErrorMessage="Giá phải là số!" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ValidationExpression="^\d{0,8}(\.\d{1,4})?$">
                                                        </asp:RegularExpressionValidator>--%>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Số lượng</label>
                                                    <div>
                                                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" placeholder="Vui lòng nhập số lượng!">
                                                        </asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng điền vào đây!"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity">
                                                        </asp:RequiredFieldValidator>--%>
                                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Số lượng không âm!" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"
                                                            ValidationExpression="^([1-9]\d*|0)$">
                                                        </asp:RegularExpressionValidator>--%>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Hình ảnh</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Danh mục</label>
                                                    <div>
                                                        <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control"
                                                            DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryID" AppendDataBoundItems="true">
                                                            <asp:ListItem Value="0">Chọn danh mục</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng điền vào đây!" ForeColor="Red" Display="Dynamic"
                                                            SetFocusOnErrror="true" ControlToValidate="ddlCategories" InitialValue="0">
                                                        </asp:RequiredFieldValidator>--%>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
                                                            SelectCommand="SELECT [CategoryID], [Name] FROM [Categories]"></asp:SqlDataSource>
                                                    </div>
                                                </div>

                                                <div class="form-check pl-4">

                                                    <asp:CheckBox ID="cbIsActive" runat="server" Text=" &nbsp; IsActive" CssClass="form-check-input"></asp:CheckBox>

                                                </div>
                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnAddOrUpdate_Click" />
                                                    <asp:Button ID="btnClear" runat="server" Text="Xóa form" CssClass="btn btn-primary" CausesValidation="false" OnClick="btnClear_Click" />

                                                </div>

                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail"></asp:Image>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                            <h4 class="sub-title">Category List</h4>
                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">



                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand" OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Tên món</th>
                                                                        <th>Hình ảnh</th>
                                                                        <th>Giá</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Loại sản phẩm</th>
                                                                        <th>IsActive</th>
                                                                        <th>Mô tả</th>
                                                                        <th>Ngày tạo</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>

                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%#Eval("Name") %></td>
                                                                <td>
                                                                    <img alt="" width="90" src="<%# Utils.GetImageUrl(Eval("ImageUrl")) %>" />
                                                                </td>
                                                                <td style="text-align: center"><%#Eval("Price") %></td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%#Eval("Quantity") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: center"><%#Eval("CategoryName") %></td>
                                                                <td style="text-align: center">
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%#Eval("IsActive") %>'></asp:Label>
                                                                </td>
                                                                <td style="text-align: center"><%#Eval("Description") %></td>
                                                                <td style="text-align: center"><%#Eval("CreateDate") %></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" Text="Edit" Style="background-color: yellow; font-size: 20px; color: black" runat="server" CssClass="badge badge-primary
                                                                        "
                                                                        CommandArgument='<%#Eval("ProductID") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>
                                                                    </asp:LinkButton>
                                                                    <asp:LinkButton ID="lnkDelete" Text="Delete" Style="background-color: red; font-size: 20px; color: black" runat="server" CssClass="badge badge-primary"
                                                                        CommandArgument='<%#Eval("ProductID") %>' CommandName="delete"
                                                                        OnClientClick="return confirm('Bạn có muốn xóa món ăn này?');">
                                                                        <i class="ti-trash"></i>
                                                                    </asp:LinkButton>


                                                                </td>

                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div>
            </div>
        </div>
    </div>
</asp:Content>
