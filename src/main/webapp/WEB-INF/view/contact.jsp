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
    <title>Contact Us - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>
<body>
<%@include file="/WEB-INF/view/widgets/navbar.jsp" %>

<main>
    <!-- Contact Hero Section -->
    <section class="contact-hero">
        <div class="contact-hero-content">
            <h1>Contact <span>Us</span></h1>
            <p>Have questions or need support? We're here to help you with any inquiries about <a href="about.jsp">Hamro-Basti</a>.</p>
        </div>
        <div class="contact-hero-image">
            <img src="${pageContext.request.contextPath}/assets/images/contact.png" alt="Contact illustration">
        </div>
    </section>

    <!-- Contact Information Section -->
    <section class="contact-info-section">
        <div class="contact-info-container">
            <div class="contact-info-card">
                <div class="contact-info-header">
                    <h2>Contact Information</h2>
                </div>

                <div class="contact-info-content">
                    <div class="contact-department">
                        <h3>Department Contacts</h3>

                        <div class="contact-item">
                            <div class="contact-item-title">General Queries</div>
                            <div class="contact-item-value">
                                <img src="${pageContext.request.contextPath}/assets/images/email-icon.png" alt="Email">
                                <a href="mailto:hamro-basti@gmail.com">hamro-basti@gmail.com</a>
                            </div>
                            <div class="contact-item-value">
                                <img src="${pageContext.request.contextPath}/assets/images/phone-icon.png" alt="Phone">
                                <a href="tel:+9770123456789">+977 01-23456789</a>
                            </div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-item-title">Technical Support</div>
                            <div class="contact-item-value">
                                <img src="${pageContext.request.contextPath}/assets/images/email-icon.png" alt="Email">
                                <a href="mailto:hamro-basti-tech@gmail.com">hamro-basti-tech@gmail.com</a>
                            </div>
                            <div class="contact-item-value">
                                <img src="${pageContext.request.contextPath}/assets/images/phone-icon.png" alt="Phone">
                                <a href="tel:+9770123456789">+977 01-23456789</a>
                            </div>
                        </div>

                        <div class="contact-item">
                            <div class="contact-item-title">Business Queries</div>
                            <div class="contact-item-value">
                                <img src="${pageContext.request.contextPath}/assets/images/email-icon.png" alt="Email">
                                <a href="mailto:hamro-basti-bus@gmail.com">hamro-basti-bus@gmail.com</a>
                            </div>
                            <div class="contact-item-value">
                                <img src="${pageContext.request.contextPath}/assets/images/phone-icon.png" alt="Phone">
                                <a href="tel:+9770123456789">+977 01-23456789</a>
                            </div>
                        </div>
                    </div>

                    <div class="office-location">
                        <h3>Office Location</h3>

                        <div class="location-item">
                            <div class="location-item-title">Hamro-Basti Head Office</div>
                            <div class="location-item-value">Morang, Koshi Province, Nepal</div>
                        </div>

                        <div class="location-item">
                            <div class="location-item-title">Mailing Address</div>
                            <div class="location-item-value">Koshi Province, Nepal</div>
                        </div>

                        <div class="location-item office-hours">
                            <div class="location-item-title">Office Hours</div>
                            <div class="location-item-value">Sunday - Friday: 8:00 AM - 5:00 PM</div>
                        </div>

                        <div class="map-container">
                            <img src="${pageContext.request.contextPath}/assets/images/map-marker.png" alt="Map marker">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section class="contact-form-section">
        <div class="contact-form-header">
            <h2>Send Us a Message</h2>
            <p>Fill out the form below and we'll get back to you as soon as possible.</p>
        </div>

        <form class="contact-form" action="contact-process.jsp" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="name">Full Name <span style="color: red;">*</span></label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="email">Email Address <span style="color: red;">*</span></label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" class="form-control">
                </div>

                <div class="form-group">
                    <label for="subject">Subject <span style="color: red;">*</span></label>
                    <input type="text" id="subject" name="subject" class="form-control" required>
                </div>
            </div>

            <div class="form-group">
                <label for="message">Message <span style="color: red;">*</span></label>
                <textarea id="message" name="message" class="form-control" required></textarea>
            </div>

            <div class="form-group">
                <label for="category">Category</label>
                <select id="category" name="category" class="form-control">
                    <option value="general">General Inquiry</option>
                    <option value="support">Technical Support</option>
                    <option value="feedback">Feedback</option>
                    <option value="partnership">Partnership Opportunity</option>
                    <option value="other">Other</option>
                </select>
            </div>

            <div class="form-submit">
                <button type="submit" class="btn">Send Message</button>
            </div>
        </form>
    </section>

    <!-- Call to Action Section -->
    <section class="cta-section">
        <div class="cta-container">
            <h2>Ready to Make a <span>Difference?</span></h2>
            <p>Join hundreds of community members already using <a href="about.jsp">Hamro-Basti</a> to improve their neighborhoods.</p>
            <a href="register.jsp" class="btn">Get Started Today</a>
        </div>
    </section>
</main>

<footer>
    <%@include file="/WEB-INF/view/widgets/footer.jsp" %>
</footer>

</body>
</html>


