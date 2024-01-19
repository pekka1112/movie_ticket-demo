package controller;

import database.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "quanlive", value = "/quanlive")
public class TicketController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
    if(user == null ){
        resp.sendRedirect("404.jsp");
    }else {
        UserDAO userDAO = new UserDAO();
        req.setAttribute("userList", userDAO.getAllUser());
        req.getRequestDispatcher("quanlive.jsp").forward(req,resp);

    }
    }
}
