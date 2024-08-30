package model;

import lombok.Data;

@Data
public class ShowTime {
    private  String showtimeID;
    private  String movieID;
    private  String showDate;
    private  String startTime;
    private  String endTime;
}
