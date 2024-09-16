
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout-view/head_libraries.jsp"></jsp:include>
<style>
  .link-header {
    font-size: 20px !important;
  }
  .link {
    font-size: 15px !important;
  }
</style>

<footer class="w3l-footer">
  <section class="footer-inner-main">
    <div class="footer-hny-grids py-5" style="padding: 0px 0px ; padding-top: 0rem !important; padding-bottom: 0rem !important; ">
      <div class="container py-lg-4">
        <div class="text-txt">
          <div class="right-side">
            <div class="row footer-about" style="background-image: url('assets/background-img/register-bg.png') !important; height: 200px ; background-repeat: no-repeat; background-size: cover">
            </div>
            <div class="row footer-links" >
              <div class="col-md-3 col-sm-6 sub-two-right mt-5" >
                <h6 class="link-header">Đặt vé xem phim</h6>
                <ul>
                  <li><a class="link" href="#">Trang chủ - Khám phá ngay !</a></li>
                  <li><a class="link" href="movie-servlet?action=init">Tìm kiếm và đặt vé xem phim</a></li>
                  <li><a class="link" href="https://www.youtube.com/@VuaPhimReview1">Review phim</a></li>
                  <li><a class="link" href="https://www.dienanh.net/blog-phim-11">Hỗ trợ khách hàng</a></li>
                </ul>
              </div>
              <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                <h6 class="link-header">Thể loại nổi bật</h6>
                <ul>
                  <li><a class="link" href="#">Hài Việt Nam</a></li>
                  <li><a class="link" href="#">Drama</a></li>
                  <li><a class="link" href="#">Hành động - Phiêu lưu</a></li>
                  <li><a class="link" href="#">Hoạt hình chiếu rạp</a></li>
                  <li><a class="link" href="#">Tâm lí- Kinh dị</a></li>
                  <li><a class="link" href="movie-servlet?action=init">Xem toàn bộ thể loại</a></li>
                </ul>
              </div>
              <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                <h6 class="link-header" >Rạp gần đây</h6>
                <ul>
                  <li><a class="link" href="showtimes-servlet?action=init">TP.HCM</a></li>
                  <li><a class="link" href="showtimes-servlet?action=init">Bình Định</a></li>
                  <li><a class="link" href="showtimes-servlet?action=init">Hà Nội</a></li>
                  <li><a class="link" href="showtimes-servlet?action=init">Thanh Hóa</a></li>
                  <li><a class="link" href="showtimes-servlet?action=init">Hải Phòng</a></li>
                  <li><a class="link" href="showtimes-servlet?action=init">Khu vực khác</a></li>
                </ul>
              </div>
              <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                <h6 class="link-header" >Đăng kí chúng tôi</h6>
                <form action="#" class="subscribe mb-3" method="post">
                  <input type="email" name="email" placeholder="Nhập Email của bạn ở đây" required="">
                  <button><span class="fa fa-envelope-o"></span></button>
                </form>
                <p class="link" >Nhập Email của bạn và bạn sẽ nhận được Thông báo phim mới nhất từ chúng tôi.</p>
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
            <p>&copy; 2024 ponzo-Ticket _ WEBSITE ĐẶT VÉ XEM PHIM HÀNG ĐẦU VIỆT NAM</p>
          </div>

          <ul class="social text-lg-right">
            <li><a href="https://www.facebook.com/"><i class="fa-brands fa-facebook"></i></a>
            </li>
            <li><a href="https://www.youtube.com/"><i class="fa-brands fa-youtube"></i></a>
            </li>
            <li><a href="https://momo.vn/cinema"><i class="fa-solid fa-film"></i></a>
            </li>
            <li><a href="https://www.google.com.vn/"><i class="fa-brands fa-google"></i></a>
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