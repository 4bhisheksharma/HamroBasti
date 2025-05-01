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
@WebServlet(name  = "UploadImageServlet", value = "/uploadImage")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,    // 2 MB
        maxFileSize       = 10 * 1024 * 1024, // 10 MB
        maxRequestSize    = 50 * 1024 * 1024  // 50 MB
)
public class UploadImageServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
