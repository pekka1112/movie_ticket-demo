<%--
  Created by IntelliJ IDEA.
  User: QUYEN
  Date: 02/12/2023
  Time: 14:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/form.css">
</head>
<body>
<div class="form register">
    <div class="form-box register">
        <h2>Register</h2>
        <form action="#">
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <input type="text" required>
                <label>Username</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="mail-open"></ion-icon></span>
                <input type="email" required>
                <label>Email</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" required>
                <label>Password</label>
            </div>
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" required>
                <label>Retype Password</label>
            </div>
            <div class="remenber-forgot">
                <label><input type="checkbox">I agree to the terms & conditions</label>

            </div>
            <button type="submit" class="btn">Register</button>
            <div class="login-register">
                <p>Already have an account?
                    <a href="login.jsp" class="login-link">Login</a>
                </p>
            </div>

        </form>
    </div>
</div>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</body>
</html>
