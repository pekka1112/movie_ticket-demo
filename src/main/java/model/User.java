package model;

import lombok.Data;

@Data
public class User {
    String userID;
    String username;
    String email;
    String password;
    int isActive ;
    int role;
}
