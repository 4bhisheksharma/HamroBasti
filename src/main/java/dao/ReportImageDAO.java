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
            "INSERT INTO report_images (report_id, image) VALUES (?, ?)";
    private static final String SELECT_BY_REPORT =
            "SELECT image_id, report_id, image, created_at FROM report_images WHERE report_id = ? ORDER BY created_at DESC";
    private static final String DELETE_SQL =
            "DELETE FROM report_images WHERE image_id = ?";

    /**
     * Inserts a new image for a given report into the database.
     * @param reportId ID of the report to associate
     * @param imageInput InputStream of the image data
     * @return generated image_id, or -1 on failure
     */
    public static int addReportImage(int reportId, InputStream imageInput) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, reportId);
            ps.setBlob(2, imageInput);
            int affected = ps.executeUpdate();
            if (affected > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) {
                        return keys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error inserting report image: " + e.getMessage());
        }
        return -1;
    }

    /**
     * Retrieves all images associated with a specific report.
     * @param reportId the report ID to filter by
     * @return List of ReportImage objects
     */
    public static List<ReportImage> getImagesByReportId(int reportId) {
        List<ReportImage> images = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_REPORT)) {
            ps.setInt(1, reportId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ReportImage img = new ReportImage();
                    img.setImageId(rs.getInt("image_id"));
                    img.setReportId(rs.getInt("report_id"));
                    img.setImageBytes(rs.getBytes("image"));
                    img.setCreatedAt(rs.getTimestamp("created_at"));
                    images.add(img);
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching report images: " + e.getMessage());
        }
        return images;
    }

    /**
     * Deletes an image by its ID.
     * @param imageId the ID of the image to delete
     * @return true if deletion succeeded
     */
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

