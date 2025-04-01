<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News - PZO</title>
    <jsp:include page="layout-view/head_libraries.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="layout-view/header.jsp"></jsp:include>
    <%-- Breadcrumbs --%>
    <div class="w3l-breadcrumbs">
        <nav id="breadcrumbs" class="breadcrumbs">
            <div class="container page-wrapper">
                <a href="index.jsp">Home</a> » <span class="breadcrumb_last" aria-current="page">Tin tức</span>
            </div>
        </nav>
    </div>

    <jsp:include page="view/newsComponent.jsp"></jsp:include>

    <%-- Footer --%>
    <jsp:include page="layout-view/footer.jsp"></jsp:include>
    <script src="assets/js/theme-change.js"></script>
    <jsp:include page="layout-view/script-libraries.jsp" ></jsp:include>
    <jsp:include page="layout-view/js-function-slider.jsp" ></jsp:include>

</body>
</html>
