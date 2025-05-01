package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportDAO {
    private static final String INSERT_SQL =
            "INSERT INTO reports (user_id, title, description, priority_id, status_id) " +
                    "VALUES (?, ?, ?, ?, ?)";

    public static int insertReport(Connection conn, int userId, String title,
                                   String description, int priorityId, int statusId)
            throws SQLException {

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
}
