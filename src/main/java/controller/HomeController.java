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
import model.*;
import service.CinemaService;
import service.MovieMediaLinkService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home-servlet"})
public class  HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieMediaLinkService movieService = new MovieMediaLinkService();
    public static List<MovieMediaLink> newestMovies, publishedMovies, unPublishedMovies, popularMovies;
    public static CinemaService cinemaService = new CinemaService();
    public static List<Cinema>  allCinema, top2Cinema;
    public HomeController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        if(action.equals("direct")) {
            initHomePage(req,resp);
        } else if(action.equals("show-cinemaShowtime")) {
            showCinemaDetail(req,resp);
        } else if (action.equals("show-cinemaDetail")) {
            searchCinemaAction(req,resp);
        } else if (action.equals("logout")) {
            logout(req,resp);
        }
    }
    private static void initHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        newestMovies = movieService.get5NewestMovie();
        session.setAttribute("newestMovies", newestMovies);
        publishedMovies = movieService.get8ReleasedMoive();
        req.setAttribute("publishedMovies", publishedMovies);
        unPublishedMovies = movieService.get5UnReleasedMoive();
        req.setAttribute("unPublishedMovies", unPublishedMovies);
        popularMovies = movieService.getMostPopularMoive();
        req.setAttribute("popularMovies", popularMovies);

        allCinema = cinemaService.getAllCinema();
        req.setAttribute("allCinema", allCinema);
        top2Cinema = cinemaService.getMostPopularCinema();
        req.setAttribute("top2Cinema",top2Cinema);

        RequestDispatcher rd = req.getRequestDispatcher("/view/home.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        }
    }
    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        session.removeAttribute("curUser");
        session.removeAttribute("curUsername");
        session.invalidate();
        initHomePage(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    private static void searchBarAction(HttpServletRequest req, HttpServletResponse resp){
        resp.setContentType("text/html");
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
            e.printStackTrace();
        }
    }
}
