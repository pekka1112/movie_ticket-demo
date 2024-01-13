<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 12/28/2023
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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