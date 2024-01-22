<%@ page import="model.User" %>
<%@ page import="beans.ShoppingCart" %>
<%@ page import="model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<script>
    function noticeUpdateSuccess() {
        alert("Cập nhật thông tin thành công !");
    }
    function noticeUpdateFailed() {
        alert("Không có gì đề cập nhật !");
    }
</script>
<%
    User user = (User) session.getAttribute("user");
    Customer customer = (Customer) session.getAttribute("customer");
    boolean isLogined = user == null ? false : true;
%>
<%
    ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
    if(shoppingCart == null){
        shoppingCart = new ShoppingCart();
    }
%>
<%
    String updateSuccessed = (String) session.getAttribute("updateStatus");
    if(updateSuccessed != null) {
        if (updateSuccessed.equals("1")) {
%>
    <script>noticeUpdateSuccess();</script>
<%
        } else {
%>
    <script>noticeUpdateFailed();</script>
<%
        }
    }
    session.removeAttribute("updateStatus");
%>
<head>
    <title>Trang người dùng</title>
    <jsp:include page="../layout-view/head_libraries.jsp"></jsp:include>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/user/userStyle.css">
    <link rel="stylesheet" href="assets/css/user/userStyle_ProfileSetting.css">
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
                        <a class="list-group-item " href="userpage-servlet?action=init">
                            <div class="d-flex justify-content-between align-items-center">
                                <div><i class="fa fa-shopping-bag mr-1 text-muted"></i>
                                    <div class="d-inline-block font-weight-medium text-uppercase">Lịch sử đặt vé</div>
                                </div><span class="badge badge-secondary">6</span>
                            </div>
                        </a>
                        <a class="list-group-item active" href="userpage-servlet?action=changeToProfileSetting"><i class="fa fa-user text-muted"></i>Cài đặt tài khoản</a>
                        <a class="list-group-item" href="#"><i class="fa fa-map-marker text-muted"></i>Addresses</a>
                        <a class="list-group-item" href="https://www.bootdey.com/snippets/view/bs4-wishlist-profile-page" tagert="__blank">
                            <div class="d-flex justify-content-between align-items-center">
                                <div><i class="fa fa-heart mr-1 text-muted"></i>
                                    <div class="d-inline-block font-weight-medium text-uppercase">My Wishlist</div>
                                </div><span class="badge badge-secondary">3</span>
                            </div>
                        </a>
                        <a class="list-group-item" href="#">
                            <div class="d-flex justify-content-between align-items-center">
                                <div><i class="fa fa-tag mr-1 text-muted"></i>
                                    <div class="d-inline-block font-weight-medium text-uppercase">My Tickets</div>
                                </div><span class="badge badge-secondary">4</span>
                            </div>
                        </a>
                    </nav>
                </div>
            </div>

            <!-- Orders Table-->
            <div class="col-lg-8 pb-5">
                <form class="row" action="userpage-servlet" method="get">
                    <input type="hidden" name="action" value="updateUser">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-fn">Họ và tên</label>
                            <input class="form-control" type="text" id="account-fn" name="name" value="<%= customer.getFullName() %>" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="order-sort">Giới tính</label>
                            <select class="form-control" id="order-sort" name="gender" >
                                <%
                                if(customer.getGender().equals("Nam")) {
                                %>
                                <option selected >Nam</option>
                                <option>Nữ</option>
                                <%
                                    } else if (customer.getGender().equals("Nữ")) {
                                %>
                                <option>Nam</option>
                                <option selected>Nữ</option>
                                <%
                                    } else if (customer.getGender() == null) {
                                %>
                                <option>Nam</option>
                                <option>Nữ</option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-email">Địa chỉ email</label>
                            <input class="form-control" type="email" id="account-email" name="email" value="<%= user.getEmail() %>" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-phone">Số điện thoại</label>
                            <%
                                if(customer.getPhoneNumber() != null) {
                            %>
                            <input class="form-control" type="text" id="account-phone" name="phoneNumber" value="<%= customer.getPhoneNumber() %>" >
                            <%
                                } else {
                            %>
                            <input class="form-control" type="text" id="account-phone" name="phoneNumber" placeholder="Chưa đăng ký SĐT" >
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="address">Địa chỉ</label>
                            <%
                                if(customer.getAddress() != null) {
                            %>
                            <input class="form-control" type="text" id="address" name="address" value="<%= customer.getAddress() %>" >
                            <%
                                } else {
                            %>
                            <input class="form-control" type="text" id="address" name="address" placeholder="Chưa nhập Địa chỉ" >
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="dob">Ngày sinh</label>
                            <%
                                if(customer.getDob() != null) {
                            %>
                            <input class="form-control" type="date" id="dob" name="dob" value="<%= customer.getDob() %>" >
                            <%
                                } else {
                            %>
                            <input class="form-control" type="date" id="dob" name="dob" placeholder="" >
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <hr >
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="username">Tên người dùng mới</label>
                            <input class="form-control" type="text" id="username" name="username" placeholder="<%= user.getUserName() %>" maxlength="20" >
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="account-pass">Mật khẩu mới *(tối đa 12)</label>
                            <input class="form-control" type="text" name="password" id="account-pass" maxlength="12" >
                        </div>
                    </div>
                    <div class="col-12">
                        <hr class="mt-2 mb-3">
                        <div class="d-flex flex-wrap justify-content-between align-items-center">
                            <div class="custom-control custom-checkbox d-block">
                                <input class="custom-control-input" type="checkbox" id="subscribe_me" checked="">
                                <label class="custom-control-label" for="subscribe_me">Đảm bảo thông tin nhập vào được an toàn</label>
                            </div>
                            <button class="btn btn-style-1 btn-primary" type="submit" data-toast="" data-toast-position="topRight" data-toast-type="success" data-toast-icon="fe-icon-check-circle" data-toast-title="Success!" data-toast-message="Your profile updated successfuly.">Cập nhật thông tin</button>
                        </div>
                    </div>
                </form>
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
