package controller.auth;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = null;

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