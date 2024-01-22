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

        String id = req.getParameter("search");
        System.out.println(Cid);
        System.out.println(Uid);
        System.out.println(Fid);
        System.out.println(Tid);
        System.out.println(id);

        if (Cid.equals("1")) {
            if (!id.isEmpty()) {
                CommentDAO commentDAO = new CommentDAO();
                req.setAttribute("commentListS", commentDAO.getAllCommentByMovieID(id));
                req.setAttribute("showAll", false);
                req.getRequestDispatcher("quanlibinhluan.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("quanlibinhquan");

            }
        } else if (Uid.equals("1")) {
            if (!id.isEmpty()) {
                UserDAO userDAO = new UserDAO();
                req.setAttribute("userListS", userDAO.getAllUserByName(id));
                req.setAttribute("showAll", false);
                req.getRequestDispatcher("quanlinguoidung.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("quanlinguoidung");

            }
        } else if (Fid.equals("1")) {
            if (!id.isEmpty()) {
                FilmDAO filmDAO = new FilmDAO();
                req.setAttribute("filmListS", filmDAO.getAllFilmByName(id));
                req.setAttribute("showAll", false);
                req.getRequestDispatcher("quanliphim.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("quanliphim");

            }
        } else if (Tid.equals("1")) {
            if (!id.isEmpty()) {
                TicketDAO ticketDAO = new TicketDAO();
                req.setAttribute("ticketsS", ticketDAO.getAllTicketByMovieID(id));
                req.setAttribute("showAll", false);
                req.getRequestDispatcher("quanlive.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("quanlive");

            }
        }


    }
}
