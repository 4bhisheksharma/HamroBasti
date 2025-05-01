package controller.content;

import dao.ReportDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ReportServlet", value = "/report")
public class ReportServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        // Fetch user's reports
        List<Map<String, Object>> reports = ReportDAO.getUserReports(user.getId());
        request.setAttribute("reports", reports);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/report.jsp");
        dispatcher.forward(request, response);
    }

}
