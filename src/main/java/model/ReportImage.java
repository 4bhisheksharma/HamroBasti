package model;

import java.sql.Timestamp;

/**
 * Model representing an image associated with a report.
 */
public class ReportImage {
    private int imageId;
    private int reportId;
    private byte[] imageBytes;
    private Timestamp createdAt;

    public ReportImage() {
    }

    public ReportImage(int imageId, int reportId, byte[] imageBytes, Timestamp createdAt) {
        this.imageId = imageId;
        this.reportId = reportId;
        this.imageBytes = imageBytes;
        this.createdAt = createdAt;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public byte[] getImageBytes() {
        return imageBytes;
    }

    public void setImageBytes(byte[] imageBytes) {
        this.imageBytes = imageBytes;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "ReportImage{" +
                "imageId=" + imageId +
                ", reportId=" + reportId +
                ", createdAt=" + createdAt +
                '}';
    }
}
