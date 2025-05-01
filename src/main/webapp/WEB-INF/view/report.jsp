<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
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
        <a href="#" class="report-new-btn">Report a new Issue</a>

        <dialog id="reportDialog" class="report-modal">
            <form id="reportForm" action="createReport" method="post" enctype="multipart/form-data" class="modal-content">
                <!-- Remove the hidden reportId field -->
                <h2>Add Report</h2>

                <label>
                    Title:<br>
                    <input type="text" name="title" placeholder="Enter your report title…" required>
                </label>

                <label>
                    Description:<br>
                    <textarea name="description" placeholder="Enter your report description…" required></textarea>
                </label>

                <label>
                    Screenshot / Photo:<br>
                    <input type="file" name="reportImage" accept="image/*" required>
                </label>

                <div class="modal-actions">
                    <button type="button" class="btn-outline" id="cancelBtn">
                        Cancel
                    </button>
                    <button type="submit" class="btn-primary">
                        Submit
                    </button>
                </div>
            </form>
        </dialog>


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
                    <option value="medium">Medium</option>
                    <option value="normal">Normal</option>
                </select>
            </div>

            <div class="filter-dropdown">
                <label for="status-filter" class="sr-only">Filter by Status</label>
                <select id="status-filter" aria-label="Filter by status">
                    <option value="">Status</option>
                    <option value="pending">Pending</option>
                    <option value="in-progress">In Progress</option>
                    <option value="resolved">Resolved</option>
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

<%--        <!-- Charts Section -->--%>
<%--        <div class="chart-container">--%>
<%--            <div class="chart-header">--%>
<%--                <div class="chart-title">Reports Overview</div>--%>
<%--                <div class="chart-actions">--%>
<%--                    <label for="chart-period" class="sr-only">Select time period</label>--%>
<%--                    <select id="chart-period" aria-label="Select time period for chart">--%>
<%--                        <option value="week">Last Week</option>--%>
<%--                        <option value="month" selected>Last Month</option>--%>
<%--                        <option value="quarter">Last Quarter</option>--%>
<%--                        <option value="year">Last Year</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <canvas id="reports-chart" height="300"></canvas>--%>
<%--        </div>--%>

<%--        <!-- Reports by Category Chart -->--%>
<%--        <div class="chart-container">--%>
<%--            <div class="chart-header">--%>
<%--                <div class="chart-title">Reports by Category</div>--%>
<%--            </div>--%>
<%--            <canvas id="category-chart" height="300"></canvas>--%>
<%--        </div>--%>

        <!-- Your Reports Section -->
        <div class="reports-section">
            <h2>Your <span>Reports</span></h2>

            <div class="reports-grid">
                <c:forEach items="${reports}" var="report">
                    <div class="report-card">
                        <div class="report-card-header">
                            <div>
                                <div class="report-card-title">${report.title}</div>
                                <div class="report-card-date">
                                    Reported on: <fmt:formatDate value="${report.createdAt}" pattern="dd MMM yyyy"/>
                                </div>
                            </div>
                            <div class="report-card-priority priority-${report.priority.toLowerCase()}">
                                    ${report.priority}
                            </div>
                        </div>
                        <div class="report-card-description">
                                ${report.description}
                        </div>
                        <div class="report-card-footer">
                            <div class="report-card-status">${report.status}</div>
                            <div class="report-card-location">
                                <!-- Add location field to your reports table if needed -->
                                Ward ${report.id % 10}, Kathmandu
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</main>
<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
<script>
    const btn  = document.querySelector('.report-new-btn');
    const dialog = document.getElementById('reportDialog');
    const openBtn    = document.querySelector('.report-new-btn');
    const cancelBtn  = document.getElementById('cancelBtn');
    const form       = document.getElementById('reportForm');
    const feedbackEl = document.getElementById('uploadFeedback');

    // Open modal
    btn.addEventListener('click', e => {
        e.preventDefault();
        dialog.showModal();
    });

    // Close on Cancel (value="cancel") or clicking outside
    dialog.addEventListener('cancel', () => dialog.close());
    dialog.addEventListener('click', e => {
        // if backdrop clicked
        const rect = dialog.getBoundingClientRect();
        if (
            e.clientX < rect.left ||
            e.clientX > rect.right ||
            e.clientY < rect.top ||
            e.clientY > rect.bottom
        ) {
            dialog.close();
        }
    });

    // 2. Cancel button closes
    cancelBtn.addEventListener('click', () => dialog.close());

</script>
</body>
</html>
