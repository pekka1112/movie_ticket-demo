package model;

public class TicketDetail {
<<<<<<< HEAD
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
=======
    String ticketID;
    String price;
    String seatName;
    String seatType;
    String roomName;
    String cinemaName;
    String location;
    String showDate;
    String startTime;
    String endTime;
    String movieName;
    String movieCategory;
    String director;
    String country;
    String movieScore;

    public TicketDetail(){}

    public TicketDetail(String ticketID, String price, String seatName, String seatType, String roomName,
                        String cinemaName, String location, String showDate, String startTime, String endTime,
                        String movieName, String movieCategory, String director, String country, String movieScore) {
        this.ticketID = ticketID;
        this.price = price;
        this.seatName = seatName;
        this.seatType = seatType;
        this.roomName = roomName;
        this.cinemaName = cinemaName;
        this.location = location;
        this.showDate = showDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.movieName = movieName;
        this.movieCategory = movieCategory;
        this.director = director;
        this.country = country;
        this.movieScore = movieScore;
>>>>>>> QUYEN
    }

    public String getTicketID() {
        return ticketID;
    }

    public void setTicketID(String ticketID) {
        this.ticketID = ticketID;
    }

<<<<<<< HEAD
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
=======
    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
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

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
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

    public String getShowDate() {
        return showDate;
    }

    public void setShowDate(String showDate) {
        this.showDate = showDate;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieCategory() {
        return movieCategory;
    }

    public void setMovieCategory(String movieCategory) {
        this.movieCategory = movieCategory;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMovieScore() {
        return movieScore;
    }

    public void setMovieScore(String movieScore) {
        this.movieScore = movieScore;
    }

    @Override
    public String toString() {
        return "TicketDetail{" +
                "ticketID='" + ticketID + '\'' +
                ", movieName='" + movieName + '\'' +
                ", price='" + price + '\'' +
                ", movieCategory='" + movieCategory + '\'' +
                ", director='" + director + '\'' +
                ", country='" + country + '\'' +
                ", movieScore='" + movieScore + '\'' +
                ", cinemaName='" + cinemaName + '\'' +
                ", roomName='" + roomName + '\'' +
                ", seatName='" + seatName + '\'' +
                ", seatType='" + seatType + '\'' +
                ", showDate='" + showDate + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", location='" + location + '\'' +
                '}';
>>>>>>> QUYEN
    }
}
