<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-dashboard.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <h2>हाम्रो-बस्ती</h2>
        <p>Admin Panel</p>
    </div>
    <div class="sidebar-menu">
        <a href="${pageContext.request.contextPath}/admin/dashboard">
            <div class="menu-item ${pageContext.request.requestURI.contains('/dashboard') ? 'active' : ''}">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/admin/users">
            <div class="menu-item ${pageContext.request.requestURI.contains('/users') ? 'active' : ''}">
                <i class="fas fa-users"></i> Users
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/admin/profile">
            <div class="menu-item ${pageContext.request.requestURI.contains('/profile') ? 'active' : ''}">
                <i class="fas fa-user"></i> Profile
            </div>
        </a>
        <a href="javascript:void(0);" onclick="confirmLogout('${pageContext.request.contextPath}/logout')">
            <div class="menu-item">
                <i class="fas fa-sign-out-alt"></i> Logout
            </div>
        </a>
    </div>
</div>

<!-- Mobile sidebar toggle button - will be shown in the header -->
<script>
    // Function to confirm logout
    function confirmLogout(logoutUrl) {
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = logoutUrl;
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        // Add sidebar toggle functionality
        const sidebarToggle = document.getElementById('sidebar-toggle');
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('main-content');

        if (sidebarToggle) {
            sidebarToggle.addEventListener('click', function() {
                sidebar.classList.toggle('open');
                if (mainContent) {
                    mainContent.classList.toggle('main-content-expanded');
                }
            });
        }

        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', function(event) {
            if (window.innerWidth <= 768 &&
                sidebar &&
                !sidebar.contains(event.target) &&
                sidebarToggle &&
                !sidebarToggle.contains(event.target) &&
                sidebar.classList.contains('open')) {
                sidebar.classList.remove('open');
            }
        });
    });
</script>
</body>
</html>
