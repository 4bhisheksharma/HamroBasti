package controller.admin;

import dao.ReportDAO;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/admin/delete-report")
public class DeleteReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int reportId = Integer.parseInt(request.getParameter("reportId"));
        ReportDAO.deleteReport(reportId);
        response.sendRedirect(request.getContextPath() + "/admin/dashboard"); // Redirect back
    }
}
