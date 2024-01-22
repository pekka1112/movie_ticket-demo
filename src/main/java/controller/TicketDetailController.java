package controller;

import database.TicketDetailDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "detailController", value = "/detailticket")
public class TicketDetailController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("sid");
        TicketDetailDAO ticketDetailDAO = new TicketDetailDAO();
        req.setAttribute("ticketDetail", ticketDetailDAO.getTicketDetailByID(id));
        req.getRequestDispatcher("ticketDetail.jsp").forward(req, resp);
    }
}
