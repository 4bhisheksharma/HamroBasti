package dao;

import model.ReportImage;
import utils.DBUtil;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Object for handling report_images table operations.
 */
public class ReportImageDAO {
    private static final String INSERT_SQL =
            "INSERT INTO report_images (report_id, report_image) VALUES (?, ?)";
    private static final String SELECT_BY_REPORT =
            "SELECT image_id, report_id, report_image, created_at FROM report_images WHERE report_id = ? ORDER BY created_at DESC";
    private static final String DELETE_SQL =
            "DELETE FROM report_images WHERE image_id = ?";

    public static void addReportImage(Connection conn, int reportId, InputStream imageInput)
            throws SQLException {

        String sql = "INSERT INTO report_images (report_id, report_image) VALUES (?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reportId);
            ps.setBinaryStream(2, imageInput);
            ps.executeUpdate();
        }
    }

    // Get all images for a report
    public static List<byte[]> getImagesByReportId(int reportId) {
        String sql = "SELECT report_image FROM report_images WHERE report_id = ?";
        List<byte[]> images = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reportId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    images.add(rs.getBytes("report_image"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching images: " + e.getMessage());
        }
        return images;
    }

    public static boolean deleteReportImage(int imageId) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_SQL)) {
            ps.setInt(1, imageId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting report image: " + e.getMessage());
            return false;
        }
    }
}

