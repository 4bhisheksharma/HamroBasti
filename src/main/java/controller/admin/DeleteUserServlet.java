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

@WebServlet("/admin/delete-user")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        // Get current logged-in user from session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        // Check if admin is trying to delete their own account
        if (currentUser != null && currentUser.getId() == userId) {
            response.sendRedirect(request.getContextPath() + "/admin/users?error=You+cannot+delete+your+own+account");
            return;
        }

        boolean deleted = UserDAO.deleteUser(userId);

        if(deleted) {
            response.sendRedirect(request.getContextPath() + "/admin/users?success=User+deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/users?error=Delete+failed");
        }
    }
}
