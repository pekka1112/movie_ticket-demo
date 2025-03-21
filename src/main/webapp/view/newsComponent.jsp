<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assets/css/page/newsComponents.css">
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Raleway:wght@300;400;500;700;900&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous"></script>
</head>
<body>
<section class = "banner">
    <div class = "banner-main-content">
        <div class = "current-news-head">
            <c:forEach items="${movieNews6}" var="n3" >
                <a href="${n3.link}"><h3>📰  ${n3.title}</h3></a>
            </c:forEach>
        </div>
    </div>
    <div class = "banner-sub-content">
        <c:forEach items="${movieNews4}" var="n4" >
            <div class = "hot-topic">
                <img src = "${n4.imgUrl}" alt = "">
                <div class = "hot-topic-content">
                    <p>${n4.summary}</p>
                    <a href = "${n4.link}">Đọc thêm</a>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
    <main>
        <section class = "main-container-right">
            <c:forEach items="${movieNews4_reverse}" var="n5" >
                <article>
                    <h4><img width="50px" height="50px" src = "${n5.imgUrl}"></h4>
                    <div>
                        <h2>${n5.title}</h2>
                        <p>${n5.summary}</p>
                        <a href = "${n5.link}">Đọc thêm<span>>></span></a>
                    </div>
                    <h4>ĐĂNG VÀO : ${n5.time}</h4>
                </article>
            </c:forEach>
        </section>
    </main>
<script async defer>

    const btnHam = document.querySelector('.ham-btn');
    const btnTimes = document.querySelector('.times-btn');
    const navBar = document.getElementById('nav-bar');

    btnHam.addEventListener('click', function(){
        if(btnHam.className !== ""){
            btnHam.style.display = "none";
            btnTimes.style.display = "block";
            navBar.classList.add("show-nav");
        }
    })

    btnTimes.addEventListener('click', function(){
        if(btnHam.className !== ""){
            this.style.display = "none";
            btnHam.style.display = "block";
            navBar.classList.remove("show-nav");
        }
    })
</script>
</body>
</html>