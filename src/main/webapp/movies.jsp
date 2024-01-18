<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movies</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="layout-view/header.jsp"></jsp:include>
    <%-- BREADCRUMBS--%>
    <div class="w3l-breadcrumbs">
      <nav id="breadcrumbs" class="breadcrumbs">
        <div class="container page-wrapper">
          <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Phim</span>
        </div>
      </nav>
    </div>

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
                      <a class="watch" href="${m.linkMovieTrailer}" target="_blank"><span class="fa fa-play" aria-hidden="true"></span>Watch Trailer</a>
                    </div>
                  </div>
                </div>
              </li>
            </div>
          </c:forEach>
        </div>
      </div>
    </section>
    <%-- Section hiển thị các bộ phim lọc theo đã chiếu và chưa chiếu --%>
    <section class="w3l-grids">
      <div class="grids-main py-5" style="padding: 0px 0px">
        <div class="container py-lg-4">
          <div class="headerhny-title">
            <div class="w3l-title-grids">
              <div class="headerhny-left">
                <h3 class="hny-title">PHIM MỚI</h3>
              </div>
              <div class="headerhny-right text-lg-right">
                <h4><a class="show-title" href="#projects">XEM TẤT CẢ</a></h4>
              </div>
            </div>
          </div>
          <div class="w3l-populohny-grids">
            <%-- lấy ra 8 phim mới nhất và hiển thị lên giao diện --%>
            <c:forEach items="${top4NewestMovies}" var="m">
              <div class="item vhny-grid">
                <div class="box16 mb-0">
                  <figure>
                    <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 350px">
                  </figure>
                  <a href="movieDetail-servlet?action=init" data-toggle="modal">
                    <div class="box-content">
                      <h3 class="title">${m.movieName}</h3>
                      <h4> <span class="post"><span class="fa fa-clock-o"> </span>Thời lượng : ${m.duration}</span>
                        <span class="post fa fa-heart text-right"></span>
                      </h4>
                    </div>
                  </a>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="w3l-title-grids">
            <div class="headerhny-left">
              <h3 class="hny-title">Phim xem nhiều</h3>
            </div>
            <div class="headerhny-right text-lg-right">
            </div>
          </div>
          <div class="w3l-populohny-grids">
            <c:forEach items="${popularMovies}" var="m">
              <div class="item vhny-grid">
                <div class="box16 mb-0">
                  <figure>
                    <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 350px">
                  </figure>
                  <a href="movieDetail-servlet?action=init" data-toggle="modal">
                    <div class="box-content">
                      <h3 class="title">${m.movieName}</h3>
                      <h4> <span class="post"><span class="fa fa-clock-o"> </span>Thời lượng : ${m.duration}</span>
                        <span class="post fa fa-heart text-right"></span>
                      </h4>
                    </div>
                  </a>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="w3l-title-grids">
            <div class="headerhny-left">
              <h3 class="hny-title">Phim sắp chiếu</h3>
            </div>
            <div class="headerhny-right text-lg-right">
            </div>
          </div>
          <div class="w3l-populohny-grids">
            <c:forEach items="${unPublishedMovies}" var="m">
              <div class="item vhny-grid">
                <div class="box16 mb-0">
                  <figure>
                    <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 350px">
                  </figure>
                  <a href="movieDetail-servlet?action=init" data-toggle="modal">
                    <div class="box-content">
                      <h3 class="title">${m.movieName}</h3>
                      <h4> <span class="post"><span class="fa fa-clock-o"> </span>Thời lượng : ${m.duration}</span>
                        <span class="post fa fa-heart text-right"></span>
                      </h4>
                    </div>
                  </a>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
        <div class="button-center text-center mt-3">
          <a href="#projects" class="btn view-button">XEM NHIỀU PHIM HƠN<span class="fa fa-angle-double-right ml-2" aria-hidden="true"></span></a>
        </div>
      </div>
    </section>

    <section class="w3l-albums py-5" id="projects">
      <div class="container py-lg-4">
        <div class="row">
          <div class="col-lg-12 mx-auto">
            <!--Horizontal Tab-->
            <div id="parentHorizontalTab">
              <%-- chuyển thành cái bộ lọc tìm kiếm như MOMO SEARCH --%>
              <ul class="resp-tabs-list hor_1">
                <li>Recent Movies</li>
                <li>Popular Movies</li>
                <li>Trend Movies</li>
                <div class="clear"></div>
              </ul>
              <div class="resp-tabs-container hor_1">
                <div class="albums-content">
                  <div class="row">
                    <c:forEach items="${allMovies}" var="m">
                      <div class="col-lg-4 new-relise-gd mt-lg-0 mt-0">
                        <div class="slider-info">
                          <div class="img-circle">
                            <a href="#small-dialog" class="popup-with-zoom-anim play-view1">
                              <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 200px">
                              <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                            </a>
                            <div id="small-dialog" class="zoom-anim-dialog mfp-hide">
                              <iframe width="832" height="349" src="${m.linkMovieTrailer}" title="${m.movieName} - OFFICIAL TRAILER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                            </div>
                          </div>
                          <div class="message">
                            <p style="font-weight: lighter">Một bộ phim của ${m.director} - ${m.country}</p>
                            <a class="author-book-title" href="movieDetail-servlet?action=init">${m.movieName}</a>
                            <h4> <span class="post"><span class="fa fa-clock-o"> </span>${m.duration}</span>
                                 <span class="post fa fa-heart text-right"></span>
                            </h4>
                          </div>
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
    <script src="assets/js/theme-change.js"></script>
    <jsp:include page="layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="layout-view/js-function-slider.jsp" ></jsp:include>

    <script src="assets/js/main.js"></script>
</body>
</html>
