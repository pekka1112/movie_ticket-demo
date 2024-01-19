<%--
  Created by IntelliJ IDEA.
  User: rrioz
  Date: 1/15/2024
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Đặt vé cho : </title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/e-ticket.css">
    <link rel="stylesheet" href="assets/css/progress.css">
    <link rel="stylesheet" href="assets/css/ticket-booking.css">
    <link rel="stylesheet" href="assets/css/payment.css">
    <link rel="stylesheet" href="https://npmcdn.com/flickity@2/dist/flickity.css">
    <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">
</head>
<body>
    <%-- Header Section--%>
    <jsp:include page="layout-view/header.jsp"></jsp:include>

    <div class="container" id="progress-container-id">
        <div class="row">
            <div class="col">
                <div class="px-0 pt-4 pb-0 mt-3 mb-3">
                    <form id="form">
                        <ul id="progressbar" class="progressbar-class">
                            <li class="active" id="step1">Show timing selection</li>
                            <li id="step2" class="not_active">Seat Selection</li>
                            <li id="step3" class="not_active">Payment</li>
                            <li id="step4" class="not_active">E-Ticket</li>
                        </ul>
                        <br>

                        <fieldset>
                            <div id="screen-select-div">
                                <h2>Show time Selection</h2>
                                <div class="carousel carousel-nav" data-flickity='{"contain": true, "pageDots": false }'>
                                    <div class="carousel-cell" id="1" onclick="myFunction(1)">
                                        <div class="date-numeric">13</div>
                                        <div class="date-day">Today</div>
                                    </div>

                                    <div class="carousel-cell" id="2" onclick="myFunction(2)">
                                        <div class="date-numeric">14</div>
                                        <div class="date-day">Tomorrow</div>
                                    </div>
                                    <div class="carousel-cell" id="3" onclick="myFunction(3)">
                                        <div class="date-numeric">15</div>
                                        <div class="date-day">Monday</div>
                                    </div>
                                    <div class="carousel-cell" id="4" onclick="myFunction(4)">
                                        <div class="date-numeric">16</div>
                                        <div class="date-day">Tuesday</div>
                                    </div>
                                    <div class="carousel-cell" id="5" onclick="myFunction(5)">
                                        <div class="date-numeric">17</div>
                                        <div class="date-day">Wednesday</div>
                                    </div>
                                    <div class="carousel-cell" id="6" onclick="myFunction(6)">
                                        <div class="date-numeric">18</div>
                                        <div class="date-day">Thursday</div>
                                    </div>
                                    <div class="carousel-cell" id="7" onclick="myFunction(7)">
                                        <div class="date-numeric">19</div>
                                        <div class="date-day">Friday</div>
                                    </div>
                                </div>
                                <ul class="time-ul">
                                    <li class="time-li">
                                        <div class="screens">
                                            Screen 1
                                        </div>
                                        <div class="time-btn">
                                            <button class="screen-time" onclick="timeFunction()">
                                                1:05 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                4:00 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                9:00 PM
                                            </button>
                                        </div>
                                    </li>
                                    <li class="time-li">
                                        <div class="screens">
                                            Screen 2
                                        </div>
                                        <div class="time-btn">
                                            <button class="screen-time" onclick="timeFunction()">
                                                3:00 PM
                                            </button>
                                        </div>
                                    </li>
                                    <li class="time-li">
                                        <div class="screens">
                                            Screen 3
                                        </div>
                                        <div class="time-btn">
                                            <button class="screen-time" onclick="timeFunction()">
                                                9:05 AM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                10:00 PM
                                            </button>
                                        </div>
                                    </li>
                                    <li class="time-li">
                                        <div class="screens">
                                            Screen 4
                                        </div>
                                        <div class="time-btn">
                                            <button class="screen-time" onclick="timeFunction()">
                                                9:05 AM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                11:00 AM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                3:00 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                7:00 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                10:00 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                11:00 PM
                                            </button>
                                        </div>
                                    </li>
                                    <li class="time-li">
                                        <div class="screens">
                                            Screen 5
                                        </div>
                                        <div class="time-btn">
                                            <button class="screen-time" onclick="timeFunction()">
                                                9:05 AM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                12:00 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                1:00 PM
                                            </button>
                                            <button class="screen-time" onclick="timeFunction()">
                                                3:00 PM
                                            </button>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <input id="screen-next-btn" type="button" name="next-step" class="next-step" value="Continue Booking"
                                   disabled />
                        </fieldset>

                        <fieldset>
                            <div>
                                <iframe id="seat-sel-iframe"
                                        style="  box-shadow: 0 14px 12px 0 var(--theme-border), 0 10px 50px 0 var(--theme-border); width: 800px; height: 550px; display: block; margin-left: auto; margin-right: auto;"
                                        src="seatSelection.jsp">

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
