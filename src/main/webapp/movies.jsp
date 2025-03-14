<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
<html>
<head>
    <title>Movies - PZO</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <style>
      .resp-tabs-list {
        font-weight: 300;
        font-size: 18px;
        padding-bottom: 5px;
        margin: 0 1% 0 0%;
        list-style: none;
        cursor: pointer;
        float: left;
        text-align: center;
        background-color: var(--theme-lite);
        border-radius: 6px;
      }
      .resp-tabs-list option {
        font-size: 18px;
        margin: 0 2%;
        padding-bottom: 5px;
        padding-top: 5px;
        cursor: pointer;
        text-align: center;
        background-color: var(--theme-lite);
        border-radius: 6px;
      }
      .resp-tabs-list select {
        padding-top: 5px;
        padding-bottom: 5px;
        border-radius: 6px;
        background-color: var(--theme-lite);
        font-size: 18px;
        cursor: pointer;
      }
    </style>
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

    <%-- Section hiển thị các bộ phim lọc theo PHIM XEM NHIỀU --%>
    <section class="w3l-grids">
      <div class="grids-main py-5" style="padding: 0px 0px !important;">
        <div class="container py-lg-4">
          <div class="w3l-title-grids">
            <div class="headerhny-left">
              <h3 class="hny-title" style="padding-bottom: 12px">PHIM XEM NHIỀU</h3>
            </div>
          </div>
          <div class="w3l-populohny-grids">
            <c:forEach items="${publishedMovies}" var="m">
              <div class="item vhny-grid">
                <div class="box16 mb-0" >
                  <figure>
                    <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 310px; width: 280px">
                  </figure>
                  <a href="movieDetail?movieID=${m.movieID}" data-toggle="modal">
                    <div class="box-content">
                      <h3 class="title" style="font-size: medium">${m.movieName}</h3>
                      <h4> <span class="post"><span class="fa fa-calendar-days"> </span> ${m.releaseDate}</span>
                        <span class="post fa fa-heart text-right">  ${m.movieScore}</span>
                      </h4>
                    </div>
                  </a>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
    </section>

    <%-- Section chứa toàn bộ phim của rạp --%>
    <section class="w3l-albums py-5" id="projects" style="padding-top: 0px !important; ">
      <div class="container py-lg-4">
        <div class="row">
          <div class="col-lg-12 mx-auto">
            <!--Horizontal Tab-->
            <div id="parentHorizontalTab">
              <%-- todo : thêm các Btn để filter movie theo các tiêu chí - áp dụng ajax --%>
              <%-- các option cho user thực hiện filter trên movie --%>
                <select class="resp-tabs-list hor_1" style="padding: 5px 30px; text-align: left">
                  <option value="recent" style="text-align: left">Phim phổ biến</option>
                  <option value="popular" style="text-align: left">Phim mới nhất</option>
                  <option value="popular" style="text-align: left">Phim sắp chiếu</option>
                </select>
                <select id="categorySelect" class="resp-tabs-list hor_1"  onchange="updatePlaceholder(); updateFilmByCategory();" style="padding : 5px 25px; text-align: left">
                  <option value="all" selected style="text-align: left">Thể loại</option>
                  <c:forEach var="c" items="${movieCategoryList}">
                    <option value="${c}" style="text-align: left">${c}</option>
                  </c:forEach>
                </select>
                <select id="countrySelect" class="resp-tabs-list hor_1" onchange="updatePlaceholder(); updateFilmByCountry()" style="padding : 5px 30px">
                  <option value="all" selected style="text-align: left">Quốc gia</option>
                  <c:forEach var="c" items="${movieCountryList}">
                    <option value="${c}" style="text-align: left">${c}</option>
                  </c:forEach>
                </select>
              <form action="movie-servlet" style="display: flex; align-items: center; margin: 0px 0px; ">
                <input type="hidden" name="action" value="findByName"/>
                <input type="text" name="txtSearch" placeholder="Nhập từ khóa tìm kiếm..."
                        style="flex: 1; padding: 6px; font-size: 16px; border: 1px solid #ccc; border-radius: 6px 0 0 6px; outline: none;"/>
                <button type="submit" style="margin-left: 20px; padding: 6px 20px; font-size: 16px; font-weight: bold; color: #fff; background-color: #007bff; border: none; border-radius: 0 6px 6px 0; cursor: pointer;">
                  Tìm kiếm
                </button>
              </form>

                <div class="resp-tabs-container hor_1">
                <div class="albums-content">
                  <div class="row">
                    <c:choose>
                      <c:when test="${not empty moviesByName}">
                        <!-- Nếu danh sách moviesByName không rỗng -->
                        <c:forEach items="${moviesByName}" var="n">
                          <div class="col-lg-3 new-relise-gd mt-lg-0 mt-0">
                            <div class="slider-info" >
                              <div class="img-circle" >
                                <a href="${n.linkMovieTrailer}" target="_blank">
                                  <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${n.linkMovieImage}" alt="" style="height: 200px; border-radius: unset; width: 300px">
                                  <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                                </a>
                              </div>
                              <div class="message" >
                                <a class="author-book-title" href="movieDetail?movieID=${n.movieID}" style="padding-bottom: 25px">${n.movieName}</a>
                                <p style="font-weight: lighter">${n.director} - ${n.country}</p>
                                <h4> <span class="post"><span class="fa fa-calendar-days"> </span>  ${n.releaseDate}</span>
                                  <span class="post fa fa-heart text-right">  ${n.movieScore}</span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <!-- Nếu danh sách moviesByName rỗng -->
                        <c:forEach items="${allMovies}" var="m">
                          <div class="col-lg-3 new-relise-gd mt-lg-0 mt-0">
                            <div class="slider-info" >
                              <div class="img-circle" >
                                <a href="${m.linkMovieTrailer}" target="_blank">
                                  <img class="img-fluid" src="../Movie_Ticket_Website/assets/movie-image/${m.linkMovieImage}" alt="" style="height: 200px; border-radius: unset; width: 300px">
                                  <div class="overlay-icon"><span class="fa fa-play video-icon" aria-hidden="true"></span></div>
                                </a>
                              </div>
                              <div class="message" >
                                <a class="author-book-title" href="movieDetail?movieID=${m.movieID}" style="padding-bottom: 25px">${m.movieName}</a>
                                <p style="font-weight: lighter">${m.director} - ${m.country}</p>
                                <h4> <span class="post"><span class="fa fa-calendar-days"> </span>  ${m.releaseDate}</span>
                                  <span class="post fa fa-heart text-right">  ${m.movieScore}</span>
                                </h4>
                              </div>
                            </div>
                          </div>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
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
    <script>
      function updatePlaceholder() {
        const select = document.getElementById("categorySelect");
        const country_select = document.getElementById("countrySelect");
        const selectedValue = select.value;
        const selectedCountryValue = country_select.value;
        if (selectedValue === "all") {
          select.options[0].text = "Thể loại";
        } else {
          select.options[0].text = "Tất cả";
        }
        if (selectedCountryValue === "all") {
          country_select.options[0].text = "Quốc gia";
        } else {
          country_select.options[0].text = "Tất cả";
        }

      }
      function updateFilmByCategory() {
        const select = document.getElementById("categorySelect");
        if (select !== "all") {
          window.location.href = "movie-servlet?action=findByCategory&category=" + select.value;
        }
      }
      function updateFilmByCountry() {
        const select = document.getElementById("countrySelect");
        if (select !== "all") {
          window.location.href = "movie-servlet?action=findByCountry&country=" + select.value;
        }
      }
    </script>
</body>
</html>
