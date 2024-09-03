package model;

import lombok.Data;

@Data
public class UserDetail {
    int userID;
    String fullName;
    String gender;
    String phoneNumber;
    String address;
    String dob;
    String profilePictureURL;
}
