<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-style.css">
    <title>Hamro-Basti</title>
</head>
<body>
<footer class="admin-footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3 class="footer-title">Hamro-Basti - Admin</h3>
            <p class="footer-text">Community-based problem reporting and solution platform</p>
        </div>

        <div class="footer-section">
            <h3 class="footer-title">Quick Links</h3>
            <ul class="footer-links">
                <li class="footer-link"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                <li class="footer-link"><a href="admin-reports.jsp">Reports</a></li>
                <li class="footer-link"><a href="${pageContext.request.contextPath}/admin/users">Users</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3 class="footer-title">Contact</h3>
            <div class="footer-contact">info@hamrobasti.np</div>
            <div class="footer-contact">+977 01-23456789</div>
        </div>
    </div>

    <div class="footer-copyright">
        &copy; <%= new java.util.Date().getYear() + 1900 %> Hamro-Basti. All rights reserved.
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 Hamro-Basti. All rights reserved.</p>
        <p>V: 1.1 (admin)</p>
    </div>
</footer>
</body>
</html>