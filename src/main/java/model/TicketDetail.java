package model;

public class TicketDetail {
    private  String ticketDetailID;
    private  String ticketID;
    private  double price;
    private  String seatID;
    private  String cinemaRoomID;

    public String getTicketDetailID() {
        return ticketDetailID;
    }

    public void setTicketDetailID(String ticketDetailID) {
        this.ticketDetailID = ticketDetailID;
    }

    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSeatID() {
        return seatID;
    }

    public void setSeatID(String seatID) {
        this.seatID = seatID;
    }

    public String getCinemaRoomID() {
        return cinemaRoomID;
    }

    public void setCinemaRoomID(String cinemaRoomID) {
        this.cinemaRoomID = cinemaRoomID;
    }

    public TicketDetail() {
    }
}
