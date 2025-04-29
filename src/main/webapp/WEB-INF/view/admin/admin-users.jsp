<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Users - Hamro-Basti</title>
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

        /* Stats card */
        .stats-card {
            background-color: #6366f1;
            border-radius: 0.5rem;
            padding: 1rem;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 300px;
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

        /* Users section */
        .users-section {
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

        .add-user-btn {
            background-color: #6366f1;
            color: white;
            border: none;
            border-radius: 0.375rem;
            padding: 0.5rem 1rem;
            cursor: pointer;
            font-weight: 500;
        }

        /* Users table */
        .users-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        .users-table th, .users-table td {
            padding: 0.75rem 1rem;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }

        .users-table th {
            background-color: #f9fafb;
            font-weight: 600;
        }

        .users-table tr:hover {
            background-color: #f9fafb;
        }

        .user-actions {
            display: flex;
            gap: 0.5rem;
        }

        .action-btn {
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            border: none;
            cursor: pointer;
            font-size: 0.875rem;
        }

        .edit-btn {
            background-color: #6366f1;
            color: white;
        }

        .delete-btn {
            background-color: #ef4444;
            color: white;
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

            .users-table {
                display: block;
                overflow-x: auto;
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
            <a href="admin-reports.jsp">Reports</a>
            <a href="admin-users.jsp" class="active">Users</a>
        </nav>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header">
            <h1>Admin Dashboard</h1>
            <div class="user-greeting">
                <span>Hello, Administrator</span>
                <div class="user-icon">A</div>
            </div>
        </header>

        <!-- Dashboard content -->
        <div class="dashboard-content">
            <!-- Stats card -->
            <div class="stats-card">
                <div>
                    <h3>Total Users</h3>
                    <div class="stats-value">87</div>
                </div>
                <div class="chart-icon">📊</div>
            </div>

            <!-- Search and filters -->
            <div class="search-filters">
                <div class="search-container">
                    <span class="search-icon">🔍</span>
                    <input type="text" placeholder="Search Users...">
                </div>
                <div class="filter-container">
                    <select class="filter-select">
                        <option value="">Role</option>
                        <option value="admin">Admin</option>
                        <option value="user">User</option>
                    </select>
                    <select class="filter-select">
                        <option value="">Status</option>
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>
                </div>
            </div>

            <!-- Users section -->
            <div class="users-section">
                <div class="section-header">
                    <h2 class="section-title">
                        <span>System</span> <span>Users</span>
                    </h2>
                    <button class="add-user-btn">+ Add New User</button>
                </div>

                <!-- Users table -->
                <table class="users-table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Joined Date</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Ram Sharma</td>
                        <td>ram.sharma@example.com</td>
                        <td>User</td>
                        <td>Active</td>
                        <td>2023-05-12</td>
                        <td>
                            <div class="user-actions">
                                <button class="action-btn edit-btn">Edit</button>
                                <button class="action-btn delete-btn">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Sita Poudel</td>
                        <td>sita.poudel@example.com</td>
                        <td>User</td>
                        <td>Active</td>
                        <td>2023-06-18</td>
                        <td>
                            <div class="user-actions">
                                <button class="action-btn edit-btn">Edit</button>
                                <button class="action-btn delete-btn">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Hari Thapa</td>
                        <td>hari.thapa@example.com</td>
                        <td>User</td>
                        <td>Inactive</td>
                        <td>2023-04-30</td>
                        <td>
                            <div class="user-actions">
                                <button class="action-btn edit-btn">Edit</button>
                                <button class="action-btn delete-btn">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Gita KC</td>
                        <td>gita.kc@example.com</td>
                        <td>User</td>
                        <td>Active</td>
                        <td>2023-07-05</td>
                        <td>
                            <div class="user-actions">
                                <button class="action-btn edit-btn">Edit</button>
                                <button class="action-btn delete-btn">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Binod Gurung</td>
                        <td>binod.gurung@example.com</td>
                        <td>User</td>
                        <td>Active</td>
                        <td>2023-08-22</td>
                        <td>
                            <div class="user-actions">
                                <button class="action-btn edit-btn">Edit</button>
                                <button class="action-btn delete-btn">Delete</button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
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
        // Add User button click event
        const addUserBtn = document.querySelector('.add-user-btn');
        if (addUserBtn) {
            addUserBtn.addEventListener('click', function() {
                alert('Add User functionality would be implemented here');
            });
        }

        // Edit buttons click events
        const editBtns = document.querySelectorAll('.edit-btn');
        editBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const name = row.cells[0].textContent;
                alert(`Edit user: ${name}`);
            });
        });

        // Delete buttons click events
        const deleteBtns = document.querySelectorAll('.delete-btn');
        deleteBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const name = row.cells[0].textContent;
                const confirmDelete = confirm(`Are you sure you want to delete user: ${name}?`);
                if (confirmDelete) {
                    alert(`User ${name} would be deleted here`);
                }
            });
        });
    });
</script>
</body>
</html>