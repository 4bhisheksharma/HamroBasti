<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Hamro-Basti</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">
</head>
<body>
<main>
    <div class="auth-container">
        <div class="auth-image">
            <img src="${pageContext.request.contextPath}/assets/images/signup_image.png" alt="Sign up illustration">
        </div>

        <div class="auth-form-container">
            <div class="auth-form-header">
                <h1>Create <span class="highlight">Account</span></h1>
                <p>Fill in your details to get started</p>
            </div>

            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" required>
                    <div class="error-message" id="fullname-error"></div>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" class="form-control" required>
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

                <div class="form-group">
                    <label for="confirm-password">Confirm Password</label>
                    <div class="password-input-container">
                        <input type="password" id="confirm-password" name="confirmPassword" class="form-control" required>
                        <span class="password-toggle" id="confirm-password-toggle">
                                <img src="${pageContext.request.contextPath}/assets/icons/eye_icon.png" alt="Show password">
                            </span>
                    </div>
                    <div class="error-message" id="confirm-password-error"></div>
                </div>

                <button type="submit" class="btn auth-btn">Create Account</button>

                <div class="auth-divider">
                    <span>OR</span>
                </div>


                <div class="auth-footer">
                    <p>Already have an account? <a href="${pageContext.request.contextPath}/login" class="highlight">Sign in</a></p>
                </div>
            </form>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/assets/scripts/auth.js"></script>
</body>
</html>
