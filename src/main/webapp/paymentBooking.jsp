<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Đặt vé</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/e-ticket.css">
    <link rel="stylesheet" href="assets/css/progress.css">
    <link rel="stylesheet" href="assets/css/ticket-booking.css">
    <link rel="stylesheet" href="assets/css/payment.css">
    <link rel="stylesheet" href="https://npmcdn.com/flickity@2/dist/flickity.css">
    <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">

</head>
<body >
    <%-- Header Section--%>
    <jsp:include page="layout-view/header.jsp"></jsp:include>

    <div class="container" id="progress-container-id">
        <div class="row">
            <div class="col">
                <div class="px-0 pt-4 pb-0 mt-3 mb-3" style="margin-top: 0px !important;">
                    <form id="form">
                        <ul id="progressbar" class="progressbar-class">
                            <li class="not_active" id="step1">Chọn rạp, đặt ngày </li>
                            <li id="step2" class="active">Chọn ghế</li>
                            <li id="step3" class="not_active">Thanh toán</li>
                            <li id="step4" class="not_active">Vé điện tử PZO_E-Ticket</li>
                        </ul>
                        <br>
                        <fieldset>
                            <form action="bookingTicket-servlet" method="get">
                                <input type="hidden" name="action" value="showShowTimeForCinema">
                                <input type="hidden" name="movieID" value="${movieID}">
                                <input style="border-radius: 10px; margin-bottom: 10px; width: 900px" type="text" name="cinemaName" placeholder="Chọn rạp chiếu phim bạn muốn đặt vé" list="cinemaListGetByMovie">
                                <datalist id="cinemaListGetByMovie">
                                    <c:forEach items="${cinemaListGetByMovie}" var="c">
                                        <option>${c}</option>
                                    </c:forEach>
                                </datalist>
                            </form>
                            <div id="screen-select-div">
                                <c:if test="${cinemaName != null}">
                                    <h2 style="font-size: 20px; margin-bottom: 7px" >Rạp : <i class="fa fa-film"></i>_${cinemaName}__${cinemaLocation}</h2>
                                </c:if>
                                <div class="carousel carousel-nav" data-flickity='{"contain": true, "pageDots": false }'>
                                    <jsp:useBean id="date" class="beans.DateBean" scope="session"/>
                                    <a class="carousel-cell" id="1" onclick="myFunction(1)" href="bookingTicket-servlet?action=showTimeInThisDate&date=${date.formatDate(date.currentDate)}&cinemaName=${cinemaName}&movieID=${movieID}">
                                        <div class="date-numeric"><fmt:formatDate value="${date.currentDate}" pattern="dd/MM"/></div>
                                        <div class="date-day">Hôm nay</div>
                                        <c:forEach items="${showtimesDate}" var="std">
                                            <c:if test="${date.formatDate(date.currentDate).equals(std)}">
                                                <div class="date-day">(Có thể đặt)</div>
                                            </c:if>
                                        </c:forEach>
                                    </a>
                                    <c:forEach var="i" begin="2" end="7" >
                                        <%-- hien thi 6 ngay bat dau tu ngay chieu phim dang duoc chon --%>
                                        <a class="carousel-cell" id="${i}" onclick="myFunction(${i})" href="bookingTicket-servlet?action=showTimeInThisDate&date=${date.formatDate(date.addDate(i-1))}&cinemaName=${cinemaName}&movieID=${movieID}">
                                            <div class="date-numeric"><fmt:formatDate value="${date.addDate(i-1)}" pattern="dd/MM"/></div>
                                            <div class="date-day"></div>
                                            <c:forEach items="${showtimesDate}" var="std">
                                                <c:if test="${date.formatDate(date.addDate(i-1)).equals(std)}">
                                                    <div class="date-day">(Có thể đặt)</div>
                                                </c:if>
                                            </c:forEach>
                                        </a>
                                    </c:forEach>
                                </div>
                                <ul class="time-ul">
                                    <li class="time-li">
                                    <%
                                        Map<String, List<String>> map = (Map<String, List<String>>) request.getAttribute("mapRoomAndTime");
                                        if(map != null) {
                                            for (Map.Entry<String, List<String>> entry : map.entrySet()) {
                                              String key = entry.getKey();
                                              List<String> value = entry.getValue() ;
                                    %>
                                        <div class="screens"><%= key %></div>
                                        <div class="time-btn">
                                            <c:forEach items="<%= value %>" var="time">
                                                <button class="screen-time" onclick="timeFunction()">${time}</button>
                                            </c:forEach>
                                        </div>
                                    <%    } %>
                                    <% } %>
                                    </li>
                                </ul>
                            </div>
                            <input id="screen-next-btn" type="button" name="next-step" class="next-step" value="Continue Booking" disabled />
                        </fieldset>

                        <fieldset>
                            <div>
                                <iframe id="seat-sel-iframe" src="seatSelection.jsp"
                                        style=" box-shadow: 0 14px 12px 0 var(--theme-border), 0 10px 50px 0 var(--theme-border); width: 800px; height: 550px; display: block; margin-left: auto; margin-right: auto;">
                                </iframe>
                            </div>
                            <br>
                            <input type="button" name="next-step" class="next-step" value="Proceed to Payment" />
                            <input type="button" name="previous-step" class="previous-step" value="Back" />
                        </fieldset>

                        <fieldset>
                            <!-- Payment Page -->
                            <div id="payment_div">
                                <div class="payment-row">
                                    <div class="col-75">
                                        <div class="payment-container">
                                            <div class="payment-row">
                                                <div class="col-50">
                                                    <h3 id="payment-h3">Payment</h3>
                                                    <div class="payment-row payment">
                                                        <div class="col-50 payment">
                                                            <label for="card" class="method card">
                                                                <div class="icon-container">
                                                                    <i class="fa fa-cc-visa" style="color: navy"></i>
                                                                    <i class="fa fa-cc-amex" style="color: blue"></i>
                                                                    <i class="fa fa-cc-mastercard" style="color: red"></i>
                                                                    <i class="fa fa-cc-discover" style="color: orange"></i>
                                                                </div>
                                                                <div class="radio-input">
                                                                    <input type="radio" id="card" />
                                                                    Pay RS.200.00 with credit card
                                                                </div>
                                                            </label>
                                                        </div>
                                                        <div class="col-50 payment">
                                                            <label for="paypal" class="method paypal">
                                                                <div class="icon-container">
                                                                    <i class="fa fa-paypal" style="color: navy"></i>
                                                                </div>
                                                                <div class="radio-input">
                                                                    <input id="paypal" type="radio" checked>
                                                                    Pay $30.00 with PayPal
                                                                </div>
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="payment-row">
                                                        <div class="col-50">
                                                            <label for="cname">Cardholder's Name</label>
                                                            <input type="text" id="cname" name="cardname" placeholder="Firstname Lastname" required />
                                                        </div>
                                                        <div class="col-50">
                                                            <label for="ccnum">Credit card number</label>
                                                            <input type="text" id="ccnum" name="cardnumber" placeholder="xxxx-xxxx-xxxx-xxxx"
                                                                   required />
                                                        </div>
                                                    </div>
                                                    <div class="payment-row">
                                                        <div class="col-50">
                                                            <label for="expmonth">Exp Month</label>
                                                            <input type="text" id="expmonth" name="expmonth" placeholder="September" required />
                                                        </div>
                                                        <div class="col-50">
                                                            <div class="payment-row">
                                                                <div class="col-50">
                                                                    <label for="expyear">Exp Year</label>
                                                                    <input type="text" id="expyear" name="expyear" placeholder="yyyy" required />
                                                                </div>
                                                                <div class="col-50">
                                                                    <label for="cvv">CVV</label>
                                                                    <input type="text" id="cvv" name="cvv" placeholder="xxx" required />
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
                            <input type="button" name="next-step" class="next-step pay-btn" value="Confirm Payment" />
                            <input type="button" name="previous-step" class="cancel-pay-btn" value="Cancel Payment"
                                   onclick="location.href='index.html';" />
                        </fieldset>

                        <fieldset>
                            <h2>E-Ticket</h2>
                            <div class="ticket-body">
                                <div class="ticket">
                                    <div class="holes-top"></div>
                                    <div class="title">
                                        <p class="cinema">MyShowz Entertainment</p>
                                        <p class="movie-title">Movie Name</p>
                                    </div>
                                    <div class="poster">
                                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/25240/only-god-forgives.jpg"
                                             alt="Movie: Only God Forgives" />
                                    </div>
                                    <div class="info">
                                        <table class="info-table ticket-table">
                                            <tr>
                                                <th>SCREEN</th>
                                                <th>ROW</th>
                                                <th>SEAT</th>
                                            </tr>
                                            <tr>
                                                <td class="bigger">18</td>
                                                <td class="bigger">H</td>
                                                <td class="bigger">24</td>
                                            </tr>
                                        </table>
                                        <table class="info-table ticket-table">
                                            <tr>
                                                <th>PRICE</th>
                                                <th>DATE</th>
                                                <th>TIME</th>
                                            </tr>
                                            <tr>
                                                <td>RS.12.00</td>
                                                <td>4/13/21</td>
                                                <td>19:30</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="holes-lower"></div>
                                    <div class="serial">
                                        <table class="barcode ticket-table">
                                            <tr>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                                <td style="background-color:black;"></td>
                                                <td style="background-color:white;"></td>
                                            </tr>
                                        </table>
                                        <table class="numbers ticket-table">
                                            <tr>
                                                <td>9</td>
                                                <td>1</td>
                                                <td>7</td>
                                                <td>3</td>
                                                <td>7</td>
                                                <td>5</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>4</td>
                                                <td>5</td>
                                                <td>4</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>7</td>
                                                <td>8</td>
                                                <td>7</td>
                                                <td>3</td>
                                                <td>4</td>
                                                <td>1</td>
                                                <td>4</td>
                                                <td>5</td>
                                                <td>2</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <input type="button" name="previous-step" class="home-page-btn" value="Browse to Home Page"
                                   onclick="location.href='index.html';" />
                        </fieldset>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <%-- Footer --%>
    <jsp:include page="layout-view/footer.jsp"></jsp:include>
    <jsp:include page="layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="layout-view/js-function-slider.jsp" ></jsp:include>
    <jsp:include page="layout-view/script_bookingTicket.jsp" ></jsp:include>
    <!-- responsive tabs -->
    <script src="assets/js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/easyResponsiveTabs.js"></script>
    <!--/theme-change-->
    <script src="assets/js/theme-change.js"></script>
    <script src="assets/js/owl.carousel.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
