
<%--
  Created by IntelliJ IDEA.
  User: QUYEN
  Date: 02/12/2023
  Time: 14:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="icon" type="image/x-icon" href="assets/images/x-icon.png">
<head>
    <title>PONZO - Đăng kí thành viên</title>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="assets/css/login-page.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body >
    <input type="hidden" id="status" value="<%= request.getAttribute("login-status")%>">
    <div class="form">
        <div class="form-box login">
            <h2>PONZER</h2>
            <form action="login-servlet" method="get">
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail-open"></ion-icon></span>
                    <input type="email" name="email" required>
                    <label>Địa chỉ Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" name="password" required>
                    <label>Mật khẩu</label>
                </div>
                <div class="remenber-forgot">
                    <label><input type="checkbox">Ghi nhớ tài khoản</label>
                    <a href="#">Quên mật khẩu ?</a>
                </div>
                <button type="submit" class="btn">Đăng nhập</button>
                <div class="login-register">
                    <p>Chưa có tài khoản ?
                        <a href="register.jsp" class="register-link">Đăng kí ngay !</a>
                    </p>
                </div>
                <c:if test="${requestScope['login-status'] == 'failed'}">
                    <div class="error-message">
                        <p>Tài khoản sai, đăng nhập thất bại !</p>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</body>
</html>
