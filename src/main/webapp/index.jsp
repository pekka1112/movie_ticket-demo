<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/3/2023
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    if (session.getAttribute("name") == null){
        response.sendRedirect("login.jsp");
    }
%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>MovieBooking - PZO</title>
    <link rel="icon" type="image/x-icon" href="assets/images/x-icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/style_new.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.5.1/css/all.min.css">
    <link href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap"
          rel="stylesheet">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
          integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<header id="site-header" class="w3l-header fixed-top">
    <nav class="navbar navbar-expand-lg navbar-light fill px-lg-0 py-0 px-3">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="assets/images/icon_banner.jpg" alt="PZO TICKET" title="PZO TICKET" style="height:35px;"/>
                PZO TICKET
            </a>
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="fa icon-expand fa-bars"></span>
                <span class="fa icon-close fa-times"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a class="nav-link" href="index.jsp">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="movies.jsp">Phim</a></li>
                    <li class="nav-item"><a class="nav-link" href="showtimes.jsp">Lịch chiếu</a></li>
                    <li class="nav-item"><a class="nav-link" href="theaters.jsp">Rạp chiếu</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">Thông tin</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.jsp">Liên hệ</a></li>
                </ul>

                <div class="search-right">
                    <a href="#search" class="btn search-hny mr-lg-3 mt-lg-0 mt-4" title="search">Tìm phim
                        <i class="fa-solid fa-magnifying-glass"></i></a>
                    <!-- search popup -->
                    <div id="search" class="pop-overlay">
                        <div class="popup">
                            <form action="#" method="post" class="search-box">
                                <input type="search" placeholder="Search your Keyword" name="search"
                                       required="required" autofocus="">
                                <button type="submit" class="btn"><span class="fa fa-search"
                                                                        aria-hidden="true"></span></button>
                            </form>
                            <div class="browse-items">
                                <h3 class="hny-title two mt-md-5 mt-4">Browse all:</h3>
                                <ul class="search-items">
                                    <li><a href="movies.html">Action</a></li>
                                    <li><a href="movies.html">Drama</a></li>
                                    <li><a href="movies.html">Family</a></li>
                                    <li><a href="movies.html">Thriller</a></li>
                                    <li><a href="movies.html">Commedy</a></li>
                                    <li><a href="movies.html">Romantic</a></li>
                                    <li><a href="movies.html">Tv-Series</a></li>
                                    <li><a href="movies.html">Horror</a></li>
                                    <li><a href="movies.html">Action</a></li>
                                    <li><a href="movies.html">Drama</a></li>
                                    <li><a href="movies.html">Family</a></li>
                                    <li><a href="movies.html">Thriller</a></li>
                                    <li><a href="movies.html">Commedy</a></li>
                                    <li><a href="movies.html">Romantic</a></li>
                                    <li><a href="movies.html">Tv-Series</a></li>
                                    <li><a href="movies.html">Horror</a></li>
                                </ul>
                            </div>
                        </div>
                        <a class="close" href="#close">×</a>
                    </div>

                </div>
                <div class="Login_SignUp" id="login"
                     style="font-size: 2rem ; display: inline-block; position: relative;">
                    <a class="nav-link" href="login.jsp"><i class="fa fa-user-circle-o"></i></a>
                </div>
            </div>
            <div class="mobile-position">
                <nav class="navigation">
                    <div class="theme-switch-wrapper">
                        <label class="theme-switch" for="checkbox">
                            <input type="checkbox" id="checkbox">
                            <div class="mode-container">
                                <i class="gg-sun"></i>
                                <i class="gg-moon"></i>
                            </div>
                        </label>
                    </div>
                </nav>
            </div>
        </div>
    </nav>
</header>

<section class="w3l-main-slider position-relative" id="home">
    <div class="companies20-content">
        <div class="owl-one owl-carousel owl-theme">
            <div class="item">
                <li>
                    <div class="slider-info banner-view bg bg2">
                        <div class="banner-info">
                            <h3>Latest Movie Trailers</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<span class="over-para">
										Consequuntur hic odio
										voluptatem tenetur consequatur.</span></p>
                            <a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
									<span class="video-play-icon">
										<span class="fa fa-play"></span>
									</span>
                                <h6>Watch Trailer</h6>
                            </a>
                            <div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
                                <iframe src="https://player.vimeo.com/video/358205676" allow="autoplay; fullscreen"
                                        allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
            <div class="item">
                <li>
                    <div class="slider-info  banner-view banner-top1 bg bg2">
                        <div class="banner-info">
                            <h3>Latest Online Movies</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<span class="over-para">
										Consequuntur hic odio
										voluptatem tenetur consequatur.</span></p>
                            <a href="#small-dialog2" class="popup-with-zoom-anim play-view1">
									<span class="video-play-icon">
										<span class="fa fa-play"></span>
									</span>
                                <h6>Watch Trailer</h6>
                            </a>
                            <div id="small-dialog2" class="zoom-anim-dialog mfp-hide">
                                <iframe src="https://player.vimeo.com/video/395376850" allow="autoplay; fullscreen"
                                        allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
            <div class="item">
                <li>
                    <div class="slider-info banner-view banner-top2 bg bg2">
                        <div class="banner-info">
                            <h3>Latest Movie Trailers</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<span class="over-para">
										Consequuntur hic odio
										voluptatem tenetur consequatur.</span></p>
                            <a href="#small-dialog3" class="popup-with-zoom-anim play-view1">
									<span class="video-play-icon">
										<span class="fa fa-play"></span>
									</span>
                                <h6>Watch Trailer</h6>
                            </a>
                            <div id="small-dialog3" class="zoom-anim-dialog mfp-hide">
                                <iframe src="https://player.vimeo.com/video/389969665" allow="autoplay; fullscreen"
                                        allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
            <div class="item">
                <li>
                    <div class="slider-info banner-view banner-top3 bg bg2">
                        <div class="banner-info">
                            <h3>Latest Online Movies</h3>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit.<span class="over-para">
										Consequuntur hic odio
										voluptatem tenetur consequatur.</span></p>
                            <a href="#small-dialog4" class="popup-with-zoom-anim play-view1">
									<span class="video-play-icon">
										<span class="fa fa-play"></span>
									</span>
                                <h6>Watch Trailer</h6>
                            </a>
                            <div id="small-dialog4" class="zoom-anim-dialog mfp-hide">
                                <iframe src="https://player.vimeo.com/video/323491174" allow="autoplay; fullscreen"
                                        allowfullscreen=""></iframe>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
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
                        <h4><a class="show-title" href="movies.html">XEM TẤT CẢ</a></h4>
                    </div>
                </div>
            </div>
            <div class="w3l-populohny-grids">
                <div class="item vhny-grid">
                    <div class="box16">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/wednesday.jpeg" alt="">
                            </figure>
                            <div class="box-content">
                                <h3 class="title">A Wednesday</h3>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 1 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/commando2.jpeg" alt="">
                            </figure>
                            <div class="box-content">
                                <h3 class="title">Commando-3</h3>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 1 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/gujju2.jpeg" alt="">
                            </figure>
                            <div class="box-content">
                                <h3 class="title">Gujjubhai Most Wanted</h3>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 1 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/avtar-2.jpeg" alt="">
                            </figure>
                            <div class="box-content">
                                <h3 class="title">Avatar</h3>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 1 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
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
                        <h4><a class="show-title" href="movies.html">XEM TẤT CẢ</a></h4>
                    </div>
                </div>
            </div>
            <div class="owl-three owl-carousel owl-theme">
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/n1.jpg" alt="">
                            </figure>
                            <div class="box-content">
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 2 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                    <h3><a class="title-gd" href="movies.html">No Time to Die</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="movies.html" class="btn watch-button">Watch now</a>
                    </div>

                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/n2.jpg" alt="">
                            </figure>
                            <div class="box-content">

                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 2 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                    <h3><a class="title-gd" href="movies.html">Mulan</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="movies.html" class="btn watch-button">Watch now</a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/n3.jpg" alt="">
                            </figure>
                            <div class="box-content">

                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 2 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                    <h3><a class="title-gd" href="movies.html">Free Guy</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="movies.html" class="btn watch-button">Watch now</a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/n4.jpg" alt="">
                            </figure>
                            <div class="box-content">

                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 2 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                    <h3><a class="title-gd" href="movies.html">My Spy</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="movies.html" class="btn watch-button">Watch now</a>
                    </div>

                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/n5.jpg" alt="">
                            </figure>
                            <div class="box-content">

                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 2 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                    <h3><a class="title-gd" href="movies.html">Scoob</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="movies.html" class="btn watch-button">Watch now</a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="movies.html">
                            <figure>
                                <img class="img-fluid" src="assets/images/n6.jpg" alt="">
                            </figure>
                            <div class="box-content">

                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 2 Hr 4min

										</span>

                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                    <h3><a class="title-gd" href="movies.html">Downhill</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="movies.html" class="btn watch-button">Watch now</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<%--Section chứa Slider hiển thị các bộ phim đang hot gần đây --%>
<section class="w3l-mid-slider position-relative">
    <div class="companies20-content">
        <div class="owl-mid owl-carousel owl-theme">
            <div class="item">
                <li>
                    <div class="slider-info mid-view bg bg2">
                        <div class="container">
                            <div class="mid-info">
                                <span class="sub-text">Comedy</span>
                                <h3>Jumanji: The Next Level</h3>
                                <p>2019 ‧ Comedy/Action ‧ 2h 3m</p>
                                <a class="watch" href="movies.html"><span class="fa fa-play"
                                                                          aria-hidden="true"></span>
                                    Watch Trailer</a>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
            <div class="item">
                <li>
                    <div class="slider-info mid-view mid-top1 bg bg2">
                        <div class="container">
                            <div class="mid-info">
                                <span class="sub-text">Adventure</span>
                                <h3>Dolittle</h3>
                                <p>2020 ‧ Family/Adventure ‧ 1h 41m</p>
                                <a class="watch" href="movies.html"><span class="fa fa-play"
                                                                          aria-hidden="true"></span>
                                    Watch Trailer</a>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
            <div class="item">
                <li>
                    <div class="slider-info mid-view mid-top2 bg bg2">
                        <div class="container">
                            <div class="mid-info">
                                <span class="sub-text">Action</span>
                                <h3>Bad Boys for Life</h3>
                                <p>2020 ‧ Comedy/Action ‧ 2h 4m</p>
                                <a class="watch" href="movies.html"><span class="fa fa-play"
                                                                          aria-hidden="true"></span>
                                    Watch Trailer</a>
                            </div>
                        </div>
                    </div>
                </li>
            </div>
        </div>
    </div>
</section>

<%--Section hiển thị lịch chiếu phim --%>
<section class="showtimes-section">
    <div class="showtimes-title"> LỊCH CHIẾU PHIM </div>
    <div class="border-div-1">
        <div class="container">
            <div class="row">
                <div class="col-5">
                    <input id="search-theater" class="form-control" type="text" placeholder="Tìm theo tên rạp" aria-label="search">
                    <div id="showtimes-list-theater"></div>
                </div>
                <div class="col-5">
                    <div id="showtimes-show"></div>
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
            <div class="row align-items-start">
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row align-items-end">
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="..." class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%-- Section : Hiển thị danh sách các rạp chiếu phim --%>
<section class="theaters-section">
    <div class="theaters-title">DANH SÁCH RẠP CHIẾU PHIM</div>
    <div class="border-div-2">
        <div class="row">
            <div class="col-sm-6">
                <div class="card">
                    <h5 class="card-header">Featured</h5>
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="card">
                    <h5 class="card-header">Featured</h5>
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer-66 -->
<footer class="w3l-footer">
    <section class="footer-inner-main">
        <div class="footer-hny-grids py-5">
            <div class="container py-lg-4">
                <div class="text-txt">
                    <div class="right-side">
                        <div class="row footer-about">
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies.html"><img class="img-fluid" src="assets/images/banner1.jpg"
                                                           alt=""></a>
                            </div>
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies.html"><img class="img-fluid" src="assets/images/banner2.jpg"
                                                           alt=""></a>
                            </div>
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies.html"><img class="img-fluid" src="assets/images/banner3.jpg"
                                                           alt=""></a>
                            </div>
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies.html"><img class="img-fluid" src="assets/images/banner4.jpg"
                                                           alt=""></a>
                            </div>
                        </div>
                        <div class="row footer-links">


                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Movies</h6>
                                <ul>
                                    <li><a href="#">Movies</a></li>
                                    <li><a href="#">Videos</a></li>
                                    <li><a href="#">English Movies</a></li>
                                    <li><a href="#">Tailor</a></li>
                                    <li><a href="#">Upcoming Movies</a></li>
                                    <li><a href="Contact_Us.html">Contact Us</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Information</h6>
                                <ul>
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="#">Tv Series</a></li>
                                    <li><a href="#">Blogs</a></li>
                                    <li><a href="sign_in.html">Login</a></li>
                                    <li><a href="Contact_Us.html">Contact</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Locations</h6>
                                <ul>
                                    <li><a href="movies.html">Asia</a></li>
                                    <li><a href="movies.html">France</a></li>
                                    <li><a href="movies.html">Taiwan</a></li>
                                    <li><a href="movies.html">United States</a></li>
                                    <li><a href="movies.html">Korea</a></li>
                                    <li><a href="movies.html">United Kingdom</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Newsletter</h6>
                                <form action="#" class="subscribe mb-3" method="post">
                                    <input type="email" name="email" placeholder="Your Email Address" required="">
                                    <button><span class="fa fa-envelope-o"></span></button>
                                </form>
                                <p>Enter your email and receive the latest news, updates and special offers from us.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div class="below-section">
            <div class="container">
                <div class="copyright-footer">
                    <div class="columns text-lg-left">
                        <p>&copy; 2021 MyShowz. All rights reserved</p>
                    </div>

                    <ul class="social text-lg-right">
                        <li><a href="#facebook"><span class="fa fa-facebook" aria-hidden="true"></span></a>
                        </li>
                        <li><a href="#linkedin"><span class="fa fa-linkedin" aria-hidden="true"></span></a>
                        </li>
                        <li><a href="#twitter"><span class="fa fa-twitter" aria-hidden="true"></span></a>
                        </li>
                        <li><a href="#google"><span class="fa fa-google-plus" aria-hidden="true"></span></a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <!-- move top -->
        <button onclick="topFunction()" id="movetop" title="Go to top">
            <span class="fa fa-arrow-up" aria-hidden="true"></span>
        </button>
        <script>
            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("movetop").style.display = "block";
                } else {
                    document.getElementById("movetop").style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
        <!-- /move top -->

    </section>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
        integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>

</html>
<!-- responsive tabs -->
<script src="assets/js/jquery-1.9.1.min.js"></script>
<script src="assets/js/easyResponsiveTabs.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
<!--/theme-change-->
<script src="assets/js/theme-change.js"></script>
<script src="assets/js/owl.carousel.js"></script>
<!-- script for banner slider-->
<script>
    $(document).ready(function () {
        $('.owl-one').owlCarousel({
            stagePadding: 280,
            loop: true,
            margin: 20,
            nav: true,
            responsiveClass: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplaySpeed: 1000,
            autoplayHoverPause: false,
            responsive: {
                0: {
                    items: 1,
                    stagePadding: 40,
                    nav: false
                },
                480: {
                    items: 1,
                    stagePadding: 60,
                    nav: true
                },
                667: {
                    items: 1,
                    stagePadding: 80,
                    nav: true
                },
                1000: {
                    items: 1,
                    nav: true
                }
            }
        })
    })
</script>
<script>
    $(document).ready(function () {
        $('.owl-three').owlCarousel({
            loop: true,
            margin: 20,
            nav: false,
            responsiveClass: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplaySpeed: 1000,
            autoplayHoverPause: false,
            responsive: {
                0: {
                    items: 2,
                    nav: false
                },
                480: {
                    items: 2,
                    nav: true
                },
                667: {
                    items: 3,
                    nav: true
                },
                1000: {
                    items: 5,
                    nav: true
                }
            }
        })
    })
</script>
<script>
    $(document).ready(function () {
        $('.owl-mid').owlCarousel({
            loop: true,
            margin: 0,
            nav: false,
            responsiveClass: true,
            autoplay: true,
            autoplayTimeout: 5000,
            autoplaySpeed: 1000,
            autoplayHoverPause: false,
            responsive: {
                0: {
                    items: 1,
                    nav: false
                },
                480: {
                    items: 1,
                    nav: false
                },
                667: {
                    items: 1,
                    nav: true
                },
                1000: {
                    items: 1,
                    nav: true
                }
            }
        })
    })
</script>
<!-- script for owlcarousel -->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script>
    $(document).ready(function () {
        $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',

            fixedContentPos: false,
            fixedBgPos: true,

            overflowY: 'auto',

            closeBtnInside: true,
            preloader: false,

            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

        $('.popup-with-move-anim').magnificPopup({
            type: 'inline',

            fixedContentPos: false,
            fixedBgPos: true,

            overflowY: 'auto',

            closeBtnInside: true,
            preloader: false,

            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-slide-bottom'
        });
    });
</script>
<!-- disable body scroll which navbar is in active -->
<script>
    $(function () {
        $('.navbar-toggler').click(function () {
            $('body').toggleClass('noscroll');
        })
    });
</script>
<!-- disable body scroll which navbar is in active -->

<!--/MENU-JS-->
<script>
    $(window).on("scroll", function () {
        var scroll = $(window).scrollTop();

        if (scroll >= 80) {
            $("#site-header").addClass("nav-fixed");
        } else {
            $("#site-header").removeClass("nav-fixed");
        }
    });

    //Main navigation Active Class Add Remove
    $(".navbar-toggler").on("click", function () {
        $("header").toggleClass("active");
    });
    $(document).on("ready", function () {
        if ($(window).width() > 991) {
            $("header").removeClass("active");
        }
        $(window).on("resize", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
        });
    });
</script>

<script src="assets/js/main.js"></script>