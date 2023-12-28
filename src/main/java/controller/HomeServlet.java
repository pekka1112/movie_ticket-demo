package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/home-page")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        System.out.println(action);
        if(action.equals("search-bar")) {
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
}
