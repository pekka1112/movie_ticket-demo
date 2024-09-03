package service;

import database.MovieMediaLinkDAO;
import model.MovieMediaLink;

import java.util.List;

public class MovieMediaLinkService {
    MovieMediaLinkDAO movieMediaLinkDAO = new MovieMediaLinkDAO();
    public List<MovieMediaLink> get5NewestMovie() {
        return movieMediaLinkDAO.getMovieSortedByReleaseDate(5);
    }
    public List<MovieMediaLink> get8NewestMovie() {
        return movieMediaLinkDAO.getMovieSortedByReleaseDate(8);
    }
    public List<MovieMediaLink> get5ReleasedMoive() {
        return movieMediaLinkDAO.getReleasedMovies(5);
    }
    public List<MovieMediaLink> get5UnReleasedMoive() {
        return movieMediaLinkDAO.getUnReleasedMovies(5);
    }
    public List<MovieMediaLink> getMostPopularMoive() {
        return movieMediaLinkDAO.getMostPopularMoive(3);
    }
    public List<MovieMediaLink> getAllMovie() {
        return movieMediaLinkDAO.getAllMovie();
    }
    public MovieMediaLink getMovieByID(String mid) {
        return movieMediaLinkDAO.getMovieByID(mid);
    }
}
