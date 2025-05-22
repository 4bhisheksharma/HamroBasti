<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Page Not Found - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <style>
        .error-container {
            text-align: center;
            padding: 100px 20px;
            max-width: 800px;
            margin: 0 auto;
        }

        .error-code {
            font-size: 120px;
            font-weight: bold;
            color: var(--primary-color);
            margin-bottom: 20px;
            line-height: 1;
        }

        .error-message {
            font-size: 24px;
            margin-bottom: 30px;
        }

        .error-description {
            margin-bottom: 40px;
            color: #666;
        }

        .error-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 40px;
        }

        .search-container {
            max-width: 500px;
            margin: 0 auto 40px;
        }

        .search-form {
            display: flex;
            gap: 10px;
        }

        .search-input {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 16px;
        }

        .helpful-links {
            margin-top: 40px;
        }

        .helpful-links h3 {
            margin-bottom: 15px;
        }

        .links-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            text-align: left;
        }

    </style>
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-logo">
            <a href="${pageContext.request.contextPath}/index.jsp">हाम्रो-बस्ती</a>
        </div>
        <div class="navbar-menu">
            <ul class="navbar-items">
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/login">Report</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/about">AboutUs</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/contact">ContactUs</a></li>
            </ul>
        </div>
        <div class="navbar-auth">
            <a href="${pageContext.request.contextPath}/login" class="login-btn">Log In</a>
            <a href="${pageContext.request.contextPath}/register" class="signup-btn">Sign Up</a>
        </div>
        <div class="mobile-menu-toggle" id="mobile-menu-toggle">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div class="mobile-menu" id="mobile-menu">
        <ul class="mobile-menu-items">
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/login">Report</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/about">AboutUs</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/contact">ContactUs</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/login">Log In</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/register">Sign Up</a></li>
        </ul>
    </div>
</nav>

<main>
    <div class="error-container">
        <div class="error-code">404</div>
        <h1 class="error-message">Page Not Found</h1>
        <p class="error-description">
            The page you are looking for might have been removed, had its name changed, 
            or is temporarily unavailable. Please check the URL or try one of the options below.
        </p>

        <div class="error-actions">
            <a href="javascript:history.back()" class="btn">Go Back</a>
        </div>

    </div>
</main>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>Hamro-Basti</h3>
            <p>Community-based platform reporting and resolving issues</p>
        </div>

        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/login">Report</a></li>
                <li><a href="${pageContext.request.contextPath}/about">AboutUs</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">ContactUs</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Contact</h3>
            <p>info@hamro-basti.np</p>
            <p>+977-01-23456789</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 Hamro-Basti. All rights reserved.</p>
        <p>V: 1.1</p>
    </div>
</footer>

<script>
    // Mobile menu toggle functionality
    document.addEventListener('DOMContentLoaded', function() {
        const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
        const mobileMenu = document.getElementById('mobile-menu');

        if (mobileMenuToggle && mobileMenu) {
            mobileMenuToggle.addEventListener('click', function() {
                mobileMenu.classList.toggle('active');
                mobileMenuToggle.classList.toggle('active');
            });
        }
    });
</script>
</body>
</html>
