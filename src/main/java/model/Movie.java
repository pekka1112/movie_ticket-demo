package model;

public class Movie {
    private String movieID;
    private String movieName;
    private String movieCategory;
    private String releaseDate;
    private String director;
    private String duration;
    private String country;
    private String movieDescription;
    private String movieContent;
    private int isPublished;
    private double movieScore;

    public Movie() {
    }

    public void setMovieID(String movieID) {
        this.movieID = movieID;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public void setMovieCategory(String movieCategory) {
        this.movieCategory = movieCategory;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setMovieDescription(String movieDescription) {
        this.movieDescription = movieDescription;
    }

    public void setMovieContent(String movieContent) {
        this.movieContent = movieContent;
    }

    public void setIsPublished(int isPublished) {
        this.isPublished = isPublished;
    }

    public void setMovieScore(double movieScore) {
        this.movieScore = movieScore;
    }

    public String getMovieID() {
        return movieID;
    }

    public String getMovieName() {
        return movieName;
    }

    public String getMovieCategory() {
        return movieCategory;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public String getDirector() {
        return director;
    }

    public String getDuration() {
        return duration;
    }

    public String getCountry() {
        return country;
    }

    public String getMovieDescription() {
        return movieDescription;
    }

    public String getMovieContent() {
        return movieContent;
    }

    public int getIsPublished() {
        return isPublished;
    }

    public double getMovieScore() {
        return movieScore;
    }
}
