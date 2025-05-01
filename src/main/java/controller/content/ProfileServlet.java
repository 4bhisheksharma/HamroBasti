package controller.content;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.User;

import java.io.*;
import java.sql.SQLException;

@WebServlet(name = "ProfileServlet", value = "/profile")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,    // 2MB
        maxFileSize = 1024 * 1024 * 10,     // 10MB
        maxRequestSize = 1024 * 1024 * 100  // 100MB
)
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        try {
            User user = UserDAO.getUserById(userId);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/WEB-INF/view/user-profile.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("DB error fetching user", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        try {
            // Extract fields from multipart request
            String fullName = null;
            String bio = null;
            byte[] imageBytes = new byte[0];

            // Iterate over all parts to get form data
            for (Part part : req.getParts()) {
                String partName = part.getName();

                if (partName.equals("name")) {
                    fullName = readPartValue(part); // Read text input
                } else if (partName.equals("bio")) {
                    bio = readPartValue(part); // Read textarea
                } else if (partName.equals("profileImage")) {
                    // Read image bytes only if a file is uploaded
                    if (part.getSize() > 0) {
                        imageBytes = readPartBytes(part);
                    }
                }
            }

            // Validate required fields
            if (fullName == null || fullName.trim().isEmpty()) {
                resp.sendRedirect(req.getContextPath() + "/profile?error=name_required");
                return;
            }

            // Fetch existing user and update data
            User currentUser = UserDAO.getUserById(userId);
            currentUser.setFullName(fullName);
            currentUser.setBio(bio != null ? bio : ""); // Handle null bio
            if (imageBytes.length > 0) {
                currentUser.setUserImage(imageBytes);
            }

            // Save to database
            boolean isUpdated = UserDAO.updateUser(currentUser);
            if (isUpdated) {
                resp.sendRedirect(req.getContextPath() + "/profile?success=true");
            } else {
                resp.sendRedirect(req.getContextPath() + "/profile?error=update_failed");
            }
        } catch (SQLException e) {
            throw new ServletException("Database error during update", e);
        }
    }

    // Helper method to read text from a part
    private String readPartValue(Part part) throws IOException {
        try (InputStream input = part.getInputStream()) {
            return new BufferedReader(new InputStreamReader(input)).readLine();
        }
    }

    // Helper method to read bytes from a part (e.g., image)
    private byte[] readPartBytes(Part part) throws IOException {
        try (InputStream input = part.getInputStream();
             ByteArrayOutputStream output = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
            return output.toByteArray();
        }
    }
}