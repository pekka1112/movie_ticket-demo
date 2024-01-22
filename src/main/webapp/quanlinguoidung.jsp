<%@page import="model.User" %>
<%@page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%--    <jsp:useBean id="user" class="model.User" scope="request"/>--%>
    <%--    <jsp:useBean id="userDAO" class="database.UserDAO" scope="request"/>--%>

    <!-- Title Page-->
    <title>ADMIN HOME</title>

    <!-- Fontfaces CSS-->
    <link href="admin/css/font-face.css" rel="stylesheet" media="all">
    <%--    <link href="admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">--%>
    <%--    <link href="admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">--%>
    <link href="admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">


    <!-- Bootstrap CSS-->
    <link href="admin/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="admin/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="admin/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="admin/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="admin/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="admin/css/theme.css" rel="stylesheet" media="all">
    <!-- new css -->
    <link rel="stylesheet" href="admin/css/style_admin.css">
    <%--    <script>--%>
    <%--        <% User user = (User) session.getAttribute("admin") == null ? null : (User) (session.getAttribute("admin"));  %>--%>
    <%--    </script>--%>

</head>

<body class="animsition">


<div class="page-wrapper">
    <!-- HEADER MOBILE-->
    <header class="header-mobile d-block d-lg-none">
        <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
                    <a class="logo" href="login">
                        <img src="assets/images/icon_banner.jpg" alt="PZO TICKET" title="PZO TICKET"
                             style="height:35px;"/>
                        PZO TICKET

                    </a>
                    <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
        </div>
        <nav class="navbar-mobile">
            <div class="container-fluid">
                <ul class="navbar-mobile__list list-unstyled">
                    <li class="active has-sub">
                        <a class="js-arrow" href="quanlinguoidung">
                            <i class="fas fa-tachometer-alt"></i>Quản Lí Người Dùng</a>
                    </li>
                    <li>
                        <a href="quanliphim">
                            <i class="fas fa-chart-bar"></i>Quản Lí Phim
                        </a>
                    </li>
                    <li>
                        <a href="quanlive">
                            <i class="fas fa-table"></i>Quản Lí vé
                        </a>

                    </li>
                    <li>
                        <a href="quanlibinhluan">
                            <i class="far fa-check-square"></i>Quản Lí Bình Luận
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- END HEADER MOBILE-->

    <!-- MENU SIDEBAR-->
    <aside class="menu-sidebar d-none d-lg-block">
        <div class="logo">
            <a href="adminhome.jsp">
                <img src="assets/images/icon_banner.jpg" alt="PZO TICKET" title="PZO TICKET" style="height:35px;"/>
                PZO TICKET
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                    <li class="active has-sub">
                        <a class="js-arrow" href="quanlinguoidung">
                            <i class="fas fa-tachometer-alt"></i>Quản Lí Người Dùng</a>
                    </li>
                    <li>
                        <a href="quanliphim">
                            <i class="fas fa-chart-bar"></i>Quản Lí Phim
                        </a>
                    </li>
                    <li>
                        <a href="quanlive">
                            <i class="fas fa-table"></i>Quản Lí vé
                        </a>

                    </li>
                    <li>
                        <a href="quanlibinhluan">
                            <i class="far fa-check-square"></i>Quản Lí Bình Luận
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>
    <!-- END MENU SIDEBAR-->

    <!-- PAGE CONTAINER-->
    <div class="page-container">
        <!-- HEADER DESKTOP-->
        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">

                        <form class="form-header" action="search?cid=0&uid=1&fid=0&tid=0" method="POST">
                            <input class="au-input au-input--xl" type="text" name="search"
                                   placeholder="Tên người dùng"/>
                            <button class="au-btn--submit" type="submit">
                                <i class="zmdi zmdi-search"></i>
                            </button>
                        </form>

                        <div class="header-button">
                            <div class="noti-wrap">
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-comment-more"></i>
                                    <span class="quantity">1</span>
                                    <div class="mess-dropdown js-dropdown">
                                        <div class="mess__title">
                                            <p>Bạn có 2 tin nhắn</p>
                                        </div>
                                        <div class="mess__item">
                                            <div class="image img-cir img-40">
                                                <img src="assets/images/thanh_phat_avt.png" alt="Thanh Phát"/>
                                            </div>
                                            <div class="content">
                                                <h6>Thanh Phát</h6>
                                                <p>Đã gửi một bức ảnh</p>
                                                <span class="time">3 phút trước</span>
                                            </div>
                                        </div>
                                        <div class="mess__item">
                                            <div class="image img-cir img-40">
                                                <img src="assets/images/thanh_phat_avt.png" alt="Thanh Phát"/>
                                            </div>
                                            <div class="content">
                                                <h6>Thanh Phát</h6>
                                                <p>bây giờ bạn đã kết nối qua tin nhắn</p>
                                                <span class="time">Hôm qua</span>
                                            </div>
                                        </div>
                                        <div class="mess__footer">
                                            <a href="#">Xem tất cả tin nhắn</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-email"></i>
                                    <span class="quantity">1</span>
                                    <div class="email-dropdown js-dropdown">
                                        <div class="email__title">
                                            <p>Bạn có 3 email mới</p>
                                        </div>
                                        <div class="email__item">
                                            <div class="image img-cir img-40">
                                                <img src="assets/images/thanh_phat_avt.png" alt="Thanh Phát"/>
                                            </div>
                                            <div class="content">
                                                <p>Cuộc họp về bảng điều khiển mới...</p>
                                                <span>Thanh Phát, 3 phút trước</span>
                                            </div>
                                        </div>
                                        <div class="email__item">
                                            <div class="image img-cir img-40">
                                                <img src="assets/images/thanh_phat_avt.png" alt="Thanh Phát"/>
                                            </div>
                                            <div class="content">
                                                <p>Cuộc họp về Database...</p>
                                                <span>Thanh Phát, Hôm qua</span>
                                            </div>
                                        </div>
                                        <div class="email__item">
                                            <div class="image img-cir img-40">
                                                <img src="assets/images/thanh_phat_avt.png" alt="Thanh Phát"/>
                                            </div>
                                            <div class="content">
                                                <p>Cuộc họp về Database...</p><p>Meeting about new dashboard...</p>
                                                <span>Thanh phát, 22-1-2024</span>
                                            </div>
                                        </div>
                                        <div class="email__footer">
                                            <a href="#">Xem tất cả email</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-notifications"></i>
                                    <span class="quantity">3</span>
                                    <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__title">
                                            <p>Bạn có 3 thông báo</p>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 img-cir img-40">
                                                <i class="zmdi zmdi-email-open"></i>
                                            </div>
                                            <div class="content">
                                                <p>Bạn đã nhận được thông báo qua email</p>
                                                <span class="date">21-01-2024, 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c2 img-cir img-40">
                                                <i class="zmdi zmdi-account-box"></i>
                                            </div>
                                            <div class="content">
                                                <p>Bạn có 1 email mới</p>
                                                <span class="date">22-01-2024, 09:30</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c3 img-cir img-40">
                                                <i class="zmdi zmdi-file-text"></i>
                                            </div>
                                            <div class="content">
                                                <p>Bạn có một tập tin mới</p>
                                                <span class="date">22-01-2024, 11:01</span>
                                            </div>
                                        </div>
                                        <div class="notifi__footer">
                                            <a href="#">Tất cả thông báo</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="account-wrap">
                                <div class="account-item clearfix js-item-menu">
                                    <div class="image">
                                        <img src="assets/images/thanh_quyen_avt.png" alt="Thanh Quyen"/>
                                    </div>
                                    <div class="content">
                                        <a class="js-acc-btn" href="#">Thanh Quyen</a>
                                    </div>
                                    <div class="account-dropdown js-dropdown">
                                        <div class="info clearfix">
                                            <div class="image">
                                                <a href="#">
                                                    <img src="assets/images/thanh_quyen_avt.png" alt="Thanh Quyen"/>
                                                </a>
                                            </div>
                                            <div class="content">
                                                <h5 class="name">
                                                    <a href="#">Thanh Quyen</a>
                                                </h5>
                                                <span class="email">ThanhQuyen@email.com</span>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__body">
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-account"></i>Tài khoản</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-settings"></i>Cài đặt</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-money-box"></i>Thanh toán</a>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__footer">
                                            <a href="login.jsp">
                                                <i class="zmdi zmdi-power"></i>Đăng xuất</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- HEADER DESKTOP-->

        <!-- MAIN CONTENT-->
        <div class="main-content">

            <div>
                <div class="card">
                    <div class="card-body">

                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark">
                            <tr>
                                <th class="align-middle">Id</th>
                                <th class="align-middle">Tên người dùng</th>
                                <th class="align-middle">Email người dùng</th>
                                <th class="align-middle">Trạng thái hoạt động</th>
                                <th class="align-middle">Chặn</th>
                                <th class="align-middle">Xóa</th>
                            </tr>
                            </thead>
                            <tbody class="align-middle" id="renderdata-user">
                            <%boolean showAll = (boolean) request.getAttribute("showAll");
                            System.out.println(showAll);
                                if (showAll) {
                                List<User> users = (List<User>) request.getAttribute("userList");
                            for (User user : users) {%>
                            <tr>
                                <td class="align-middle"><%=user.getUserId()%>
                                </td>
                                <td class="align-middle"><%=user.getUserName()%>
                                </td>
                                <td class="align-middle"><%=user.getEmail()%>
                                </td>
                                <td class="align-middle">
                                    <button class="btn btn-sm btn-primary"><%=user.isActive() ? "Đang hoạt động" : "Bị chặn"%>
                                    </button>
                                </td>
                                <td class="align-middle">
                                    <button id="btnBlock" data-id="<%=user.getUserId()%>" class="btn btn-sm btn-primary"
                                            data-toggle="modal" data-target="#blockUser"
                                            title=<%= user.isActive() ? "Chặn" : "Mở chặn" %>><i
                                            class="fa-solid fa-ban"></i></button>
                                </td>
                                <td class="align-middle">
                                    <button data-id="<%=user.getUserId()%>" class="btn btn-sm btn-primary"
                                            data-toggle="modal" data-target="#deleteUser" title="Xóa"><i
                                            class="fa fa-times"></i></button>
                                </td>

                            </tr>
                            <%}%>
                            <%} else {
                            List<User> listUserSearch = (List<User>) request.getAttribute("userListS");
                            for(User user : listUserSearch) {%>
                            <tr>
                                <td class="align-middle"><%=user.getUserId()%>
                                </td>
                                <td class="align-middle"><%=user.getUserName()%>
                                </td>
                                <td class="align-middle"><%=user.getEmail()%>
                                </td>
                                <td class="align-middle">
                                    <button class="btn btn-sm btn-primary"><%=user.isActive() ? "Đang hoạt động" : "Bị chặn"%>
                                    </button>
                                </td>
                                <td class="align-middle">
                                    <button id="btnBlock1" data-id="<%=user.getUserId()%>" class="btn btn-sm btn-primary"
                                            data-toggle="modal" data-target="#blockUser"
                                            title=<%= user.isActive() ? "Chặn" : "Mở chặn" %>><i
                                            class="fa-solid fa-ban"></i></button>
                                </td>
                                <td class="align-middle">
                                    <button data-id="<%=user.getUserId()%>" class="btn btn-sm btn-primary"
                                            data-toggle="modal" data-target="#deleteUser" title="Xóa"><i
                                            class="fa fa-times"></i></button>
                                </td>

                            </tr>

                            <%}%>
                            <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
    </div>

</div>
<%--Confirm delete--%>
<div id="deleteUser" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Xóa người dùng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xóa nó không ? </p>
            </div>
            <div class="modal-footer">
                <button id="btn-delete-user" type="button" class="btn btn-danger">Xóa</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div>
<%--    block user--%>
<div id="blockUser" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title-block">Chặn người dùng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="body-block">Bạn có chắc chắn muốn chặn người này không không ? </p>
            </div>
            <div class="modal-footer">
                <button id="btn-block-user" type="button" class="btn btn-danger">Chặn</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div>
<script src="./admin/js/Dialog.js"></script>
<script>
    Dialog('#deleteUser', '#btn-delete-user', 'quanlinguoidung', 'userID', "delete")
    Dialog('#blockUser', '#btn-block-user', 'quanlinguoidung', 'userID', "put")
</script>
<!-- Jquery JS-->
<script src="admin/vendor/jquery-3.2.1.min.js"></script>
<!-- Bootstrap JS-->
<script src="admin/vendor/bootstrap-4.1/popper.min.js"></script>
<script src="admin/vendor/bootstrap-4.1/bootstrap.min.js"></script>
<!-- Vendor JS       -->
<script src="admin/vendor/slick/slick.min.js">
</script>
<script src="admin/vendor/wow/wow.min.js"></script>
<script src="admin/vendor/animsition/animsition.min.js"></script>
<script src="admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
</script>
<script src="admin/vendor/counter-up/jquery.waypoints.min.js"></script>
<script src="admin/vendor/counter-up/jquery.counterup.min.js">
</script>
<script src="admin/vendor/circle-progress/circle-progress.min.js"></script>
<script src="admin/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="admin/vendor/chartjs/Chart.bundle.min.js"></script>
<script src="admin/vendor/select2/select2.min.js">

</script>

<!-- Main JS-->
<script src="admin/js/main.js"></script>

</body>

</html>
<!-- end document-->
