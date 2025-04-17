package model;

import java.security.Timestamp;

public class Report {
    private int report_id;
    private int user_id;
    private String title;
    private String description;
    private int priority_id;
    private int status_id;
    private Timestamp created_at;
    private Timestamp updated_at;

    public Report() {
    }

    public Report(int report_id, int user_id, String title, String description, int priority_id, int status_id, Timestamp created_at, Timestamp updated_at) {
        this.report_id = report_id;
        this.user_id = user_id;
        this.title = title;
        this.description = description;
        this.priority_id = priority_id;
        this.status_id = status_id;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public int getReport_id() {
        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPriority_id() {
        return priority_id;
    }

    public void setPriority_id(int priority_id) {
        this.priority_id = priority_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
}
