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

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MovieServlet", urlPatterns = {"/movie-servlet"})
public class MovieController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieMediaLinkDAO movieMediaLinkDAO;
    public static CinemaDAO cinemaDAO;
    public static List<MovieMediaLink> newestMovies, publishedMovies, unPublishedMovies, popularMovies, allMovies;
    public static List<Cinema>  allCinema, top2Cinema;
    public MovieController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("init")) {
            initData(req,resp);
        } else if(action.equals("show-cinemaShowtime")) {
            showCinemaDetail(req,resp);
        } else if (action.equals("show-cinemaDetail")) {
            searchCinemaAction(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private static void searchBarAction(HttpServletRequest req, HttpServletResponse resp){
        resp.setContentType("text/html");
    }
    private static void initData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
//        movieMediaLinkDAO = new MovieMediaLinkDAO();
//        cinemaDAO = new CinemaDAO();
//        newestMovies = movieMediaLinkDAO.getNewestFilms(8);
//        publishedMovies = movieMediaLinkDAO.getPublishedMoive(1,5);
//        unPublishedMovies = movieMediaLinkDAO.getPublishedMoive(0,4);
//        popularMovies = movieMediaLinkDAO.getMostPopularMoive(4);
//        allMovies = movieMediaLinkDAO.getAllMovie();
//        allCinema = cinemaDAO.getAllCinema();
//        top2Cinema = cinemaDAO.getMostPopularCinema();
//        req.setAttribute("top4NewestMovies", newestMovies);
//        req.setAttribute("publishedMovies", publishedMovies);
//        req.setAttribute("unPublishedMovies", unPublishedMovies);
//        req.setAttribute("popularMovies", popularMovies);
//        req.setAttribute("allCinema", allCinema);
//        req.setAttribute("allMovies", allMovies);
//        req.setAttribute("top2Cinema",top2Cinema);
//        RequestDispatcher rd = req.getRequestDispatcher("/movies.jsp");
//        if (rd != null) {
//            rd.forward(req, resp);
//        } else {
//            System.out.println("RequestDispatcher is null");
//        }
    }
    private static void searchCinemaAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        try {
            String cinemaName = req.getParameter("cinemaName");
            List<Cinema> list = cinemaDAO.getCinemaByName(cinemaName);
            int size = list.size();
            req.setAttribute("resCinemaList",list);
            req.setAttribute("resCinemaListSize",size);
            req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } private static void showCinemaDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");
//        resp.setCharacterEncoding("UTF-8");
//        req.setCharacterEncoding("UTF-8");
//        try {
//            String cid = req.getParameter("cid");
//            Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
//            movieMediaLinkDAO = new MovieMediaLinkDAO();
//            cinemaDAO = new CinemaDAO();
//            newestMovies = movieMediaLinkDAO.getNewestFilms(5);
//            publishedMovies = movieMediaLinkDAO.getPublishedMoive(1,5);
//            unPublishedMovies = movieMediaLinkDAO.getPublishedMoive(0,4);
//            popularMovies = movieMediaLinkDAO.getMostPopularMoive(3);
//            allCinema = cinemaDAO.getAllCinema();
//            top2Cinema = cinemaDAO.getMostPopularCinema();
//
//            req.setAttribute("top4NewestMovies", newestMovies);
//            req.setAttribute("publishedMovies", publishedMovies);
//            req.setAttribute("unPublishedMovies", unPublishedMovies);
//            req.setAttribute("popularMovies", popularMovies);
//            req.setAttribute("allCinema", allCinema);
//            req.setAttribute("top2Cinema",top2Cinema);
//
//            req.setAttribute("cinemaDetail",cinemaDetail);
//            req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
