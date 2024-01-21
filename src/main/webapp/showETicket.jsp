<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Đặt vé</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
    <link rel="stylesheet" href="assets/css/e-ticket.css">
    <link rel="stylesheet" href="assets/css/progress.css">
    <link rel="stylesheet" href="assets/css/ticket-booking.css">
    <link rel="stylesheet" href="assets/css/payment.css">
    <link rel="stylesheet" href="assets/css/seat.css">
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
                <form id="form" style="margin-top: 0px">
                    <ul id="progressbar" class="progressbar-class">
                        <li class="not_active" id="step1">Chọn rạp, đặt ngày </li>
                        <li id="step2" class="active">Chọn ghế</li>
                        <li id="step3" class="not_active">Thanh toán</li>
                        <li id="step4" class="not_active">Vé điện tử PZO_E-Ticket</li>
                    </ul>
                    <br>
                    <fieldset>
                        <div class="demo">
                            <div id="seat-map">
                                <div class="front">Màn hình</div>
                            </div>
                            <div class="booking-details" style="width: 600px; height: 400px; text-align: left">
                                <p>Tên phim: <span>${movieName}</span></p>
                                <p>Rạp : <span>${cinemaName} - ${cinemaLocation}</span></p>
                                <p>Phòng chiếu : <span> ${cinemaRoomName}</span></p>
                                <p>Thời gian: <span>${curDate} - ${time}</span></p>
                                <p>Số vé mua : <span id="counter">1</span></p>
                                <p>Giá vé (Đồng giá 50k/1vé): <b><span id="total">50.000</span></b></p>
                                <p>Chọn ghế còn trống: </p>
                                <ul id="selected-seats">
                                    <c:forEach var="c" items="${seats}">
                                        <li style="border-radius: 5px; padding: 0px;border: 1px groove black">
                                            <a href="bookingTicket-servlet?action=changeToCheckout&time=${time}&cinemaRoomName=${cinemaRoomName}&date=${curDate}&cinemaName=${cinemaName}&movieID=${movieID}&seats=${c.seatName}">${c.seatName }</a>
                                        </li>
                                    </c:forEach>
                                </ul>
<%--                                <form action="bookingTicket-servlet" method="get">--%>
<%--                                    <input type="hidden" name="action" value="showShowTimeForCinema">--%>
<%--                                    <input type="hidden" name="movieID" value="${movieID}">--%>
<%--                                    <input type="hidden" name="seatName" value="${seatName}">--%>
<%--                                    <button type="submit"  style="border-radius: 5px; padding: 10px;border: 1px groove black ">MUA</button>--%>
<%--                                </form>--%>
                            </div>
                            <div style="clear:both"></div>
                        </div>
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
<script>
    var price = 50000; //price
    $(document).ready(function() {
        var $cart = $('#selected-seats'), //Sitting Area
            $counter = $('#counter'), //Votes
            $total = $('#total'); //Total money

        var sc = $('#seat-map').seatCharts({
            map: [  //Seating chart
                'aa__aa__aa',
                'aaaaaaaaaa',
                '__________',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aaaaaaaaaa',
                'aa__aa__aa'
            ],
            naming : {
                top : false,
                getLabel : function (character, row, column) {
                    return column;
                }
            },
            legend : { //Definition legend
                node : $('#legend'),
                items : [
                    [ 'a', 'available',   'Trống' ],
                    [ 'a', 'unavailable', 'Đã đặt']
                ]
            },
            click: function () { //Click event
                if (this.status() == 'available') { //optional seat
                    $('<li id="seatName">R'+(this.settings.row+1)+'C'+this.settings.label+'</li>')
                        .attr('id', 'cart-item-'+this.settings.id)
                        .data('seatId', this.settings.id)
                        .appendTo($cart);
                    $counter.text(sc.find('selected').length+1);
                    $total.text(recalculateTotal(sc)+price);

                    // var element = document.getElementById("seatName");
                    // alert(element.outerHTML)
                    <c:set var="seatName" value=""></c:set>
                    return 'selected';
                } else if (this.status() == 'selected') { //Checked
                    //Update Number
                    $counter.text(sc.find('selected').length-1);
                    //update totalnum
                    $total.text(recalculateTotal(sc)-price);

                    //Delete reservation
                    $('#cart-item-'+this.settings.id).remove();
                    //optional
                    return 'available';
                } else if (this.status() == 'unavailable') { //sold
                    return 'unavailable';
                } else {
                    return this.style();
                }
            }
        });
        //sold seat
        sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');

    });
    //sum total money
    function recalculateTotal(sc) {
        var total = 0;
        sc.find('selected').each(function () {
            total += price;
        });

        return total;
    }
</script>
</body>
</html>
