<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reports - Hamro-Basti</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            flex-direction: column;
        }

        .main-container {
            display: flex;
            flex: 1;
        }

        /* Sidebar styles */
        .sidebar {
            width: 200px;
            background-color: #6366f1;
            color: white;
            flex-shrink: 0;
        }

        .sidebar-header {
            padding: 1rem;
        }

        .sidebar-header h1 {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .sidebar-header p {
            font-size: 0.875rem;
            color: rgba(255, 255, 255, 0.8);
        }

        .sidebar-nav {
            margin-top: 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            padding: 0 0.5rem;
        }

        .sidebar-nav a {
            padding: 0.75rem;
            border-radius: 0.375rem;
            text-decoration: none;
            color: white;
            transition: background-color 0.2s;
        }

        .sidebar-nav a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .sidebar-nav a.active {
            background-color: white;
            color: #6366f1;
        }

        /* Main content styles */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .header {
            padding: 1rem;
            border-bottom: 1px solid #e5e7eb;
            background-color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .user-greeting {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #6366f1;
        }

        .user-icon {
            width: 1.5rem;
            height: 1.5rem;
            background-color: #6366f1;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
        }

        /* Dashboard content */
        .dashboard-content {
            padding: 1.5rem;
        }

        /* Stats cards */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1rem;
        }

        .stats-card {
            background-color: #6366f1;
            border-radius: 0.5rem;
            padding: 1rem;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .stats-card h3 {
            font-size: 1.125rem;
            font-weight: 500;
        }

        .stats-value {
            background-color: white;
            color: #6366f1;
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            margin-top: 0.5rem;
            font-size: 1.25rem;
            font-weight: 700;
            text-align: center;
        }

        .chart-icon {
            font-size: 1.5rem;
            color: rgba(255, 255, 255, 0.8);
        }

        /* Search and filters */
        .search-filters {
            margin-top: 2rem;
            background-color: #6366f1;
            border-radius: 0.5rem;
            padding: 1rem;
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            align-items: center;
        }

        .search-container {
            flex: 1;
            position: relative;
            min-width: 200px;
        }

        .search-container input {
            width: 100%;
            padding: 0.5rem 0.5rem 0.5rem 2rem;
            border-radius: 0.375rem;
            border: none;
            outline: none;
        }

        .search-icon {
            position: absolute;
            left: 0.5rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
        }

        .filter-container {
            display: flex;
            gap: 0.5rem;
        }

        .filter-select {
            padding: 0.5rem;
            border-radius: 0.375rem;
            border: none;
            outline: none;
            min-width: 140px;
        }

        /* Reports section */
        .reports-section {
            margin-top: 2rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .section-title span:first-child {
            color: #1f2937;
        }

        .section-title span:last-child {
            color: #6366f1;
        }

        /* Report cards */
        .reports-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .report-card {
            background-color: #6366f1;
            border-radius: 0.5rem;
            padding: 1rem;
            color: white;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        @media (min-width: 768px) {
            .report-card {
                flex-direction: row;
                justify-content: space-between;
                align-items: center;
            }
        }

        .report-info {
            flex: 1;
        }

        .report-title {
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .report-description {
            font-size: 0.875rem;
            color: rgba(255, 255, 255, 0.8);
        }

        .report-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-top: 0.5rem;
            font-size: 0.75rem;
        }

        .report-meta-item {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .report-actions {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        @media (min-width: 768px) {
            .report-actions {
                align-items: flex-end;
            }
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border-radius: 0.375rem;
            border: none;
            cursor: pointer;
            font-weight: 500;
            white-space: nowrap;
        }

        .btn-white {
            background-color: white;
            color: #6366f1;
        }

        .btn-outline {
            background-color: transparent;
            border: 1px solid white;
            color: white;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
            gap: 0.25rem;
        }

        .pagination-btn {
            padding: 0.5rem 0.75rem;
            border-radius: 0.375rem;
            border: 1px solid #d1d5db;
            background-color: white;
            cursor: pointer;
        }

        .pagination-btn.active {
            background-color: #6366f1;
            color: white;
            border-color: #6366f1;
        }

        /* Footer */
        .footer {
            background-color: #1f2937;
            color: white;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            padding: 1.5rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-section h3 {
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .footer-section p, .footer-section li {
            font-size: 0.875rem;
            color: #9ca3af;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.25rem;
        }

        .footer-links a {
            color: #9ca3af;
            text-decoration: none;
        }

        .footer-links a:hover {
            color: white;
        }

        .copyright {
            text-align: center;
            padding: 1rem;
            border-top: 1px solid #374151;
            font-size: 0.875rem;
            color: #9ca3af;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                order: 2;
            }

            .sidebar-nav {
                flex-direction: row;
                overflow-x: auto;
                padding: 0.5rem;
            }

            .main-content {
                order: 1;
            }

            .search-filters {
                flex-direction: column;
                align-items: stretch;
            }
        }
    </style>
</head>
<body>
<div class="main-container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1>हामो-बस्ती</h1>
            <p>Admin Panel</p>
        </div>
        <nav class="sidebar-nav">
            <a href="admin-dashboard.jsp">Dashboard</a>
            <a href="admin-reports.jsp" class="active">Reports</a>
            <a href="admin-users.jsp">Users</a>
        </nav>
    </div>

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

                <!-- Pagination -->
                <div class="pagination">
                    <button class="pagination-btn">&lt;</button>
                    <button class="pagination-btn active">1</button>
                    <button class="pagination-btn">2</button>
                    <button class="pagination-btn">3</button>
                    <button class="pagination-btn">&gt;</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="footer-content">
        <div class="footer-section">
            <h3>Hamro-Basti - Admin</h3>
            <p>Community-based problem reporting and solution platform</p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul class="footer-links">
                <li><a href="admin-dashboard.jsp">Dashboard</a></li>
                <li><a href="admin-reports.jsp">Reports</a></li>
                <li><a href="admin-users.jsp">Users</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact</h3>
            <p>info@hamrobasti.np</p>
            <p>+977 01-2345678</p>
        </div>
    </div>
    <div class="copyright">
        © 2025 Hamro-Basti. All rights reserved.
    </div>
</footer>

<script>
    // This is just for frontend interactivity, no backend logic
    document.addEventListener('DOMContentLoaded', function() {
        // Status buttons click events
        const statusBtns = document.querySelectorAll('.btn-white');
        statusBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const reportCard = this.closest('.report-card');
                const reportTitle = reportCard.querySelector('.report-title').textContent;

                const statusOptions = ['Pending', 'In Progress', 'Resolved'];
                const currentStatus = prompt(`Set status for "${reportTitle}"\nOptions: ${statusOptions.join(', ')}`, 'In Progress');

                if (currentStatus && statusOptions.map(s => s.toLowerCase()).includes(currentStatus.toLowerCase())) {
                    alert(`Status for "${reportTitle}" would be updated to ${currentStatus}`);
                }
            });
        });

        // Priority buttons click events
        const priorityBtns = document.querySelectorAll('.btn-outline');
        priorityBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const reportCard = this.closest('.report-card');
                const reportTitle = reportCard.querySelector('.report-title').textContent;

                const priorityOptions = ['Low', 'Medium', 'High', 'Urgent'];
                const currentPriority = prompt(`Set priority for "${reportTitle}"\nOptions: ${priorityOptions.join(', ')}`, 'Medium');

                if (currentPriority && priorityOptions.map(p => p.toLowerCase()).includes(currentPriority.toLowerCase())) {
                    alert(`Priority for "${reportTitle}" would be updated to ${currentPriority}`);
                }
            });
        });

        // Search functionality (frontend only)
        const searchInput = document.querySelector('.search-container input');
        if (searchInput) {
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                const reportCards = document.querySelectorAll('.report-card');

                reportCards.forEach(card => {
                    const title = card.querySelector('.report-title').textContent.toLowerCase();
                    const description = card.querySelector('.report-description').textContent.toLowerCase();

                    if (title.includes(searchTerm) || description.includes(searchTerm)) {
                        card.style.display = '';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        }

        // Filter dropdowns (frontend only)
        const filterSelects = document.querySelectorAll('.filter-select');
        filterSelects.forEach(select => {
            select.addEventListener('change', function() {
                alert(`Filter applied: ${this.options[this.selectedIndex].text}`);
                // In a real implementation, this would filter the reports
            });
        });

        // Pagination (frontend only)
        const paginationBtns = document.querySelectorAll('.pagination-btn');
        paginationBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                if (!this.classList.contains('active')) {
                    document.querySelector('.pagination-btn.active').classList.remove('active');
                    this.classList.add('active');
                    alert(`Page ${this.textContent} would be loaded`);
                }
            });
        });
    });
</script>
</body>
</html>