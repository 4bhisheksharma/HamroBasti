<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-dashboard.css">
    <style>
        .report-images { display: flex; gap: 10px; margin-top: 10px; }
        .report-image { max-width: 200px; max-height: 150px; border: 1px solid #ddd; }
        .action-btns { display: flex; gap: 5px; }
        .status-priority { display: flex; gap: 15px; margin-top: 10px; }
        .modal { display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; overflow: auto; background-color: rgba(0,0,0,0.4); }
        .modal-content { background-color: #fefefe; margin: 15% auto; padding: 20px; border: 1px solid #888; width: 80%; }
    </style>
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>
</nav>
<div class="main-container">
    <div class="content">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <div class="user-info">
                Hello, Administrator
                <div class="profile-icon">
                    <a href="${pageContext.request.contextPath}/admin/profile" style="text-decoration: none">  <span style="color: white">A</span></a>
                </div>
            </div>
        </div>

        <div class="dashboard-content">
            <!-- Stats Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <h3>Total Reports</h3>
                    <div class="stat-value">${totalReports}</div>
                </div>
                <c:forEach items="${statusCounts}" var="status">
                    <div class="stat-card">
                        <h3>${status.key}</h3>
                        <div class="stat-value">${status.value}</div>
                    </div>
                </c:forEach>
            </div>

            <!-- Reports List -->
            <div class="reports-section">
                <h2>All Reports</h2>

                <c:forEach items="${allReports}" var="report">
                    <div class="report-card">
                        <div class="report-info">
                            <h3>${report.title}<br>
                                <span class="report-meta">Reported by: ${report.userFullName}</span>
                            </h3>
                            <p>${report.description}</p>
                            <div class="status-priority">
                                <form action="${pageContext.request.contextPath}/admin/update-status" method="post">
                                    <input type="hidden" name="reportId" value="${report.reportId}">
                                    <select name="status" onchange="this.form.submit()">
                                        <c:forEach items="${allStatuses}" var="status">
                                            <option value="${status.statusId}" ${report.statusId == status.statusId ? 'selected' : ''}>
                                                    ${status.label}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </form>

                                <form action="${pageContext.request.contextPath}/admin/update-priority" method="post">
                                    <input type="hidden" name="reportId" value="${report.reportId}">
                                    <select name="priority" onchange="this.form.submit()">
                                        <c:forEach items="${allPriorities}" var="priority">
                                            <option value="${priority.priorityId}" ${report.priorityId == priority.priorityId ? 'selected' : ''}>
                                                    ${priority.label}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </form>
                            </div>

                            <c:if test="${not empty report.images}">
                                <div class="report-images">
                                    <c:forEach items="${report.images}" var="image">
                                        <img src="data:image/jpeg;base64,${image}" class="report-image">
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                        <div class="action-btns">
                            <form action="${pageContext.request.contextPath}/admin/delete-report" method="post">
                                <input type="hidden" name="reportId" value="${report.reportId}">
                                <button type="submit" class="action-btn delete-btn">Delete</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<footer style="z-index: 1000;">
    <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
</footer>

<script>
    window.onclick = function(event) {
        if (event.target == document.getElementById('detailModal')) {
            closeModal();
        }
    }
</script>
</body>
</html>