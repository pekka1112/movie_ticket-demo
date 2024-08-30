package model;

import lombok.Data;

@Data
public class MovieMediaLink extends Movie{
    private String movieMediaLinkID;
    private String movieID;
    private String linkMovieTrailer;
    private String linkMovieImage;
}
