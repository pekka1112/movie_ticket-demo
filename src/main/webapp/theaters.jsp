<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/6/2023
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Theaters - PZO</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
</head>
<body>
    <%-- Header --%>
    <jsp:include page="layout-view/header.jsp"></jsp:include>

    <%-- Breadcrumbs --%>
    <div class="w3l-breadcrumbs">
        <nav id="breadcrumbs" class="breadcrumbs">
            <div class="container page-wrapper">
                <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Rạp Phim</span>
            </div>
        </nav>
    </div>

    <%--Section hiển thị lịch chiếu phim --%>
    <section class="showtimes-section">
        <div class="showtimes-title" style="padding : 20px 0px 30px 0px;"> RẠP CHIẾU NỔI BẬT </div>
        <div class="border-div-1">
            <div class="container">
                <div class="row">
                    <div class="col-5">
                        <%-- truyen du lieu - ten rap chieu phim can tim den HomeController servlet --%>
                        <form action="home-servlet" method="post">
                            <input type="hidden" name="action" value="show-cinemaDetail">
                            <input class="form-control" type="text" name="cinemaName" placeholder="Tìm theo tên rạp" aria-label="search">
                        </form> <br>
                        <div id= "showtimes-list_cinema">
                            <%-- hien thi toan bo danh sach cinema, click 1 cinema thuc hien truyen cid toi servlet home --%>
                            <c:forEach items="${allCinema}" var="cinema" >
                                <div class="row_cinemaName">
                                    <i class="fa-solid fa-film"> </i>
                                    <a href="home-servlet?action=show-cinemaShowtime&cid=${cinema.cinemaID}" style="color: whitesmoke">${cinema.cinemaName}</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-7">
                        <div id="showtimes-rightBox">
                            <%-- hien thi noi dung cinema lay duoc tu home-servlet --%>
                            <div class="showtimes-cinema_title">
                                <h2 style="font-size: 25px"><i class="fa-solid fa-film"> </i> ${cinemaDetail.cinemaName}</h2>
                                <h4 style="font-size: 18px; font-weight: lighter"> ${cinemaDetail.location}</h4>
                            </div>
                            <div class="showtimes-calendar">
                                <div class="showtimes-btn_group">
                                    <%-- hien thi 7 ngay tinh tu hom nay de dat ve --%>
                                    <div class="showtimes-calenderBox" style="text-align: center">
                                        <c:forEach var="i" begin="1" end="7" >
                                            <%-- hien thi 7 ngay bat dau tu ngay chieu phim dang duoc chon --%>
                                            <a style="margin: 10px 10px; border: 1px groove black; border-radius: 5px; font-family: 'Open Sans', sans-serif; color: floralwhite; background: #c94c7a">Day ${i} ${cinemaDetail}</a>
                                        </c:forEach>
                                    </div>
                                </div> <br>
                                <div class="showtimes-show">
                                    <c:forEach var="i" begin="1" end="5" >
                                        <%-- hien thi cac phim trong ngay duoc chon --%>
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">Special title treatment</h5>
                                                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                <a href="#" class="btn btn-primary">ĐẶT VÉ NGAY</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%-- Section hiển thị các rạp chiếu phim nổi bật    --%>
    <section class="theaters-section">
        <div >
            <h3 class="hny-title" style="color: #c94c7a; text-align: center" >RẠP CHIẾU NỔI BẬT</h3>
        </div>
        <div class="w3l-title-grids">
            <div class="headerhny-left text-lg-left">
            </div>
            <div class="headerhny-right text-lg-right">
                <h4><a class="show-title" href="../Movie_Ticket_Website/theaters.jsp">XEM TẤT CẢ</a></h4>
            </div>
        </div>
        <div class="border-div-2">
            <div class="row">
                <%-- hien thi 2 rap chieu phim noi bat nhat --%>
                <c:forEach items="${top2Cinema}" var="c2" >
                    <div class="col-sm-6">
                        <div class="card">
                            <h5 class="card-header" style="color: #0c5460; font-size: 15px">${c2.cinemaName}</h5>
                            <div class="card-body">
                                <h5 class="card-title" style="font-size: 20px">${c2.cinemaName}</h5>
                                <p class="card-text">${c2.location}</p><br>
                                <a href="../Movie_Ticket_Website/theaters.jsp" class="btn btn-primary">Xem Chi Tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <%-- Footer --%>
    <jsp:include page="layout-view/footer.jsp"></jsp:include>
    <jsp:include page="layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="layout-view/js-function-slider.jsp" ></jsp:include>
    <!-- responsive tabs -->
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/easyResponsiveTabs.js"></script>
    <!--/theme-change-->
    <script src="assets/js/theme-change.js"></script>
    <script src="assets/js/owl.carousel.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
