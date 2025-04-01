package controller;

import database.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;
import scrapper.MovieNewsScraper;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "NewsControllerServlet", urlPatterns = {"/news-servlet"})
public class NewsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static List<MovieNews> movieNews3, movieNews5, movieNews4, movieNews6, movieNews4_reverse;
    public static MovieNewsScraper scraper = new MovieNewsScraper();
    public NewsController() {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");

        movieNews3 = scraper.getNews(3);
        req.setAttribute("movieNews3", movieNews3);
        movieNews4 = scraper.getNews(4);
        req.setAttribute("movieNews4", movieNews4);
        movieNews4_reverse = scraper.getNewsReverse();
        req.setAttribute("movieNews4_reverse", movieNews4_reverse);
        movieNews5 = scraper.getNews(5);
        req.setAttribute("movieNews5", movieNews5);
        movieNews6 = scraper.getNews(7);
        req.setAttribute("movieNews6", movieNews6);

        RequestDispatcher rd = req.getRequestDispatcher("/news.jsp");
        if (rd != null) {
            rd.forward(req, resp);
        } else {
            System.out.println("RequestDispatcher is null");
        }
    }
}
