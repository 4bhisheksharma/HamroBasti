package controller.admin;
import dao.ReportDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/update-priority")
public class UpdatePriorityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reportId = Integer.parseInt(request.getParameter("reportId"));
        int newPriority = Integer.parseInt(request.getParameter("priority"));

        try {
            ReportDAO.updateReportPriority(reportId, newPriority);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
