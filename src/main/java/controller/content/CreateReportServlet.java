package controller.content;

import dao.ReportDAO;
import dao.ReportImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;
import utils.DBUtil;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/createReport")
@MultipartConfig
public class CreateReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Part imagePart = request.getPart("reportImage");

        // Validate inputs
        if (title == null || title.isEmpty() ||
                description == null || description.isEmpty() ||
                imagePart == null || imagePart.getSize() == 0) {
            response.sendRedirect(request.getContextPath() + "/report?error=missing_fields");
            return;
        }

        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // Insert report using DAO
            int reportId = ReportDAO.insertReport(conn, user.getId(), title, description, 1,  1);

            // Insert image using DAO
            try (InputStream imageStream = imagePart.getInputStream()) {
                ReportImageDAO.addReportImage(conn, reportId, imageStream);
            }

            conn.commit(); // Commit transaction
            response.sendRedirect(request.getContextPath() + "/report?success=true");

        } catch (SQLException e) {
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                System.err.println("Rollback failed: " + ex.getMessage());
            }
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/report?error=database_error");
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset autocommit
                    conn.close();
                }
            } catch (SQLException ignored) {}
        }
    }
}