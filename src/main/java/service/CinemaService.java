package service;

import database.CinemaDAO;
import model.Cinema;

import java.util.List;

public class CinemaService {
    CinemaDAO cinemaDAO = new CinemaDAO();
    public List<Cinema> getAllCinema() {
        return cinemaDAO.getAllCinema();
    }

    public List<Cinema> getMostPopularCinema() {
        return cinemaDAO.getMostPopularCinema(2);
    }

    public List<Cinema> getCinemaByName(String cinemaName) {
        return cinemaDAO.getCinemaByName(cinemaName);
    }

    public Cinema getCinemaByID(int cid) {
        return cinemaDAO.getCinemaByID(cid);
    }
}
