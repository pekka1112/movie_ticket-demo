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
    <link rel="stylesheet" href="assets/css/movieDetail.css">
<%-- BREADCRUMBS --%>
<div class="w3l-breadcrumbs">
    <nav id="breadcrumbs" class="breadcrumbs">
        <div class="container page-wrapper">
            <a href="index.jsp">Trang Chủ</a> » <span class="breadcrumb_last" aria-current="page">${movie.movieName}</span>
        </div>
    </nav>
</div>

<%-- Section thể hiện chi tiết phim--%>
<section class="film-detail" style="background: url(../Movie_Ticket_Website/assets/movie-image/${movie.linkMovieImage}) no-repeat center ; background-size: cover; position: relative;overflow: hidden">
    <div class="container" id="film-detailBackground">
        <div class="row">
            <div class="col-4" id="film-detail__poster" >
                <img src="../Movie_Ticket_Website/assets/movie-image/${movie.linkMovieImage}" id="poster" alt="" style="border: 2px groove whitesmoke;">
            </div>
            <div class="col-8" id="film-detail__context" style="; margin: 25px 0px ; padding-left: 0px" >
                <div class="film-detail__txt" id="filmCategory-detail">Thể loại : ${movie.movieCategory}</div>
                <div class="film-detail__txt" id="filmName-detail"><i class="fa-solid fa-film"></i> ${movie.movieName}</div>
                <div class="film-detail__txt" id="filmDes-detail"> ' ${movie.movieDescription} ' </div>
                <div class="film-detail__txt" id="filmDirector-detail">Từ đạo diễn ${movie.director} - ${movie.country}</div>
                <div class="film-detail__txt" id="filmDuration-detail">Thời lượng - <i class="fa-solid fa-clock"></i> : ${movie.duration} h</div>
                <div class="film-detail__txt" id="filmScore-detail"><i class="fa-solid fa-star"></i> ${movie.movieScore}</div>
                <div class="film-detail__txt" id="filmDate-detail">Ngày ra rạp : ${movie.releaseDate}</div>
                <div class="film-detail__txt" >Nội dung : </div>
                <div class="film-detail__txt" id="filmDescription-detail">${movie.movieContent}</div>
                <%-- btn để thực hiện đặt vé cho bộ phim đang hiển thị                --%>
                <div class="button-center text-center mt-4" style="margin-top: 0px">
                    <a href="#" class="btn watch-button" style="color: white;  font-size: 25px">Đặt vé ngay</a>
                </div> <br>
            </div>
        </div>
    </div>
</section>

<%--Section hiển thị lịch chiếu phim --%>
<section class="showtimes-section">
        <div class="showtimes-title" style="padding : 20px 0px 30px 0px;"> LỊCH CHIẾU PHIM </div>
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