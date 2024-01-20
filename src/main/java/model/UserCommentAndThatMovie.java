package model;

public class UserCommentAndThatMovie extends UserComment{
    private String movieID;
    private String linkMovieImage;
    public UserCommentAndThatMovie() {
        super();
    }

    @Override
    public String getMovieID() {
        return movieID;
    }

    @Override
    public void setMovieID(String movieID) {
        this.movieID = movieID;
    }

    public String getLinkMovieImage() {
        return linkMovieImage;
    }

    public void setLinkMovieImage(String linkMovieImage) {
        this.linkMovieImage = linkMovieImage;
    }
}
