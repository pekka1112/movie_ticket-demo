package model;

import lombok.Data;

@Data
public class User {
    int userID;
    String username;
    String email;
    String password;
    boolean isActive ;
    int role;
}
