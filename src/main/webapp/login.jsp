<%--
  Created by IntelliJ IDEA.
  User: QUYEN
  Date: 02/12/2023
  Time: 14:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="assets/css/form.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body style="background: url('img/pxfuel.jpg') no-repeat; background-size: cover">
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="form">
    <div class="form-box login">
        <h2>Login</h2>
        <form action="login" method="get">
            <div class="input-box">
                <span class="icon"><ion-icon name="mail-open"></ion-icon></span>
                <input type="email" name="email" required>
                <label>Email</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" name="password" required>
                <label>Password</label>
            </div>
            <div class="remenber-forgot">
                <label><input type="checkbox">Remenber me</label>
                <a href="#">Forgot Password?</a>
            </div>
            <button type="submit" class="btn">Login</button>
            <div class="login-register">
                <p>Don't have an account?
                    <a href="register.jsp" class="register-link">Register</a>
                </p>
            </div>

        </form>
    </div>
</div>


<script type="text/javascript">
    var status = document.getElementById("status").value;
    // console.log(status);
    if (status === "failed") {
       swal ("Sorry", "Email or Password is incorrect", "error")
    }
</script>
</body>
</html>
