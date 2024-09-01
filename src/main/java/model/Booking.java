package model;

import lombok.Data;
@Data
public class Booking {
    int bookingID;
    int userID;
    int ticketID;
    String status;
    String bookingTime;
}
