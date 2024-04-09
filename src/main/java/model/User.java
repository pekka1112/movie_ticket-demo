package model;

public class User {
    String userId;
    String userName;
    String email;
    String password;
    boolean isActive;
    int roles;

    public User() {}

    public User(String userId, String userName, String email, String password, boolean isActive, int roles) {
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.isActive = isActive;
        this.roles = roles;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }


}
