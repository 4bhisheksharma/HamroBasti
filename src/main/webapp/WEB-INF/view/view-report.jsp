<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 5/1/2025
  Time: 12:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>View Report - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>
<div class="report-details">
    <h1>${report.title}</h1>

    <div class="report-meta">
        <span class="priority priority-${report.priority.toLowerCase()}">
            ${report.priority}
        </span>
        <span class="status">Status, ${report.status}</span>
        <span class="date">
            Reported on: <fmt:formatDate value="${report.createdAt}" pattern="dd MMM yyyy"/>
        </span>
    </div>

    <div class="report-content">
        <p>${report.description}</p>

        <div class="report-images">
            <c:forEach items="${images}" var="image">
                <img src="data:image/*;base64,${image}"
                     alt="Report image"
                     class="report-image"
                     style="max-width: 300px; margin: 10px;">
            </c:forEach>
        </div>
    </div>

    <div class="report-actions">
        <a href="editReport?id=${report.id}" class="btn-edit">Edit Report</a>
        <form action="deleteReport" method="post" class="delete-form">
            <input type="hidden" name="id" value="${report.id}">
            <button type="submit" class="btn-outline-del">Delete Report</button>
        </form>
    </div>

    <div class="report-actions">
        <a href="report" class="btn-edit">Back to Report</a>
    </div>
</div>
<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
</body>
</html>
