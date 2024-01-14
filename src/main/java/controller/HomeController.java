package controller;

import database.CinemaDAO;
import database.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home-servlet"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieDAO movieDAO;
    public static CinemaDAO cinemaDAO;
    public static List<MovieMediaLink> newestMovies, publishedMovies, unPublishedMovies, popularMovies;
    public static List<Cinema>  allCinema, top2Cinema;
    public HomeController() {

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("direct")) {
            redirectToHomePage(req,resp);
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
    private static void redirectToHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        newestMovies = movieDAO.getNewestFilms(5);
        publishedMovies = movieDAO.getPublishedMoive(1,5);
        unPublishedMovies = movieDAO.getPublishedMoive(0,4);
        popularMovies = movieDAO.getMostPopularMoive(3);
        allCinema = cinemaDAO.getAllCinema();
        top2Cinema = cinemaDAO.getMostPopularCinema();
        req.setAttribute("top4NewestMovies", newestMovies);
        req.setAttribute("publishedMovies", publishedMovies);
        req.setAttribute("unPublishedMovies", unPublishedMovies);
        req.setAttribute("popularMovies", popularMovies);
        req.setAttribute("allCinema", allCinema);
        req.setAttribute("top2Cinema",top2Cinema);
        RequestDispatcher rd = req.getRequestDispatcher("/view/home.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
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
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        try {
            String cid = req.getParameter("cid");
            Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
            movieDAO = new MovieDAO();
            cinemaDAO = new CinemaDAO();
            newestMovies = movieDAO.getNewestFilms(5);
            publishedMovies = movieDAO.getPublishedMoive(1,5);
            unPublishedMovies = movieDAO.getPublishedMoive(0,4);
            popularMovies = movieDAO.getMostPopularMoive(3);
            allCinema = cinemaDAO.getAllCinema();

            req.setAttribute("top4NewestMovies", newestMovies);
            req.setAttribute("publishedMovies", publishedMovies);
            req.setAttribute("unPublishedMovies", unPublishedMovies);
            req.setAttribute("popularMovies", popularMovies);
            req.setAttribute("allCinema", allCinema);

            req.setAttribute("cinemaDetail",cinemaDetail);
            req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
