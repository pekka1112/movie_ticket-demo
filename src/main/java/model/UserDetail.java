package model;

import lombok.Data;

@Data
public class UserDetail {
    private String userID;
    private String fullName;
    private String gender;
    private String address;
    private String phoneNumber;
    private String dob;
}
