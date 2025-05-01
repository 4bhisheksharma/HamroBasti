package dao;

import utils.DBUtil;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReportDAO {
    private static final String INSERT_SQL =
            "INSERT INTO reports (user_id, title, description, priority_id, status_id) " + "VALUES (?, ?, ?, ?, ?)";

    public static int insertReport(Connection conn, int userId, String title, String description, int priorityId, int statusId) throws SQLException {

        try (PreparedStatement ps = conn.prepareStatement(INSERT_SQL, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setInt(4, priorityId);
            ps.setInt(5, statusId);

            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                throw new SQLException("Creating report failed, no ID obtained");
            }
        }
    }

    // Add this method
    public static List<Map<String, Object>> getUserReports(int userId) {
        String sql = "SELECT r.report_id, r.title, r.description, r.created_at, " + "p.label AS priority, s.label AS status " + "FROM reports r " + "JOIN priorities p ON r.priority_id = p.priority_id " + "JOIN report_status s ON r.status_id = s.status_id " + "WHERE r.user_id = ? " + "ORDER BY r.created_at DESC";

        List<Map<String, Object>> reports = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> report = new HashMap<>();
                    report.put("id", rs.getInt("report_id"));
                    report.put("title", rs.getString("title"));
                    report.put("description", rs.getString("description"));
                    report.put("createdAt", rs.getTimestamp("created_at"));
                    report.put("priority", rs.getString("priority"));
                    report.put("status", rs.getString("status"));
                    reports.add(report);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching reports: " + e.getMessage());
        }
        return reports;
    }

    // Get single report with priority and status
    public static Map<String, Object> getReportById(int reportId) {
        String sql = "SELECT r.*, p.label AS priority, s.label AS status " +
                "FROM reports r " +
                "JOIN priorities p ON r.priority_id = p.priority_id " +
                "JOIN report_status s ON r.status_id = s.status_id " +
                "WHERE r.report_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reportId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Map<String, Object> report = new HashMap<>();
                    report.put("id", rs.getInt("report_id"));
                    report.put("title", rs.getString("title"));
                    report.put("description", rs.getString("description"));
                    report.put("createdAt", rs.getTimestamp("created_at"));
                    report.put("priority", rs.getString("priority"));
                    report.put("status", rs.getString("status"));
                    report.put("userId", rs.getInt("user_id"));
                    return report;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching report: " + e.getMessage());
        }
        return null;
    }

    // In ReportDAO.java
    public static boolean updateReport(Connection conn, int reportId, String title, String description) throws SQLException {

        String sql = "UPDATE reports SET title = ?, description = ?  WHERE report_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setInt(3, reportId);

            return ps.executeUpdate() > 0;
        }
    }

//    // In ReportImageDAO.java (keep your existing method)
//    public static void addReportImage(Connection conn, int reportId, InputStream imageInput)
//            throws SQLException {
//
//        try (PreparedStatement ps = conn.prepareStatement(INSERT_SQL,
//                PreparedStatement.RETURN_GENERATED_KEYS)) {
//
//            ps.setInt(1, reportId);
//            ps.setBinaryStream(2, imageInput);
//            ps.executeUpdate();
//        }
//    }

    // Delete report
    public static boolean deleteReport(int reportId) {
        String sql = "DELETE FROM reports WHERE report_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reportId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting report: " + e.getMessage());
            return false;
        }
    }
}
