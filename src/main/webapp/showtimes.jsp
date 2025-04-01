<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ShowTimes - PZO</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/showtimes.css">
</head>
<body>
    <%-- Header --%>
    <jsp:include page="layout-view/header.jsp"></jsp:include>

    <%-- Breadcrumbs --%>
    <div class="w3l-breadcrumbs">
        <nav id="breadcrumbs" class="breadcrumbs">
            <div class="container page-wrapper">
                <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Lịch Chiếu</span>
            </div>
        </nav>
    </div>

    <%--Section hiển thị lịch chiếu phim --%>
    <section class="showtimes-section" id="showtimeSection" >
        <div class="showtimes-title" style="padding : 20px 0px 30px 0px;"> LỊCH CHIẾU PHIM </div>
        <div class="border-div-1" style="padding-top: 0px">
            <div class="container">
                <%-- filter Cinema by Name and Location --%>
                <div id="showtimes-bottom">
                    <div class="row">
                        <div class="location-group">
                            <%-- thực hiện tìm kiếm tên rạp - ten rap chieu phim can tim den HomeController servlet --%>
                            <form action="showtimes-servlet" method="post" style="width: 500px; padding-top: 20px">
                                <input type="hidden" name="action" value="search_by_name">
                                <input type="hidden" name="cid" value="${cinemaDetail.cinemaID}">
                                <input class="form-control" type="text" name="txtSearch" oninput="searchAJAX(this)"  value="${txtSearch}" placeholder="Tìm theo tên rạp" aria-label="search" value="${txtHistory}">
                            </form>
                            <%-- filter tên cinema theo Loại Rạp --%>
                            <select id="cinema-name" class="form-select" style="width: 150px;">
                                <option>CGV</option>
                                <option>Cinestar</option>
                                <option>Beta</option>
                            </select>
                            <label for="city">Vị trí   </label>
                            <select id="city" class="form-select" style="width: 200px;">
                                <option>Hồ Chí Minh</option>
                                <option>Hà Nội</option>
                                <option>Đà Nẵng</option>
                            </select>
                            <button class="btn btn-location"><i class="fas fa-map-marker-alt"> </i>  Rạp gần bạn</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <div id= "showtimes-list_cinema" style="padding-bottom: 30px">
                            <c:forEach items="${curListCinema}" var="cinema">
                                <div class="row_cinemaName">
                                    <img class="cinema_img" src="assets/images/obitoAVATAR.png">
                                    <a href="showtimes-servlet?action=show-cinemaShowtime&cid=${cinema.cinemaID}" style="color: whitesmoke" >${cinema.cinemaName}</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-8">
                        <div id="showtimes-rightBox">
                            <%-- hien thi noi dung cinema lay duoc tu home-servlet --%>
                            <div class="showtimes-cinema_title" id="cinemaTitle">
                                <div class="row">
                                    <div class="col-1">
                                        <img style="width: 50px; height: 50px" class="cinema_img" src="assets/images/obitoAVATAR.png">
                                    </div>
                                    <div class="col-9">
                                        <h2 style="font-size: 20px; padding-bottom: 5px; font-style: italic">Lịch chiếu phim CGV</h2>
                                        <h4 style="font-size: 13px; font-weight: lighter; "> Thủ Đức <a href="">[ Bản đồ ]</a></h4>
                                    </div>
                                </div>
<%--                                <c:if test="${(cinemaDetail == null) && (curCinemaList != 0)}">--%>
<%--                                    <h2 style="font-size: 25px;padding-bottom: 5px"><i class="fa-solid fa-film"> </i> Bạn chưa chọn rạp phim</h2>--%>
<%--                                    <h4 style="font-size: 17px; font-weight: lighter;padding-bottom: 10px"></h4>--%>
<%--                                </c:if>--%>
<%--                                <c:if test="${cinemaDetail != null}">--%>
<%--                                </c:if>--%>
                            </div>
                            <div class="showtimes-calendar">
                                <div class="showtimes-btn_group">
                                    <%-- hien thi 7 ngay tinh tu HOM NAY de dat ve --%>
                                    <div class="showtimes-calenderBox">
                                        <%--  dùng javaBean để lấy ngày tháng và hiển thị ngày hôm nay--%>
                                        <jsp:useBean id="date" class="beans.DateBean" scope="session"/>
                                        <a class="showtimes-curdateItem" href="showtimes-servlet?action=showShowTime&date=${date.formatDate(date.currentDate)}&cid=${cinemaDetail.cinemaID}&cinemaName=">
                                            <fmt:formatDate value="${date.currentDate}" pattern="dd/MM"/> [Hôm nay]
                                        </a>
                                        <c:forEach var="i" begin="1" end="6" >
                                            <%-- hien thi 6 ngay bat dau tu ngay chieu phim dang duoc chon --%>
                                            <a class="showtimes-dateItem" href="showtimes-servlet?action=showShowTime&date=${date.formatDate(date.addDate(i))}&cid=${cinemaDetail.cinemaID}">
                                                <fmt:formatDate value="${date.addDate(i)}" pattern="dd/MM"/>
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div> <br>
                                <div class="showtimes-show">
                                    <%-- neu user chua chon ten rap phim va thoi gian --%>
<%--                                    <c:if test="${movieListForCNameAndShowtime == null}" >--%>
<%--                                        <div class="card">--%>
<%--                                            <div class="card-body">--%>
<%--                                                <h5 class="card-title" style="color: whitesmoke;font-weight: bolder; margin-bottom: 5px; background-color: rgba(121,177,187,0.35); border-radius: 5px">Chưa có Phim để hiển thị</h5>--%>
<%--                                                <p class="card-text" style="color: whitesmoke;"></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </c:if>--%>
<%--                                    <c:if test="${movieListForCNameAndShowtime != null}" >--%>
<%--                                        <c:forEach items="${movieListForCNameAndShowtime}" var="m">--%>
                                            <%-- hien thi cac phim trong ngay duoc chon --%>
<%--                                            <div class="card">--%>
<%--                                                <div class="card-body"--%>
<%--                                                     style="background: url(../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}) no-repeat center; background-size: cover;  margin: 5px 0px 0px 0px;border-radius: 5px;">--%>
<%--                                                    <h5 class="card-title" style="color: whitesmoke;font-weight: bolder; margin-bottom: 5px; background-color: rgba(121,177,187,0.35); border-radius: 5px">${m.movieName}</h5>--%>
<%--                                                    <p class="card-text" style="color: whitesmoke;">${m.movieDescription}</p>--%>
<%--                                                    <a href="movieDetail-servlet?action=init&movieID=${m.movieID}" class="btn btn-primary" style="margin-top: 5px">Đặt vé ngày ${wantedBookDate}</a>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
<%--                                    </c:if>--%>

                                        <div class="card scroll-container">
                                            <div class="container mt-4" style="margin-top: 10px !important;">
                                                <div class="card mb-2">
                                                    <div class="row">
                                                        <div class="col-3" style="padding-right: 0px">
                                                            <img src="../Movie_Ticket_Website/assets/movie-image/mikey-17.png" class="img-fluid rounded-start" alt="Ảnh" style="height: 200px; width: 150px" >
                                                        </div>
                                                        <div class="col-9" style="padding-left: 0px">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Mikey 17 </h5>
                                                                <h6 class="card-title">Hành động, Phiêu lưu </h6>
                                                                <p class="card-text">
                                                                    Mô tả ngắn về sản phẩm. Đây là một đoạn văn bản mô tả chi tiết hơn.
                                                                    Thêm nội dung để kiểm tra thanh cuộn.
                                                                </p>
                                                                <a href="#" class="btn btn-primary">Xem chi tiết</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container mt-4" style="margin-top: 10px !important;">
                                                <div class="card mb-2">
                                                    <div class="row">
                                                        <div class="col-3" style="padding-right: 0px">
                                                            <img src="../Movie_Ticket_Website/assets/movie-image/mikey-17.png" class="img-fluid rounded-start" alt="Ảnh" style="height: 200px; width: 150px" >
                                                        </div>
                                                        <div class="col-9" style="padding-left: 0px">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Mikey 17 </h5>
                                                                <h6 class="card-title">Hành động, Phiêu lưu </h6>
                                                                <p class="card-text">
                                                                    Mô tả ngắn về sản phẩm. Đây là một đoạn văn bản mô tả chi tiết hơn.
                                                                    Thêm nội dung để kiểm tra thanh cuộn.
                                                                </p>
                                                                <a href="#" class="btn btn-primary">Xem chi tiết</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="container mt-4" style="margin-top: 10px !important;">
                                                <div class="card mb-2">
                                                    <div class="row">
                                                        <div class="col-3" style="padding-right: 0px">
                                                            <img src="../Movie_Ticket_Website/assets/movie-image/mikey-17.png" class="img-fluid rounded-start" alt="Ảnh" style="height: 200px; width: 150px" >
                                                        </div>
                                                        <div class="col-9" style="padding-left: 0px">
                                                            <div class="card-body">
                                                                <h5 class="card-title">Mikey 17 </h5>
                                                                <h6 class="card-title">Hành động, Phiêu lưu </h6>
                                                                <p class="card-text">
                                                                    Mô tả ngắn về sản phẩm. Đây là một đoạn văn bản mô tả chi tiết hơn.
                                                                    Thêm nội dung để kiểm tra thanh cuộn.
                                                                </p>
                                                                <a href="#" class="btn btn-primary">Xem chi tiết</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
    <script>
        function searchAJAX(input) {
            var txtSearch = input.value;
            $.ajax({
                url: "/Movie_Ticket_Website/showtimes-servlet?action=search_by_name",
                type : "get",
                data : {
                    txtSearch : txtSearch
                },
                success: function(data){
                    var row = document.getElementById('showtimes-list_cinema');
                    row.innerHTML = data;
                },
                error : function (xhr) {

                }
            });
        }
    </script>

</body>
</html>
