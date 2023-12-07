<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodie.User.Registration" %>

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
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result).width(200).height(200);

                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"> </asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Đăng ký</h2>"> </asp:Label>

            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Vui lòng nhập họ tên!"
                                ToolTip="Full Name"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Vui lòng nhập tên!" ControlToValidate="txtName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Bạn phải nhập tên vào đây!"
                                  ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtName"></asp:RegularExpressionValidator>
                        </div>--%>
                        </div>

                        <div>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Vui lòng nhập tên đăng nhập!"
                                ToolTip="Full UserName"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Vui lòng nhập tên đăng nhập!" ControlToValidate="txtUserName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                        </div>

                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Vui lòng nhập email!"
                                ToolTip="Full Email"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Vui lòng nhập email!" ControlToValidate="txtEmail"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                        </div>

                        <div>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Vui lòng nhập số điện thoại!"
                                ToolTip="Mobile Number" TextMode="Number"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Vui lòng nhập số điện thoại!" ControlToValidate="txtName"
                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Bạn phải nhập số điện thoại vào đây!"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                        </div>--%>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Vui lòng nhập địa chỉ!"
                                ToolTip="Full Address" TextMode="MultiLine"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Vui lòng nhập địa chỉ!" ControlToValidate="txtAddress"
             ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                        </div>


                        <div>
                            <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Vui lòng nhập PostCode!"
                                ToolTip="Full PostCode" TextMode="Number"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="Vui lòng nhập PostCode!" ControlToValidate="txtPostCode"
             ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="Bạn phải nhập PostCode vào đây!"  ControlToValidate="txtPostCode"
    ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtPostCode"></asp:RegularExpressionValidator>
                      
                            --%>
                        </div>

                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" />
                        </div>

                        <div>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Vui lòng nhập mật khẩu!"
                                ToolTip="Password" TextMode="Password"></asp:TextBox>

                            <%--  <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Vui lòng nhập mật khẩu!" ControlToValidate="txtPassword"
                     ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row pl-4">
                <div class="btn_box">
                    <asp:Button ID="btnRegister" runat="server" Text="Đăng ký" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                        OnClick="btnRegister_Click"/>
                <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                    Text="Bạn có chắc muốn đăng ký? <a href='Login.aspx' class='badge badge-info'>Đăng nhập vào đây!</a>" ></asp:Label>
                </div>
            </div>
            <div class="row p-5">
                <div style="align-items:center">
                    <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                </div>
            </div>

        </div>
    </section>
</asp:Content>
