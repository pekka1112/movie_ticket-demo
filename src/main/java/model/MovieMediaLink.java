package model;

import lombok.Data;

@Data
public class MovieMediaLink extends Movie{
     int movieID;
     String linkMovieTrailer;
     String linkMovieImage;
}
