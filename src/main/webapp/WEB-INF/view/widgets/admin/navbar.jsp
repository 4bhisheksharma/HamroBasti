<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-dashboard.css">
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h2>हाम्रो-बस्ती</h2>
        <p>Admin Panel</p>
    </div>
    <div class="sidebar-menu">
       <a href="${pageContext.request.contextPath}/admin/dashboard"> <div class="menu-item">Dashboard 🏡</div></a>
        <a href="${pageContext.request.contextPath}/admin/users"> <div class="menu-item">Users 👥</div></a>
        <a href="${pageContext.request.contextPath}/admin/profile"> <div class="menu-item">Profile 👤</div></a>
        <a href="${pageContext.request.contextPath}/logout" > <div class="menu-item">Logout 📤</div></a>
    </div>
</div>
</body>
</html>