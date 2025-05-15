<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<nav>
    <%@include file="/WEB-INF/view/widgets/navbar.jsp" %>
</nav>
<main>
    <!-- Hero Section -->
    <section class="hero">
        <div class="container">
            <div class="hero">
                <div class="hero-content">
                    <h1>Help Keep Your <span class="highlight">Community</span> Safe and Clean</h1>
                    <p>Report issues and track solutions through the Hamro-Basti platform</p>
                    <a href="${pageContext.request.contextPath}/report" class="btn">View Your Reports</a>
                </div>
                <div class="hero-image">
                    <img src="${pageContext.request.contextPath}/assets/images/report.png" alt="Community illustration">
                </div>
            </div>
        </div>
    </section>

    <!-- Community Section -->
    <section class="community">
        <div class="container">
            <h2>Join Our <span class="highlight">Community</span></h2>
            <p>Together, through the Hamro-Basti app, we can all work to make our communities safer and cleaner. Start today!</p>
            <div class="cta-buttons">
<%--                <a href="${pageContext.request.contextPath}/view/signup.jsp" class="btn">Register Now</a>--%>
                <a href="${pageContext.request.contextPath}/WEB-INF/view/about.jsp" class="btn-outline">Learn More</a>
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
<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
</body>
</html>