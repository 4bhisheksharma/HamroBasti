package controller.auth;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import services.AuthService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/signup.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Use AuthService to create user with hashed password
            int userId = AuthService.createUser(fullname, email, password);

            if (userId > 0) {
                // Registration successful, redirect to login page with success message
                request.setAttribute("success", "Registration successful! Please login with your new account.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/login.jsp");
                dispatcher.forward(request, response);
            } else {
                // Registration failed (likely email already exists)
                request.setAttribute("error", "Email already exists. Please use a different email address.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/signup.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            // Handle database error
            request.setAttribute("error", "An error occurred during registration. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/auth/signup.jsp");
            dispatcher.forward(request, response);
        }
    }
}
