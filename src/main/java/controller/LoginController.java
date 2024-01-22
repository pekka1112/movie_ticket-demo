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

@WebServlet(name = "login" , value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    // đặt encoding cho req, resp
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        System.out.println(email + password);
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserbyEmailAndPassword(email, password);
        HttpSession session = req.getSession();
        if (user != null){
           if(user.isAdmin()){
                session.setAttribute("admin",user);
                resp.sendRedirect("adminHome");
           }
           else{
               session.setAttribute("user",user);
               req.getRequestDispatcher("index.jsp").forward(req,resp);
               return;
           }

        }else{
            System.out.println("user null");
            req.setAttribute("status", "failed");
            req.getRequestDispatcher("login.jsp").forward(req,resp);

        }

    }
}
