<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}../assets/css/navbar.css">
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-logo">
            <a href="../index.jsp">Hamro-Basti</a>
        </div>
        <div class="navbar-menu">
            <ul class="navbar-items">
                <li class="navbar-item"><a href="../index.jsp">Home</a></li>
                <li class="navbar-item"><a href="../view/report.jsp">Report</a></li>
                <li class="navbar-item"><a href="../view/about.jsp">AboutUs</a></li>
                <li class="navbar-item"><a href="../view/contact.jsp">ContactUs</a></li>
            </ul>
        </div>
        <div class="navbar-auth">
            <a href="../view/login.jsp" class="login-btn">Log In</a>
            <a href="../view/signup.jsp" class="signup-btn">Sign Up</a>
        </div>
        <div class="mobile-menu-toggle" id="mobile-menu-toggle">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div class="mobile-menu" id="mobile-menu">
        <ul class="mobile-menu-items">
            <li class="mobile-menu-item"><a href="../index.jsp">Home</a></li>
            <li class="mobile-menu-item"><a href="../view/report.jsp">Report</a></li>
            <li class="mobile-menu-item"><a href="../view/about.jsp">AboutUs</a></li>
            <li class="mobile-menu-item"><a href="../view/contact.jsp">ContactUs</a></li>
            <li class="mobile-menu-item"><a href="../view/login.jsp">Log In</a></li>
            <li class="mobile-menu-item"><a href="../view/signup.jsp">Sign Up</a></li>
        </ul>
    </div>
</nav>
</body>
</html>