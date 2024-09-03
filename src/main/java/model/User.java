package model;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {
    int userID;
    String username;
    String email;
    String password;
    boolean isActive ;
    int roleID;
}
