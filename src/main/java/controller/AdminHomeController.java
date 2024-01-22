package controller;

import database.AdminHomeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "adminHome" , value = "/adminHome")
public class AdminHomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("admin");
        if (user == null) {
            resp.sendRedirect("404.jsp");
        } else {
            AdminHomeDAO adminHomeDAO = new AdminHomeDAO();
            req.setAttribute("userOnl", adminHomeDAO.getUserOnl());
            req.setAttribute("ticketQuantity", adminHomeDAO.getTicketQuantity());
            req.setAttribute("totalMovie", adminHomeDAO.gettotalMovie());
            req.setAttribute("totalEaring", adminHomeDAO.getTotalEarning());
            req.setAttribute("Top10MovieEaring", adminHomeDAO.getFilmEaring());

            req.getRequestDispatcher("adminhome.jsp").forward(req, resp);
            return;
        }
    }
}
