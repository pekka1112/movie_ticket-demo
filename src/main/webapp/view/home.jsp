<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/3/2023
  Time: 12:53 AM
  To change this template use File | Settings | File Templates.
--%>
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
                        <div class="slider-info banner-view bg bg2"
<%--                             style=" background: url(../assets/movie-image/aquaman-vuong-quoc-that-lac.jpg) no-repeat center"--%>
                             >
                            <div class="banner-info">
                                <h3>${newestMovie.movieName}</h3>
                                <p><span>${newestMovie.movieContent}</span></p>
                                <a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
									<span class="video-play-icon">
										<span class="fa fa-play"></span>
									</span>
                                    <h6>Xem Trailer</h6>
                                </a>
                                <div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
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
                        <h4><a class="show-title" href="../movies.jsp">XEM TẤT CẢ</a></h4>
                    </div>
                </div>
            </div>
            <div class="w3l-populohny-grids">
                <div class="item vhny-grid">
                    <div class="box16">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
                            </figure>
                            <div class="box-content">
                                <h3 class="title">A Wednesday</h3>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span> 1 Hr 4min </span>
                                    <span class="post fa fa-heart text-right"></span>
                                </h4>
                            </div>
                            <span class="fa fa-play video-icon" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                        <h4><a class="show-title" href="../movies.jsp">XEM TẤT CẢ</a></h4>
                    </div>
                </div>
            </div>
            <div class="owl-three owl-carousel owl-theme">
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                    <h3><a class="title-gd" href="../movies.jsp">No Time to Die</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="../movies.jsp" class="btn watch-button">Watch now</a>
                    </div>

                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                    <h3><a class="title-gd" href="../movies.jsp">Mulan</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="../movies.jsp" class="btn watch-button">Watch now</a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                    <h3><a class="title-gd" href="../movies.jsp">Free Guy</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="../movies.jsp" class="btn watch-button">Watch now</a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                    <h3><a class="title-gd" href="../movies.jsp">My Spy</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="../movies.jsp" class="btn watch-button">Watch now</a>
                    </div>

                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                    <h3><a class="title-gd" href="../movies.jsp">Scoob</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="../movies.jsp" class="btn watch-button">Watch now</a>
                    </div>
                </div>
                <div class="item vhny-grid">
                    <div class="box16 mb-0">
                        <a href="../movies.jsp">
                            <figure>
                                <img class="img-fluid" src="#" alt="">
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
                    <h3><a class="title-gd" href="../movies.jsp">Downhill</a></h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit</p>
                    <div class="button-center text-center mt-4">
                        <a href="../movies.jsp" class="btn watch-button">Watch now</a>
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
                                <a class="watch" href="../movies.jsp"><span class="fa fa-play"
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
                                <a class="watch" href="../movies.jsp"><span class="fa fa-play"
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
                                <a class="watch" href="../movies.jsp"><span class="fa fa-play"
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

    <jsp:include page="../layout-view/footer.jsp" ></jsp:include>

    <jsp:include page="../layout-view/script-libraries.jsp" ></jsp:include>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js" integrity="sha512-IsNh5E3eYy3tr/JiX2Yx4vsCujtkhwl7SLqgnwLNgf04Hrt9BT9SXlLlZlWx+OK4ndzAoALhsMNcCmkggjZB1w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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