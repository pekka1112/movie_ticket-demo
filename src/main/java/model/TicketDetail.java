package model;

public class TicketDetail {
    String ticketDetailID;
    double price;
    String seatID;
    String cinemaRoomID;
    String ticketID;

    public TicketDetail() {

    }

    public TicketDetail(String ticketDetailID, double price, String seatID, String cinemaRoomID, String ticketID) {
        this.ticketDetailID = ticketDetailID;
        this.price = price;
        this.seatID = seatID;
        this.cinemaRoomID = cinemaRoomID;
        this.ticketID = ticketID;
    }

    public String getTicketDetailID() {
        return ticketDetailID;
    }

    public void setTicketDetailID(String ticketDetailID) {
        this.ticketDetailID = ticketDetailID;
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

    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

    @Override
    public String toString() {
        return "TicketDetail{" +
                "ticketDetailID='" + ticketDetailID + '\'' +
                ", price=" + price +
                ", seatID='" + seatID + '\'' +
                ", cinemaRoomID='" + cinemaRoomID + '\'' +
                ", ticketID='" + ticketID + '\'' +
                '}';
    }
}
