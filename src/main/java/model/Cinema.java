package model;

public class Cinema {
    private String cinemaID;
    private String cinemaName;
    private String location;
    private String cinemaRoomID;

    public Cinema() {
    }

    public String getCinemaID() {
        return cinemaID;
    }

    public void setCinemaID(String cinemaID) {
        this.cinemaID = cinemaID;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCinemaRoomID() {
        return cinemaRoomID;
    }

    public void setCinemaRoomID(String cinemaRoomID) {
        this.cinemaRoomID = cinemaRoomID;
    }
}
