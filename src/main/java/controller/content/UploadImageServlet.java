package controller.content;

import dao.ReportImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

/**
 * Servlet handling image uploads for reports.
 * Returns JSON responses for AJAX integration.
 */
@WebServlet("/uploadImage")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,    // 1 MB
        maxFileSize       = 5 * 1024 * 1024, // 5 MB
        maxRequestSize    = 6 * 1024 * 1024  // 6 MB
)
public class UploadImageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // 1) Validate reportId
        String rid = req.getParameter("reportId");
        if (rid == null || rid.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"success\":false,\"message\":\"Missing reportId\"}");
            return;
        }

        // 2) Retrieve file part
        Part imagePart = req.getPart("reportImage");
        if (imagePart == null || imagePart.getSize() == 0) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("{\"success\":false,\"message\":\"No file uploaded\"}");
            return;
        }

        // 3) Delegate to DAO
        int reportId = Integer.parseInt(rid);
        int imageId = ReportImageDAO.addReportImage(reportId, imagePart.getInputStream());

        // 4) Build JSON response
        if (imageId > 0) {
            resp.getWriter().write(
                    "{\"success\":true,\"message\":\"Image uploaded successfully!\",\"imageId\":" + imageId + "}"
            );
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write(
                    "{\"success\":false,\"message\":\"Upload failed.\"}"
            );
        }
    }
}
