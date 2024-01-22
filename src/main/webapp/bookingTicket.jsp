<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <title>Đặt vé : ${movieName}</title>
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
                            <li class="active" id="step1">Chọn rạp, đặt ngày </li>
                            <li id="step2" class="not_active">Chọn ghế</li>
                            <li id="step3" class="not_active">Thanh toán</li>
                            <li id="step4" class="not_active">Vé điện tử PZO_E-Ticket</li>
                        </ul>
                        <br>
                        <fieldset>
                            <div class="row">
                                <div class="col-5" >
                                    <div style="margin-top: 5px; border: 1px groove; border: 10px; padding: 5px"><h3>${movieName}</h3></div>
                                </div>
                                <div class="col-4" >
                                    <form action="bookingTicket-servlet" method="get">
                                        <input type="hidden" name="action" value="showShowTimeForCinema">
                                        <input type="hidden" name="movieID" value="${movieID}">
                                        <input style="border-radius: 10px; margin-bottom: 20px; width: 630px" type="text" name="cinemaName" placeholder="Chọn rạp chiếu phim bạn muốn đặt vé" list="cinemaListGetByMovie">
                                        <datalist id="cinemaListGetByMovie">
                                            <c:forEach items="${cinemaListGetByMovie}" var="c">
                                                <option>${c}</option>
                                            </c:forEach>
                                        </datalist>
                                    </form>
                                </div>
                            </div>

                            <div id="screen-select-div">
                                <c:if test="${cinemaName != null}">
                                    <h2 style="font-size: 20px; margin-bottom: 20px" >Rạp : <i class="fa fa-film"></i>_${cinemaName}__${cinemaLocation}</h2>
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
                                        <div class="screens">Tên phòng chiếu : <%= key %></div>
                                        <div class="time-btn">
                                            <c:forEach items="<%= value %>" var="time">
                                                <a href="bookingTicket-servlet?action=changeToSeatBooking&time=${time}&cinemaRoomName=<%=key%>&date=${curDate}&cinemaName=${cinemaName}&movieID=${movieID}" style="border-radius: 5px; background-color: #0f6674; padding: 10px ;color: white;margin: 10px 5px">${time}</a>
                                            </c:forEach>
                                        </div>
                                    <%    } %>
                                    <% } %>
                                    </li>
                                </ul>
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
</body>
</html>
