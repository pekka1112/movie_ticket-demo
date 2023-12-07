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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
<div class="form register">
    <div class="form-box register">
        <h2>Register</h2>
        <form action="register" method="get">
            <div class="input-box">
                <span class="icon"><ion-icon name="person"></ion-icon></span>
                <input type="text" name="userName" required>
                <label>Username</label>
            </div>
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
            <div class="input-box">
                <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                <input type="password" name="retypePassword" required>
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

</body>

<script type="text/javascript">

        var status = document.getElementById("status").value;
        // console.log(status);
    document.addEventListener("DOMContentLoaded", function () {
        if (status === "success") {
            swal("Congrats", "Account Created Successfully", "success");
        }
    });

</script>
</html>
