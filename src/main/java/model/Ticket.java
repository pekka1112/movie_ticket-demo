package model;

public class Ticket {


    String ticketID;
    String cinemaID;
    String showtimeID;

    public Ticket(){

    }
    public Ticket(String ticketID, String cinemaID, String showtimeID) {
        this.ticketID = ticketID;
        this.cinemaID = cinemaID;
        this.showtimeID = showtimeID;
    }



    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

    public String getCinemaID() {
        return cinemaID;
    }

    public void setCinemaID(String cinemaID) {
        this.cinemaID = cinemaID;
    }

    public String getShowtimeID() {
        return showtimeID;
    }

    public void setShowtimeID(String showtimeID) {
        this.showtimeID = showtimeID;
    }


    @Override
    public String toString() {
        return "Ticket{" +
                "ticketID='" + ticketID + '\'' +
                ", cinemaID='" + cinemaID + '\'' +
                ", showtimeID='" + showtimeID + '\'' +
                '}';

    }
}
