package model;

import lombok.Data;

@Data
public class Customer {
    private String customerID;
    private String userID;
    private String fullName;
    private String gender;
    private String phoneNumber;
    private String dob;
}
