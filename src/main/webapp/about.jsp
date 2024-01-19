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
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
</head>
<body>

    <jsp:include page="layout-view/header.jsp"></jsp:include>
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
                <div class="col-lg-6 ab-left pl-lg-4 mt-lg-0 mt-5">
                    <h3 class="hny-title">WEBSITE ĐẶT VÉ XEM PHIM - PZO TICKET</h3>
                    <p class="mt-3">
                        Chào mừng đến với trải nghiệm giải trí tuyệt vời tại website đặt vé xem phim của chúng tôi! Tại đây, chúng tôi tự hào cung cấp dịch vụ đặt vé nhanh chóng và thuận tiện, giúp bạn dễ dàng lựa chọn bộ phim yêu thích và trải nghiệm những khoảnh khắc giải trí đặc sắc.
                    </p>
                    <p class="mt-3">
                        Với giao diện thân thiện và dễ sử dụng, bạn có thể dễ dàng tìm kiếm thông tin về các bộ phim mới nhất, xem lịch chiếu, và chọn ghế ngồi theo ý muốn của mình. Chúng tôi cam kết đảm bảo sự thoải mái và hài lòng cho khách hàng, đồng thời cung cấp các ưu đãi và khuyến mãi hấp dẫn.
                    </p>
                    <p class="mt-3">
                        Ngoài ra, website của chúng tôi còn cung cấp các đánh giá và đánh giá từ cộng đồng người xem, giúp bạn có cái nhìn tổng quan về chất lượng của các bộ phim trước khi quyết định đặt vé. Đặt vé ngay hôm nay để trải nghiệm không gian giải trí đẳng cấp và không ngừng được cập nhật với những bộ phim mới nhất!
                    </p>
                    <div class="ready-more mt-4">
                        <a href="https://www.facebook.com/phatthanh2016" class="btn read-button">Tìm hiểu thêm<span class="fa fa-angle-double-right ml-2" aria-hidden="true"></span></a>
                    </div>
                </div>
                <div class="col-lg-6 ab-right">
                    <img class="img-fluid" src="assets/images/obitoAVATAR.png">
                </div>
            </div>

            <div class="w3l-counter-stats-info text-center">
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">100+</p>
                            <h4>Phim</h4>
                        </div>
                    </div>
                </div>
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">5000+</p>
                            <h4>Người dùng</h4>
                        </div>
                    </div>
                </div>
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">30+</p>
                            <h4>Thể loại</h4>

                        </div>
                    </div>
                </div>
                <div class="stats_left">
                    <div class="counter_grid">
                        <div class="icon_info">
                            <p class="counter">2</p>
                            <h4>Admin Quản lí</h4>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div id="carouselMultiItemExample" class="carousel slide carousel-dark text-center" data-mdb-ride="carousel">
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

    <jsp:include page="layout-view/footer.jsp" ></jsp:include>
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
