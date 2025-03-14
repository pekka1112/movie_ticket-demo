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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MovieServlet", urlPatterns = {"/movie-servlet"})
public class MovieController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieMediaLinkService movieMediaLinkService = new MovieMediaLinkService();
    public static List<MovieMediaLink> allMovies, publishedMovies, unPublishedMovies;
    public static List<MovieMediaLink> newestMovies; // todo : return về 1 list movie đc sort by realeasDate
    public static List<MovieMediaLink> popularMovies; // todo : return về 1 list movie đc sort by vé mua nhiều -> tìm trong db vé của phim này rồi sort
    public static List<MovieMediaLink> moviesByCategory, moviesByName, moviesByContry ;
    public static List<String> movieCategoryList, movieCountryList;
    public static MovieMediaLinkService mmlService ;
    public MovieController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        // init data for film page
        allMovies = movieMediaLinkService.getAllMovie();
        req.setAttribute("allMovies", allMovies);
        publishedMovies = movieMediaLinkService.getMostPopularMoive();
        req.setAttribute("publishedMovies", publishedMovies);
        unPublishedMovies = movieMediaLinkService.get5UnReleasedMoive();
        req.setAttribute("unPublishedMovies", unPublishedMovies);
        // init data for category & country
        movieCategoryList = movieMediaLinkService.getAllCategory();
        req.setAttribute("movieCategoryList", movieCategoryList);
        movieCountryList = movieMediaLinkService.getAllCountry();
        req.setAttribute("movieCountryList", movieCountryList);

        String action = req.getParameter("action");
        if(action.equals("init")) {
            initData(req,resp);
        } else if(action.equals("show-cinemaShowtime")) {
            showCinemaDetail(req,resp);
        } else if (action.equals("show-cinemaDetail")) {
            searchCinemaAction(req,resp);
        } else if (action.equals("findByName")) {
            findMoviesByNameAction(req,resp); // tìm kiếm theo tên phim nhập từ ô search
        } else if (action.equals("findByCategory")) {
            findMoviesByCategoryAction(req,resp);
        } else if (action.equals("findByCountry")) {
            findMoviesByCountryAction(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private static void initData(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/movies.jsp");
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
            req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void findMoviesByNameAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String keyWord = req.getParameter("txtSearch");
            mmlService = new MovieMediaLinkService();
            moviesByName = mmlService.getMovieByName(keyWord);
            req.setAttribute("moviesByName", moviesByName);
            req.getRequestDispatcher("movies.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static void findMoviesByCategoryAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String keyWord = req.getParameter("category");
            mmlService = new MovieMediaLinkService();
            moviesByName = mmlService.getMovieByCategory(keyWord);
            req.setAttribute("moviesByName", moviesByName);
            req.getRequestDispatcher("movies.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static void findMoviesByCountryAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String keyWord = req.getParameter("country");
            mmlService = new MovieMediaLinkService();
            moviesByName = mmlService.getMovieByCountry(keyWord);
            req.setAttribute("moviesByName", moviesByName);
            req.getRequestDispatcher("movies.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void showCinemaDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
