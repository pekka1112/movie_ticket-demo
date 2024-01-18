package model;

import java.util.Date;

public class Film {
    String movieID;
    String movieName;
    String movieCategory;
    Date releaseDate;
    String director;
    String duration;
    String country;
    String movieDescription;
    String movieContent;
    boolean isPublished;
    double movieScore;

    public Film() {
    }
    public Film(String movieID, String movieName, String movieCategory, Date releaseDate, String director, String duration,
                String country, String movieDescription, String movieContent, boolean isPublished, double movieScore) {
        this.movieID = movieID;
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
    }

    public String getMovieID() {
        return movieID;
    }

    public void setMovieID(String movieID) {
        this.movieID = movieID;
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

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
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

    public boolean isPublished() {
        return isPublished;
    }

    public void setPublished(boolean published) {
        isPublished = published;
    }

    public double getMovieScore() {
        return movieScore;
    }

    public void setMovieScore(double movieScore) {
        this.movieScore = movieScore;
    }

    @Override
    public String toString() {
        return "Film{" +
                "movieID='" + movieID + '\'' +
                ", movieName='" + movieName + '\'' +
                ", movieCategory='" + movieCategory + '\'' +
                ", raleaseDate=" + releaseDate +
                ", director='" + director + '\'' +
                ", duration='" + duration + '\'' +
                ", country='" + country + '\'' +
                ", movieDescription='" + movieDescription + '\'' +
                ", movieContent='" + movieContent + '\'' +
                ", isPublished=" + isPublished +
                ", movieScore=" + movieScore +
                '}';
    }
}
