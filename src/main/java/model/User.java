package model;

import java.sql.Timestamp;
import java.util.Base64;

public class User {
    private int id;
    private int roleId = 1;
    private String fullName;
    private String email;
    private String password;
    private Timestamp createdAt;
    private byte[] user_image;
    private String bio;

    public User() {
    }

    public User(int id, int roleId, String fullName, String email, String password, Timestamp created_at, byte[] user_image, String bio) {
        this.id = id;
        this.roleId = roleId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.createdAt = created_at;
        this.user_image = user_image;
        this.bio = bio;
    }

    public User(int id, int roleId, String fullName, String email, String password, Timestamp created_at, byte[] image) {
        this.id = id;
        this.roleId = roleId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.createdAt = created_at;
        this.user_image = image;
    }


    public User(int id, int roleId, String fullName, String email, String password) {
        this.id = id;
        this.roleId = roleId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
    }

    public User(String fullName, String email, String password){
        this.fullName = fullName;
        this.email = email;
        this.password = password;
    }

    public User(String fullName, String email, String password, int role) {
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.roleId = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreatedAt() {return createdAt;}

    public void setCreated_at(Timestamp created_at) {this.createdAt = created_at;}

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public byte[] getUserImage() {return user_image;}

    public void setUserImage(byte[] image) {this.user_image = image;}



    public boolean isRegularUser() {
        return roleId == 1;
    }

    public boolean isAdmin() {
        return roleId == 2;
    }

    // Helper method to check if user has admin-level permissions
    public boolean hasAdminPermissions() {
        return roleId == 2; //regular admin
    }

    // Helper method to check if user can upload images
    public boolean canUploadImages() {
        return roleId == 1 || roleId == 2; // Regular user or regular admin
    }



    public String getUserImageAsBase64() {
        if (user_image == null) return "";
        return Base64.getEncoder().encodeToString(user_image);
    }
}
