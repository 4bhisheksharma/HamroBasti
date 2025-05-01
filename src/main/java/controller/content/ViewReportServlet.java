package controller.content;

import dao.ReportDAO;
import dao.ReportImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/viewReport")
public class ViewReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int reportId = Integer.parseInt(request.getParameter("id"));
        try {
            // Get report data
            Map<String, Object> report = ReportDAO.getReportById(reportId);

            // Get images as Base64 strings
            List<String> base64Images = ReportImageDAO.getImagesByReportId(reportId)
                    .stream()
                    .map(bytes -> Base64.getEncoder().encodeToString(bytes))
                    .collect(Collectors.toList());

            request.setAttribute("report", report);
            request.setAttribute("images", base64Images);
            request.getRequestDispatcher("/WEB-INF/view/view-report.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/report?error=image_load_failed");
        }
    }
}
