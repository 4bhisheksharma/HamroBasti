<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-logo">
            <a href="${pageContext.request.contextPath}/home">हाम्रो-बस्ती</a>
        </div>
        <div class="navbar-menu">
            <ul class="navbar-items">
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/report">Report</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/about">AboutUs</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/contact">ContactUs</a></li>
            </ul>
        </div>
        <div class="navbar-auth">

    <a href="${pageContext.request.contextPath}/profile" class="nav-profile">
        <c:choose>
            <c:when test="${not empty user.userImage}">
                <img src="data:image/jpeg;base64,${user.userImageAsBase64}"
                     class="avatar-preview"
                     alt="Profile Avatar"
                     id="avatarPreview">
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/assets/images/placeholder_profile.png"
                     class="avatar-preview"
                     alt="Default Avatar"
                     id="avatarPreview">
            </c:otherwise>
        </c:choose>
    </a>

    <a href="${pageContext.request.contextPath}/logout" class="signup-btn">Log Out</a>
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