package controller.admin;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminUsersServlet", urlPatterns = {"/admin/users"})
public class AdminUsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check authentication and admin role
        if (user == null || !user.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Get all users
            List<User> users = UserDAO.getAllUsers();
            request.setAttribute("users", users);
            request.setAttribute("totalUsers", users.size());

        } catch (SQLException e) {
            request.setAttribute("error", "Error fetching users: " + e.getMessage());
        }

        request.getRequestDispatcher("/WEB-INF/view/admin/admin-users.jsp").forward(request, response);
    }
}