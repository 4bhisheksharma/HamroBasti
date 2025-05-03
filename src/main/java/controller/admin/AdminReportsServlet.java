package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Priority;
import model.ReportStatus;
import model.User;
import dao.ReportDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminReportsServlet", urlPatterns = {"/admin/dashboard"})
public class AdminReportsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.isAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            // Get all reports with user info
            List<Map<String, Object>> allReports = ReportDAO.getAllReportsWithUserInfo();

            // Get status counts for stats
            Map<String, Integer> statusCounts = ReportDAO.getStatusCounts();

            // Get all possible statuses and priorities
            List<ReportStatus> allStatuses = ReportDAO.getAllStatuses();
            List<Priority> allPriorities = ReportDAO.getAllPriorities();

            request.setAttribute("allReports", allReports);
            request.setAttribute("statusCounts", statusCounts);
            request.setAttribute("totalReports", allReports.size());
            request.setAttribute("allStatuses", allStatuses);
            request.setAttribute("allPriorities", allPriorities);

            request.getRequestDispatcher("/WEB-INF/view/admin/admin-dashboard.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new ServletException("Database error", e);
        }
    }
}
