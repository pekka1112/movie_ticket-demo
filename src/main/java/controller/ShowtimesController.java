package controller;

import database.CinemaDAO;
import database.MovieMediaLinkDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cinema;
import model.MovieMediaLink;
import service.CinemaService;
import service.MovieMediaLinkService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowtimesServlet", urlPatterns = {"/showtimes-servlet"})
public class ShowtimesController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieMediaLinkService movieMediaLinkService = new MovieMediaLinkService();
    public static List<MovieMediaLink> newest8Movies, allMovies;
    public static MovieMediaLink movie;
    public static CinemaService cinemaService = new CinemaService();
    public ShowtimesController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

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
        HttpSession session = req.getSession();
        newest8Movies = movieMediaLinkService.get8NewestMovie();
        allMovies = movieMediaLinkService.getAllMovie();

        String mid = req.getParameter("movieID");
        movie = movieMediaLinkService.getMovieByID(mid);

        session.setAttribute("newest8Movies", newest8Movies);
        session.setAttribute("allMovies", allMovies);
        session.setAttribute("movie",movie);

        RequestDispatcher rd = req.getRequestDispatcher("/showtimes.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
    private static void searchCinemaAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String cinemaName = req.getParameter("cinemaName");
        List<Cinema> list = cinemaService.getCinemaByName(cinemaName);
        int size = list.size();
        session.setAttribute("resCinemaList",list);
        session.setAttribute("resCinemaListSize",size);
        req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
    }
    private static void showCinemaDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String cid = req.getParameter("cid");
            Cinema cinemaDetail = cinemaService.getCinemaByID(Integer.parseInt(cid));

            req.setAttribute("cinemaDetail",cinemaDetail);
            req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
        } catch (Exception e) {
        }
    }
}
