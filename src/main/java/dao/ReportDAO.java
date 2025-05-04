package dao;

import model.Priority;
import model.ReportStatus;
import utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

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

    // Get a single report with priority and status
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
            e.printStackTrace(); // Log the error
            return false;
        }
    }

    public static List<Map<String, Object>> getAllReportsWithUserInfo() throws SQLException {
        String sql = "SELECT r.*, u.full_name AS userFullName, p.label AS priority, s.label AS status "
                + "FROM reports r "
                + "JOIN users u ON r.user_id = u.user_id "
                + "JOIN priorities p ON r.priority_id = p.priority_id "
                + "JOIN report_status s ON r.status_id = s.status_id "
                + "ORDER BY r.created_at DESC";

        List<Map<String, Object>> reports = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> report = new HashMap<>();
                report.put("reportId", rs.getInt("report_id"));
                report.put("title", rs.getString("title"));
                report.put("description", rs.getString("description"));
                report.put("userFullName", rs.getString("userFullName"));
                report.put("statusId", rs.getInt("status_id"));
                report.put("priorityId", rs.getInt("priority_id"));
                report.put("images", getReportImages(rs.getInt("report_id")));
                reports.add(report);
            }
        }
        return reports;
    }

    public static List<String> getReportImages(int reportId) {
        String sql = "SELECT report_image FROM report_images WHERE report_id = ?";
        List<String> images = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reportId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                byte[] imageBytes = rs.getBytes("report_image");
                images.add(Base64.getEncoder().encodeToString(imageBytes));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return images;
    }

    public static Map<String, Integer> getStatusCounts() throws SQLException {
        String sql = "SELECT s.label, COUNT(*) as count "
                + "FROM reports r "
                + "JOIN report_status s ON r.status_id = s.status_id "
                + "GROUP BY s.label";

        Map<String, Integer> counts = new HashMap<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                counts.put(rs.getString("label"), rs.getInt("count"));
            }
        }
        return counts;
    }

    public static void updateReportStatus(int reportId, int statusId) throws SQLException {
        String sql = "UPDATE reports SET status_id = ? WHERE report_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, statusId);
            ps.setInt(2, reportId);
            ps.executeUpdate();
        }
    }

    public static void updateReportPriority(int reportId, int priorityId) throws SQLException {
        String sql = "UPDATE reports SET priority_id = ? WHERE report_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, priorityId);
            ps.setInt(2, reportId);
            ps.executeUpdate();
        }
    }

    // In ReportDAO.java
    public static List<ReportStatus> getAllStatuses() throws SQLException {
        String sql = "SELECT * FROM report_status";
        List<ReportStatus> statuses = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ReportStatus status = new ReportStatus();
                status.setStatusId(rs.getInt("status_id"));
                status.setLabel(rs.getString("label"));
                statuses.add(status);
            }
        }
        return statuses;
    }

    public static List<Priority> getAllPriorities() throws SQLException {
        String sql = "SELECT * FROM priorities";
        List<Priority> priorities = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Priority priority = new Priority();
                priority.setPriorityId(rs.getInt("priority_id"));
                priority.setLabel(rs.getString("label"));
                priorities.add(priority);
            }
        }
        return priorities;
    }
}
