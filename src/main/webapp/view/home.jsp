
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
    <title>MovieBooking - PZO</title>
    <jsp:include page="../layout-view/head_libraries.jsp"></jsp:include>

</head>
<body>
    <jsp:include page="../layout-view/header.jsp"></jsp:include>

<%-- Section Trailer Phim--%>
<section class="w3l-main-slider position-relative" id="home">
    <div class="companies20-content">
        <div class="owl-one owl-carousel owl-theme">
            <c:forEach items="${top4NewestMovies}" var="newestMovie" >
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
        <div class="grids-main py-5">
            <div class="container py-lg-3">
                <div class="headerhny-title">
                    <div class="w3l-title-grids">
                        <div class="headerhny-left">
                            <h3 class="hny-title">PHIM ĐANG CHIẾU</h3>
                        </div>
                        <div class="headerhny-right text-lg-right">
                            <h4><a class="show-title" href="../Movie_Ticket_Website/movies.jsp">XEM TẤT CẢ</a></h4>
                        </div>
                    </div>
                </div>
                <div class="owl-three owl-carousel owl-theme">
                    <c:forEach items="${publishedMovies}" var="m" >
                        <div class="item vhny-grid">
                            <div class="box16 mb-0">
                                <a href="../Movie_Ticket_Website/movies.jsp">
                                    <figure>
                                        <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style=" height:  300px">
                                    </figure>
                                    <div class="box-content">
                                        <h4> <span class="post"><span class="fa fa-clock-o"></span> ${m.duration} </span>
                                            <span class="post fa fa-heart text-right"></span>
                                        </h4>
                                    </div>
                                    <span class="fa fa-play-circle video-icon" aria-hidden="true"></span>
                                </a>
                            </div>
                            <h3><a class="title-gd" href="movieDetail-servlet?action=init&movieID=${m.movieID}"> ${m.movieName} </a> </h3>
                            <p> ${m.movieDescription} </p>
                            <div class="button-center text-center mt-4">
                                <a href="#" class="btn watch-button">Đặt vé ngay</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

<%--Section PHIM SẮP CHIẾU --%>
<section class="w3l-grids">
    <div class="grids-main py-5">
        <div class="container py-lg-3">
            <div class="headerhny-title">
                <div class="w3l-title-grids">
                    <div class="headerhny-left">
                        <h3 class="hny-title">PHIM SẮP CHIẾU</h3>
                    </div>
                    <div class="headerhny-right text-lg-right">
                        <h4><a class="show-title" href="../Movie_Ticket_Website/movies.jsp">XEM TẤT CẢ</a></h4>
                    </div>
                </div>
            </div>
            <div class="w3l-populohny-grids">
                <c:forEach items="${unPublishedMovies}" var="m" >
                    <div class="item vhny-grid">
                        <div class="box16">
                                <a href="../movies.jsp">
                                    <figure>
                                        <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style=" height:  350px">
                                    </figure>
                                    <div class="box-content">
                                        <h2 class="title" style="" >${m.movieName}</h2>
                                        <h4> <span class="post"><span class="fa fa-clock-o"> </span> ${m.duration} </span>
                                            <span class="post fa fa-heart text-right"></span>
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

<%--Section chứa Slider hiển thị các bộ phim đang hot gần đây --%>
<section class="w3l-mid-slider position-relative">
    <div class="companies20-content">
        <div class="owl-mid owl-carousel owl-theme">
            <c:forEach items="${popularMovies}" var="m">
                <div class="item">
                    <li>
                        <div class="slider-info mid-view"
                             style = "background: url(../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}) no-repeat center; background-size: cover; ">
                            <div class="container">
                                <div class="mid-info">
                                    <span class="sub-text"> ${m.movieCategory} </span>
                                    <h3> ${m.movieName}</h3>
                                    <p>${m.releaseDate} ‧ ${m.country} ‧ ${m.duration}</p>
                                    <a class="watch" href="../Movie_Ticket_Website/movies.jsp"><span class="fa fa-play" aria-hidden="true"></span>Watch Trailer</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </div>
            </c:forEach>
        </div>
    </div>
</section><br>

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

<%-- Section : Hiển thị bình luận nổi bật --%>
<section class="comments-section">
    <div class="comments-title">BÌNH LUẬN NỔI BẬT</div>
    <div class="border-div-2">
        <div class="container">
            <div class="row align-items">
                <c:forEach items="${comments}" var="c" >
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">${c.movieName}</h5>
                                <p class="card-text">Ẩn Danh : " ${c.commentText} " </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>

<%-- Section : Hiển thị danh sách các rạp chiếu phim --%>
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