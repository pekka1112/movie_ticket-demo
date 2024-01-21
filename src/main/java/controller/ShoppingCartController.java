package controller;

import beans.CartItem;
import beans.ShoppingCart;
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
import java.util.List;

@WebServlet(name = "shoppingCart", urlPatterns = {"/shoppingCart-servlet"})
public class ShoppingCartController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static MovieDAO movieDAO;
    public static CinemaDAO cinemaDAO;
    public static UserCommentDAO userCommentDAO;
    public static List<MovieMediaLink> newestMovies, publishedMovies, unPublishedMovies, popularMovies, movieListForCNameAndShowtime;
    public static List<Cinema>  allCinema, top2Cinema, searchedResultCinemaList;
    public static List<UserCommentDetail> comments ;
    public static String cinemaSearchText = "";
    public ShoppingCartController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ShoppingCart cart ;
        HttpSession session = req.getSession();
        cart = (ShoppingCart) session.getAttribute("cart");
        if(cart == null ) {
            cart = new ShoppingCart();
        }
        session.setAttribute("cart",cart);
        String action = req.getParameter("action");
        if(action.equals("view")) {
            viewCart(req,resp);
        } else if(action.equals("add")) {
            doPost(req,resp);
        } else if(action.equals("update")) {
            updateCart(req,resp);
        } else if(action.equals("remove")) {
            removeMovie(req,resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        String mid = req.getParameter("movieID");
        MovieMediaLink movie = movieDAO.getMovieByID(mid);

        CartItem item = new CartItem();
//        item.setMovie(movie);
        item.setQuanlity(1);
        item.setPrice(50000);
        cart.add(item);
        session.setAttribute("cart",cart);
        RequestDispatcher rd = req.getRequestDispatcher("/shoppingCart.jsp");
        rd.forward(req,resp);
    }

    private void updateCart(HttpServletRequest req, HttpServletResponse resp) {
    }

    private static void removeMovie(HttpServletRequest req, HttpServletResponse resp) {
        
    }
    private static void viewCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();

        movieDAO = new MovieDAO();

        RequestDispatcher rd = req.getRequestDispatcher("/shoppingCart.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
}
