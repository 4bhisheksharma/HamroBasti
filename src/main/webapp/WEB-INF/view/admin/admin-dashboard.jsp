<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>
</nav>
    <!-- Hero Section -->
<%--TODO:--%>
    <section class="hero">
        <div class="container">
            <div class="hero">
                <div class="hero-content">
                    <h1>Aare ma<span class="highlight"> बलराम </span>admin bata, namaskaram!</h1>
                    <p>Report issues and track solutions through the Hamro-Basti platform</p>
                    <a href="${pageContext.request.contextPath}/report" class="btn">View more</a>
                </div>
                <div class="hero-image">
                    <img src="${pageContext.request.contextPath}/assets/images/admin_dashboard_image.png" alt="admin image">
                </div>
            </div>
        </div>
    </section>
<footer>
    <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
</footer>
</body>
</html>
