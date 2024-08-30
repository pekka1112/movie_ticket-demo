package model;

import lombok.Data;

@Data
public class UserComment {
    private String commentID;
    private String movieID;
    private String customerID;
    private String commentText;
}
