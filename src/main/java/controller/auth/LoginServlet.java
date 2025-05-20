package controller.auth;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import java.io.IOException;
import java.sql.SQLException;
import services.AuthService;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if user has a remember-me cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user_email")) {
                    request.setAttribute("remembered_email", cookie.getValue());
                    request.setAttribute("remember_checked", "checked");
                    break;
                }
            }
        }

        // Check for cookie consent
        boolean cookieConsent = false;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cookie_consent") && cookie.getValue().equals("accepted")) {
                    cookieConsent = true;
                    break;
                }
            }
        }
        request.setAttribute("cookieConsent", cookieConsent);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String cookieConsent = request.getParameter("cookie_consent");
        User user = null;

        // Handle cookie consent
        if (cookieConsent != null && cookieConsent.equals("accepted")) {
            Cookie consentCookie = new Cookie("cookie_consent", "accepted");
            consentCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days
            consentCookie.setPath("/");
            response.addCookie(consentCookie);
        }

        try {
            // Use AuthService to validate user with secure password checking
            user = AuthService.validateUser(email, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (user != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("user_id", user.getId());
            session.setAttribute("isLoggedIn", true);

            // Handle remember me functionality with cookies
            if (remember != null && cookieConsent != null && cookieConsent.equals("accepted")) {
                // Create cookies for remembering the user
                Cookie emailCookie = new Cookie("user_email", email);
                emailCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                emailCookie.setPath("/");
                response.addCookie(emailCookie);

                Cookie userIdCookie = new Cookie("user_id", String.valueOf(user.getId()));
                userIdCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
                userIdCookie.setPath("/");
                response.addCookie(userIdCookie);
            }

            // Log the login activity
            String userType = "User";
            if (user.isAdmin()) userType = "Admin";

            if(user.isRegularUser()){
                response.sendRedirect(request.getContextPath() + "/home");
            }
            else if (user.isAdmin()) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            }
        } else {
            // Login failed
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/login.jsp?error=true");
            dispatcher.forward(request, response);
        }
    }
}
