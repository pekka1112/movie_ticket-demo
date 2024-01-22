package controller;

import database.AdminHomeDAO;
import database.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebServlet(name = "Login" , value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // đặt encoding cho req, resp
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserbyEmailAndPassword(email, password);
        HttpSession session = req.getSession();
        if (user != null){
           session.setAttribute("user",user);
           if(user.isAdmin()){
               AdminHomeDAO adminHomeDAO = new AdminHomeDAO();
               req.setAttribute("userOnl", adminHomeDAO.getUserOnl());
               req.setAttribute("ticketQuantity", adminHomeDAO.getTicketQuantity());
               req.setAttribute("totalMovie", adminHomeDAO.gettotalMovie());
               req.setAttribute("totalEaring", adminHomeDAO.getTotalEarning());
               req.setAttribute("Top10MovieEaring", adminHomeDAO.getFilmEaring());

               req.getRequestDispatcher("adminhome.jsp").forward(req,resp);
               return;
           }
           else{
               req.getRequestDispatcher("index.jsp").forward(req,resp);
               return;
           }

        }else{
           req.setAttribute("status", "failed");
            req.getRequestDispatcher("login.jsp").forward(req,resp);

        }

    }
}
