<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users Management - Hamro-Basti</title>
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
                <h1>Users Management</h1>
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
            <!-- Stats Card -->
            <div class="stats-container">
                <div class="stat-card">
                    <h3>Total Users</h3>
                    <div class="stat-value">${totalUsers}</div>
                </div>
            </div>

            <!-- Users Table -->
            <div class="reports-section">
                <h2>All Users</h2>

                <div class="table-responsive">
                    <table class="users-table">
                        <thead>
                        <tr>
                            <th>Profile</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Joined Date</th>
                            <th>Bio</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty user.userImageAsBase64}">
                                            <img src="data:image/jpeg;base64,${user.userImageAsBase64}"
                                                 class="user-avatar"
                                                 alt="Profile">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="avatar-placeholder">${user.fullName.charAt(0)}</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${user.fullName}</td>
                                <td>${user.email}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${user.roleId == 2}">
                                            <span class="text-primary">Admin</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span>Resident</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <fmt:formatDate value="${user.createdAt}"
                                                    pattern="yyyy-MM-dd HH:mm"/>
                                </td>
                                <td>${user.bio}</td>
                                <td>
                                    <div class="user-actions">
                                        <form action="${pageContext.request.contextPath}/admin/delete-user"
                                              method="post"
                                              onsubmit="return confirm('Are you sure you want to delete this user?')">
                                            <input type="hidden" name="userId" value="${user.id}">
                                            <button type="submit" class="action-btn delete-btn">
                                                <i class="fas fa-trash-alt"></i> Delete
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Include Footer -->
        <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
    </div>
</div>

<script>
    // This is just for frontend interactivity, no backend logic
    document.addEventListener('DOMContentLoaded', function() {
        // Add User button click event
        const addUserBtn = document.querySelector('.add-user-btn');
        if (addUserBtn) {
            addUserBtn.addEventListener('click', function() {
                alert('Add User functionality would be implemented here');
            });
        }
    });
</script>
</body>
</html>
