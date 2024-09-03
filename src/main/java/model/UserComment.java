package model;

import lombok.Data;

@Data
public class UserComment {
    int commentID;
    int movieID;
    int userID;
    String commentText;
    String commentTime;
}
