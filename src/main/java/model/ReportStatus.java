package model;

public class ReportStatus {
    private int statusId;
    private String label;

    public ReportStatus() {}

    public ReportStatus(int statusId, String label) {
        this.statusId = statusId;
        this.label = label;
    }

    // Getters and Setters
    public int getStatusId() { return statusId; }
    public void setStatusId(int statusId) { this.statusId = statusId; }
    public String getLabel() { return label; }
    public void setLabel(String label) { this.label = label; }
}