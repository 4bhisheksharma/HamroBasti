<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Users - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}assets/css/admin/admin-users.css">
</head>
<body>
<div class="main-container">
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>

    <!-- Main content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header">
            <h1>Users Management</h1>
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
<%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>

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