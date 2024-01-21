package controller;

import database.CommentDAO;
import database.FilmDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Film;

import java.io.IOException;
@WebServlet(name = "updateController", value = "/updateComment")
public class UpdateCommentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("sid");
        CommentDAO commentDAO = new CommentDAO();
        req.setAttribute("comment", commentDAO.getCommentById(id));
        req.getRequestDispatcher("updateComment.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("commentID");
        String text = req.getParameter("text");

        CommentDAO commentDAO = new CommentDAO();
        commentDAO.updateFilm(id, text);
        resp.sendRedirect("quanlibinhluan");

    }
}
