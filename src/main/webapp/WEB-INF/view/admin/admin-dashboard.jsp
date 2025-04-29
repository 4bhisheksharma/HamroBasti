<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-style.css">
</head>
<body>
<div class="main-container">
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>

    <!-- Sidebar -->
<%--    <div class="sidebar">--%>
<%--        <div class="sidebar-header">--%>
<%--            <h2>हाम्रो-बस्ती</h2>--%>
<%--            <p>Admin Panel</p>--%>
<%--        </div>--%>
<%--        <div class="sidebar-menu">--%>
<%--            <div class="menu-item active">Dashboard</div>--%>
<%--            <div class="menu-item">Reports</div>--%>
<%--            <div class="menu-item">Users</div>--%>
<%--            <div class="menu-item">Logout 📤</div>--%>
<%--        </div>--%>
<%--    </div>--%>

    <!-- Main Content -->
    <div class="content">
        <div class="header">
            <h1>Admin Dashboard</h1>
            <div class="user-info">
                Hello, Administrator
                <div class="profile-icon">
                    <span>A</span>
                </div>
            </div>
        </div>

        <div class="dashboard-content">
            <!-- Stats Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <div>
                        <h3>Total Reports</h3>
                        <div class="stat-value">142</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>

                <div class="stat-card">
                    <div>
                        <h3>Pending</h3>
                        <div class="stat-value">142</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>

                <div class="stat-card">
                    <div>
                        <h3>In Progress</h3>
                        <div class="stat-value">142</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>

                <div class="stat-card">
                    <div>
                        <h3>Resolved</h3>
                        <div class="stat-value">142</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="search-container">
                <div class="search-input">
                    <span>🔍</span>
                    <input type="text" placeholder="Search Reports...">
                </div>
                <div class="filter-dropdown">
                    <span>Priority</span>
                    <span>▼</span>
                </div>
                <div class="filter-dropdown">
                    <span>Status</span>
                    <span>▼</span>
                </div>
            </div>

            <!-- Reports List -->
            <div class="reports-section">
                <h2>Pending <span>Reports</span></h2>

                <div class="report-card">
                    <div class="report-info">
                        <h3>Drainage Blockage</h3>
                        <p>Drainage is blocked so fix this issue as soon as possible. Thank You</p>
                    </div>
                    <div class="report-actions">
                        <button class="action-btn">Set Status</button>
                        <button class="action-btn">Set Priority</button>
                    </div>
                </div>

                <div class="report-card">
                    <div class="report-info">
                        <h3>Drainage Blockage</h3>
                        <p>Drainage is blocked so fix this issue as soon as possible. Thank You</p>
                    </div>
                    <div class="report-actions">
                        <button class="action-btn">Set Status</button>
                        <button class="action-btn">Set Priority</button>
                    </div>
                </div>

                <div class="report-card">
                    <div class="report-info">
                        <h3>Drainage Blockage</h3>
                        <p>Drainage is blocked so fix this issue as soon as possible. Thank You</p>
                    </div>
                    <div class="report-actions">
                        <button class="action-btn">Set Status</button>
                        <button class="action-btn">Set Priority</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
<%--<div class="footer">--%>
<%--    <div class="footer-content">--%>
<%--        <div class="footer-section">--%>
<%--            <h3>Hamro-Basti - Admin</h3>--%>
<%--            <p>Community-based problem reporting and solution platform</p>--%>
<%--        </div>--%>

<%--        <div class="footer-section">--%>
<%--            <h3>Quick Links</h3>--%>
<%--            <a href="#">Dashboard</a>--%>
<%--            <a href="#">Reports</a>--%>
<%--            <a href="#">Users</a>--%>
<%--        </div>--%>

<%--        <div class="footer-section">--%>
<%--            <h3>Contact</h3>--%>
<%--            <p>info@hamrobasti.np</p>--%>
<%--            <p>+977 01-2345678</p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<div class="copyright">--%>
<%--    © 2025 Hamro-Basti. All rights reserved.--%>
<%--</div>--%>

<script>
    // Simple JavaScript for menu item selection
    document.querySelectorAll('.menu-item').forEach(item => {
        item.addEventListener('click', function() {
            document.querySelectorAll('.menu-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });

    // Simple JavaScript for dropdown functionality
    document.querySelectorAll('.filter-dropdown').forEach(dropdown => {
        dropdown.addEventListener('click', function() {
            // In a real application, you would toggle a dropdown menu here
            console.log('Dropdown clicked');
        });
    });

    // Action buttons functionality
    document.querySelectorAll('.action-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            // In a real application, you would show a modal or form here
            alert('Action button clicked: ' + this.textContent);
        });
    });
</script>
</body>
</html>
