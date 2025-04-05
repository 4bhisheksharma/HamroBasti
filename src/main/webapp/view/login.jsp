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

            <form id="login-form" class="auth-form" action="login-process.jsp" method="post">
                <div class="form-group">
                    <label for="username">Username or Email</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                    <div class="error-message" id="username-error"></div>
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
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="forgot-password.jsp" class="forgot-password">Forgot password?</a>
                </div>

                <button type="submit" class="btn auth-btn">Log In</button>

                <div class="auth-divider">
                    <span>OR</span>
                </div>

<%--                <div class="social-login">--%>
<%--                    <button type="button" class="social-btn google-btn">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/google-icon.png" alt="Google">--%>
<%--                        <span>Continue with Google</span>--%>
<%--                    </button>--%>
<%--                    <button type="button" class="social-btn facebook-btn">--%>
<%--                        <img src="${pageContext.request.contextPath}/assets/images/facebook-icon.png" alt="Facebook">--%>
<%--                        <span>Continue with Facebook</span>--%>
<%--                    </button>--%>
<%--                </div>--%>

                <div class="auth-footer">
                    <p>Don't have an account? <a href="signup.jsp" class="highlight">Sign up</a></p>
                </div>
            </form>
        </div>
    </div>
</main>
</body>
</html>
