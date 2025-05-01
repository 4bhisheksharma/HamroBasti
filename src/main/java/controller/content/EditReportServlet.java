package controller.content;
import dao.ReportDAO;
import dao.ReportImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import utils.DBUtil;

@WebServlet("/editReport")
@MultipartConfig
public class EditReportServlet extends HttpServlet {

    // Display edit form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int reportId = Integer.parseInt(request.getParameter("id"));
        Map<String, Object> report = ReportDAO.getReportById(reportId);

        if (report != null) {
            request.setAttribute("report", report);
            request.getRequestDispatcher("/WEB-INF/view/edit-report.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/report?error=report_not_found");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection conn = null;
        try {
            // Get database connection and manage transaction
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // Get form parameters
            int reportId = Integer.parseInt(request.getParameter("reportId"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            Part imagePart = request.getPart("image");

            // 1. Update report details
            boolean reportUpdated = ReportDAO.updateReport(
                    conn, // Pass connection
                    reportId,
                    title,
                    description
            );

            // 2. Update image if provided
            if (imagePart != null && imagePart.getSize() > 0) {
                try (InputStream imageStream = imagePart.getInputStream()) {
                    ReportImageDAO.addReportImage(conn, reportId, imageStream);
                }
            }

            // Commit transaction if both operations succeeded
            if (reportUpdated) {
                conn.commit();
                response.sendRedirect(request.getContextPath() + "/viewReport?id=" + reportId + "&success=true");
            } else {
                conn.rollback();
                response.sendRedirect(request.getContextPath() + "/editReport?id=" + reportId + "&error=update_failed");
            }

        } catch (SQLException | NumberFormatException e) {
            // Rollback on error
            try { if (conn != null) conn.rollback(); } catch (SQLException ex) {}
            e.printStackTrace(); // Log error
            response.sendRedirect(request.getContextPath() + "/report?error=database_error");
        } finally {
            // Cleanup resources
            try {
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset autocommit
                    conn.close();
                }
            } catch (SQLException ignored) {}
        }
    }
}
