package controller.admin;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet(name = "AdminProfileServlet", urlPatterns = {"/admin/profile"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 5,   // 5MB
        maxRequestSize = 1024 * 1024 * 5 // 5MB
)
public class AdminProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // Check authentication first
        if (user == null || !user.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Forward to profile page
        request.getRequestDispatcher("/WEB-INF/view/admin/admin-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Get form data
            String fullName = request.getParameter("name");
            String bio = request.getParameter("bio");

            // Handle file upload
            Part filePart = request.getPart("profileImage");
            if (filePart != null && filePart.getSize() > 0) {
                try (InputStream fileContent = filePart.getInputStream()) {
                    user.setUserImage(fileContent.readAllBytes());
                }
            }

            // Update user details
            user.setFullName(fullName);
            user.setBio(bio);

            // Save to database
            if (UserDAO.updateUser(user)) {
                // Refresh session data
                User updatedUser = UserDAO.getUserById(user.getId());
                session.setAttribute("user", updatedUser);
                session.setAttribute("success", "Profile updated successfully");
            } else {
                session.setAttribute("error", "Failed to update profile");
            }

        } catch (SQLException | IOException e) {
            session.setAttribute("error", "Error updating profile: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin/profile");
    }
}