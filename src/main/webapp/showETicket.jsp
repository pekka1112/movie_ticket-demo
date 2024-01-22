<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="model.User" %>
<%@ page import="model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    User user = (User) session.getAttribute("user");
    Customer customer = (Customer) session.getAttribute("customer");
    boolean isLogined = user == null ? false : true;
%>
<html>
<head>
    <title>Đặt vé : ${movieName}</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/e-ticket.css">
    <link rel="stylesheet" href="assets/css/progress.css">
    <link rel="stylesheet" href="assets/css/ticket-booking.css">
    <link rel="stylesheet" href="assets/css/payment.css">
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css' rel='stylesheet'>
    <link href='' rel='stylesheet'>
    <style>h2 {
        font-size: 40px;
        background: linear-gradient(to left, #660066 0%, #ff3300 100%);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }</style>
    <script type='text/javascript' src=''></script>
    <script type='text/javascript' src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href="https://npmcdn.com/flickity@2/dist/flickity.css">
    <link href="https://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700" rel="stylesheet">

</head>
<body oncontextmenu='return false' class='snippet-body' >
<%-- Header Section--%>
<jsp:include page="layout-view/header.jsp"></jsp:include>

<div class="container" id="progress-container-id">
    <div class="row">
        <div class="col">
            <div class="px-0 pt-4 pb-0 mt-3 mb-3" style="margin-top: 0px !important;">
                <form id="form" style="margin-top: 0px">
                    <ul id="progressbar" class="progressbar-class">
                        <li class="not_active" id="step1">Chọn rạp, đặt ngày </li>
                        <li id="step2" class="not_active">Chọn ghế</li>
                        <li id="step3" class="not_active">Thanh toán</li>
                        <li id="step4" class="active">Vé điện tử PZO_E-Ticket</li>
                    </ul>
                    <br>
                    <fieldset>
                        <main>
                            <div class="py-5 text-center" style="padding-top: 0px !important; padding-bottom: 30px !important; ">
                            </div>
                            <div class="row g-5">
                                <div class="col-md-5 col-lg-4 order-md-last">
                                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                                        <span class="text-primary">Thông tin vé</span>
                                        <span class="badge bg-primary rounded-pill"></span>
                                    </h4>
                                    <ul class="list-group mb-3">
                                        <li class="list-group-item d-flex justify-content-between lh-sm">
                                            <div style="text-align: left">
                                                <h6 class="my-0" style="font-size: smaller">Vé  ${movieName}</h6>
                                                <small class="text-muted">${cinemaName}</small>
                                                <hr>
                                                <h6 class="my-0" style="font-size: smaller">Phòng : ${cinemaRoomName}</h6>
                                                <small class="text-muted">Ghế ${seatName}</small>
                                                <hr>
                                                <h6 class="my-0" style="font-size: smaller">Thời gian ${curDate} - ${time}</h6>
                                                <small class="text-muted">Ghế ${seatName}</small>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between">
                                            <span>Giá</span>
                                            <strong>50,000 VNĐ</strong>
                                        </li>
                                    </ul>
                                    <form class="card p-2">
                                        <div class="input-group">
                                            <button type="submit" class="btn btn-danger" >Tiếp tục đặt</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-7 col-lg-8" style="margin-top: 0px">
                                    <div class="ticket-body">
                                        <div class="ticket">
                                            <div class="holes-top"></div>
                                            <div class="title">
                                                <p class="movie-title">PZO-Ticket Entertainment</p>
                                                <p class="cinema">${movieName}</p>
                                            </div>
                                            <div class="poster">
                                                <img src="../Movie_Ticket_Website/assets/movie-image/${movieImage}"  alt="Movie: Only God Forgives" style="height: 250px;width: 400px"/>
                                            </div>
                                            <div class="info">
                                                <table class="info-table ticket-table">
                                                    <tr>
                                                        <th>RẠP</th>
                                                        <th>MÀN HÌNH</th>
                                                        <th>GHẾ</th>
                                                    </tr>
                                                    <tr>
                                                        <td class="bigger">${cinemaName}</td>
                                                        <td class="bigger">${cinemaRoomName}</td>
                                                        <td class="bigger">${seatName}</td>
                                                    </tr>
                                                </table>
                                                <table class="info-table ticket-table">
                                                    <tr>
                                                        <th>NGÀY</th>
                                                        <th>GIỜ</th>
                                                        <th>GIÁ</th>
                                                    </tr>
                                                    <tr>
                                                        <td>${curDate}</td>
                                                        <td>${time}</td>
                                                        <td>50,000VNĐ</td>
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
                                </div>
                            </div>
                        </main>
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
<script type="text/javascript" src="assets/js/seatSelectionJS/jquery-1.11.0.min.js"></script>
<%--<script type="text/javascript" src="assets/js/seatBooking.js"></script>--%>
<script type="text/javascript" src="assets/js/seatSelectionJS/jquery.seat-charts.min.js"></script>
</body>
</html>
