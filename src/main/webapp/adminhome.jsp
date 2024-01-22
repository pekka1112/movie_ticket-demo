<%@ page import="java.util.List" %>
<%@ page import="model.FilmEaring" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%--%>
<%--    if (session.getAttribute("user") == null){--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Title Page-->
    <title>ADMIN HOME</title>

    <!-- Fontfaces CSS-->
    <link href="admin/css/font-face.css" rel="stylesheet" media="all">
<%--    <link href="admin/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">--%>
<%--    <link href="admin/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">--%>
    <link href="admin/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

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

</head>

<body class="animsition">
<%int userOnl = (int) request.getAttribute("userOnl");%>
<%int ticketQuantity = (int) request.getAttribute("ticketQuantity");%>
<%int totalMovie = (int) request.getAttribute("totalMovie");%>
<%double totalEaring = (double) request.getAttribute("totalEaring");%>
<%List<FilmEaring> filmEarings = (List<FilmEaring>) request.getAttribute("Top10MovieEaring");%>
<div class="page-wrapper">
    <!-- HEADER MOBILE-->
    <header class="header-mobile d-block d-lg-none">
        <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
                    <a class="logo" href="adminHome">
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
                    <li >
                        <a class="js-arrow"  href="quanlinguoidung">
                            <i class="fas fa-tachometer-alt"></i>Quản Lí Người Dùng</a>
                    </li>
                    <li >
                        <a href="quanliphim">
                            <i class="fas fa-chart-bar"></i>Quản Lí Phim
                        </a>
                    </li>
                    <li >
                        <a href="quanlive">
                            <i class="fas fa-table"></i>Quản Lí vé
                        </a>

                    </li>
                    <li >
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
            <a href="adminHome">
                <img src="assets/images/icon_banner.jpg" alt="PZO TICKET" title="PZO TICKET" style="height:35px;"/>
                PZO TICKET
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                    <li >
                        <a class="js-arrow"  href="quanlinguoidung">
                            <i class="fas fa-tachometer-alt"></i>Quản Lí Người Dùng</a>
                    </li>
                    <li >
                        <a href="quanliphim">
                            <i class="fas fa-chart-bar"></i>Quản Lí Phim
                        </a>
                    </li>
                    <li >
                        <a href="quanlive">
                            <i class="fas fa-table"></i>Quản Lí vé
                        </a>
                    </li>
                    <li >
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
                        <form class="form-header" action="" method="POST">
                            <input class="au-input au-input--xl" type="text" name="search" placeholder="Tìm kiếm..."/>
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
                                            <a href="logout">
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
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="overview-wrap">
                                <h2 class="title-1">Tổng quan</h2>
                                <button class="au-btn au-btn-icon au-btn--blue">
                                    <i class="zmdi zmdi-plus"></i>Tạo mới
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="row m-t-25">
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c1">
                                <div class="overview__inner">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-account-o"></i>
                                        </div>
                                        <div class="text">
                                            <h2><%=userOnl%></h2>
                                            <span>đang hoạt động</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart1"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c2">
                                <div class="overview__inner" >
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-shopping-cart"></i>
                                        </div>
                                        <div class="text">
                                            <h2><%=ticketQuantity%></h2>
                                            <span>Tổng số vé</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart2"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c3">
                                <div class="overview__inner" >
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="fa-solid fa-film"></i>
                                        </div>
                                        <div class="text">
                                            <h2><%=totalMovie%></h2>
                                            <span>Tổng số phim</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart3"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="overview-item overview-item--c4">
                                <div class="overview__inner" style="padding-bottom: 33px">
                                    <div class="overview-box clearfix">
                                        <div class="icon">
                                            <i class="zmdi zmdi-money"></i>
                                        </div>
                                        <div class="text">
                                            <h2><%=totalEaring%></h2>
                                            <span>Tổng thu nhập</span>
                                        </div>
                                    </div>
                                    <div class="overview-chart">
                                        <canvas id="widgetChart4"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="au-card recent-report">
                                <div class="au-card-inner">
                                    <h3 class="title-2">báo cáo gần đây</h3>
                                    <div class="chart-info">
                                        <div class="chart-info__left">
                                            <div class="chart-note">
                                                <span class="dot dot--blue"></span>
                                                <span>các sản phẩm</span>
                                            </div>
                                            <div class="chart-note mr-0">
                                                <span class="dot dot--green"></span>
                                                <span>dịch vụ</span>
                                            </div>
                                        </div>
                                        <div class="chart-info__right">
                                            <div class="chart-statis">
                                                    <span class="index incre">
                                                        <i class="zmdi zmdi-long-arrow-up"></i>25%</span>
                                                <span class="label">các sản phẩm</span>
                                            </div>
                                            <div class="chart-statis mr-0">
                                                    <span class="index decre">
                                                        <i class="zmdi zmdi-long-arrow-down"></i>10%</span>
                                                <span class="label">dịch vụ</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="recent-report__chart">
                                        <canvas id="recent-rep-chart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="au-card chart-percent-card">
                                <div class="au-card-inner">
                                    <h3 class="title-2 tm-b-5">Tỉ lệ %</h3>
                                    <div class="row no-gutters">
                                        <div class="col-xl-6">
                                            <div class="chart-note-wrap">
                                                <div class="chart-note mr-0 d-block">
                                                    <span class="dot dot--blue"></span>
                                                    <span>các sản phẩm</span>
                                                </div>
                                                <div class="chart-note mr-0 d-block">
                                                    <span class="dot dot--red"></span>
                                                    <span>dịch vụ</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-6">
                                            <div class="percent-chart">
                                                <canvas id="percent-chart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                            <h2 class="title-1 m-b-25">10 phim có doanh thu cao nhất</h2>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning">
                                    <thead>
                                    <tr>
                                        <th>ID phim</th>
                                        <th>Tên phim</th>
                                        <th>Thể loại</th>
                                        <th>Ngày sản xuất</th>
                                        <th>Quốc gì</th>
                                        <th>Đánh giá</th>
                                        <th class="text-right">Tổng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%for(FilmEaring filmEaring : filmEarings){%>
                                    <tr>
                                        <td><%=filmEaring.getMovieID()%></td>
                                        <td><%=filmEaring.getMovieName()%></td>
                                        <td><%=filmEaring.getMovieCategory()%></td>
                                        <td><%=filmEaring.getReleaseDate()%></td>
                                        <td><%=filmEaring.getCountry()%></td>
                                        <td><%=filmEaring.getMovieScore()%></td>
                                        <td class="text-right"><%=filmEaring.getPrice()%></td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>

<%--                        <div class="col-lg-3">--%>
<%--                            <h2 class="title-1 m-b-25">Top countries</h2>--%>
<%--                            <div class="au-card au-card--bg-blue au-card-top-countries m-b-40">--%>
<%--                                <div class="au-card-inner">--%>
<%--                                    <div class="table-responsive">--%>
<%--                                        <table class="table table-top-countries">--%>
<%--                                            <tbody>--%>
<%--                                            <tr>--%>
<%--                                                <td>United States</td>--%>
<%--                                                <td class="text-right">$119,366.96</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Australia</td>--%>
<%--                                                <td class="text-right">$70,261.65</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>United Kingdom</td>--%>
<%--                                                <td class="text-right">$46,399.22</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Turkey</td>--%>
<%--                                                <td class="text-right">$35,364.90</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Germany</td>--%>
<%--                                                <td class="text-right">$20,366.96</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>France</td>--%>
<%--                                                <td class="text-right">$10,366.96</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Australia</td>--%>
<%--                                                <td class="text-right">$5,366.96</td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <td>Italy</td>--%>
<%--                                                <td class="text-right">$1639.32</td>--%>
<%--                                            </tr>--%>
<%--                                            </tbody>--%>
<%--                                        </table>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">--%>
<%--                                <div class="au-card-title" style="background-image:url('images/bg-title-01.jpg');">--%>
<%--                                    <div class="bg-overlay bg-overlay--blue"></div>--%>
<%--                                    <h3>--%>
<%--                                        <i class="zmdi zmdi-account-calendar"></i>26 April, 2018</h3>--%>
<%--                                    <button class="au-btn-plus">--%>
<%--                                        <i class="zmdi zmdi-plus"></i>--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                                <div class="au-task js-list-load">--%>
<%--                                    <div class="au-task__title">--%>
<%--                                        <p>Tasks for John Doe</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="au-task-list js-scrollbar3">--%>
<%--                                        <div class="au-task__item au-task__item--danger">--%>
<%--                                            <div class="au-task__item-inner">--%>
<%--                                                <h5 class="task">--%>
<%--                                                    <a href="#">Meeting about plan for Admin Template 2018</a>--%>
<%--                                                </h5>--%>
<%--                                                <span class="time">10:00 AM</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-task__item au-task__item--warning">--%>
<%--                                            <div class="au-task__item-inner">--%>
<%--                                                <h5 class="task">--%>
<%--                                                    <a href="#">Create new task for Dashboard</a>--%>
<%--                                                </h5>--%>
<%--                                                <span class="time">11:00 AM</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-task__item au-task__item--primary">--%>
<%--                                            <div class="au-task__item-inner">--%>
<%--                                                <h5 class="task">--%>
<%--                                                    <a href="#">Meeting about plan for Admin Template 2018</a>--%>
<%--                                                </h5>--%>
<%--                                                <span class="time">02:00 PM</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-task__item au-task__item--success">--%>
<%--                                            <div class="au-task__item-inner">--%>
<%--                                                <h5 class="task">--%>
<%--                                                    <a href="#">Create new task for Dashboard</a>--%>
<%--                                                </h5>--%>
<%--                                                <span class="time">03:30 PM</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-task__item au-task__item--danger js-load-item">--%>
<%--                                            <div class="au-task__item-inner">--%>
<%--                                                <h5 class="task">--%>
<%--                                                    <a href="#">Meeting about plan for Admin Template 2018</a>--%>
<%--                                                </h5>--%>
<%--                                                <span class="time">10:00 AM</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-task__item au-task__item--warning js-load-item">--%>
<%--                                            <div class="au-task__item-inner">--%>
<%--                                                <h5 class="task">--%>
<%--                                                    <a href="#">Create new task for Dashboard</a>--%>
<%--                                                </h5>--%>
<%--                                                <span class="time">11:00 AM</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="au-task__footer">--%>
<%--                                        <button class="au-btn au-btn-load js-load-btn">load more</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="au-card au-card--no-shadow au-card--no-pad m-b-40">--%>
<%--                                <div class="au-card-title" style="background-image:url('images/bg-title-02.jpg');">--%>
<%--                                    <div class="bg-overlay bg-overlay--blue"></div>--%>
<%--                                    <h3>--%>
<%--                                        <i class="zmdi zmdi-comment-text"></i>New Messages</h3>--%>
<%--                                    <button class="au-btn-plus">--%>
<%--                                        <i class="zmdi zmdi-plus"></i>--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                                <div class="au-inbox-wrap js-inbox-wrap">--%>
<%--                                    <div class="au-message js-list-load">--%>
<%--                                        <div class="au-message__noti">--%>
<%--                                            <p>You Have--%>
<%--                                                <span>2</span>--%>

<%--                                                new messages--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-message-list">--%>
<%--                                            <div class="au-message__item unread">--%>
<%--                                                <div class="au-message__item-inner">--%>
<%--                                                    <div class="au-message__item-text">--%>
<%--                                                        <div class="avatar-wrap">--%>
<%--                                                            <div class="avatar">--%>
<%--                                                                <img src="images/icon/avatar-02.jpg" alt="John Smith">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="text">--%>
<%--                                                            <h5 class="name">John Smith</h5>--%>
<%--                                                            <p>Have sent a photo</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="au-message__item-time">--%>
<%--                                                        <span>12 Min ago</span>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="au-message__item unread">--%>
<%--                                                <div class="au-message__item-inner">--%>
<%--                                                    <div class="au-message__item-text">--%>
<%--                                                        <div class="avatar-wrap online">--%>
<%--                                                            <div class="avatar">--%>
<%--                                                                <img src="images/icon/avatar-03.jpg"--%>
<%--                                                                     alt="Nicholas Martinez">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="text">--%>
<%--                                                            <h5 class="name">Nicholas Martinez</h5>--%>
<%--                                                            <p>You are now connected on message</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="au-message__item-time">--%>
<%--                                                        <span>11:00 PM</span>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="au-message__item">--%>
<%--                                                <div class="au-message__item-inner">--%>
<%--                                                    <div class="au-message__item-text">--%>
<%--                                                        <div class="avatar-wrap online">--%>
<%--                                                            <div class="avatar">--%>
<%--                                                                <img src="images/icon/avatar-04.jpg"--%>
<%--                                                                     alt="Michelle Sims">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="text">--%>
<%--                                                            <h5 class="name">Michelle Sims</h5>--%>
<%--                                                            <p>Lorem ipsum dolor sit amet</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="au-message__item-time">--%>
<%--                                                        <span>Yesterday</span>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="au-message__item">--%>
<%--                                                <div class="au-message__item-inner">--%>
<%--                                                    <div class="au-message__item-text">--%>
<%--                                                        <div class="avatar-wrap">--%>
<%--                                                            <div class="avatar">--%>
<%--                                                                <img src="images/icon/avatar-05.jpg"--%>
<%--                                                                     alt="Michelle Sims">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="text">--%>
<%--                                                            <h5 class="name">Michelle Sims</h5>--%>
<%--                                                            <p>Purus feugiat finibus</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="au-message__item-time">--%>
<%--                                                        <span>Sunday</span>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="au-message__item js-load-item">--%>
<%--                                                <div class="au-message__item-inner">--%>
<%--                                                    <div class="au-message__item-text">--%>
<%--                                                        <div class="avatar-wrap online">--%>
<%--                                                            <div class="avatar">--%>
<%--                                                                <img src="images/icon/avatar-04.jpg"--%>
<%--                                                                     alt="Michelle Sims">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="text">--%>
<%--                                                            <h5 class="name">Michelle Sims</h5>--%>
<%--                                                            <p>Lorem ipsum dolor sit amet</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="au-message__item-time">--%>
<%--                                                        <span>Yesterday</span>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="au-message__item js-load-item">--%>
<%--                                                <div class="au-message__item-inner">--%>
<%--                                                    <div class="au-message__item-text">--%>
<%--                                                        <div class="avatar-wrap">--%>
<%--                                                            <div class="avatar">--%>
<%--                                                                <img src="images/icon/avatar-05.jpg"--%>
<%--                                                                     alt="Michelle Sims">--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="text">--%>
<%--                                                            <h5 class="name">Michelle Sims</h5>--%>
<%--                                                            <p>Purus feugiat finibus</p>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="au-message__item-time">--%>
<%--                                                        <span>Sunday</span>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-message__footer">--%>
<%--                                            <button class="au-btn au-btn-load js-load-btn">load more</button>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="au-chat">--%>
<%--                                        <div class="au-chat__title">--%>
<%--                                            <div class="au-chat-info">--%>
<%--                                                <div class="avatar-wrap online">--%>
<%--                                                    <div class="avatar avatar--small">--%>
<%--                                                        <img src="images/icon/avatar-02.jpg" alt="John Smith">--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                                <span class="nick">--%>
<%--                                                        <a href="#">John Smith</a>--%>
<%--                                                    </span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-chat__content">--%>
<%--                                            <div class="recei-mess-wrap">--%>
<%--                                                <span class="mess-time">12 Min ago</span>--%>
<%--                                                <div class="recei-mess__inner">--%>
<%--                                                    <div class="avatar avatar--tiny">--%>
<%--                                                        <img src="images/icon/avatar-02.jpg" alt="John Smith">--%>
<%--                                                    </div>--%>
<%--                                                    <div class="recei-mess-list">--%>
<%--                                                        <div class="recei-mess">Lorem ipsum dolor sit amet, consectetur--%>
<%--                                                            adipiscing elit non iaculis--%>
<%--                                                        </div>--%>
<%--                                                        <div class="recei-mess">Donec tempor, sapien ac viverra</div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <div class="send-mess-wrap">--%>
<%--                                                <span class="mess-time">30 Sec ago</span>--%>
<%--                                                <div class="send-mess__inner">--%>
<%--                                                    <div class="send-mess-list">--%>
<%--                                                        <div class="send-mess">Lorem ipsum dolor sit amet, consectetur--%>
<%--                                                            adipiscing elit non iaculis--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="au-chat-textfield">--%>
<%--                                            <form class="au-form-icon">--%>
<%--                                                <input class="au-input au-input--full au-input--h65" type="text"--%>
<%--                                                       placeholder="Type a message">--%>
<%--                                                <button class="au-input-icon">--%>
<%--                                                    <i class="zmdi zmdi-camera"></i>--%>
<%--                                                </button>--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>

                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT-->
        <!-- END PAGE CONTAINER-->
    </div>

</div>

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
