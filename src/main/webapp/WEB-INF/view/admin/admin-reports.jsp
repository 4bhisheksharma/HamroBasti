<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reports - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/admin/admin-style.css">

</head>
<body>
<div class="main-container">
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>

    <!-- Main content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header">
            <h1>Reports Management</h1>
            <div class="user-greeting">
                <span>Hello, Administrator</span>
                <div class="user-icon">A</div>
            </div>
        </header>

        <!-- Dashboard content -->
        <div class="dashboard-content">
            <!-- Stats cards -->
            <div class="stats-container">
                <div class="stats-card">
                    <div>
                        <h3>Total Reports</h3>
                        <div class="stats-value">142</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>
                <div class="stats-card">
                    <div>
                        <h3>Pending</h3>
                        <div class="stats-value">45</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>
                <div class="stats-card">
                    <div>
                        <h3>In Progress</h3>
                        <div class="stats-value">38</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>
                <div class="stats-card">
                    <div>
                        <h3>Resolved</h3>
                        <div class="stats-value">59</div>
                    </div>
                    <div class="chart-icon">📊</div>
                </div>
            </div>

            <!-- Search and filters -->
            <div class="search-filters">
                <div class="search-container">
                    <span class="search-icon">🔍</span>
                    <input type="text" placeholder="Search Reports...">
                </div>
                <div class="filter-container">
                    <select class="filter-select">
                        <option value="">Priority</option>
                        <option value="high">High</option>
                        <option value="medium">Medium</option>
                        <option value="low">Low</option>
                    </select>
                    <select class="filter-select">
                        <option value="">Status</option>
                        <option value="pending">Pending</option>
                        <option value="in-progress">In Progress</option>
                        <option value="resolved">Resolved</option>
                    </select>
                </div>
            </div>

            <!-- Reports section -->
            <div class="reports-section">
                <div class="section-header">
                    <h2 class="section-title">
                        <span>Pending</span> <span>Reports</span>
                    </h2>
                </div>

                <!-- Reports list -->
                <div class="reports-list">
                    <div class="report-card">
                        <div class="report-info">
                            <h3 class="report-title">Drainage Blockage</h3>
                            <p class="report-description">Drainage is blocked so fix this issue as soon as possible. Thank You</p>
                            <div class="report-meta">
                                <div class="report-meta-item">
                                    <span>Reported by:</span>
                                    <span>Ram Sharma</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Date:</span>
                                    <span>2023-10-15</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Location:</span>
                                    <span>Ward 5, Kathmandu</span>
                                </div>
                            </div>
                        </div>
                        <div class="report-actions">
                            <button class="action-btn btn-white">Set Status</button>
                            <button class="action-btn btn-outline">Set Priority</button>
                        </div>
                    </div>

                    <div class="report-card">
                        <div class="report-info">
                            <h3 class="report-title">Street Light Not Working</h3>
                            <p class="report-description">The street light at the corner of Main Street has not been working for three days. It's very dark at night and unsafe.</p>
                            <div class="report-meta">
                                <div class="report-meta-item">
                                    <span>Reported by:</span>
                                    <span>Sita Thapa</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Date:</span>
                                    <span>2023-10-18</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Location:</span>
                                    <span>Ward 3, Lalitpur</span>
                                </div>
                            </div>
                        </div>
                        <div class="report-actions">
                            <button class="action-btn btn-white">Set Status</button>
                            <button class="action-btn btn-outline">Set Priority</button>
                        </div>
                    </div>

                    <div class="report-card">
                        <div class="report-info">
                            <h3 class="report-title">Garbage Collection Issue</h3>
                            <p class="report-description">Garbage has not been collected for over a week. The area is becoming unhygienic and there's a bad smell.</p>
                            <div class="report-meta">
                                <div class="report-meta-item">
                                    <span>Reported by:</span>
                                    <span>Hari Karki</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Date:</span>
                                    <span>2023-10-20</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Location:</span>
                                    <span>Ward 7, Bhaktapur</span>
                                </div>
                            </div>
                        </div>
                        <div class="report-actions">
                            <button class="action-btn btn-white">Set Status</button>
                            <button class="action-btn btn-outline">Set Priority</button>
                        </div>
                    </div>

                    <div class="report-card">
                        <div class="report-info">
                            <h3 class="report-title">Water Supply Problem</h3>
                            <p class="report-description">No water supply in our area for the last two days. We need immediate assistance.</p>
                            <div class="report-meta">
                                <div class="report-meta-item">
                                    <span>Reported by:</span>
                                    <span>Gita Poudel</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Date:</span>
                                    <span>2023-10-21</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Location:</span>
                                    <span>Ward 2, Kathmandu</span>
                                </div>
                            </div>
                        </div>
                        <div class="report-actions">
                            <button class="action-btn btn-white">Set Status</button>
                            <button class="action-btn btn-outline">Set Priority</button>
                        </div>
                    </div>

                    <div class="report-card">
                        <div class="report-info">
                            <h3 class="report-title">Pothole on Main Road</h3>
                            <p class="report-description">There's a large pothole on the main road that's causing traffic and is dangerous for vehicles.</p>
                            <div class="report-meta">
                                <div class="report-meta-item">
                                    <span>Reported by:</span>
                                    <span>Binod Shrestha</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Date:</span>
                                    <span>2023-10-22</span>
                                </div>
                                <div class="report-meta-item">
                                    <span>Location:</span>
                                    <span>Ward 10, Lalitpur</span>
                                </div>
                            </div>
                        </div>
                        <div class="report-actions">
                            <button class="action-btn btn-white">Set Status</button>
                            <button class="action-btn btn-outline">Set Priority</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
</footer>
</body>
</html>