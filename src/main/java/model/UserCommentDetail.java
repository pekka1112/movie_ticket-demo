package model;

public class UserCommentDetail extends UserComment{
    private String movieID;
    private String movieName;
    private String linkMovieImage;
    public UserCommentDetail() {
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

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
}
