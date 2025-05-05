<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 5/1/2025
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Report - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>
<div class="report-details">
    <h2>Edit Report</h2>
    <form id="editForm" action="editReport" method="post" enctype="multipart/form-data">
        <input type="hidden" name="reportId" value="${report.id}">

        <div class="form-group">
            <label>Title:</label>
            <label>
                <input type="text" name="title" value="${report.title}" required>
            </label>
        </div>

        <div class="form-group">
            <label>Description:</label>
            <textarea name="description" required>${report.description}</textarea>
        </div>

        <div class="form-group">
            <label>Update Image:</label>
            <input type="file" name="image">
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-outline">Save Changes</button>
            <a href="viewReport?id=${report.id}" class="btn-cancel">Cancel</a>
        </div>
    </form>
</div>
<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
</body>
</html>
