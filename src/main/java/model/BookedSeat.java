package model;

import lombok.Data;

@Data
public class BookedSeat {
    int bookedSeatID;
    String seatNumber ;
    String seatType;
    int roomID;
    int showtimeID;
    int userID;
    String bookingTime;
}
