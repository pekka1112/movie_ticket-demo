
<%--<%--%>
<%--    if (session.getAttribute("name") == null){--%>
<%--        response.sendRedirect("login.jsp");--%>
<%--    }--%>
<%--%>--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <title>PONZO - Đặt vé xem phim ngay trên Ponzo</title>
    <jsp:include page="../layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/page/home.css">
</head>

<body>
    <jsp:include page="../layout-view/header.jsp"></jsp:include>

    <%-- Section Trailer Phim--%>
    <section class="w3l-main-slider position-relative" id="home">
    <div class="companies20-content">
        <div class="owl-one owl-carousel owl-theme">
            <c:forEach items="${newestMovies}" var="newestMovie" >
                <div class="item">
                    <li>
                        <div class="slider-info banner-view"  style="background: url(../Movie_Ticket_Website/assets/movie-image/${newestMovie.linkMovieImage}) no-repeat center; background-size: cover; " >
                            <div class="banner-info">
                                <h3>${newestMovie.movieName}</h3>
                                <p><span>${newestMovie.movieContent}</span></p>
                                <a href="#small-dialog" class="popup-with-zoom-anim play-view1">
                                    <span class="video-play-icon">
                                        <span class="fa fa-play"></span>
                                    </span>
                                    <h6>Xem Trailer</h6>
                                </a>
                                <div id="small-dialog" class="zoom-anim-dialog mfp-hide">
                                    <iframe width="832" height="349" src="${newestMovie.linkMovieTrailer}" title="${newestMovie.movieName} - OFFICIAL TRAILER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                    </li>
                </div>
            </c:forEach>
        </div>
    </div>
    </section>

    <%--Section PHIM ĐANG CHIẾU --%>
    <section class="w3l-grids">
            <div class="grids-main py-5" style="padding-bottom: 0rem !important; padding-top: 1.5rem !important;">
                <div class="container py-lg-3">
                    <div class="headerhny-title">
                        <div class="w3l-title-grids">
                            <div class="headerhny-left">
                                <h3 class="hny-title">PHIM ĐANG CHIẾU</h3>
                            </div>
                            <div class="headerhny-right text-lg-right">
                                <h4><a class="show-title" href="movie-servlet?action=init">XEM TẤT CẢ</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="owl-three owl-carousel owl-theme">
                        <c:forEach items="${publishedMovies}" var="m" >
                            <div class="item vhny-grid">
                                <div class="box16 mb-0">
                                    <a>
                                        <figure>
                                            <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style=" height:  300px">
                                        </figure>
                                        <div class="box-content">
                                            <h4>
                                                <span class="post"><span class="fa fa-calendar-days"></span> ${m.releaseDate}</span>
                                                <span class="post" style="font-size: larger"><span class="fa fa-check-circle-o"></span> ${m.movieScore}</span>
                                                <a href="bookingTicket-servlet?action=init" class="post fa-regular " style="font-size: 10px">
                                                    <div class="watch-button" style="padding : 5px 5px 5px 5px; height : 55px !important; width : 80px!important;color : whitesmoke; font-size: 17px; border: 1px groove whitesmoke; border-radius: 5px; font-family: SansSerif">
                                                        ĐẶT VÉ
                                                    </div>
                                                </a>
                                            </h4>
                                        </div>
                                        <span class="video-icon">
                                            <a href="" style="color: white"><i class="fa fa-cart-plus "></i></a>
                                        </span>
                                    </a>
                                </div>
                                <h3>
                                    <a class="title-gd movie-title" href="movieDetail?movieID=${m.movieID}"> ${m.movieName} </a>
                                </h3>
                                <p class="movie-des"> ${m.movieDescription} </p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>

    <%--Section PHIM SẮP CHIẾU --%>
    <section class="w3l-grids">
        <div class="grids-main py-5" style="padding-bottom: 0rem !important; padding-top: 0rem !important;">
            <div class="container py-lg-3">
                <div class="headerhny-title">
                    <div class="w3l-title-grids">
                        <div class="headerhny-left">
                            <h3 class="hny-title">PHIM SẮP CHIẾU</h3>
                        </div>
                        <div class="headerhny-right text-lg-right">
                            <h4><a class="show-title" href="movie-servlet?action=init">XEM TẤT CẢ</a></h4>
                        </div>
                    </div>
                </div>
                <div class="w3l-populohny-grids">
                    <c:forEach items="${unPublishedMovies}" var="m" >
                        <div class="item vhny-grid">
                            <div class="box16">
                                    <a href="">
                                        <figure>
                                            <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style=" height:  350px">
                                        </figure>
                                        <div class="box-content">
                                            <h2 class="title" style="" >${m.movieName}</h2>
                                            <h2 class="title" style="" >Khởi chiếu : ${m.releaseDate}</h2>
                                            <h4>
                                                <span class="post"><span class="fa fa-clock-o"> </span> ${m.duration} - ${m.movieCategory}</span>
                                                <span class="post fa fa-heart text-right" style="font-size: larger " ></span>
                                            </h4>
                                        </div>
                                        <span class="fa fa-play-circle video-icon" aria-hidden="true"></span>
                                    </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

    <%-- Section : Hiển thị tin tức phim --%>
    <section class="comments-section">
        <h3 class="hny-title" style="color: #c94c7a; text-align: center" >TIN TỨC PHIM</h3>
        <jsp:include page="newsComponent.jsp" ></jsp:include>
    </section>

<jsp:include page="../layout-view/footer.jsp" ></jsp:include>
<jsp:include page="../layout-view/script-libraries.jsp" ></jsp:include>
<jsp:include page="../layout-view/js-function-slider.jsp" ></jsp:include>

</body>

</html>
<!-- responsive tabs -->
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/easyResponsiveTabs.js"></script>
<!--/theme-change-->
<script src="assets/js/theme-change.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<script src="assets/js/main.js"></script>