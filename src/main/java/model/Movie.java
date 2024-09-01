package model;

import lombok.Data;

@Data
public class Movie {
     int movieID;
     String movieName;
     String movieCategory;
     String releaseDate;
     String director;
     String duration;
     String country;
     String movieDescription;
     String movieContent;
     double movieScore;
}
