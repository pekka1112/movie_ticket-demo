package model;

import lombok.Data;

@Data
public class Ticket {
    int ticketID;
    int showtimeID;
    int bookedSeatID;
    double price;
}
