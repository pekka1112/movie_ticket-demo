package model;

import lombok.Data;
@Data
public class BookingDetail {
    private String bookingDetailID;
    private String bookingID;
    private String bookingDate;
    private int  totalTicket;
}
