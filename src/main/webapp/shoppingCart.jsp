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
<%
    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
    if(shoppingCart == null) {
        shoppingCart = new ShoppingCart();
        List<CartItem> cartItem = shoppingCart.getCartItem();
    }
    List<CartItem> cartItem = shoppingCart.getCartItem();
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
                                        <img src="../Movie_Ticket_Website/assets/movie-image/<%= ci %>" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark"><%= ci %></a>
                                            <small>
                                                <span class="text-muted">Color:</span>
                                                <span class="ui-product-color ui-product-color-sm align-text-bottom" style="background:#e81e2c;"></span> &nbsp;
                                                <span class="text-muted">Size: </span> EU 37 &nbsp;
                                                <span class="text-muted">Ships from: </span> China
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">$57.55</td>
                                <td class="align-middle p-4"><input type="text" class="form-control text-center" value="2"></td>
                                <td class="text-right font-weight-semibold align-middle p-4">$115.1</td>
                                <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                            </tr>
                            <% } %>

                            <tr>
                                <td class="p-4">
                                    <div class="media align-items-center">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark">Product 2</a>
                                            <small>
                                                <span class="text-muted">Color:</span>
                                                <span class="ui-product-color ui-product-color-sm align-text-bottom" style="background:#000;"></span> &nbsp;
                                                <span class="text-muted">Storage: </span> 32GB &nbsp;
                                                <span class="text-muted">Warranty: </span> Standard - 1 year &nbsp;
                                                <span class="text-muted">Ships from: </span> China
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">$1049.00</td>
                                <td class="align-middle p-4"><input type="text" class="form-control text-center" value="1"></td>
                                <td class="text-right font-weight-semibold align-middle p-4">$1049.00</td>
                                <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                            </tr>
                            <tr>
                                <td class="p-4">
                                    <div class="media align-items-center">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="d-block ui-w-40 ui-bordered mr-4" alt="">
                                        <div class="media-body">
                                            <a href="#" class="d-block text-dark">Product 3</a>
                                            <small>
                                                <span class="text-muted">Ships from: </span> Germany
                                            </small>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right font-weight-semibold align-middle p-4">$20.55</td>
                                <td class="align-middle p-4"><input type="text" class="form-control text-center" value="1"></td>
                                <td class="text-right font-weight-semibold align-middle p-4">$20.55</td>
                                <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                            </tr>
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
                            <label class="text-muted font-weight-normal m-0">Khuyến mãi</label>
                            <div class="text-large"><strong>$20</strong></div>
                        </div>
                        <div class="text-right mt-4">
                            <label class="text-muted font-weight-normal m-0">Tổng thanh toán</label>
                            <div class="text-large"><strong>$1164.65</strong></div>
                        </div>
                    </div>
                </div>

                <div class="float-right">
                    <button href="home-servlet?action=direct" type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" >Quay lại</button>
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
