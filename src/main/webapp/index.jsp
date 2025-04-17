<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
</head>
<body>
<nav class="navbar">
    <div class="navbar-container">
        <div class="navbar-logo">
            <a href="index.jsp">हाम्रो-बस्ती</a>
        </div>
        <div class="navbar-menu">
            <ul class="navbar-items">
                <li class="navbar-item"><a href="index.jsp">Home</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/login">Report</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/login">AboutUs</a></li>
                <li class="navbar-item"><a href="${pageContext.request.contextPath}/login">ContactUs</a></li>
            </ul>
        </div>
        <div class="navbar-auth">
            <a href="${pageContext.request.contextPath}/login" class="login-btn">Log In</a>
            <a href="${pageContext.request.contextPath}/login" class="signup-btn">Sign Up</a>
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
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/login">AboutUs</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/login">ContactUs</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/login">Log In</a></li>
            <li class="mobile-menu-item"><a href="${pageContext.request.contextPath}/login">Sign Up</a></li>
        </ul>
    </div>
</nav>
<main>
    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero">
                <div class="hero-content">
                    <h1>Help Keep Your <span class="highlight">Community</span> Safe and Clean</h1>
                    <p>Report issues and track solutions through the Hamro-Basti platform</p>
                    <a href="${pageContext.request.contextPath}/login" class="btn">Report an Issue</a>
                </div>
                <div class="hero-image">
                    <img src="${pageContext.request.contextPath}/assets/images/report.png" alt="Community illustration">
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="container">
            <h2>Key <span class="highlight">Features</span></h2>
            <div class="feature-cards">
                <div class="feature-card">
                    <div class="feature-icon">
                        <img src="${pageContext.request.contextPath}/assets/icons/report_icon.png" alt="Report icon">
                    </div>
                    <h3>Local Issue Reporting</h3>
                    <p>Report hyper-specific issues like vandalism, stray animals, garbage, broken streetlights, and damaged roads</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">
                        <img src="${pageContext.request.contextPath}/assets/icons/image_icon.png" alt="Image icon">
                    </div>
                    <h3>Image-Based Reporting</h3>
                    <p>Report hyper-specific issues like stray animals, garbage, broken streetlights, and damaged roads with images</p>
                </div>

                <div class="feature-card">
                    <div class="feature-icon">
                        <img src="${pageContext.request.contextPath}/assets/icons/update_icon.png" alt="Update icon">
                    </div>
                    <h3>Progress Updates</h3>
                    <p>Track report status and receive notifications when reported authorities update progress and resolve issues</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Community Section -->
    <section class="community">
        <div class="container">
            <h2>Join Our <span class="highlight">Community</span></h2>
            <p>Together through the Hamro-Basti app, we can all work to make our communities safer and cleaner. Start today!</p>
            <div class="cta-buttons">
                <a href="${pageContext.request.contextPath}/login" class="btn">Register Now</a>
                <a href="${pageContext.request.contextPath}/login" class="btn-outline">Learn More</a>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works">
        <div class="container">
            <h2>How It Works</h2>
            <p>Our platform makes it easy to report issues and get them resolved quickly</p>

            <div class="steps">
                <div class="step">
                    <div class="step-number">1</div>
                    <h3>Report an Issue</h3>
                    <p>Simply submit the details of the problem</p>
                </div>

                <div class="step">
                    <div class="step-number">2</div>
                    <h3>Verification</h3>
                    <p>Admins verify and prioritize reports</p>
                </div>

                <div class="step">
                    <div class="step-number">3</div>
                    <h3>Resolution</h3>
                    <p>Authorities work to resolve the issue</p>
                </div>

                <div class="step">
                    <div class="step-number">4</div>
                    <h3>Confirmation</h3>
                    <p>Users confirm as resolved and completed</p>
                </div>
            </div>
        </div>
    </section>
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
                <li><a href="${pageContext.request.contextPath}/login">AboutUs</a></li>
                <li><a href="${pageContext.request.contextPath}/login">ContactUs</a></li>

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
        <p>V: 1.1(Abhishek branch)</p>
    </div>
</footer>
</body>
</html>