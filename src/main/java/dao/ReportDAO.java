package dao;

import utils.DBUtil;

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
}
