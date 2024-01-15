<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/14/2023
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chi Tiết Phim - ${movie.movieName}</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="layout-view/header.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/movie_detail.css">
<%-- BREADCRUMBS --%>
<div class="w3l-breadcrumbs">
    <nav id="breadcrumbs" class="breadcrumbs">
        <div class="container page-wrapper">
            <a href="index.jsp">Trang Chủ</a> » <span class="breadcrumb_last" aria-current="page">${movie.movieName}</span>
        </div>
    </nav>
</div>

<%-- Section thể hiện chi tiết phim--%>
<section class="film-detail" style="background: url(../Movie_Ticket_Website/assets/movie-image/${movie.linkMovieImage}) no-repeat center ; background-size: cover; ">
    <div class="container" >
        <div class="row">
            <div class="col-4" id="film-detail__poster" >
                <img src="../Movie_Ticket_Website/assets/movie-image/${movie.linkMovieImage}" id="poster" alt="" style="border: 2px groove whitesmoke;">
            </div>
            <div class="col-8" id="film-detail__context" style="border: 2px groove white; margin: 25px 0px" >
                <div class="film-detail__txt">${movie.movieCategory}</div>
                <div class="film-detail__txt">2</div>
                <div class="film-detail__txt">3</div>
                <div class="film-detail__txt">4</div>
                <div class="film-detail__txt">5</div>
            </div>

        </div>
    </div>
</section>

<section class="showtimes-section">
    <div class="showtimes-title" style="padding : 20px 0px 30px 0px;"> LỊCH CHIẾU : </div>
    <div class="border-div-1">
        <div class="container">
            <div class="row">
                <div class="col-5">
                    <input id="search-theater" class="form-control" type="text" placeholder="Tìm theo tên rạp" aria-label="search">
                    <div id="showtimes-list_theaters"></div>
                </div>
                <div class="col-7">
                    <div id="showtimes-right_box">
                        <div class="showtimes-theaters_title">
                            // Dùng JSP hiển thị tên rạp được chọn ra
                        </div>
                        <div class="showtimes-calendar">
                            <div class="showtimes-btn_group">
                                // hiển thị các 7 nút hiển thị 7 ngày trong tuần để hiển thị lịch chiếu từng ngày của rạp
                            </div>
                            <div class="showtimes-show">
                                // hiển thị lịch chiếu tương ứng trong ngày đó của rạp đó
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="layout-view/footer.jsp"></jsp:include>
<jsp:include page="layout-view/js-function-slider.jsp"></jsp:include>
<jsp:include page="layout-view/script-libraries.jsp"></jsp:include>
</body>
</html>
<!-- responsive tabs -->
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/easyResponsiveTabs.js"></script>
<!--/theme-change-->
<script src="assets/js/theme-change.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<script src="assets/js/main.js"></script>