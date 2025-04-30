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
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>
<main>
    <div class="reports-container">
        <!-- Reports Header Section -->
        <div class="reports-header">
            <div class="reports-title">
                <h1>Reports</h1>
                <p>View issues reported in the community <br>
                    <i>For now everything here is hard coded.</i>
                </p>
            </div>
            <div class="reports-illustration">
                <img src="${pageContext.request.contextPath}/assets/images/reports.png" alt="Reports illustration">
            </div>
        </div>

        <!-- Report New Issue Button -->
        <a href="#" class="report-new-btn">Report a new Issue</a>

        <dialog id="reportDialog" class="report-modal">
            <form id="reportForm"
                  action="uploadImage"
                  method="post"
                  enctype="multipart/form-data"
                  class="modal-content">
                <h2>Add Report</h2>

                <!-- hidden reportId (set this server-side per report) -->
                <input type="hidden" name="reportId" value="${param.reportId}" />

                <label>
                    Title:<br>
                    <input type="text" name="title"
                           placeholder="Enter your report title…" required>
                </label>

                <label>
                    Description:<br>
                    <textarea name="description"
                              placeholder="Enter your report description…" required>
      </textarea>
                </label>

                <label>
                    Screenshot / Photo:<br>
                    <input type="file" name="reportImage"
                           accept="image/*" required>
                </label>

                <div class="modal-actions">
                    <button type="button" class="btn-outline" id="cancelBtn">
                        Cancel
                    </button>
                    <button type="submit" class="btn-primary">
                        Submit
                    </button>
                </div>

                <!-- inline feedback -->
                <div id="uploadFeedback" style="margin-top:1rem;color:#e74c3c;"></div>
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

    // 3. Handle submission via Fetch
    form.addEventListener('submit', async e => {
        e.preventDefault();
        feedbackEl.style.color = '#333';
        feedbackEl.textContent = 'Uploading…';

        try {
            const resp = await fetch(form.action, {
                method: form.method,
                body: new FormData(form)
            });
            if (!resp.ok) throw new Error(`Server returned ${resp.status}`);
            const json = await resp.json();

            if (json.success) {
                feedbackEl.style.color = '#27ae60';
                feedbackEl.textContent = json.message;
                // optionally close after a delay:
                setTimeout(() => dialog.close(), 1000);
            } else {
                throw new Error(json.message || 'Upload failed');
            }
        } catch (err) {
            feedbackEl.style.color = '#e74c3c';
            feedbackEl.textContent = err.message;
        }
    });
</script>
</body>
</html>
