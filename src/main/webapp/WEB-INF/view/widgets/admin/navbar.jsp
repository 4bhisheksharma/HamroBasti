<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-logo">
            <a href="#">हाम्रो-बस्ती - Admin</a>
        </div>
        <div class="navbar-menu">
            <ul class="navbar-items">
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/report">Report</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/WEB-INF/view/about.jsp">AboutUs</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/WEB-INF/view/contact.jsp">ContactUs</a></li>
            </ul>
        </div>
        <div class="navbar-auth">
<%--            <a href="${pageContext.request.contextPath}/login" class="login-btn">Log In</a>--%>
<%--             here we will fetch the name of the user who is logged in--%>
            <a href="${pageContext.request.contextPath}/login" class="signup-btn">Log Out</a>
        </div>
        <div class="mobile-menu-toggle" id="mobile-menu-toggle">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div class="mobile-menu" id="mobile-menu">
        <ul class="mobile-menu-items">
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/report">Report</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/WEB-INF/view/about.jsp">AboutUs</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/WEB-INF/view/contact.jsp">ContactUs</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/WEB-INF/view/auth/login.jsp">Log In</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/WEB-INF/view/auth/signup.jsp">Sign Up</a></li>
        </ul>
    </div>
</nav>
</body>
</html>