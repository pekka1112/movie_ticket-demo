package model;

import lombok.Data;

@Data
public class Actor {
    private String actorID;
    private String movieID;
    private String actorName;
    private String dob;
    private String gender;
}
