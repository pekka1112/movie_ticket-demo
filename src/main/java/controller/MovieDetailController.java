package controller;

import database.CinemaDAO;
import database.MovieMediaLinkDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import service.MovieMediaLinkService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieDetail", urlPatterns = {"/movieDetail"})
public class MovieDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieMediaLinkService movieService = new MovieMediaLinkService();
    public MovieDetailController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String mid = req.getParameter("movieID");
        Movie curMovie = movieService.getMovieByID(mid);
        req.setAttribute("movie", curMovie);
        RequestDispatcher rd = req.getRequestDispatcher("view/movieDetail.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
