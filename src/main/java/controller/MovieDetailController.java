package controller;

import database.CinemaDAO;
import database.MovieDAO;
import database.UserCommentDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;

@WebServlet(name = "MovieDetailServlet", urlPatterns = {"/movieDetail-servlet"})
public class MovieDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieDAO movieDAO;
    public static CinemaDAO cinemaDAO;
    public static UserCommentDAO userCommentDAO;
    public static List<MovieMediaLink> newestMovies, publishedMovies, unPublishedMovies, popularMovies, allMovies,movieListForCNameAndShowtime;
    public  static  MovieMediaLink movie;
    public static List<Cinema>  allCinema, top2Cinema, searchedResultCinemaList;;
    public static String cinemaSearchText = "";
    public MovieDetailController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("init")) {
            initData(req,resp);
        } else if(action.equals("show-cinemaShowtime")) {
            showCinemaName(req,resp);
        } else if (action.equals("show-cinemaDetail")) {
            searchCinemaAction(req,resp);
        } else if (action.equals("showShowTime")) {
            showShowTime(req,resp);
        } else if (action.equals("cinemaSearch")) {
            cinemaSearchAction(req,resp);
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
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        allCinema = cinemaDAO.getAllCinema();
        req.setAttribute("allCinema", allCinema);
        req.setAttribute("top2Cinema",top2Cinema);

        // process : show all cinema
        req.setAttribute("txtHistory", "");
        cinemaSearchText = "";
        req.setAttribute("allCinema", allCinema);
        req.setAttribute("searchedResultCinemaList",null);
        req.setAttribute("isShowAllCinema",true);

        // main process : show movie detail
        String mid = req.getParameter("movieID");
        movie = movieDAO.getMovieByID(mid);
        req.setAttribute("movie",movie);
        // show detail movie
        String cid = req.getParameter("cid");
        Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
        req.setAttribute("cinemaDetail",cinemaDetail);

        RequestDispatcher rd = req.getRequestDispatcher("/movieDetail.jsp");
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
            req.getRequestDispatcher("/movieDetail.jsp").forward(req,resp);
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
            req.setAttribute("cinemaDetail",cinemaDetail);

            // main process : show movie detail
            String mid = req.getParameter("movieID");
            movie = movieDAO.getMovieByID(mid);
            req.setAttribute("movie",movie);

            // main process : search cinema by name
            searchedResultCinemaList = cinemaDAO.getCinemaByName(cinemaSearchText);
            req.setAttribute("txtHistory", cinemaSearchText);

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

            req.getRequestDispatcher("/movieDetail.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static void showShowTime(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        userCommentDAO = new UserCommentDAO();
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

        // main process : show movie detail
        String mid = req.getParameter("movieID");
        movie = movieDAO.getMovieByID(mid);
        req.setAttribute("movie",movie);

        // process show searched cinema
        HttpSession session = req.getSession();
        searchedResultCinemaList = cinemaDAO.getCinemaByName(cinemaSearchText);
        int searchedResultCinemaListSize = searchedResultCinemaList.size();
        req.setAttribute("searchedResultCinemaList", searchedResultCinemaList);
//        session.setAttribute("searchedResultCinemaList", searchedResultCinemaList);
        req.setAttribute("searchedResultCinemaListSize", searchedResultCinemaListSize);
        req.setAttribute("txtHistory", cinemaSearchText);

        // main process : show showtimes of detail cinema
        String cid = req.getParameter("cid"); // lay ra id phim duoc gui cung
        String date = req.getParameter("date"); // lấy ra ngày cần xem lich chieu
        if(!cid.equals("") && !date.equals("")) {
            Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
            req.setAttribute("cinemaDetail",cinemaDetail);
            req.setAttribute("wantedBookDate", date);
            movieListForCNameAndShowtime = movieDAO.getMovieForCinemaAndShowtime(cid,date); // danh sach cac phim cua cinema co cid trong thoi gian date
            req.setAttribute("movieListForCNameAndShowtime",movieListForCNameAndShowtime);
            session.setAttribute("movieListForCNameAndShowtime",movieListForCNameAndShowtime);
        }

        RequestDispatcher rd = req.getRequestDispatcher("/movieDetail.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void showCinemaName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = req.getSession();
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

            // main process : show movie detail
            String mid = req.getParameter("movieID");
            movie = movieDAO.getMovieByID(mid);
            req.setAttribute("movie",movie);

            // main process : show detail cinema
            String cid = req.getParameter("cid");
            Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
            req.setAttribute("cinemaDetail",cinemaDetail);

            // main process : search cinema by name
            searchedResultCinemaList = cinemaDAO.getCinemaByName(cinemaSearchText);
            req.setAttribute("txtHistory", cinemaSearchText);

            int searchedResultCinemaListSize = searchedResultCinemaList.size();
            req.setAttribute("searchedResultCinemaList", searchedResultCinemaList);
            session.setAttribute("searchedResultCinemaList", searchedResultCinemaList);
            req.setAttribute("searchedResultCinemaListSize", searchedResultCinemaListSize);

            req.getRequestDispatcher("/movieDetail.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private static void cinemaSearchAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        movieDAO = new MovieDAO();
        cinemaDAO = new CinemaDAO();
        userCommentDAO = new UserCommentDAO();
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

        // main process : show movie detail
        String mid = req.getParameter("movieID");
        movie = movieDAO.getMovieByID(mid);
        req.setAttribute("movie",movie);

        // process right box data
        String cid = req.getParameter("cid"); // lay ra id phim duoc gui cung
        Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
        req.setAttribute("cinemaDetail",cinemaDetail);
        String date = req.getParameter("date"); // lấy ra ngày cần xem lich chieu
        req.setAttribute("wantedBookDate", date);
        movieListForCNameAndShowtime = movieDAO.getMovieForCinemaAndShowtime(cid,date); // danh sach cac phim cua cinema co cid trong thoi gian date
        if(movieListForCNameAndShowtime.size() != 0) {
            req.setAttribute("movieListForCNameAndShowtime",movieListForCNameAndShowtime);
        }
        // main process : show detail cinema
        req.setAttribute("cinemaDetail",cinemaDetail);
        req.setAttribute("cinemaDetail",cinemaDetail);

        // main process : show showtime of detail cinema
        HttpSession session = req.getSession();
        req.setAttribute("cinemaDetail",cinemaDetail);
        req.setAttribute("movieListForCNameAndShowtime",session.getAttribute("movieListForCNameAndShowtime"));

        // main process : search cinema by name
        String txt = req.getParameter("cinemaName");
        cinemaSearchText = txt;
        req.setAttribute("txtHistory", txt);
        searchedResultCinemaList = cinemaDAO.getCinemaByName(txt);
        int searchedResultCinemaListSize = searchedResultCinemaList.size();
        req.setAttribute("searchedResultCinemaList", searchedResultCinemaList);
        session.setAttribute("searchedResultCinemaList", searchedResultCinemaList);
        req.setAttribute("searchedResultCinemaListSize", searchedResultCinemaListSize);

        RequestDispatcher rd = req.getRequestDispatcher("/movieDetail.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
}
