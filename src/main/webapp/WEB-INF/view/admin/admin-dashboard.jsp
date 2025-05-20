<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-dashboard.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body>
<div class="layout-container">
    <!-- Include Sidebar -->
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>

    <!-- Main Content -->
    <div class="main-content" id="main-content">
        <header class="header">
            <div class="header-left">
                <button class="sidebar-toggle" id="sidebar-toggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h1>Admin - Dashboard</h1>
            </div>
            <div class="user-info">
                <span>Hello, Administrator</span>
                <a href="${pageContext.request.contextPath}/admin/profile">
                    <div class="profile-icon">
                        <span>A</span>
                    </div>
                </a>
            </div>
        </header>

        <div class="dashboard-container">
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
                            <h3>${report.title}</h3>
                            <span class="report-meta">Reported by: ${report.userFullName}</span> <br>
                            <span class="report-meta">Last Updated: <fmt:formatDate value="${report.createdAt}" pattern="yyyy-MM-dd" /></span> <br>
                            <span class="report-meta">Created: <fmt:formatDate value="${report.updatedAt}" pattern="yyyy-MM-dd" /></span>
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
                                        <img src="data:image/jpeg;base64,${image}" class="report-image" alt="Report Image">
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>
                        <div class="action-btns">
                            <form action="${pageContext.request.contextPath}/admin/delete-report" method="post">
                                <input type="hidden" name="reportId" value="${report.reportId}">
                                <button type="submit" class="action-btn delete-btn">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Include Footer -->
        <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
    </div>
</div>

<script>
    // Modal functionality
    function openModal(id) {
        document.getElementById(id).style.display = 'block';
    }

    function closeModal() {
        document.querySelectorAll('.modal').forEach(modal => {
            modal.style.display = 'none';
        });
    }

    window.onclick = function(event) {
        if (event.target.classList.contains('modal')) {
            closeModal();
        }
    }
</script>
</body>
</html>
