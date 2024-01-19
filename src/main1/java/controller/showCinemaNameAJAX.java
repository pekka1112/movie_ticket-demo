package controller;

import database.CinemaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cinema;

import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "showCinemaName", urlPatterns = {"/showCinemaNameAjax"})
public class showCinemaNameAJAX extends HttpServlet {
    public static CinemaDAO cinemaDAO;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        try {
            String cid = req.getParameter("cid");
            Cinema cinemaDetail = cinemaDAO.getCinemaByID(cid);
            req.setAttribute("cinemaDetail",cinemaDetail);
            PrintWriter out = resp.getWriter();
            out.println("<h2 style=\"font-size: 25px;padding-bottom: 5px\"><i class=\"fa-solid fa-film\"> </i> " + cinemaDetail.getCinemaName() + "  </h2>\n" +
                    "                                <h4 style=\"font-size: 17px; font-weight: lighter;padding-bottom: 10px\">  " + cinemaDetail.getLocation() + "</h4>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
