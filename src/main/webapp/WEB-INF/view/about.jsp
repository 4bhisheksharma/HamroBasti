<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/4/2025
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>
<%@include file="/WEB-INF/view/widgets/navbar.jsp" %>

<main>
    <div class="about-container">
        <!-- About Header Section -->
        <div class="about-header">
            <div class="about-content">
                <h1>About <span>Hamro-Basti</span></h1>
                <p>Empowering communities to create safer, cleaner, and more responsive neighborhoods through technology and collaboration</p>
            </div>
            <div class="about-illustration">
                <img src="${pageContext.request.contextPath}/assets/images/aboutUs.png" alt="Community collaboration illustration">
            </div>
        </div>

        <!-- Mission and Vision Section -->
        <div class="mission-vision">
            <div class="info-card">
                <div class="card-icon">
                    <img src="${pageContext.request.contextPath}/assets/images/mission-icon.png" alt="Mission icon">
                </div>
                <h2>Our Mission</h2>
                <p>To create a transparent, efficient, and responsive platform that connects residents with local authorities to address community issues.</p>
            </div>

            <div class="info-card">
                <div class="card-icon">
                    <img src="${pageContext.request.contextPath}/assets/images/vision-icon.png" alt="Vision icon">
                </div>
                <h2>Our Vision</h2>
                <p>A Nepal where every community has the tools and resources to quickly identify, report, and resolve local issues through collaborative efforts.</p>
            </div>
        </div>
    </div>

    <!-- Core Values Section -->
    <section class="values-section">
        <div class="values-container">
            <h2>Our Core Values</h2>

            <div class="values-grid">
                <div class="value-card">
                    <div class="value-icon">
                        <img src="${pageContext.request.contextPath}/assets/images/community-icon.png" alt="Community icon">
                    </div>
                    <h3>Community First</h3>
                    <p>We prioritize the needs and well-being of communities in everything we do.</p>
                </div>

                <div class="value-card">
                    <div class="value-icon">
                        <img src="${pageContext.request.contextPath}/assets/images/accountability-icon.png" alt="Accountability icon">
                    </div>
                    <h3>Accountability</h3>
                    <p>We promote transparency and responsibility at all levels of governance.</p>
                </div>

                <div class="value-card">
                    <div class="value-icon">
                        <img src="${pageContext.request.contextPath}/assets/images/inclusivity-icon.png" alt="Inclusivity icon">
                    </div>
                    <h3>Inclusivity</h3>
                    <p>We ensure our platform is accessible and beneficial to all community members.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Join Us Section -->
    <div class="about-container">
        <div class="join-section">
            <h2>Join Us in Building <span>Better</span> Communities</h2>
            <p>Be part of the solution. Join <a href="signup.jsp">Hamro-Basti</a> today and help make your community safer, cleaner, and more responsive.</p>

            <div class="cta-buttons">
                <a href="register.jsp" class="btn">Register Now</a>
                <a href="contact.jsp" class="btn-outline">Contact Us</a>
            </div>
        </div>

        <!-- Additional About Content (Optional) -->
        <div class="additional-content" style="margin-bottom: 60px;">
            <h2 style="text-align: center; margin-bottom: 30px;">Our Story</h2>

            <div style="display: flex; gap: 30px; align-items: center; margin-bottom: 40px;">
                <div style="flex: 1;">
                    <h3 style="margin-bottom: 15px; font-size: 1.3rem;">How We Started</h3>
                    <p style="line-height: 1.6; color: #555;">Hamro-Basti was founded in 2025 by a group of IIC undergraduade student citizens who wanted to create a more efficient way for communities to report and resolve local issues. What started as a small project in one neighborhood of Kathmandu has now grown to serve multiple communities across Nepal.</p>
                </div>
                <div style="flex: 1; text-align: center;">
                    <img src="${pageContext.request.contextPath}/assets/images/story-image.png" alt="Hamro-Basti founding team" style="max-width: 100%; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                </div>
            </div>

            <div style="display: flex; gap: 30px; align-items: center; flex-direction: row-reverse;">
                <div style="flex: 1;">
                    <h3 style="margin-bottom: 15px; font-size: 1.3rem;">Our Impact</h3>
                    <p style="line-height: 1.6; color: #555;">Since our launch, we've helped resolve over 5,000 community issues, from broken streetlights to garbage collection problems. Our platform has reduced the average resolution time for community issues by 60%, making neighborhoods safer and more livable for everyone.</p>
                </div>
                <div style="flex: 1; text-align: center;">
                    <img src="${pageContext.request.contextPath}/assets/images/impact-image.png" alt="Community impact" style="max-width: 100%; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.1);">
                </div>
            </div>
        </div>
    </div>
</main>

<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>
</body>
</html>

