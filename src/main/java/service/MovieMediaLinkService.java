package service;

import database.MovieMediaLinkDAO;
import model.MovieMediaLink;

import java.util.List;
import java.util.stream.Collectors;

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
    public List<MovieMediaLink> get8ReleasedMoive() {
        return movieMediaLinkDAO.getReleasedMovies(8);
    }
    public List<MovieMediaLink> get4ReleasedMoive() {
        return movieMediaLinkDAO.getReleasedMovies(4);
    }
    public List<MovieMediaLink> get5UnReleasedMoive() {
        return movieMediaLinkDAO.getUnReleasedMovies(5);
    }
    public List<MovieMediaLink> getMostPopularMoive() {
        return movieMediaLinkDAO.getMostPopularMovies(4);
    }
    public List<MovieMediaLink> getAllMovie() {
        return movieMediaLinkDAO.getAllMovie();
    }
    public MovieMediaLink getMovieByID(String mid) {
        return movieMediaLinkDAO.getMovieByID(mid);
    }

    public List<String> getAllCategory() {
        // chuyển Set extractorMovieCategory thành List bằng stream
        return movieMediaLinkDAO.extractorMovieCategory().stream().sorted().collect(Collectors.toList());
    }

    public List<String> getAllCountry() {
        return movieMediaLinkDAO.extractorMovieCountry().stream().sorted().collect(Collectors.toList());
    }

    public List<MovieMediaLink> getMovieByName(String keyWord) {
        return movieMediaLinkDAO.getMovieByName(keyWord);
    }

    public List<MovieMediaLink> getMovieByCategory(String keyWord) {
        return movieMediaLinkDAO.getMovieByCategory(keyWord);
    }

    public List<MovieMediaLink> getMovieByCountry(String keyWord) {
        return movieMediaLinkDAO.getMovieByCountry(keyWord);
    }

    public List<MovieMediaLink> getMovieBy(String name, String category, String country, int time) {
        return movieMediaLinkDAO.getMovieBy(name, category, country, time);
    }


}
