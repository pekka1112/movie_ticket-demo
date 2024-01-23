package model;

public class Booking {
    private String bookingID;
    private String ticketID;
    private String userID;

    public Booking() {
    }

    public Booking(String bookingID, String ticketID, String userID) {
        this.bookingID = bookingID;
        this.ticketID = ticketID;
        this.userID = userID;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
}
