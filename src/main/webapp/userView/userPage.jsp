<%@ page import="model.User" %>
<%@ page import="beans.ShoppingCart" %><%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 1/22/2024
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<%
    User user = (User) session.getAttribute("user");
    boolean isLogined = user == null ? false : true;
%>
<%
    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
    if(shoppingCart == null){
        shoppingCart = new ShoppingCart();
    }
%>
<head>
    <title>Trang người dùng</title>
    <jsp:include page="../layout-view/head_libraries.jsp"></jsp:include>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/user/userStyle.css">
</head>
<body>
    <jsp:include page="../layout-view/header.jsp"></jsp:include>

    <%-- main section --%>
    <div class="container mb-4 main-container" style="margin-top: 100px">
        <div class="row">

            <div class="col-lg-4 pb-5">
                <!-- Account Sidebar-->
                <div class="author-card pb-3">
                    <div class="author-card-cover" style="background-image: url(../Movie_Ticket_Website/assets/images/mtp-banner.png);"><a class="btn btn-style-1 btn-white btn-sm" href="#" data-toggle="tooltip" title="" data-original-title="You currently have 290 Reward points to spend"><i class="fa fa-award text-md"></i>&nbsp;9999 points</a></div>
                    <div class="author-card-profile">
                        <div class="author-card-avatar"><img src="../Movie_Ticket_Website/assets/images/obitoAVATAR.png" alt="Daniel Adams">
                        </div>
                        <div class="author-card-details">
                            <h5 class="author-card-name text-lg">${sessionScope.get("userName")} #${sessionScope.get("user").userId}</h5>
                            <span class="author-card-position">Email : ${sessionScope.get("user").email}
                                <%
                                    User u = (User) session.getAttribute("user");
                                    if(u.isActive()) {
                                %>
                                    ✅
                                <%
                                    }
                                %>
                            </span>
                        </div>
                    </div>
                </div>

                <div class="wizard">
                    <nav class="list-group list-group-flush">
                        <a class="list-group-item active" href="userpage-servlet?action=init">
                            <div class="d-flex justify-content-between align-items-center">
                                <div><i class="fa fa-shopping-bag mr-1 text-muted"></i>
                                    <div class="d-inline-block font-weight-medium text-uppercase">Lịch sử đặt vé</div>
                                </div><span class="badge badge-secondary">6</span>
                            </div>
                        </a>
                        <a class="list-group-item" href="userpage-servlet?action=changeToProfileSetting"><i class="fa fa-user text-muted"></i>Cài đặt tài khoản</a>
<%--                        <a class="list-group-item" href="#"><i class="fa fa-map-marker text-muted"></i>Addresses</a>--%>
<%--                        <a class="list-group-item" href="https://www.bootdey.com/snippets/view/bs4-wishlist-profile-page" tagert="__blank">--%>
<%--                            <div class="d-flex justify-content-between align-items-center">--%>
<%--                                <div><i class="fa fa-heart mr-1 text-muted"></i>--%>
<%--                                    <div class="d-inline-block font-weight-medium text-uppercase">My Wishlist</div>--%>
<%--                                </div><span class="badge badge-secondary">3</span>--%>
<%--                            </div>--%>
<%--                        </a>--%>
<%--                        <a class="list-group-item" href="#">--%>
<%--                            <div class="d-flex justify-content-between align-items-center">--%>
<%--                                <div><i class="fa fa-tag mr-1 text-muted"></i>--%>
<%--                                    <div class="d-inline-block font-weight-medium text-uppercase">My Tickets</div>--%>
<%--                                </div><span class="badge badge-secondary">4</span>--%>
<%--                            </div>--%>
<%--                        </a>--%>
                    </nav>
                </div>
            </div>

            <!-- Orders Table-->
            <div class="col-lg-8 pb-5">
                <div class="d-flex justify-content-end pb-3">
                    <div class="form-inline">
                        <label class="text-muted mr-3" for="order-sort">Tìm kiếm theo</label>
                        <select class="form-control" id="order-sort">
                            <option>Tất cả</option>
                            <option>Tên</option>
                            <option>In Progress</option>
                            <option>Delayed</option>
                            <option>Canceled</option>
                        </select>
                        <form style="margin-bottom: 0px" action="userpage-servlet" method="post">
                            <input type="hidden" name="action" value="searchBy_transName">
                            <input class="form-control" type="search" placeholder="Nhập mã GD" name="transName">
                        </form>
                    </div>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                        <tr>
                            <th>Mã GD #</th>
                            <th>Vé</th>
                            <th>Ngày thực hiện</th>
                            <th>Loại giao dịch</th>
                            <th>Giá</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${transList}" var="t">
                                <tr>
                                    <td><a class="navi-link" href="#order-details" data-toggle="modal">${t.transactionID}</a></td>
                                    <td>${t.ticketID}</td>
                                    <td>${t.transDate}</td>
                                    <td><span class="badge badge-danger m-0">${t.paymentTypeID}</span></td>
                                    <td><span>${t.totalPrice} VNĐ</span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="../assets/js/user/userMain.js"></script>
    <jsp:include page="../layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="../layout-view/js-function-slider.jsp" ></jsp:include>
</body>
</html>
<!-- responsive tabs -->
<%--<script src="assets/js/jquery-3.7.1.min.js"></script>--%>
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/easyResponsiveTabs.js"></script>
<!--/theme-change-->
<script src="../assets/js/theme-change.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<script src="../assets/js/main.js"></script>
