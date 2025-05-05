// this class is not used***

//package controller.admin;

//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.User;
//import services.AuthService;
//
//import java.io.IOException;
//
//@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboardd"})
//public class AdminDashboardServlet extends HttpServlet {
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        // Forward to the dashboard page
//        request.getRequestDispatcher("/WEB-INF/view/admin/admin-dashboard.jsp").forward(request, response);
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//
//        if (user == null) {
//            response.sendRedirect(request.getContextPath() + "/login");
//            return;
//        }
//    }
//
//}
