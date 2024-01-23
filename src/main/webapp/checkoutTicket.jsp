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
                        <li id="step3" class="active">Thanh toán</li>
                        <li id="step4" class="not_active">Vé điện tử PZO_E-Ticket</li>
                    </ul>
                    <br>
                    <fieldset>
                        <main>
                        <div class="py-5 text-center" style="padding-top: 0px !important; padding-bottom: 30px !important; ">
                            <h2>Xác nhận thanh toán</h2>
                        </div>
                        <div class="row g-5">
                            <div class="col-md-5 col-lg-4 order-md-last">
                                <h4 class="d-flex justify-content-between align-items-center mb-3">
                                    <span class="text-primary">Vé của bạn</span>
                                    <span class="badge bg-primary rounded-pill"></span>
                                </h4>
                                <ul class="list-group mb-3">
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0" style="font-size: smaller">Vé  ${movieName}</h6>
                                            <small class="text-muted">${cinemaName}</small>
                                        </div>
                                        <span class="text-muted">50.000</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0" style="font-size: smaller">Phòng : ${cinemaRoomName}</h6>
                                            <small class="text-muted">Ghế ${seatName}</small>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between lh-sm">
                                        <div>
                                            <h6 class="my-0" style="font-size: smaller">Thời gian ${curDate} - ${time}</h6>
                                            <small class="text-muted">Ghế ${seatName}</small>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between bg-light">
                                        <div class="text-success">
                                            <h6 class="my-0">Giảm giá</h6>
                                            <small>Không</small>
                                        </div>
                                        <span class="text-success"></span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <span>Tổng</span>
                                        <strong>50,000 VNĐ</strong>
                                    </li>
                                </ul>

                                <form class="card p-2">
                                    <div class="input-group">
<%--                                        <input type="text" class="form-control" placeholder="Mã giảm giá" style="width: 10px !important;">--%>
                                            <a href="bookingTicket-servlet?action=changeToETicket&time=${time}&cinemaRoomName=${cinemaRoomName}&date=${curDate}&cinemaName=${cinemaName}&movieID=${movieID}&seatName=${c.seatName}">Thanh toán</a>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-7 col-lg-8">
                                <form class="needs-validation" novalidate>
                                    <div class="row g-3">
                                        <div class="col-sm-6">
                                            <label for="firstName" class="form-label">Tên đầy dủ</label>
                                            <input type="text" class="form-control" id="firstName" placeholder="" value="<%= customer.getFullName() %>" required>
                                            <div class="invalid-feedback">
                                                Bắt buộc điền thông tin
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <label for="lastName" class="form-label">Ngày sinh</label>
                                            <input type="text" class="form-control" id="lastName" placeholder="" value="<%= customer.getDob() %>" required>
                                            <div class="invalid-feedback">
                                                Bắt buộc điền thông tin
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="email" class="form-label">Email <span class="text-muted">(Bắt buộc)</span></label>
                                            <input type="email" class="form-control" id="email" placeholder="you@example.com" value="<%= user.getEmail() %>">
                                            <div class="invalid-feedback">
                                                Please enter a valid email address for shipping updates.
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="address" class="form-label">Địa chỉ</label>
                                            <input type="text" class="form-control" id="address" placeholder="Plaza street" required value="<%= customer.getAddress() %>">
                                            <div class="invalid-feedback">
                                                Please enter your shipping address.
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="address2" class="form-label">Số điện thoại <span class="text-muted">(Optional)</span></label>
                                            <input type="text" class="form-control" id="address2" placeholder="Apartment or suite" value="<%= customer.getPhoneNumber() %>">
                                        </div>

<%--                                        <div class="col-md-5">--%>
<%--                                            <label for="country" class="form-label">Country</label>--%>
<%--                                            <select class="form-select" id="country" required>--%>
<%--                                                <option value="">Choose...</option>--%>
<%--                                                <option>India</option>--%>
<%--                                            </select>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Please select a valid country.--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="col-md-4">--%>
<%--                                            <label for="state" class="form-label">State</label>--%>
<%--                                            <select class="form-select" id="state" required>--%>
<%--                                                <option value="">Choose...</option>--%>
<%--                                                <option>Delhi</option>--%>
<%--                                            </select>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Please provide a valid state.--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="col-md-3">--%>
<%--                                            <label for="zip" class="form-label">Zip</label>--%>
<%--                                            <input type="text" class="form-control" id="zip" placeholder="" required>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Zip code required.--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <hr class="my-4">--%>

<%--                                    <div class="form-check">--%>
<%--                                        <input type="checkbox" class="form-check-input" id="same-address">--%>
<%--                                        <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>--%>
<%--                                    </div>--%>

<%--                                    <div class="form-check">--%>
<%--                                        <input type="checkbox" class="form-check-input" id="save-info">--%>
<%--                                        <label class="form-check-label" for="save-info">Save this information for next time</label>--%>
<%--                                    </div>--%>

                                    <hr class="my-4">

<%--                                    <h4 class="mb-3">Phương thức thanh toán</h4>--%>

<%--                                    <div class="my-3">--%>
<%--                                        <c:forEach items="${payments}" var="p">--%>
<%--                                            <div class="form-check">--%>
<%--                                                <input id="${p.paymentTypeName}" name="paymentMethod" type="radio" class="form-check-input" checked required>--%>
<%--                                                <label class="form-check-label" for="${p.paymentTypeName}">${p.paymentTypeName}</label>--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
<%--                                    </div>--%>

<%--                                    <div class="row gy-3">--%>
<%--                                        <div class="col-md-6">--%>
<%--                                            <label for="cc-name" class="form-label">Name on card</label>--%>
<%--                                            <input type="text" class="form-control" id="cc-name" placeholder="" required>--%>
<%--                                            <small class="text-muted">Full name as displayed on card</small>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Name on card is required--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="col-md-6">--%>
<%--                                            <label for="cc-number" class="form-label">Credit card number</label>--%>
<%--                                            <input type="text" class="form-control" id="cc-number" placeholder="" required>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Credit card number is required--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="col-md-3">--%>
<%--                                            <label for="cc-expiration" class="form-label">Expiration</label>--%>
<%--                                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Expiration date required--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="col-md-3">--%>
<%--                                            <label for="cc-cvv" class="form-label">CVV</label>--%>
<%--                                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>--%>
<%--                                            <div class="invalid-feedback">--%>
<%--                                                Security code required--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <hr class="my-4">--%>

<%--                                    <button class="w-100 btn btn-danger btn-lg" type="submit">Continue to checkout</button>--%>
                                </form>
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
