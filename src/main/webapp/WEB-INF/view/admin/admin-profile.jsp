<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Profile - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin/admin-dashboard.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div class="layout-container">
    <!-- Include Sidebar -->
    <%@include file="/WEB-INF/view/widgets/admin/navbar.jsp" %>

    <!-- Main Content -->
    <div class="main-content" id="main-content">
        <header class="header">
            <div class="header-left">
                <button class="sidebar-toggle" id="sidebar-toggle">
                    <i class="fas fa-bars"></i>
                </button>
                <h1>Profile</h1>
            </div>
            <div class="user-info">
                <span>Hello, Administrator</span>
                <div class="profile-icon">
                    <span>A</span>
                </div>
            </div>
        </header>

        <div class="dashboard-container">
            <div class="profile-container">
                <div class="profile-header">
                    <h2>Your Profile</h2>
                </div>

                <div class="profile-content">
                    <div class="avatar-section">
                        <c:choose>
                            <c:when test="${not empty user.userImage}">
                                <img src="data:image/jpeg;base64,${user.userImageAsBase64}"
                                     class="avatar-preview"
                                     alt="Profile Avatar"
                                     id="avatarPreview">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/assets/images/placeholder_profile.png"
                                     class="avatar-preview"
                                     alt="Default Avatar"
                                     id="avatarPreview">
                            </c:otherwise>
                        </c:choose>
                        <label for="profileImage" class="btn-save mt-3">
                            <i class="fas fa-camera"></i> Change Photo
                        </label>
                    </div>

                    <form action="${pageContext.request.contextPath}/admin/profile" method="post" enctype="multipart/form-data">
                        <input type="file" name="profileImage" id="profileImage" accept="image/*" hidden>
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text"
                                   id="name"
                                   name="name"
                                   class="form-control"
                                   value="${user.fullName}"
                                   required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email"
                                   id="email"
                                   name="email"
                                   class="form-control"
                                   value="${user.email}"
                                   readonly>
                        </div>

                        <div class="form-group">
                            <label for="bio">Bio</label>
                            <textarea id="bio"
                                      name="bio"
                                      class="form-control"
                                      rows="3">${user.bio}</textarea>
                        </div>

                        <div class="form-group">
                            <label for="createdat">Member Since</label>
                            <input type="text"
                                   id="createdat"
                                   class="form-control"
                                   value="<c:choose>
                                <c:when test="${not empty user.createdAt}">
                                    <fmt:formatDate value="${user.createdAt}" pattern="MMMM dd, yyyy"/>
                                </c:when>
                                <c:otherwise>
                                    Not available
                                </c:otherwise>
                            </c:choose>"
                                   readonly>
                        </div>

                        <div class="form-group">
                            <label for="role">Role</label>
                            <input type="text"
                                   id="role"
                                   class="form-control"
                                   value="<c:choose>
                                <c:when test="${user.roleId == 1}">Resident</c:when>
                                <c:when test="${user.roleId == 2}">Admin</c:when>
                                <c:otherwise>Unknown Role</c:otherwise>
                            </c:choose>"
                                   readonly>
                        </div>

                        <div class="d-flex gap-3">
                            <button type="submit" class="btn-save">
                                <i class="fas fa-save"></i> Save Changes
                            </button>
                            <a href="${pageContext.request.contextPath}/admin/dashboard" class="btn-save" style="background-color: var(--text-light);">
                                <i class="fas fa-arrow-left"></i> Back to Dashboard
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Include Footer -->
        <%@include file="/WEB-INF/view/widgets/admin/footer.jsp" %>
    </div>
</div>

<script>
    // Image preview functionality
    document.getElementById('profileImage').addEventListener('change', function(e) {
        const reader = new FileReader();
        reader.onload = function() {
            document.getElementById('avatarPreview').src = reader.result;
        }
        reader.readAsDataURL(e.target.files[0]);
    });
</script>
</body>
</html>
