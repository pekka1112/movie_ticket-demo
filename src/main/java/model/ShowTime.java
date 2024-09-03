package model;

import lombok.Data;

@Data
public class ShowTime {
      int showtimeID;
      int movieID;
      int cinemaID;
      int roomID;
      String startTime;
      String endTime;
}
