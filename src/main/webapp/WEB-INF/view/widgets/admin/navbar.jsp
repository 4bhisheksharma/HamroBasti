<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-style.css">
</head>
<body>
<nav class="admin-layout">
    <div class="admin-sidebar">
        <div class="sidebar-header">
            <div class="sidebar-title">हाम्रो-बस्ती</div>
            <div class="sidebar-subtitle">Admin Panel</div>
        </div>
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="sidebar-nav-item active">Dashboard</a>
            <a href="${pageContext.request.contextPath}/404" class="sidebar-nav-item">Reports</a>
            <a href="${pageContext.request.contextPath}/admin/users" class="sidebar-nav-item">Users</a>
        </nav>
    </div>
</nav>
</body>
</html>