package model;

public class MovieMediaLink extends Movie{
    private String movieMediaLinkID;
    private String movieID;
    private String linkMovieTrailer;
    private String linkMovieImage;

    public MovieMediaLink() {
        super();
    }

    public String getMovieMediaLinkID() {
        return movieMediaLinkID;
    }

    public void setMovieMediaLinkID(String movieMediaLinkID) {
        this.movieMediaLinkID = movieMediaLinkID;
    }

    @Override
    public String getMovieID() {
        return movieID;
    }

    @Override
    public void setMovieID(String movieID) {
        this.movieID = movieID;
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
}
