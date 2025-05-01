package controller.content;
import dao.ReportDAO;
import dao.ReportImageDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteReport")
public class DeleteReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int reportId = Integer.parseInt(request.getParameter("id"));
//        int imageId = Integer.parseInt(request.getParameter("imageId"));
        boolean deleted = ReportDAO.deleteReport(reportId);

        //TODO: image is not deleting while deleting the report/either handle it from database of from backend
//        boolean img_deleted = ReportImageDAO.deleteReportImage(imageId);

        if (deleted) {
            response.sendRedirect(request.getContextPath() + "/report?success=report_deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/report?error=delete_failed");
        }
    }
}
