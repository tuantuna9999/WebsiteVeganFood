<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Foodie.User.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblmsg.ClientID%>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblmsg"></asp:Label>
                </div>
                <h2>Login</h2>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <img id="userLogin" src="../Images/login.png" alt="" class="img-thumbnail"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Tên đăng nhập"></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" type="password" placeholder="Nhập mật khẩu"></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" type="password" placeholder="Nhập lại mật khẩu"></asp:TextBox>
                        </div>
                        <div class="btn-box">
                            <asp:Button ID="btnLogin" runat="server" Text="Cập Nhật" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" onClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

