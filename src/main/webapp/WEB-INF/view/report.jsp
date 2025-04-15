<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<nav>
    <%@include file="/widgets/navbar.jsp" %>
</nav>
<main>
    <div class="reports-container">
        <!-- Reports Header Section -->
        <div class="reports-header">
            <div class="reports-title">
                <h1>Reports</h1>
                <p>View issues reported in the community</p>
            </div>
            <div class="reports-illustration">
                <img src="${pageContext.request.contextPath}/assets/images/reports.png" alt="Reports illustration">
            </div>
        </div>

        <!-- Report New Issue Button -->
        <a href="report-issue.jsp" class="report-new-btn">Report a new Issue</a>

        <!-- Filter Section -->
        <div class="filter-section">
            <div class="search-box">
                <label for="search-reports" class="sr-only">Search Reports</label>
                <input type="text" id="search-reports" placeholder="Search Reports..." aria-label="Search reports">
            </div>

            <div class="filter-dropdown">
                <label for="priority-filter" class="sr-only">Filter by Priority</label>
                <select id="priority-filter" aria-label="Filter by priority">
                    <option value="">Priority</option>
                    <option value="critical">Critical</option>
                    <option value="high">High</option>
                    <option value="medium">Medium</option>
                    <option value="normal">Normal</option>
                    <option value="low">Low</option>
                </select>
            </div>

            <div class="filter-dropdown">
                <label for="status-filter" class="sr-only">Filter by Status</label>
                <select id="status-filter" aria-label="Filter by status">
                    <option value="">Status</option>
                    <option value="pending">Pending</option>
                    <option value="in-progress">In Progress</option>
                    <option value="resolved">Resolved</option>
                    <option value="closed">Closed</option>
                </select>
            </div>

            <div class="filter-dropdown">
                <label for="category-filter" class="sr-only">Filter by Category</label>
                <select id="category-filter" aria-label="Filter by category">
                    <option value="">Category</option>
                    <option value="streetlight">Streetlight</option>
                    <option value="road">Road</option>
                    <option value="garbage">Garbage</option>
                    <option value="water">Water</option>
                    <option value="electricity">Electricity</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <div class="date-filter">
                <label for="date-range" class="sr-only">Filter by Date Range</label>
                <input type="text" id="date-range" placeholder="Select date range" aria-label="Filter by date range">
            </div>
        </div>

        <!-- Dashboard Section -->
        <div class="dashboard-section">
            <div class="dashboard-card">
                <h3>Total Reports</h3>
                <div class="number">124</div>
            </div>

            <div class="dashboard-card">
                <h3>Pending</h3>
                <div class="number">45</div>
            </div>

            <div class="dashboard-card">
                <h3>In Progress</h3>
                <div class="number">38</div>
            </div>

            <div class="dashboard-card">
                <h3>Resolved</h3>
                <div class="number">41</div>
            </div>
        </div>

        <!-- Charts Section -->
        <div class="chart-container">
            <div class="chart-header">
                <div class="chart-title">Reports Overview</div>
                <div class="chart-actions">
                    <label for="chart-period" class="sr-only">Select time period</label>
                    <select id="chart-period" aria-label="Select time period for chart">
                        <option value="week">Last Week</option>
                        <option value="month" selected>Last Month</option>
                        <option value="quarter">Last Quarter</option>
                        <option value="year">Last Year</option>
                    </select>
                </div>
            </div>
            <canvas id="reports-chart" height="300"></canvas>
        </div>

        <!-- Reports by Category Chart -->
        <div class="chart-container">
            <div class="chart-header">
                <div class="chart-title">Reports by Category</div>
            </div>
            <canvas id="category-chart" height="300"></canvas>
        </div>

        <!-- Your Reports Section -->
        <div class="reports-section">
            <h2>Your <span>Reports</span></h2>

            <div class="reports-grid">
                <!-- Report Card 1 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Pole-lamp Broken</div>
                            <div class="report-card-date">Reported on: 15 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-critical">Critical</div>
                    </div>
                    <div class="report-card-description">
                        Lamp is broken so fix this issue as soon as possible. Thank You!
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">In Progress</div>
                        <div class="report-card-location">Ward 5, Kathmandu</div>
                    </div>
                </div>

                <!-- Report Card 2 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Drainage Blockage</div>
                            <div class="report-card-date">Reported on: 10 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-medium">Medium</div>
                    </div>
                    <div class="report-card-description">
                        Drainage is blocked so fix this issue as soon as possible. Thank You!
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">Pending</div>
                        <div class="report-card-location">Ward 3, Kathmandu</div>
                    </div>
                </div>

                <!-- Report Card 3 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Voltage Issue</div>
                            <div class="report-card-date">Reported on: 5 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-normal">Normal</div>
                    </div>
                    <div class="report-card-description">
                        Voltage is so low in our area so fix this issue as soon as possible. Thank You!
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">Resolved</div>
                        <div class="report-card-location">Ward 7, Kathmandu</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Community Reports Section -->
        <div class="reports-section">
            <h2>Community <span>Reports</span></h2>

            <div class="reports-grid">
                <!-- Report Card 1 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Road Pothole</div>
                            <div class="report-card-date">Reported on: 18 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-high">High</div>
                    </div>
                    <div class="report-card-description">
                        Large pothole on main road causing traffic and accidents. Please repair urgently.
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">In Progress</div>
                        <div class="report-card-location">Ward 2, Kathmandu</div>
                    </div>
                </div>

                <!-- Report Card 2 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Garbage Collection</div>
                            <div class="report-card-date">Reported on: 16 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-medium">Medium</div>
                    </div>
                    <div class="report-card-description">
                        Garbage has not been collected for a week. Bad smell and health hazard.
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">Pending</div>
                        <div class="report-card-location">Ward 4, Kathmandu</div>
                    </div>
                </div>

                <!-- Report Card 3 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Water Supply Issue</div>
                            <div class="report-card-date">Reported on: 12 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-critical">Critical</div>
                    </div>
                    <div class="report-card-description">
                        No water supply for 3 days. Urgent assistance needed for the community.
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">In Progress</div>
                        <div class="report-card-location">Ward 6, Kathmandu</div>
                    </div>
                </div>

                <!-- Report Card 4 -->
                <div class="report-card">
                    <div class="report-card-header">
                        <div>
                            <div class="report-card-title">Stray Dogs</div>
                            <div class="report-card-date">Reported on: 8 Jun 2023</div>
                        </div>
                        <div class="report-card-priority priority-normal">Normal</div>
                    </div>
                    <div class="report-card-description">
                        Group of stray dogs in the area causing disturbance at night. Need animal control.
                    </div>
                    <div class="report-card-footer">
                        <div class="report-card-status">Pending</div>
                        <div class="report-card-location">Ward 1, Kathmandu</div>
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <a href="#" class="pagination-item disabled" aria-label="Previous page">&lt;</a>
                <a href="#" class="pagination-item active" aria-current="page">1</a>
                <a href="#" class="pagination-item">2</a>
                <a href="#" class="pagination-item">3</a>
                <a href="#" class="pagination-item">4</a>
                <a href="#" class="pagination-item">5</a>
                <a href="#" class="pagination-item" aria-label="Next page">&gt;</a>
            </div>
        </div>
    </div>
</main>
<footer>
<%--    <%@include file="/widgets/footer.jsp" %>--%>
</footer>
</body>
</html>
