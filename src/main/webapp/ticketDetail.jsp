<%@ page import="model.Film" %>
<%@ page import="model.Comment" %>
<%@ page import="database.TicketDetailDAO" %>
<%@ page import="model.TicketDetail" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Title Page-->
    <title>UPDATE FILM</title>

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
    <!-- new css -->
    <link rel="stylesheet" href="admin/css/style_admin.css">


</head>

<body class="animsition">
<%--<%List<User> users = (List<User>) request.getAttribute("listUser");%>--%>
<div class="page-wrapper">
    <!-- HEADER MOBILE-->
    <header class="header-mobile d-block d-lg-none">
        <div class="header-mobile__bar">
            <div class="container-fluid">
                <div class="header-mobile-inner">
                    <a class="logo" href="adminhome.jsp">
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
                        <a class="js-arrow"  href="quanlinguoidung">
                            <i class="fas fa-tachometer-alt"></i>Quản Lí Người Dùng</a>
                    </li>
                    <li>

                        <a href="quanliphim">
                            <i class="fas fa-chart-bar"></i>Quản Lí Phim
                        </a>
                    </li>
                    <li class="active has-sub" >
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
                                            <p>You have 2 news message</p>
                                        </div>
                                        <div class="mess__item">
                                            <div class="image img-cir img-40">
                                                <img src="images/icon/avatar-06.jpg" alt="Michelle Moreno"/>
                                            </div>
                                            <div class="content">
                                                <h6>Michelle Moreno</h6>
                                                <p>Have sent a photo</p>
                                                <span class="time">3 min ago</span>
                                            </div>
                                        </div>
                                        <div class="mess__item">
                                            <div class="image img-cir img-40">
                                                <img src="images/icon/avatar-04.jpg" alt="Diane Myers"/>
                                            </div>
                                            <div class="content">
                                                <h6>Diane Myers</h6>
                                                <p>You are now connected on message</p>
                                                <span class="time">Yesterday</span>
                                            </div>
                                        </div>
                                        <div class="mess__footer">
                                            <a href="#">View all messages</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-email"></i>
                                    <span class="quantity">1</span>
                                    <div class="email-dropdown js-dropdown">
                                        <div class="email__title">
                                            <p>You have 3 New Emails</p>
                                        </div>
                                        <div class="email__item">
                                            <div class="image img-cir img-40">
                                                <img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey"/>
                                            </div>
                                            <div class="content">
                                                <p>Meeting about new dashboard...</p>
                                                <span>Cynthia Harvey, 3 min ago</span>
                                            </div>
                                        </div>
                                        <div class="email__item">
                                            <div class="image img-cir img-40">
                                                <img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey"/>
                                            </div>
                                            <div class="content">
                                                <p>Meeting about new dashboard...</p>
                                                <span>Cynthia Harvey, Yesterday</span>
                                            </div>
                                        </div>
                                        <div class="email__item">
                                            <div class="image img-cir img-40">
                                                <img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey"/>
                                            </div>
                                            <div class="content">
                                                <p>Meeting about new dashboard...</p>
                                                <span>Cynthia Harvey, April 12,,2018</span>
                                            </div>
                                        </div>
                                        <div class="email__footer">
                                            <a href="#">See all emails</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="noti__item js-item-menu">
                                    <i class="zmdi zmdi-notifications"></i>
                                    <span class="quantity">3</span>
                                    <div class="notifi-dropdown js-dropdown">
                                        <div class="notifi__title">
                                            <p>You have 3 Notifications</p>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c1 img-cir img-40">
                                                <i class="zmdi zmdi-email-open"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a email notification</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c2 img-cir img-40">
                                                <i class="zmdi zmdi-account-box"></i>
                                            </div>
                                            <div class="content">
                                                <p>Your account has been blocked</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__item">
                                            <div class="bg-c3 img-cir img-40">
                                                <i class="zmdi zmdi-file-text"></i>
                                            </div>
                                            <div class="content">
                                                <p>You got a new file</p>
                                                <span class="date">April 12, 2018 06:50</span>
                                            </div>
                                        </div>
                                        <div class="notifi__footer">
                                            <a href="#">All notifications</a>
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
                                                    <i class="zmdi zmdi-account"></i>Account</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-settings"></i>Setting</a>
                                            </div>
                                            <div class="account-dropdown__item">
                                                <a href="#">
                                                    <i class="zmdi zmdi-money-box"></i>Billing</a>
                                            </div>
                                        </div>
                                        <div class="account-dropdown__footer">
                                            <a href="#">
                                                <i class="zmdi zmdi-power"></i>Logout</a>
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
                        <% TicketDetail ticketDetail = (TicketDetail) request.getAttribute("ticketDetail");%>
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">thông tin chi tiết</h4>
                                <button type="button" class="close" data-dismiss="modal"></button>
                            </div>

                            <!-- Modal Body -->
                            <div class="modal-body">
                                <!-- Đặt nội dung form ở đây -->
                                <form >
                                    <div class="form-group">
                                        <label>Id vé</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getTicketID()%>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Tên phim</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getMovieName()%>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getPrice()%>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Thể loại</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getMovieCategory()%>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Đạo diễn</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getDirector()%>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Quốc gia</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getCountry()%>" readonly>
                                    </div>
                                    <div class="form-group">
                                        <label>Đánh giá</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getMovieScore()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Tên rạp chiếu</label>
                                        <input type="text" class="form-control"  value="<%=ticketDetail.getCinemaName()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Tên phòng chiếu</label>
                                        <input type="text" class="form-control"   value="<%=ticketDetail.getRoomName()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Tên ghế</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getSeatName()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Loại ghế</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getSeatType()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Ngày chiếu</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getShowDate()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Thời gian bắt đầu</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getStartTime()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Thời gian kết thúc</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getEndTime()%>" readonly>
                                    </div>

                                    <div class="form-group">
                                        <label>Địa chỉ</label>
                                        <input type="text" class="form-control" value="<%=ticketDetail.getLocation()%>" readonly>
                                    </div>

                                    <div class="modal-footer">
                                        <a href="quanlive">
                                            <button type="button" class="btn btn-secondary" >Đóng</button>
                                        </a>

                                    </div>

                                </form>
                            </div>

                        </div>

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