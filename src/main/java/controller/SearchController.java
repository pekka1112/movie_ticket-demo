package controller;

import database.CommentDAO;
import database.FilmDAO;
import database.TicketDAO;
import database.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "searchController", value = "/search")
public class SearchController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String Cid = req.getParameter("cid");
        String Uid = req.getParameter("uid");
        String Fid = req.getParameter("fid");
        String Tid = req.getParameter("tid");

        String id =req.getParameter("search");

        if (Cid.equals("1")){
            CommentDAO commentDAO = new CommentDAO();
            req.setAttribute("commentListS", commentDAO.getAllCommentByMovieID(id));
            req.getRequestDispatcher("quanlibinhluan.jsp").forward(req, resp);
        }else if(Uid.equals("1")){
            UserDAO userDAO = new UserDAO();
            req.setAttribute("userListS", userDAO.getAllUserByName(id));
            req.getRequestDispatcher("quanlinguoidung.jsp").forward(req,resp);
        }else if(Fid.equals("1")){
            FilmDAO filmDAO = new FilmDAO();
            req.setAttribute("filmListS", filmDAO.getAllFilmByName(id));
            req.getRequestDispatcher("quanliphim.jsp").forward(req,resp);
        } else{
            TicketDAO ticketDAO = new TicketDAO();
            req.setAttribute("ticketsS", ticketDAO.getAllTicketByMovieID(id));
            req.getRequestDispatcher("quanlive.jsp").forward(req,resp);
        }


    }
}
