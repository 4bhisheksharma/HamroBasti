<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Hamro-Basti</title>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-style.css">

</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>
<%--    TODO: manage this all--%>
</nav>
<div class="admin-layout">
    <!-- Main Content -->
    <div class="admin-content">
        <!-- Header -->
        <header class="admin-header">
            <h1 class="header-title">Admin Dashboard</h1>
            <div class="header-user">
                <div class="header-user-greeting">Hello, Administrator</div>
                <div class="header-user-avatar">A</div>
            </div>
        </header>

        <!-- Dashboard Content -->
        <div class="dashboard-container">
            <!-- Stats Cards -->
            <div class="stats-grid">
                <div class="stats-card">
                    <div class="stats-info">
                        <div class="stats-title">Total Reports</div>
                        <div class="stats-value">142</div>
                    </div>
                    <div class="stats-icon">
                        <div class="icon-placeholder"></div>
                    </div>
                </div>

                <div class="stats-card">
                    <div class="stats-info">
                        <div class="stats-title">Pending</div>
                        <div class="stats-value">37</div>
                    </div>
                    <div class="stats-icon">
                        <div class="icon-placeholder"></div>
                    </div>
                </div>

                <div class="stats-card">
                    <div class="stats-info">
                        <div class="stats-title">In Progress</div>
                        <div class="stats-value">45</div>
                    </div>
                    <div class="stats-icon">
                        <div class="icon-placeholder"></div>
                    </div>
                </div>

                <div class="stats-card">
                    <div class="stats-info">
                        <div class="stats-title">Resolved</div>
                        <div class="stats-value">60</div>
                    </div>
                    <div class="stats-icon">
                        <div class="icon-placeholder"></div>
                    </div>
                </div>
            </div>

            <!-- Search Section -->
            <div class="search-section">
                <div class="search-input">
                    <div class="search-icon"></div>
                    <input type="text" placeholder="Search Reports...">
                </div>

                <div class="filter-dropdown">
                    <button class="filter-button">
                        <div class="filter-icon"></div>
                        Priority
                    </button>
                </div>

                <div class="filter-dropdown">
                    <button class="filter-button">
                        <div class="filter-icon"></div>
                        Status
                    </button>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="charts-section">
                <div class="section-header">
                    <h2 class="section-title">Reports <span>Overview</span></h2>
                </div>

                <div class="chart-container">
                    <div class="chart-placeholder">
                        Chart Placeholder - Reports by Status
                    </div>
                </div>
            </div>

            <!-- Recent Activity Section -->
            <div class="activity-section">
                <div class="section-header">
                    <h2 class="section-title">Recent <span>Activity</span></h2>
                </div>

                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">
                            <div class="activity-icon-placeholder"></div>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">New user registered: John Doe</div>
                            <div class="activity-time">Today, 10:30 AM</div>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon">
                            <div class="activity-icon-placeholder"></div>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">Report status updated: Drainage issue in Ward 5</div>
                            <div class="activity-time">Yesterday, 3:45 PM</div>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon">
                            <div class="activity-icon-placeholder"></div>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">New report submitted: Street light not working</div>
                            <div class="activity-time">Yesterday, 1:20 PM</div>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon">
                            <div class="activity-icon-placeholder"></div>
                        </div>
                        <div class="activity-content">
                            <div class="activity-title">User profile updated: Sarah Johnson</div>
                            <div class="activity-time">Apr 25, 2023</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pending Reports Section -->
            <div class="reports-section">
                <div class="section-header">
                    <h2 class="section-title">Pending <span>Reports</span></h2>
                </div>

                <div class="report-card">
                    <div class="report-info">
                        <h3 class="report-title">Drainage Blockage</h3>
                        <p class="report-description">Drainage is blocked so fix this issue as soon as possible. Thank You</p>
                    </div>
                    <div class="report-actions">
                        <button class="action-btn">Set Status</button>
                        <button class="action-btn">Set Priority</button>
                    </div>
                </div>

                <div class="report-card">
                    <div class="report-info">
                        <h3 class="report-title">Street Light Not Working</h3>
                        <p class="report-description">The street light at the corner of Main Street and Park Avenue has been out for three days.</p>
                    </div>
                    <div class="report-actions">
                        <button class="action-btn">Set Status</button>
                        <button class="action-btn">Set Priority</button>
                    </div>
                </div>

                <div class="report-card">
                    <div class="report-info">
                        <h3 class="report-title">Garbage Collection Missed</h3>
                        <p class="report-description">The garbage collection service did not come to our area this week. Please address this issue.</p>
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

<!-- Admin Footer -->
<footer>
    <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
</footer>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Placeholder for any JavaScript functionality
        console.log('Dashboard UI loaded');

        // Example of how you might implement filter dropdowns
        const filterButtons = document.querySelectorAll('.filter-button');
        filterButtons.forEach(button => {
            button.addEventListener('click', function() {
                alert('Filter dropdown would appear here');
            });
        });
    });
</script>
</body>
</html>