<%@ page import="beans.ShoppingCart" %>
<%@ page import="beans.CartItem" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 1/21/2024
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script>
    function noteNonCinema() {
        alert("GIỎ HÀNG TRỐNG");
    }
</script>
<%
    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
    List<CartItem> cartItem ;
    if(shoppingCart == null) {
%>
<script>noteNonCinema();</script>
<%
        response.sendRedirect("/index.jsp");
        shoppingCart = new ShoppingCart();
         cartItem = shoppingCart.getCartItem();
    } else {
        cartItem = shoppingCart.getCartItem();
    }
%>
<html>
<head>
    <title>Giỏ hàng</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/shoppingCart.css">
</head>
<body>
    <jsp:include page="layout-view/header.jsp"></jsp:include>
    <div class="w3l-breadcrumbs" style="padding-top: 70px;padding-bottom: 0px">
        <nav id="breadcrumbs" class="breadcrumbs">
            <div class="container page-wrapper">
                <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Giỏ hàng</span>
            </div>
        </nav>
    </div>
    <div class="container px-3 my-5 clearfix" style="margin-top: 10px !important;">
        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered m-0">
                        <thead>
                            <tr>
                                <th class="text-center py-3 px-4" style="min-width: 400px;">Vé &amp; Thông tin vé đặt</th>
                                <th class="text-right py-3 px-4" style="width: 100px;">Giá vé</th>
                                <th class="text-center py-3 px-4" style="width: 120px;">Số lượng</th>
                                <th class="text-center py-3 px-4" style="width: 120px">Tổng</th>
                                <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for(CartItem ci : cartItem) {
                            %>
                                <tr>
                                <td class="p-4">
                                    <div class="media align-items-center">
                                        <img src="../Movie_Ticket_Website/assets/movie-image/<%= ci.getTicketData().getLinkMovieImage() %>" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark" style="font-style: italic">Tên phim : <%= ci.getTicketData().getMovieName() %><p><%= ci.getTicketData().getCinemaName() %> (<%= ci.getTicketData().getLocation() %>)</p></a>
                                            <small>
                                                <span class="text-muted">Chưa thanh toán</span>
                                                <span class="ui-product-color ui-product-color-sm align-text-bottom" style="background:#58bd37;"></span> &nbsp;
                                                <span class="text-muted">Phòng chiếu : </span> <%= ci.getTicketData().getRoomName() %>
                                                <span class="text-muted">Thời gian : </span> <%= ci.getTicketData().getShowDate() %> * <%= ci.getTicketData().getStartTime() %> * Ghế : <%= ci.getTicketData().getSeatName() %>
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4"><%= ci.getPrice()%></td>
                                <td class="align-middle p-4"><input type="text" class="form-control text-center" value="<%= ci.getQuanlity()%>"></td>
                                <td class="text-right font-weight-semibold align-middle p-4"><%= ci.getTotalPrice()%> VNĐ</td>
                                    <c:url value="" var="deleteLink"></c:url>
                                <td class="text-center align-middle px-0"><a href="/Movie_Ticket_Website/shoppingCart-servlet?action=delete&ticketID=<%=ci.getTicketData().getTicketID()%>" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">x</a></td>
                            </tr>
<%--                            <a class="btn btn-lg btn-primary mt-2"--%>
<%--                               href="/Movie_Ticket_Website/bookingTicket-servlet?action=changeToCheckout&--%>
<%--                               addToCart=0&time=<%= ci.getTicketData().getStartTime() %>&--%>
<%--                               cinemaRoomName=<%= ci.getTicketData().getRoomName() %>&--%>
<%--                               date=<%= ci.getTicketData().getShowDate() %>&--%>
<%--                               cinemaName=<%= ci.getTicketData().getCinemaName() %> &movieID=${movieID}&--%>
<%--                               seatName=<%= ci.getTicketData().getSeatName() %>">Thanh toán</a>--%>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                    <div class="mt-4">
                        <label class="text-muted font-weight-normal">Mã giảm giá</label>
                        <input type="text" placeholder="Nhập voucher tại đây" class="form-control">
                    </div>
                    <div class="d-flex">
                        <div class="text-right mt-4 mr-5">
                            <label class="text-muted font-weight-normal m-0">Khuyến mãi cực sốc</label>
                            <div class="text-large"><strong>- 0 VNĐ</strong></div>
                        </div>
                        <div class="text-right mt-4">
                            <label class="text-muted font-weight-normal m-0">Tổng thanh toán</label>
                            <div class="text-large"><strong><%= shoppingCart.totalPriceItem()%> VNĐ</strong></div>
                        </div>
                    </div>
                </div>

                <div class="float-right">
<%--                    <button href="/home-servlet?action=direct" type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" >Quay lại</button>--%>
    <a href="/Movie_Ticket_Website/home-servlet?action=direct" type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" >Quay lại</a>
<%--    <a class="btn btn-lg btn-primary mt-2"  href="">${c.seatName }</a> type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" >Thanh toán</a>--%>
                        <button type="button" class="btn btn-lg btn-primary mt-2">Thanh toán</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="layout-view/js-function-slider.jsp" ></jsp:include>
</body>
</html>
<%--<script src="assets/js/jquery-3.7.1.min.js"></script>--%>
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/easyResponsiveTabs.js"></script>
<!--/theme-change-->
<script src="assets/js/theme-change.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<script src="assets/js/main.js"></script>
