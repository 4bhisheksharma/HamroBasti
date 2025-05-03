package controller.admin;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import dao.ReportDAO;

@WebServlet("/admin/update-status")
public class UpdateStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reportId = Integer.parseInt(request.getParameter("reportId"));
        int newStatus = Integer.parseInt(request.getParameter("status"));

        try {
            ReportDAO.updateReportStatus(reportId, newStatus);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/admin/dashboard");
    }
}
