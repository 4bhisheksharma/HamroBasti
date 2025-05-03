<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Users - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/admin/admin-users.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/admin/admin-dashboard.css">

    <style>

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .avatar-placeholder {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #007bff;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }
    </style>

</head>
<body>
<div class="main-container">
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>

    <!-- Main content -->
    <div class="main-content">
        <header class="header">
            <h1>Users Management</h1>
            <div class="user-greeting">
                <span>Hello, Administrator</span>
                <div class="user-icon">A</div>
            </div>
        </header>

        <div class="dashboard-content">
            <!-- Stats card -->
            <div class="stats-card">
                <div>
                    <h3>Total Users</h3>
                    <div class="stats-value">${totalUsers}</div>
                </div>
                <div class="chart-icon">📊</div>
            </div>

            <!-- Users table -->
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
                                <c:when test="${user.roleId == 2}">Admin</c:when>
                                <c:otherwise>Resident</c:otherwise>
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
                                      onsubmit="return confirm('Are you sure?')">
                                    <input type="hidden" name="userId" value="${user.id}">
                                    <button type="submit" class="action-btn delete-btn">Delete</button>
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

<!-- Footer -->
<%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>

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

        // Edit buttons click events
        const editBtns = document.querySelectorAll('.edit-btn');
        editBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const name = row.cells[0].textContent;
                alert(`Edit user: ${name}`);
            });
        });

    });
</script>
</body>
</html>