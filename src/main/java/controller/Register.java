package controller;

import database.UserLoginDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String userName = req.getParameter("userName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String retypePassword = req.getParameter("retypePassword");
        Connection connection = null;
        RequestDispatcher requestDispatcher =  null;

            UserLoginDAO userDAO = new UserLoginDAO();
            boolean check = userDAO.registerUser(userName, email, password);
            requestDispatcher = req.getRequestDispatcher("register.jsp");

            if (check){
                req.setAttribute("status", "success");
            }else{
                req.setAttribute("status", "failed");
            }
            requestDispatcher.forward(req,resp);
            System.out.println(req.getAttribute("status"));

    }
}
