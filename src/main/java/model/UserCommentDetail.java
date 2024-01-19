package model;

public class UserCommentDetail extends UserComment{
    private String movieName;
    public UserCommentDetail() {
        super();
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }
}
