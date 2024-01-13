package controller;

import database.MovieDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Movie;
import model.MovieMediaLink;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = {"/home-servlet"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieDAO movieDAO;
    public static List<MovieMediaLink> list;
    public HomeController() {

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println(action);
        if(action.equals("direct")) {
            redirectToHomePage(req,resp);
            System.out.println("direct");
        } else if(action.equals("search-bar")) {
//            searchBarAction(req,resp);
            System.out.println("check");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private static void searchBarAction(HttpServletRequest req, HttpServletResponse resp){
        // implement search action here
        resp.setContentType("text/html");
//        RequestDispatcher rd = getServletContext().getRequestDispatcher("index.jsp").forward(req,resp);
    }
    private static void redirectToHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        movieDAO = new MovieDAO();
        list = movieDAO.getNewestFilms(5);
        req.setAttribute("top4NewestMovies",list);
        RequestDispatcher rd = req.getRequestDispatcher("/view/home.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            // Xử lý trường hợp khi rd là null
            System.out.println("RequestDispatcher is null");
        }
    }
}
