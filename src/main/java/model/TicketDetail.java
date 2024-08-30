package model;

import lombok.Data;

@Data
public class TicketDetail {
    private  String ticketDetailID;
    private  String ticketID;
    private  double price;
    private  String seatID;
    private  String cinemaRoomID;
}
