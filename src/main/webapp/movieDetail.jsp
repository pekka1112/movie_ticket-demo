<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/14/2023
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Lịch Chiếu</title>
    <link rel="icon" type="image/x-icon" href="assets/images/x-icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/movie_detail.css">
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
<jsp:include page="layout-view/header.jsp"></jsp:include>
<%-- BREADCRUMBS --%>
<div class="w3l-breadcrumbs">
    <nav id="breadcrumbs" class="breadcrumbs">
        <div class="container page-wrapper">
            <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page"></span>
        </div>
    </nav>
</div>

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
                                <a class="watch" href="movies.jsp"><span class="fa fa-play"
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
                                <a class="watch" href="movies.jsp"><span class="fa fa-play"
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
                                <a class="watch" href="movies.jsp"><span class="fa fa-play"
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

<section class="film-detail">
    <div class="container">
        <div class="row">
            <div class="col-4" id="film-detail__poster">
                <img src="./assets/images/obitoAVATAR.png" id="poster" alt="">
            </div>
            <div class="col-8" id="film-detail__context">
                <div class="film-detail__txt">1</div>
                <div class="film-detail__txt">2</div>
                <div class="film-detail__txt">3</div>
                <div class="film-detail__txt">4</div>
                <div class="film-detail__txt">5</div>
            </div>
        </div>
    </div>
</section>

<section class="showtimes-section">
    <div class="showtimes-title" style="padding : 20px 0px 30px 0px;"> LỊCH CHIẾU : ${movieName} </div>
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

<jsp:include page="user-view/footer.jsp"></jsp:include>
<script src="assets/js/header_active-btn-clicked.js"> </script>
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
<script src="assets/js/main.js"></script>
<script src="assets/js/theme-change.js"></script>
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
