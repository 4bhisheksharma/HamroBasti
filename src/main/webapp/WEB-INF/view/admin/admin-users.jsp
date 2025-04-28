<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Users - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-style.css">

</head>
<body>
<!-- Include navbar -->
<jsp:include page="/WEB-INF/view/widgets/admin/navbar.jsp" />

<main>
    <div class="admin-container">
        <!-- Admin Header -->
        <div class="admin-header">
            <div class="admin-title">
                <h1>User Management</h1>
                <p>Manage all users in the system</p>
            </div>
            <div class="admin-actions">
                <button id="add-user-btn" class="btn">Add New User</button>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section">
            <div class="filter-header">
                <div class="filter-title">Search & Filter</div>
                <button class="filter-toggle" id="filter-toggle">
                    <span>Show Filters</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"/></svg>
                </button>
            </div>

            <form action="#" method="get" id="filter-form">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="sort" value="id">
                <input type="hidden" name="direction" value="asc">

                <div class="filter-body" id="filter-body" style="display: none;">
                    <div class="filter-group">
                        <label for="search" class="filter-label">Search</label>
                        <input type="text" id="search" name="search" class="filter-control" placeholder="Search by name or email">
                    </div>

                    <div class="filter-group">
                        <label for="role" class="filter-label">Role</label>
                        <select id="role" name="role" class="filter-control">
                            <option value="">All Roles</option>
                            <option value="1">Administrator</option>
                            <option value="2">Community Member</option>
                            <option value="3">Municipal Staff</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="status" class="filter-label">Status</label>
                        <select id="status" name="status" class="filter-control">
                            <option value="">All Statuses</option>
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                            <option value="pending">Pending</option>
                        </select>
                    </div>

                    <div class="filter-group">
                        <label for="records" class="filter-label">Records Per Page</label>
                        <select id="records" name="records" class="filter-control">
                            <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                    </div>
                </div>

                <div class="filter-actions">
                    <button type="button" id="reset-filter-btn" class="btn-outline-sm">Reset</button>
                    <button type="submit" class="btn btn-sm">Apply Filters</button>
                </div>
            </form>
        </div>

        <!-- Users Table -->
        <div class="users-table-container">
            <table class="users-table">
                <thead>
                <tr>
                    <th class="sortable active" data-sort="id">ID</th>
                    <th class="sortable" data-sort="full_name">User</th>
                    <th class="sortable" data-sort="role_id">Role</th>
                    <th class="sortable" data-sort="status">Status</th>
                    <th class="sortable" data-sort="created_at">Created</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- Sample User 1 -->
                <tr>
                    <td>1</td>
                    <td>
                        <div class="user-name">
                            <div class="user-avatar">J</div>
                            <div class="user-info">
                                <div class="user-fullname">John Doe</div>
                                <div class="user-email">john.doe@example.com</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="user-role role-admin">Administrator</div>
                    </td>
                    <td>
                        <div class="user-status status-active">Active</div>
                    </td>
                    <td>Jan 15, 2023</td>
                    <td>
                        <div class="user-actions">
                            <button class="action-btn view-btn" data-user-id="1" title="View User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
                            </button>
                            <button class="action-btn edit-btn" data-user-id="1" title="Edit User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                            </button>
                            <button class="action-btn delete-btn" data-user-id="1" data-user-name="John Doe" title="Delete User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Sample User 2 -->
                <tr>
                    <td>2</td>
                    <td>
                        <div class="user-name">
                            <div class="user-avatar">S</div>
                            <div class="user-info">
                                <div class="user-fullname">Sarah Johnson</div>
                                <div class="user-email">sarah.j@example.com</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="user-role role-staff">Municipal Staff</div>
                    </td>
                    <td>
                        <div class="user-status status-active">Active</div>
                    </td>
                    <td>Feb 22, 2023</td>
                    <td>
                        <div class="user-actions">
                            <button class="action-btn view-btn" data-user-id="2" title="View User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
                            </button>
                            <button class="action-btn edit-btn" data-user-id="2" title="Edit User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                            </button>
                            <button class="action-btn delete-btn" data-user-id="2" data-user-name="Sarah Johnson" title="Delete User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Sample User 3 -->
                <tr>
                    <td>3</td>
                    <td>
                        <div class="user-name">
                            <div class="user-avatar">R</div>
                            <div class="user-info">
                                <div class="user-fullname">Raj Patel</div>
                                <div class="user-email">raj.patel@example.com</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="user-role role-user">Community Member</div>
                    </td>
                    <td>
                        <div class="user-status status-inactive">Inactive</div>
                    </td>
                    <td>Mar 10, 2023</td>
                    <td>
                        <div class="user-actions">
                            <button class="action-btn view-btn" data-user-id="3" title="View User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
                            </button>
                            <button class="action-btn edit-btn" data-user-id="3" title="Edit User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                            </button>
                            <button class="action-btn delete-btn" data-user-id="3" data-user-name="Raj Patel" title="Delete User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Sample User 4 -->
                <tr>
                    <td>4</td>
                    <td>
                        <div class="user-name">
                            <div class="user-avatar">M</div>
                            <div class="user-info">
                                <div class="user-fullname">Maria Garcia</div>
                                <div class="user-email">maria.g@example.com</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="user-role role-staff">Municipal Staff</div>
                    </td>
                    <td>
                        <div class="user-status status-pending">Pending</div>
                    </td>
                    <td>Apr 05, 2023</td>
                    <td>
                        <div class="user-actions">
                            <button class="action-btn view-btn" data-user-id="4" title="View User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
                            </button>
                            <button class="action-btn edit-btn" data-user-id="4" title="Edit User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                            </button>
                            <button class="action-btn delete-btn" data-user-id="4" data-user-name="Maria Garcia" title="Delete User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                            </button>
                        </div>
                    </td>
                </tr>

                <!-- Sample User 5 -->
                <tr>
                    <td>5</td>
                    <td>
                        <div class="user-name">
                            <div class="user-avatar">A</div>
                            <div class="user-info">
                                <div class="user-fullname">Alex Wilson</div>
                                <div class="user-email">alex.w@example.com</div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="user-role role-admin">Administrator</div>
                    </td>
                    <td>
                        <div class="user-status status-active">Active</div>
                    </td>
                    <td>May 18, 2023</td>
                    <td>
                        <div class="user-actions">
                            <button class="action-btn view-btn" data-user-id="5" title="View User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
                            </button>
                            <button class="action-btn edit-btn" data-user-id="5" title="Edit User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
                            </button>
                            <button class="action-btn delete-btn" data-user-id="5" data-user-name="Alex Wilson" title="Delete User">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                            </button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="pagination-container">
            <div class="pagination-info">
                Showing 1 to 5 of 25 users
            </div>
            <div class="pagination">
                <a href="#" class="pagination-item disabled">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M18.41 16.59L13.82 12l4.59-4.59L17 6l-6 6 6 6zM6 6h2v12H6z"/></svg>
                </a>
                <a href="#" class="pagination-item disabled">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/></svg>
                </a>

                <a href="#" class="pagination-item active">1</a>
                <a href="#" class="pagination-item">2</a>
                <a href="#" class="pagination-item">3</a>
                <a href="#" class="pagination-item">4</a>
                <a href="#" class="pagination-item">5</a>

                <a href="#" class="pagination-item">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 6L8.59 7.41 13.17 12l-4.58 4.59L10 18l6-6z"/></svg>
                </a>
                <a href="#" class="pagination-item">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5.59 7.41L10.18 12l-4.59 4.59L7 18l6-6-6-6zM16 6h2v12h-2z"/></svg>
                </a>
            </div>
        </div>
    </div>

    <!-- View User Modal -->
    <div class="modal-backdrop" id="view-user-modal">
        <div class="modal">
            <div class="modal-header">
                <h3 class="modal-title">User Details</h3>
                <button class="modal-close" data-dismiss="modal">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>
                </button>
            </div>
            <div class="modal-body">
                <div id="user-details-content">
                    <div class="user-details-header">
                        <div class="user-details-avatar">J</div>
                        <div class="user-details-info">
                            <h3>John Doe</h3>
                            <p>john.doe@example.com</p>
                            <div class="user-details-badges">
                                <span class="user-role role-admin">Administrator</span>
                                <span class="user-status status-active">Active</span>
                            </div>
                        </div>
                    </div>

                    <div class="user-details-section">
                        <h4>Personal Information</h4>
                        <ul class="details-list">
                            <li class="details-item">
                                <div class="details-label">Phone</div>
                                <div class="details-value">+1 (555) 123-4567</div>
                            </li>
                            <li class="details-item">
                                <div class="details-label">Address</div>
                                <div class="details-value">123 Main Street, Anytown, CA 12345</div>
                            </li>
                            <li class="details-item">
                                <div class="details-label">Bio</div>
                                <div class="details-value">System administrator with over 5 years of experience in community management.</div>
                            </li>
                        </ul>
                    </div>

                    <div class="user-details-section">
                        <h4>Account Information</h4>
                        <ul class="details-list">
                            <li class="details-item">
                                <div class="details-label">User ID</div>
                                <div class="details-value">1</div>
                            </li>
                            <li class="details-item">
                                <div class="details-label">Created At</div>
                                <div class="details-value">January 15, 2023</div>
                            </li>
                            <li class="details-item">
                                <div class="details-label">Last Updated</div>
                                <div class="details-value">June 10, 2023</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn-outline-sm" data-dismiss="modal">Close</button>
                <button class="btn btn-sm" id="edit-from-view-btn">Edit User</button>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal-backdrop" id="edit-user-modal">
        <div class="modal">
            <div class="modal-header">
                <h3 class="modal-title" id="edit-user-title">Edit User</h3>
                <button class="modal-close" data-dismiss="modal">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>
                </button>
            </div>
            <div class="modal-body">
                <form id="edit-user-form" action="#" method="post">
                    <input type="hidden" id="edit-user-id" name="userId" value="1">

                    <div class="form-group">
                        <label for="edit-fullname" class="form-label">Full Name</label>
                        <input type="text" id="edit-fullname" name="fullName" class="form-control" value="John Doe" required>
                    </div>

                    <div class="form-group">
                        <label for="edit-email" class="form-label">Email Address</label>
                        <input type="email" id="edit-email" name="email" class="form-control" value="john.doe@example.com" required>
                    </div>

                    <div class="form-group">
                        <label for="edit-phone" class="form-label">Phone Number</label>
                        <input type="tel" id="edit-phone" name="phone" class="form-control" value="+1 (555) 123-4567">
                    </div>

                    <div class="form-group">
                        <label for="edit-address" class="form-label">Address</label>
                        <input type="text" id="edit-address" name="address" class="form-control" value="123 Main Street, Anytown, CA 12345">
                    </div>

                    <div class="form-group">
                        <label for="edit-role" class="form-label">Role</label>
                        <select id="edit-role" name="roleId" class="form-control" required>
                            <option value="1" selected>Administrator</option>
                            <option value="2">Community Member</option>
                            <option value="3">Municipal Staff</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="edit-status" class="form-label">Status</label>
                        <select id="edit-status" name="status" class="form-control" required>
                            <option value="active" selected>Active</option>
                            <option value="inactive">Inactive</option>
                            <option value="pending">Pending</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="edit-bio" class="form-label">Bio</label>
                        <textarea id="edit-bio" name="bio" class="form-control" rows="3">System administrator with over 5 years of experience in community management.</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn-outline-sm" data-dismiss="modal">Cancel</button>
                <button class="btn btn-sm" id="save-user-btn">Save Changes</button>
            </div>
        </div>
    </div>

    <!-- Delete User Modal -->
    <div class="modal-backdrop" id="delete-user-modal">
        <div class="modal">
            <div class="modal-header">
                <h3 class="modal-title">Delete User</h3>
                <button class="modal-close" data-dismiss="modal">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/></svg>
                </button>
            </div>
            <div class="modal-body">
                <div class="delete-confirmation">
                    <div class="delete-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
                    </div>
                    <h3 class="delete-title">Confirm Deletion</h3>
                    <p class="delete-message">
                        Are you sure you want to delete the user <span class="delete-user-name">John Doe</span>? This action cannot be undone.
                    </p>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn-outline-sm" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-sm" style="background-color: #e74c3c;">Delete User</button>
            </div>
        </div>
    </div>
</main>

<!-- Include footer -->
<jsp:include page="/WEB-INF/view/widgets/admin/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Filter toggle
        const filterToggle = document.getElementById('filter-toggle');
        const filterBody = document.getElementById('filter-body');

        if (filterToggle && filterBody) {
            filterToggle.addEventListener('click', function() {
                const isCollapsed = filterBody.style.display === 'none';
                filterBody.style.display = isCollapsed ? 'flex' : 'none';
                filterToggle.querySelector('span').textContent = isCollapsed ? 'Hide Filters' : 'Show Filters';
                filterToggle.classList.toggle('collapsed', !isCollapsed);
            });
        }

        // Reset filters
        const resetFilterBtn = document.getElementById('reset-filter-btn');
        if (resetFilterBtn) {
            resetFilterBtn.addEventListener('click', function() {
                document.getElementById('search').value = '';
                document.getElementById('role').value = '';
                document.getElementById('status').value = '';
                document.getElementById('records').value = '10';
            });
        }

        // Sortable columns
        const sortableColumns = document.querySelectorAll('.sortable');
        sortableColumns.forEach(column => {
            column.addEventListener('click', function() {
                sortableColumns.forEach(col => col.classList.remove('active', 'desc'));
                this.classList.add('active');
                if (this.getAttribute('data-sort') === document.querySelector('input[name="sort"]').value) {
                    if (document.querySelector('input[name="direction"]').value === 'asc') {
                        document.querySelector('input[name="direction"]').value = 'desc';
                        this.classList.add('desc');
                    } else {
                        document.querySelector('input[name="direction"]').value = 'asc';
                    }
                } else {
                    document.querySelector('input[name="sort"]').value = this.getAttribute('data-sort');
                    document.querySelector('input[name="direction"]').value = 'asc';
                }
            });
        });

        // Modal functionality
        const modals = document.querySelectorAll('.modal-backdrop');
        const modalCloseButtons = document.querySelectorAll('[data-dismiss="modal"]');

        function openModal(modalId) {
            document.getElementById(modalId).classList.add('show');
            document.body.style.overflow = 'hidden';
        }

        function closeModal(modal) {
            modal.classList.remove('show');
            document.body.style.overflow = '';
        }

        modalCloseButtons.forEach(button => {
            button.addEventListener('click', function() {
                const modal = this.closest('.modal-backdrop');
                closeModal(modal);
            });
        });

        modals.forEach(modal => {
            modal.addEventListener('click', function(e) {
                if (e.target === this) {
                    closeModal(this);
                }
            });
        });

        // View user details
        const viewButtons = document.querySelectorAll('.view-btn');
        viewButtons.forEach(button => {
            button.addEventListener('click', function() {
                openModal('view-user-modal');
            });
        });

        // Edit user
        const editButtons = document.querySelectorAll('.edit-btn');
        const editFromViewBtn = document.getElementById('edit-from-view-btn');

        editButtons.forEach(button => {
            button.addEventListener('click', function() {
                openModal('edit-user-modal');
            });
        });

        if (editFromViewBtn) {
            editFromViewBtn.addEventListener('click', function() {
                closeModal(document.getElementById('view-user-modal'));
                openModal('edit-user-modal');
            });
        }

        // Delete user
        const deleteButtons = document.querySelectorAll('.delete-btn');
        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const userName = this.getAttribute('data-user-name');
                document.querySelector('.delete-user-name').textContent = userName;
                openModal('delete-user-modal');
            });
        });

        // Add new user
        const addUserBtn = document.getElementById('add-user-btn');
        if (addUserBtn) {
            addUserBtn.addEventListener('click', function() {
                document.getElementById('edit-user-title').textContent = 'Add New User';
                document.getElementById('edit-user-form').reset();
                openModal('edit-user-modal');
            });
        }
    });
</script>
</body>
</html>