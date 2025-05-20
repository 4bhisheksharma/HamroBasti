<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 4/4/2025
  Time: 2:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
<main>
    <div class="auth-container">
        <div class="auth-image">
            <img src="${pageContext.request.contextPath}/assets/images/login_image.png" alt="Login illustration">
        </div>

        <div class="auth-form-container">
            <div class="auth-form-header">
                <h1>Log <span class="highlight">In</span></h1>
                <p>Enter your credentials to access your account</p>
            </div>
            <c:if test="${not empty error}">
                <div class="auth-error-alert">
                        ${error}
                </div>
            </c:if>

            <!-- Cookie Consent Banner (hidden by default, shown when Remember me is clicked) -->
            <c:if test="${cookieConsent != true}">
                <div id="cookie-consent-banner" style="display: none; background-color: #f8f9fa; padding: 15px; border-radius: 5px; margin-bottom: 20px; border: 1px solid #ddd;">
                    <h4 style="margin-top: 0;">Cookie Notice</h4>
                    <p>Hamro-Basti use cookies to enhance your experience. By accepting you agree to our use of cookies.</p>
                    <div style="display: flex; gap: 10px; margin-top: 10px;">
                        <button id="accept-cookies" type="button" style="background-color: #4CAF50; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer;">Accept Cookies</button>
                        <button id="reject-cookies" type="button" style="background-color: #f44336; color: white; border: none; padding: 8px 15px; border-radius: 4px; cursor: pointer;">Reject Cookies</button>
                    </div>
                </div>
            </c:if>

            <form id="login-form" class="auth-form" action="${pageContext.request.contextPath}/login" method="post">
                <input type="hidden" id="cookie_consent" name="cookie_consent" value="${cookieConsent ? 'accepted' : ''}">

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" class="form-control" value="${remembered_email}" required>
                    <div class="error-message" id="email-error"></div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="password-input-container">
                        <input type="password" id="password" name="password" class="form-control" required>
                        <span class="password-toggle" id="password-toggle">
                                <img src="${pageContext.request.contextPath}/assets/icons/eye_icon.png" alt="Show password">
                            </span>
                    </div>
                    <div class="error-message" id="password-error"></div>
                </div>

                <div class="form-options">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" name="remember" ${remember_checked}>
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="#" class="forgot-password">Forgot password?</a>
                </div>

                <button type="submit" class="btn auth-btn">Log In</button>

                <div class="auth-divider">
                    <span>OR</span>
                </div>

                <div class="auth-footer">
                    <p>Don't have an account? <a href="${pageContext.request.contextPath}/register" class="highlight">Sign up</a></p>
                </div>
            </form>
        </div>
    </div>
</main>

<script>
    // Cookie consent functionality
    document.addEventListener('DOMContentLoaded', function() {
        const acceptBtn = document.getElementById('accept-cookies');
        const rejectBtn = document.getElementById('reject-cookies');
        const cookieConsentInput = document.getElementById('cookie_consent');
        const cookieBanner = document.getElementById('cookie-consent-banner');
        const rememberCheckbox = document.getElementById('remember');

        // Show cookie banner when Remember me is clicked
        if (rememberCheckbox && cookieBanner) {
            rememberCheckbox.addEventListener('change', function() {
                if (this.checked && cookieConsentInput.value !== 'accepted') {
                    cookieBanner.style.display = 'block';
                }
            });
        }

        if (acceptBtn) {
            acceptBtn.addEventListener('click', function() {
                cookieConsentInput.value = 'accepted';
                if (cookieBanner) {
                    cookieBanner.style.display = 'none';
                }
            });
        }

        if (rejectBtn) {
            rejectBtn.addEventListener('click', function() {
                cookieConsentInput.value = 'rejected';
                if (cookieBanner) {
                    cookieBanner.style.display = 'none';
                }
            });
        }
    });
</script>

<script src="${pageContext.request.contextPath}/assets/scripts/auth.js"></script>
</body>
</html>
