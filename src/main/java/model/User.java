package model;

public class User {
    private int id;
    private int roleId = 1;
    private String fullName;
    private String email;
    private String password;

    public User() {

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



    public boolean isRegularUser() {
        return roleId == 1;
    }

    public boolean isAdmin() {
        return roleId == 2;
    }

    // Helper method to check if user has admin-level permissions
    public boolean hasAdminPermissions() {
        return roleId == 0 || roleId == 2; // Super admin or regular admin
    }

    // Helper method to check if user can upload images
    public boolean canUploadImages() {
        return roleId == 1 || roleId == 2; // Regular user or regular admin
    }

}
