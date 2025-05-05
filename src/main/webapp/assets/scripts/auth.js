document.addEventListener('DOMContentLoaded', function() {
    // Common validation functions
    const validateEmail = (email) => {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    };

    const showError = (element, message) => {
        element.textContent = message;
        element.style.display = 'block';
    };

    const clearError = (element) => {
        element.textContent = '';
        element.style.display = 'none';
    };

    const authErrorAlert = document.querySelector('.auth-error-alert');

    if (authErrorAlert) {
        // Clear server error when user starts typing
        emailInput.addEventListener('input', () => {
            if (authErrorAlert) authErrorAlert.remove();
        });

        passwordInput.addEventListener('input', () => {
            if (authErrorAlert) authErrorAlert.remove();
        });
    }

    // Login Form Validation
    const loginForm = document.getElementById('login-form');
    if(loginForm) {
        const emailInput = document.getElementById('email');
        const passwordInput = document.getElementById('password');
        const emailError = document.getElementById('email-error');
        const passwordError = document.getElementById('password-error');

        loginForm.addEventListener('submit', function(e) {
            let isValid = true;

            // Email validation
            if(!validateEmail(emailInput.value.trim())) {
                showError(emailError, 'Please enter a valid email address');
                isValid = false;
            } else {
                clearError(emailError);
            }

            // Password validation
            if(passwordInput.value.trim() === '') {
                showError(passwordError, 'Password cannot be empty');
                isValid = false;
            } else {
                clearError(passwordError);
            }

            if(!isValid) e.preventDefault();
        });
    }

    // Signup Form Validation
    const signupForm = document.querySelector('form[action*="/register"]');
    if(signupForm) {
        const fullnameInput = document.getElementById('fullname');
        const signupEmailInput = document.getElementById('email');
        const signupPasswordInput = document.getElementById('password');
        const confirmPasswordInput = document.getElementById('confirm-password');
        const fullnameError = document.getElementById('fullname-error');
        const signupEmailError = document.getElementById('email-error');
        const signupPasswordError = document.getElementById('password-error');
        const confirmPasswordError = document.getElementById('confirm-password-error');

        signupForm.addEventListener('submit', function(e) {
            let isValid = true;

            // Full Name validation
            if(fullnameInput.value.trim() === '') {
                showError(fullnameError, 'Full name cannot be empty');
                isValid = false;
            } else {
                clearError(fullnameError);
            }

            // Email validation
            if(!validateEmail(signupEmailInput.value.trim())) {
                showError(signupEmailError, 'Please enter a valid email address');
                isValid = false;
            } else {
                clearError(signupEmailError);
            }

            // Password validation
            if(signupPasswordInput.value.trim() === '') {
                showError(signupPasswordError, 'Password cannot be empty');
                isValid = false;
            } else if(signupPasswordInput.value.length < 6) {
                showError(signupPasswordError, 'Password must be at least 6 characters');
                isValid = false;
            } else {
                clearError(signupPasswordError);
            }

            // Confirm Password validation
            if(confirmPasswordInput.value !== signupPasswordInput.value) {
                showError(confirmPasswordError, 'Passwords do not match');
                isValid = false;
            } else {
                clearError(confirmPasswordError);
            }

            if(!isValid) e.preventDefault();
        });
    }

    // Password toggle functionality
    document.querySelectorAll('.password-toggle').forEach(toggle => {
        toggle.addEventListener('click', function() {
            const passwordInput = this.previousElementSibling;
            const type = passwordInput.type === 'password' ? 'text' : 'password';
            passwordInput.type = type;
            this.querySelector('img').src = `${pageContext.request.contextPath}/assets/icons/${
                type === 'password' ? 'eye_icon.png' : 'eye_slash_icon.png'
            }`;
        });
    });
});