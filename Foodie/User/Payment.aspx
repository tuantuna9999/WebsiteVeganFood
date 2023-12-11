<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Foodie.User.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .rounded{
            border-radius: 1rem
        }

        .nav-pills .nav-link{
            color: #000
        }

        .nav-pills .nav-link.active{
            color: white
        }
        .bold{
            font-weight: bold
        }
        .card{
            padding: 40px 50px;
            border-radius: 20px;
            border:none;
            box-shadow: 1px 5px 10px 1px rgba(0, 0, 0, 0.2)
        }
    </style>
    <script>
        /*For disappearing alert message */
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
        /*For tooltip */
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
        
        <script type="text/javascript">
            function DisableBackButton() {
                window.history.forward()
            }
            DisableBackButton();
            window.onload = DisableBackButton;
            window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
             window.onunload = function () { void (0) }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="book_section" style="background-image: url('../Images/payment-bg.png'); width: 100%; height: 100%; background-repeat: no-repeat;
        background-size: auto; background-attachment: fixed; background-position: left;">

        <div class="container py-5">
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <!-- For demo purpose-->
             <div class="row mb-4">
                 <div class="col-lg-8 mx-auto text-center">
                     <h1 class="display-6">Order Payment</h1>
                 </div>
             </div>
              <!-- End -->
            <div class="row pb-5">
                <div class="col-lg-6 mx-auto">
                    <div class="card">
                        <div class="card-header">
                            <div class="bg-white shadow-sm pt-4 pl-2 pb-2">
                                <!-- Payment type tabs -->
                                <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                    <li class="nav-item"><a data-toggle="pill" href="#credit-card" class="nav-link active"><i class="fa fa-cab"></i></a></li>
                                    <li class="nav-item"><a data-toggle="pill" href="#paypal" class="nav-link"><i class="fa fa-money mr-2"></i></a></li>
                                </ul>
                                 <!-- End -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>

</asp:Content>
