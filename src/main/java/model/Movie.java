package model;

import lombok.Data;

@Data
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
}
