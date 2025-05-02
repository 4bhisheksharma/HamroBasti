package model;

public class Priority {
    private int priorityId;
    private String label;

    public Priority() {}

    public Priority(int priorityId, String label) {
        this.priorityId = priorityId;
        this.label = label;
    }

    // Getters and Setters
    public int getPriorityId() { return priorityId; }
    public void setPriorityId(int priorityId) { this.priorityId = priorityId; }
    public String getLabel() { return label; }
    public void setLabel(String label) { this.label = label; }
}