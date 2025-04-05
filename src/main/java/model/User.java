package model;

public class User {
    private int id;
    private String name;
    private int email;
    private int password;

    public User(String name, int password, int email, int id) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.id = id;
    }

    //getter methods
    public int getEmail() {
        return email;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getPassword() {
        return password;
    }

    //setter methods

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(int email) {
        this.email = email;
    }

    public void setPassword(int password) {
        this.password = password;
    }
}
