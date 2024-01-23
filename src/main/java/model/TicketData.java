package model;

public class TicketData {

    // Ticket Table
    private  String ticketID, cinemaID, showtimeID;
    // TicketDetail Table
    private  String ticketDetailID, seatID, cinemaRoomID;
    private  double price;
    // Showtime Table
    private  String movieID, showDate, startTime, endTime;
    // Movie Table
    private String movieName, movieCategory, releaseDate, director, duration, country, movieDescription, movieContent;
    private int isPublished;
    private double movieScore;
    // MovieMediaLink Table
    private String movieMediaLinkID, linkMovieTrailer, linkMovieImage;
    // Cinema Table
    private String cinemaName, location;
    // CinemaRoom Table
    private String roomName;
    // Seat Table
    private String seatName, seatType;
    //Service Table
    private String serviceDescription;

    public TicketData() {}

    public TicketData(String ticketID, String cinemaID, String showtimeID, String ticketDetailID, String seatID, String cinemaRoomID, double price, String movieID, String showDate, String startTime, String endTime, String movieName, String movieCategory, String releaseDate, String director, String duration, String country, String movieDescription, String movieContent, int isPublished, double movieScore, String movieMediaLinkID, String linkMovieTrailer, String linkMovieImage, String cinemaName, String location, String roomName, String seatName, String seatType, String serviceDescription) {
        this.ticketID = ticketID;
        this.cinemaID = cinemaID;
        this.showtimeID = showtimeID;
        this.ticketDetailID = ticketDetailID;
        this.seatID = seatID;
        this.cinemaRoomID = cinemaRoomID;
        this.price = price;
        this.movieID = movieID;
        this.showDate = showDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.movieName = movieName;
        this.movieCategory = movieCategory;
        this.releaseDate = releaseDate;
        this.director = director;
        this.duration = duration;
        this.country = country;
        this.movieDescription = movieDescription;
        this.movieContent = movieContent;
        this.isPublished = isPublished;
        this.movieScore = movieScore;
        this.movieMediaLinkID = movieMediaLinkID;
        this.linkMovieTrailer = linkMovieTrailer;
        this.linkMovieImage = linkMovieImage;
        this.cinemaName = cinemaName;
        this.location = location;
        this.roomName = roomName;
        this.seatName = seatName;
        this.seatType = seatType;
        this.serviceDescription = serviceDescription;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
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

    public String getTicketDetailID() {
        return ticketDetailID;
    }

    public void setTicketDetailID(String ticketDetailID) {
        this.ticketDetailID = ticketDetailID;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getMovieID() {
        return movieID;
    }

    public void setMovieID(String movieID) {
        this.movieID = movieID;
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

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getMovieDescription() {
        return movieDescription;
    }

    public void setMovieDescription(String movieDescription) {
        this.movieDescription = movieDescription;
    }

    public String getMovieContent() {
        return movieContent;
    }

    public void setMovieContent(String movieContent) {
        this.movieContent = movieContent;
    }

    public int getIsPublished() {
        return isPublished;
    }

    public void setIsPublished(int isPublished) {
        this.isPublished = isPublished;
    }

    public double getMovieScore() {
        return movieScore;
    }

    public void setMovieScore(double movieScore) {
        this.movieScore = movieScore;
    }

    public String getMovieMediaLinkID() {
        return movieMediaLinkID;
    }

    public void setMovieMediaLinkID(String movieMediaLinkID) {
        this.movieMediaLinkID = movieMediaLinkID;
    }

    public String getLinkMovieTrailer() {
        return linkMovieTrailer;
    }

    public void setLinkMovieTrailer(String linkMovieTrailer) {
        this.linkMovieTrailer = linkMovieTrailer;
    }

    public String getLinkMovieImage() {
        return linkMovieImage;
    }

    public void setLinkMovieImage(String linkMovieImage) {
        this.linkMovieImage = linkMovieImage;
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

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
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
}
