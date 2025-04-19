<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.User"%>
<%--@elvariable id="user" type="model.User"--%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/profile.css">
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>
<h2>Profile</h2>
    <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data">
        <label>Name:</label>
        <label>
            <input type="text" name="name" value="${user.fullName}" required/>
        </label><br/>
        <label>Email:</label>
        <label>
            <input type="email" name="email" value="${user.email}" required/>
        </label><br/>
        <label>Bio:</label>
        <label>
            <input type="text" name="bio" value="${user.bio}" required/>
        </label><br/>
        <label>Photo:</label>
        <input type="file" name="profileImage" accept="image/*"/><br/>
        <button type="submit">Save Changes</button>
    </form>
<c:if test="${empty user}">
    <p>User not found.</p>
</c:if>
<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
</body>
</html>
