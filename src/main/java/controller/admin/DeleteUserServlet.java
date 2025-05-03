package controller.admin;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/delete-user")
public class DeleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        boolean deleted = UserDAO.deleteUser(userId);

        if(deleted) {
            response.sendRedirect(request.getContextPath() + "/admin/users?success=User+deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/users?error=Delete+failed");
        }
    }
}