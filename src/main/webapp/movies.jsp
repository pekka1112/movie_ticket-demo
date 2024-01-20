<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Movies</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/movie.css">
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

    <%-- Section thể hiện tất cả các phim   --%>
    <section class="w3l-albums py-5" id="projects" style="padding : 0px !important;">
      <div class="container py-lg-4">
        <div class="row">
          <div class="col-lg-12 mx-auto">
            <!--Horizontal Tab-->
            <div id="parentHorizontalTab">
              <div class="container py-lg-4">
                <div class="headerhny-title">
                  <div class="w3l-title-grids">
                    <div class="headerhny-left">
                      <h3 class="hny-title">TÌM PHIM CHIẾU RẠP TRÊN PZO</h3>
                    </div>
                    <div class="headerhny-right">
                      <div class="row">
                        <%--  Filter : filter by country, isPublished, movieCategory, director + find by movieName --%>
                        <%-- first Filter : filter by country, isPublished, movieCategory, director + find by movieName --%>
                        <%-- lọc phim theo tên thể loại --%>
                        <div class="col-2">
                          <form action="movie-servlet" method="get">
                            <input type="hidden" name="action" value="filterCategory">
                            <input class="filter_input" type="text" name="category" placeholder="Thể loại" list="catelogyList">
                            <datalist id="catelogyList">
                              <c:forEach items="${categoryList}" var="c">
                                <option>${c}</option>
                              </c:forEach>
                            </datalist>
                          </form>
                        </div>
                        <%-- lọc phim theo tên quốc gia --%>
                        <div class="col-2">
                          <form action="movie-servlet" method="get">
                            <input type="hidden" name="action" value="filterCountry">
                            <input class="filter_input" type="text" name="country" placeholder="Quốc gia" list="countryList">
                            <datalist id="countryList">
                              <c:forEach items="${countryList}" var="c">
                                <option>${c}</option>
                              </c:forEach>
                            </datalist>
                          </form>
                        </div>
                        <%-- lọc phim theo năm phát hành --%>
                        <div class="col-2">
                          <form action="movie-servlet" method="get">
                            <input type="hidden" name="action" value="filterYear">
                            <input class="filter_input" type="text" name="year" placeholder="Năm " list="yearList">
                            <datalist id="yearList">
                              <c:forEach items="${yearList}" var="c">
                                <option>${c}</option>
                              </c:forEach>
                            </datalist>
                          </form>
                        </div>
                        <%-- nhập tên để tìm phim  --%>
                        <div class="col-2">
                          <form action="movie-servlet" method="get">
                            <input type="hidden" name="action" value="findByMovieName">
                            <input class="filter_input" type="search" name="movieName" placeholder="Nhập tên phim để tìm kiếm" >
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="resp-tabs-container hor_1">
                  <div class="albums-content">
                    <div class="row">
                      <%-- hiện allMovie khi gọi init hoặc search không có phim--%>
                      <c:if test="${isShowAllCinema || movieFilteredByNameSize == 0}">
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
                                <a class="author-book-title" href="movieDetail-servlet?action=init&movieID=${m.movieID}">${m.movieName}</a>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span>${m.duration}</span>
                                  <span class="post fa fa-heart text-right"></span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                      <%-- hiện allMovie khi gọi init hoặc search không có phim--%>
                      <c:if test="${movieFilteredByCategory != null}">
                        <c:forEach items="${movieFilteredByCategory}" var="m">
                          <div class="col-lg-4 new-relise-gd mt-lg-0 mt-0">
                            <div class="slider-info">
                              <div class="img-circle">
                                <a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
                                  <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 200px">
                                  <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                                </a>
                                <div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
                                  <iframe width="832" height="349" src="${m.linkMovieTrailer}" title="${m.movieName} - OFFICIAL TRAILER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                              </div>
                              <div class="message">
                                <p style="font-weight: lighter">Một bộ phim của ${m.director} - ${m.country}</p>
                                <a class="author-book-title" href="movieDetail-servlet?action=init&movieID=${m.movieID}">${m.movieName}</a>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span>${m.duration}</span>
                                  <span class="post fa fa-heart text-right"></span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                      <c:if test="${movieFilteredByCountry != null}">
                        <c:forEach items="${movieFilteredByCountry}" var="m">
                          <div class="col-lg-4 new-relise-gd mt-lg-0 mt-0">
                            <div class="slider-info">
                              <div class="img-circle">
                                <a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
                                  <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 200px">
                                  <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                                </a>
                                <div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
                                  <iframe width="832" height="349" src="${m.linkMovieTrailer}" title="${m.movieName} - OFFICIAL TRAILER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                              </div>
                              <div class="message">
                                <p style="font-weight: lighter">Một bộ phim của ${m.director} - ${m.country}</p>
                                <a class="author-book-title" href="movieDetail-servlet?action=init&movieID=${m.movieID}">${m.movieName}</a>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span>${m.duration}</span>
                                  <span class="post fa fa-heart text-right"></span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                      <c:if test="${movieFilteredByYear != null}">
                        <c:forEach items="${movieFilteredByYear}" var="m">
                          <div class="col-lg-4 new-relise-gd mt-lg-0 mt-0">
                            <div class="slider-info">
                              <div class="img-circle">
                                <a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
                                  <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 200px">
                                  <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                                </a>
                                <div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
                                  <iframe width="832" height="349" src="${m.linkMovieTrailer}" title="${m.movieName} - OFFICIAL TRAILER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                              </div>
                              <div class="message">
                                <p style="font-weight: lighter">Một bộ phim của ${m.director} - ${m.country}</p>
                                <a class="author-book-title" href="movieDetail-servlet?action=init&movieID=${m.movieID}">${m.movieName}</a>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span>${m.duration}</span>
                                  <span class="post fa fa-heart text-right"></span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                      <c:if test="${movieFilteredByName != null}">
                        <c:forEach items="${movieFilteredByName}" var="m">
                          <div class="col-lg-4 new-relise-gd mt-lg-0 mt-0">
                            <div class="slider-info">
                              <div class="img-circle">
                                <a href="#small-dialog1" class="popup-with-zoom-anim play-view1">
                                  <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 200px">
                                  <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                                </a>
                                <div id="small-dialog1" class="zoom-anim-dialog mfp-hide">
                                  <iframe width="832" height="349" src="${m.linkMovieTrailer}" title="${m.movieName} - OFFICIAL TRAILER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                </div>
                              </div>
                              <div class="message">
                                <p style="font-weight: lighter">Một bộ phim của ${m.director} - ${m.country}</p>
                                <a class="author-book-title" href="movieDetail-servlet?action=init&movieID=${m.movieID}">${m.movieName}</a>
                                <h4> <span class="post"><span class="fa fa-clock-o"> </span>${m.duration}</span>
                                  <span class="post fa fa-heart text-right"></span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </section>

    <%-- Section hiển thị các bộ phim lọc theo đã chiếu và chưa chiếu --%>
    <section class="w3l-grids">
      <div class="grids-main py-5" >
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
                  <a href="movieDetail-servlet?action=init&movieID=${m.movieID}" data-toggle="modal">
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
                  <a href="movieDetail-servlet?action=init&movieID=${m.movieID}" data-toggle="modal">
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
                  <a href="movieDetail-servlet?action=init&movieID=${m.movieID}" data-toggle="modal">
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


    <jsp:include page="layout-view/footer.jsp"></jsp:include>
    <script src="assets/js/theme-change.js"></script>
    <jsp:include page="layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="layout-view/js-function-slider.jsp" ></jsp:include>

    <script src="assets/js/main.js"></script>
</body>
</html>
