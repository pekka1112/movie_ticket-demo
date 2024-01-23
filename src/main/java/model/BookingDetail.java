package model;

public class BookingDetail {
    private String bookingDetailID;
    private String bookingID;
    private String bookingDate;
    private int  totalTicket;

    public String getBookingDetailID() {
        return bookingDetailID;
    }

    public void setBookingDetailID(String bookingDetailID) {
        this.bookingDetailID = bookingDetailID;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getTotalTicket() {
        return totalTicket;
    }

    public void setTotalTicket(int totalTicket) {
        this.totalTicket = totalTicket;
    }

    public BookingDetail() {
    }

    public BookingDetail(String bookingDetailID, String bookingID, String bookingDate, int totalTicket) {
        this.bookingDetailID = bookingDetailID;
        this.bookingID = bookingID;
        this.bookingDate = bookingDate;
        this.totalTicket = totalTicket;
    }
}
