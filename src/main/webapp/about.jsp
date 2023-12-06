<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/6/2023
  Time: 1:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>About the PZO</title>
    <link rel="icon" type="image/x-icon" href="assets/images/x-icon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/style_new.css">
    <link rel="stylesheet" type="text/css" href="assets/css/swiper.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.x.x/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.x.x/js/swiper.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.css" integrity="sha512-rd0qOHVMOcez6pLWPVFIv7EfSdGKLt+eafXh4RO/12Fgr41hDQxfGvoi1Vy55QIVcQEujUE1LQrATCLl2Fs+ag==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                    <li class="nav-item "><a class="nav-link" href="index.jsp">Trang chủ</a></li>
                    <li class="nav-item "><a class="nav-link" href="movies.jsp">Phim</a></li>
                    <li class="nav-item"><a class="nav-link" href="showtimes.jsp">Lịch chiếu</a></li>
                    <li class="nav-item"><a class="nav-link" href="theaters.jsp">Rạp chiếu</a></li>
                    <li class="nav-item active"><a class="nav-link" href="about.jsp">Thông tin</a></li>
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
                    <a class="nav-link" href="sign_in.html"><i class="fa fa-user-circle-o"></i></a>
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
    <!--/breadcrumbs -->
    <div class="w3l-breadcrumbs">
        <nav id="breadcrumbs" class="breadcrumbs">
            <div class="container page-wrapper">
                <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Thông Tin</span>
            </div>
        </nav>
    </div>

    <div class="w3l-ab-grids py-5">
        <div class="container py-lg-4">
            <div class="row ab-grids-sec align-items-center">
                <div class="col-lg-6 ab-right">
                    <img class="img-fluid" src="assets/images/banner1.jpg">
                </div>
                <div class="col-lg-6 ab-left pl-lg-4 mt-lg-0 mt-5">
                    <h3 class="hny-title">My Showz Entertainment</h3>
                    <p class="mt-3">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam id quisquam ipsam
                        molestiae ad eius accusantium? Nulla dolorem perferendis inventore! posuere cubilia Curae;
                        Nunc non risus in justo convallis feugiat.</p>
                    <div class="ready-more mt-4">
                        <a href="#" class="btn read-button">Read More <span class="fa fa-angle-double-right ml-2"
                                                                            aria-hidden="true"></span></a>
                    </div>
                </div>
            </div>

            <div class="w3l-counter-stats-info text-center">
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">65</p>
                            <h4>Movies</h4>

                        </div>
                    </div>
                </div>
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">165</p>
                            <h4>Shows</h4>

                        </div>
                    </div>
                </div>
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">463</p>
                            <h4>Staff Members</h4>

                        </div>
                    </div>
                </div>
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">5063</p>
                            <h4>No. of Users</h4>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- Carousel wrapper -->
    <div id="carouselMultiItemExample" class="carousel slide carousel-dark text-center" data-mdb-ride="carousel">
        <!-- Controls -->
        <div class="d-flex justify-content-center mb-4">
            <button class="carousel-control-prev position-relative" type="button"
                    data-mdb-target="#carouselMultiItemExample" data-mdb-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next position-relative" type="button"
                    data-mdb-target="#carouselMultiItemExample" data-mdb-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- Inner -->
        <div class="carousel-inner py-4">
            <!-- Single item -->
            <div class="carousel-item active">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="./assets/images/thanh_quyen_avt.png" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Thanh Quyền</h5>
                            <p>UX Designer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod eos id
                                officiis hic tenetur quae quaerat ad velit ab hic tenetur.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                            </ul>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="./assets/images/thanh_phat_avt.png" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Thanh Phát</h5>
                            <p>Web Developer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis
                                suscipit laboriosam, nisi ut aliquid commodi.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li>
                                    <i class="fas fa-star-half-alt fa-sm"></i>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(10).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Hữu Quý</h5>
                            <p>Photographer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                praesentium voluptatum deleniti atque corrupti.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="far fa-star fa-sm"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single item -->
            <div class="carousel-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(3).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">John Doe</h5>
                            <p>UX Designer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod eos id
                                officiis hic tenetur quae quaerat ad velit ab hic tenetur.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                            </ul>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(4).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Alex Rey</h5>
                            <p>Web Developer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis
                                suscipit laboriosam, nisi ut aliquid commodi.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li>
                                    <i class="fas fa-star-half-alt fa-sm"></i>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(5).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Maria Kate</h5>
                            <p>Photographer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                praesentium voluptatum deleniti atque corrupti.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="far fa-star fa-sm"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single item -->
            <div class="carousel-item">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(6).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Anna Deynah</h5>
                            <p>UX Designer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod eos id
                                officiis hic tenetur quae quaerat ad velit ab hic tenetur.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                            </ul>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(8).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">John Doe</h5>
                            <p>Web Developer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis
                                suscipit laboriosam, nisi ut aliquid commodi.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li>
                                    <i class="fas fa-star-half-alt fa-sm"></i>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-4 d-none d-lg-block">
                            <img class="rounded-circle shadow-1-strong mb-4"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(7).webp" alt="avatar"
                                 style="width: 150px;" />
                            <h5 class="mb-3">Maria Kate</h5>
                            <p>Photographer</p>
                            <p class="text-muted">
                                <i class="fas fa-quote-left pe-2"></i>
                                At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
                                praesentium voluptatum deleniti atque corrupti.
                            </p>
                            <ul class="list-unstyled d-flex justify-content-center text-warning mb-0">
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="fas fa-star fa-sm"></i></li>
                                <li><i class="far fa-star fa-sm"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Inner -->
    </div>
    <!-- Carousel wrapper -->

    <section class="w3l-clients" id="clients">
        <!-- /grids -->
        <!-- <div class="cusrtomer-layout py-5"> -->
        <div class="container py-lg-4">
            <!-- <div class="headerhny-title">
                <h3 class="hny-title">Our Testimonials</h3>
            </div> -->
            <!-- /grids -->
            <div class="testimonial-width">
                <div class="owl-clients owl-carousel owl-theme mb-lg-5">
                    <div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae laudantium
                                        voluptate rem ullam dolore!.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/team1.jpg" class="img-fluid" alt="/">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Johnson smith</h3>
                                        <p class="indentity">Washington</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae laudantium
                                        voluptate rem ullam dolore!.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/team2.jpg" class="img-fluid" alt="/">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Alexander leo</h3>
                                        <p class="indentity">Washington</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae laudantium
                                        voluptate rem ullam dolore!.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/team3.jpg" class="img-fluid" alt="/">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Roy Linderson</h3>
                                        <p class="indentity">Washington</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae laudantium
                                        voluptate rem ullam dolore!.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/team4.jpg" class="img-fluid" alt="/">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Mike Thyson</h3>
                                        <p class="indentity">Washington</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae laudantium
                                        voluptate rem ullam dolore!.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/team2.jpg" class="img-fluid" alt="/">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Laura gill</h3>
                                        <p class="indentity">Washington</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-content">
                            <div class="testimonial">
                                <blockquote>
                                    <q>Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit beatae laudantium
                                        voluptate rem ullam dolore!.</q>
                                </blockquote>
                                <div class="testi-des">
                                    <div class="test-img"><img src="assets/images/team3.jpg" class="img-fluid" alt="/">
                                    </div>
                                    <div class="peopl align-self">
                                        <h3>Smith Johnson</h3>
                                        <p class="indentity">Washington</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /grids -->
        </div>
    </section>

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
    <script src="assets/js/theme-change.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/11.0.5/swiper-bundle.min.js" integrity="sha512-Ysw1DcK1P+uYLqprEAzNQJP+J4hTx4t/3X2nbVwszao8wD+9afLjBQYjz7Uk4ADP+Er++mJoScI42ueGtQOzEA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
