<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="icon" type="image/x-icon" href="assets/images/x-icon.png">
<head>
    <title>PONZO - Đăng kí thành viên</title>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="assets/css/register-page.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="form register">
    <div class="form-box register">
        <h2 style="color: #df0e62">Đăng kí PONZER</h2>
        <form id="form" action="register-servlet" method="get">
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <input type="text" id="userName" name="userName" required>
                <label>Tên người dùng</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="mail-open"></ion-icon></span>
                <input type="email" id="email" name="email" required>
                <label>Tài khoản Email</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" id="password" name="password" required>
                <label>Mật khẩu</label>
                <small>error message</small>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" id="retypePassword" name="retypePassword" required>
                <label>Nhập lại mật khẩu</label>
                <small>error message</small>
            </div>
            <div class="remenber-forgot">
                <label><input type="checkbox">Tôi đồng ý với điều khoản người dùng.</label>
            </div>
            <button type="submit" class="btn">Đăng kí</button>
            <div class="login-register">
                <p>Bạn đã có tài khoản ?
                    <a href="login.jsp" class="login-link">Đăng nhập</a>
                </p>
            </div>
        </form>
    </div>
</div>

</body>
<script src="assets/js/register.js"></script>
</html>
