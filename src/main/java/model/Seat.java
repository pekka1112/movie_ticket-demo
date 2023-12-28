package model;

public class Seat {
    private String seatID;
    private String seatName;
    private String seatType;
    private String cinemaRoomID;

    public String getSeatID() {
        return seatID;
    }

    public void setSeatID(String seatID) {
        this.seatID = seatID;
    }

    public String getSeatName() {
        return seatName;
    }

    public void setSeatName(String seatName) {
        this.seatName = seatName;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public String getCinemaRoomID() {
        return cinemaRoomID;
    }

    public void setCinemaRoomID(String cinemaRoomID) {
        this.cinemaRoomID = cinemaRoomID;
    }

    public Seat() {
    }
}
